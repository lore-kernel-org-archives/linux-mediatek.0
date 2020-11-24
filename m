Return-Path: <SRS0=KQlx=E6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5247C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 21:38:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5845C206E5
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2020 21:38:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XhQl2uJs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tfyNznt7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5845C206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PHup5xC4c01t3jHW+kF9lYWu9b8SGr4V8nES6g0kUTg=; b=XhQl2uJs8hhUCibFpqHicKcmn
	LoElVgQuCBdMa4roRSCBbCQAjVAzsH2ysYnP6OVY9V3WZuFB7z3SnCB1dJZGftyWcyAduVRtPSmoA
	cxn6XmecMeuqWIpt8zF2e+ir/2QNDLOA/IDR4sOgnpU+O/OQLglz7GPQKdMClIGCWVMEPDv93cv1U
	oK6c+Acr1LA5ZijEhgC5ixdpVUQ1HcxW9a2+AMk6bqXbZhHpapFDPeTbpbUm25qEHPKYKcwoqW/Gr
	EWy7v1t3MTWMW6Z0aP6fqQeiGnjAdyrPzQPdsj069405NkvP16AFGeJZZJz0drcVYlT2Juvzs8inJ
	ZYJVJv8rA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khg1A-0004AN-3b; Tue, 24 Nov 2020 21:38:33 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khg17-00049v-LP; Tue, 24 Nov 2020 21:38:30 +0000
Received: by mail-ej1-x643.google.com with SMTP id gj5so47802ejb.8;
 Tue, 24 Nov 2020 13:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iQio4Ne00oWRLO53kOiJ6PJC/Dr9Xmg8gf3qp82R6SI=;
 b=tfyNznt7z8kE5BWQGQcZEExW/qZBtg4t3865yVSNR8vlIDnL1AzvjhxYVTFSC2Pc5y
 ytZWCs+5+/FYVzg+R+hxN8CRV9eACwQPq3V6G+RQgUEebVloawO6RPLfId+zXOddXeXK
 4W42xKjJ9eDsI2K5N6LczjlBHdNAGAZysnbLJ0KTXyQp9rTIClSDVvb6WOm6qbHPUt3j
 xZNNYJRLqoxxgVM2Ob7vVBgdd1EPCQt80UXlRUDrSxpXnjbWafUobGyngEknLVQCCjGb
 NCOP8cG5PaWbhpUy33aukbnO32PkOFhURyXDLDoI6TyvRIbbdm6e81QwdPC/YdyeVZDK
 U1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iQio4Ne00oWRLO53kOiJ6PJC/Dr9Xmg8gf3qp82R6SI=;
 b=jvOu97Gg7w9xwGjfYQDi+erdKrQ1pNMlY0sf5F91V/f/5wYfO5ISrrGw3OdJ0a+tLs
 hVnkImNc2XFACqsB8B56c+zDwz0r1sLFImF1m7FIxe6HNnI7JPMdzW2tli9xLEQwwuG5
 Rrv227//2KBNWSq9QWWQ+EANLJDEjLiUezl51rMVNmBcITdpzOyAFjPIyhtGXwicBeoj
 8IGKhtKillnBxrIUv2AUnhjICHZVkDfo9iktRROHKhsM/Lh5QVcc+jVG8xNtBBzd6i7d
 MUHeXitpG85uhTeeLIU/B1yE91/t2angDuENRer5wRW3p53nT44Zn40hsHS1gWKsvbiH
 CyQQ==
X-Gm-Message-State: AOAM530+BbJviEFpX3LNU/hjJ3J73Ie4FNFZlHSdmH5eFkG6Y2JD3QZN
 9YjKtXdEUOYzQPcoT0l0Nok=
X-Google-Smtp-Source: ABdhPJykTb408PecV0yt6X9lQn51yoRJmiwXBgwIkczHmEgrGAEDMshHi1tKnOetfrRhVUD5rJRkpw==
X-Received: by 2002:a17:906:4a91:: with SMTP id
 x17mr411974eju.126.1606253908473; 
 Tue, 24 Nov 2020 13:38:28 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:b507:ec4b:7acf:a836?
 ([2a01:110f:b59:fd00:b507:ec4b:7acf:a836])
 by smtp.gmail.com with ESMTPSA id k12sm122131ejz.48.2020.11.24.13.38.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 13:38:27 -0800 (PST)
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
To: Gene Chen <gene.chen.richtek@gmail.com>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd> <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
 <20201119215721.GA5337@amd> <0700c32d-643b-fedb-06f0-21547b18205d@gmail.com>
 <CAE+NS363BpytNGZzfZHLa7KLKL8gjGj14oNvRi3oaH9KT79REg@mail.gmail.com>
 <25fef924-634d-7f60-7e1d-0290d1701fab@gmail.com>
 <CAE+NS34vDejgf8Ydfer_rY25qaG-DQQ5H-9-Er+Shz0=UF-EzA@mail.gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <31804c28-fa2b-9b1d-2d10-63de70d2fbd8@gmail.com>
Date: Tue, 24 Nov 2020 22:38:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS34vDejgf8Ydfer_rY25qaG-DQQ5H-9-Er+Shz0=UF-EzA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_163829_754245_9F3F1B32 
X-CRM114-Status: GOOD (  23.08  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, shufan_lee@richtek.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gMTEvMjQvMjAgODozMyBBTSwgR2VuZSBDaGVuIHdyb3RlOgo+IEphY2VrIEFuYXN6ZXdza2kg
PGphY2VrLmFuYXN6ZXdza2lAZ21haWwuY29tPiDmlrwgMjAyMOW5tDEx5pyIMjTml6Ug6YCx5LqM
IOS4iuWNiDQ6NTLlr6vpgZPvvJoKPj4KPj4gT24gMTEvMjMvMjAgNDowMCBBTSwgR2VuZSBDaGVu
IHdyb3RlOgo+Pj4gSmFjZWsgQW5hc3pld3NraSA8amFjZWsuYW5hc3pld3NraUBnbWFpbC5jb20+
IOaWvCAyMDIw5bm0MTHmnIgyMOaXpSDpgLHkupQg5LiK5Y2INjoyNuWvq+mBk++8mgo+Pj4+Cj4+
Pj4gT24gMTEvMTkvMjAgMTA6NTcgUE0sIFBhdmVsIE1hY2hlayB3cm90ZToKPj4+Pj4gT24gVGh1
IDIwMjAtMTEtMTkgMjI6MDM6MTQsIEphY2VrIEFuYXN6ZXdza2kgd3JvdGU6Cj4+Pj4+PiBIaSBQ
YXZlbCwgR2VuZSwKPj4+Pj4+Cj4+Pj4+PiBPbiAxMS8xOC8yMCAxMDozNyBQTSwgUGF2ZWwgTWFj
aGVrIHdyb3RlOgo+Pj4+Pj4+IEhpIQo+Pj4+Pj4+Cj4+Pj4+Pj4+IEZyb206IEdlbmUgQ2hlbiA8
Z2VuZV9jaGVuQHJpY2h0ZWsuY29tPgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBBZGQgTEVEX0NPTE9SX0lE
X01PT05MSUdIVCBkZWZpbml0aW9ucwo+Pj4+Pj4+Cj4+Pj4+Pj4gV2h5IGlzIG1vb25saWdodCBh
IGNvbG9yPyBDYW1lcmEgZmxhc2hlcyBhcmUgdXN1YWxseSB3aGl0ZSwgbm8/Cj4+Pj4+Pj4KPj4+
Pj4+PiBBdCBsZWFzdCBpdCBuZWVkcyBhIGNvbW1lbnQuLi4KPj4+Pj4+Cj4+Pj4+PiBUaGF0J3Mg
bXkgZmF1bHQsIEluIGZhY3QgSSBzaG91bGQgaGF2ZSBhc2tlZCBhYm91dCBhZGRpbmcKPj4+Pj4+
IExFRF9GVU5DVElPTl9NT09OTElHSFQsIGl0IHdhcyBldmlkZW50bHkgdG9vIGxhdGUgZm9yIG1l
IHRoYXQgZXZlbmluZy4uLgo+Pj4+Pgo+Pj4+PiBBaGEsIHRoYXQgbWFrZXMgbW9yZSBzZW5zZS4K
Pj4+Pj4KPj4+Pj4gQnV0IHBsZWFzZSBsZXQncyBjYWxsIGl0ICJ0b3JjaCIgaWYgd2UgZG8gdGhh
dCwgYXMgdGhhdCBpcyBhbHJlYWR5Cj4+Pj4+IHVzZWQgaW4ga2VybmVsIHNvdXJjZXMuLi4gYW5k
IHByb2JhYmx5IGluIHRoZSBpbnRlcmZhY2UsIHRvbzoKPj4+Pgo+Pj4+IEknZCBzYXkgdGhhdCB0
b3JjaCBpcyBzb21ldGhpbmcgZGlmZmVyZW50IHRoYXQgbW9vbmxpZ2h0LAo+Pj4+IGJ1dCB3ZSB3
b3VsZCBuZWVkIG1vcmUgaW5wdXQgZnJvbSBHZW5lIHRvIGxlYXJuIG1vcmUgYWJvdXQKPj4+PiB0
aGUgbmF0dXJlIG9mIGxpZ2h0IGVtaXR0ZWQgYnkgTUwgTEVEIG9uIGhpcyBkZXZpY2UuCj4+Pj4K
Pj4+PiBQbGVhc2Ugbm90ZSB0aGF0IHRvcmNoIGlzIHVzdWFsbHkgbWVhbnQgYXMgdGhlIG90aGVy
IG1vZGUgb2YKPj4+PiBmbGFzaCBMRUQgKHNvbWV0aW1lcyBpdCBpcyBjYWxsZWQgIm1vdmllIG1v
ZGUiKSwgd2hpY2ggaXMgYWxyZWFkeQo+Pj4+IGhhbmRsZWQgYnkgYnJpZ2h0bmVzcyBmaWxlIG9m
IExFRCBjbGFzcyBmbGFzaCBkZXZpY2UgKGkuZS4gaXRzIExFRCBjbGFzcwo+Pj4+IHN1YnNldCks
IGFuZCB3aGljaCBhbHNvIG1hcHMgdG8gdjRsMi1mbGFzaCBUT1JDSCBtb2RlLgo+Pj4+Cj4+Pgo+
Pj4gSXQncyB1c2VkIHRvIGZyb250IGNhbWVyYSBmaWxsIGxpZ2h0Lgo+Pj4gTW9yZSBicmlnaHRu
ZXNzIHRoYW4gc2NyZWVuIGJhY2tsaWdodCwgYW5kIG1vcmUgc29mdCBsaWdodCB0aGFuIGZsYXNo
Lgo+Pj4gSSB0aGluayBMRURfSURfQ09MT1JfV0hJVEUgaXMgb2theS4KPj4KPj4gU28gd2h5IGlu
IHY2IHlvdSBhc3NpZ25lZCBMRURfQ09MT1JfSURfQU1CRVIgdG8gaXQ/Cj4+Cj4+IFJlZ2FyZGxl
c3Mgb2YgdGhhdCwgbm93IHdlJ3JlIHRhbGtpbmcgYWJvdXQgTEVEIGZ1bmN0aW9uIC0geW91IGNo
b3NlCj4+IExFRF9GVU5DVElPTl9JTkRJQ0FUT1IgZm9yIGl0LCBidXQgaW5mZXJyaW5nIGZyb20g
eW91ciBhYm92ZSBkZXNjcmlwdGlvbgo+PiAtIGl0IGNlcnRhaW5seSBkb2Vzbid0IGZpdCBoZXJl
Lgo+Pgo+PiBBbHNvIHJlZ2lzdGVyIG5hbWVzLCBjb250YWluaW5nIHBhcnQgIk1MIiBpbmRpY2F0
ZSB0aGF0IHRoaXMgTEVEJ3MKPj4gaW50ZW5kZWQgZnVuY3Rpb24gaXMgbW9vbmxpbmdodCwgd2hp
Y2ggeW91ciBkZXNjcmlwdGlvbiBzb21laG93Cj4+IGNvcnJvYm9yYXRlcy4KPj4KPj4gTW9vbmxp
Z2h0IExFRHMgYmVjb21lIHViaXF1aXRvdXMgbm93YWRheXMgc28gc29vbmVyIG9yIGxhdGVyIHdl
IHdpbGwKPj4gbmVlZCB0byBhZGQgdGhpcyBmdW5jdGlvbiBhbnl3YXkgWzBdLgo+Pgo+PiBbMF0K
Pj4gaHR0cHM6Ly9sYW5kc2NhcGVsaWdodGluZ29ha3ZpbGxlLmNvbS93aGF0LWlzLW1vb24tbGln
aHRpbmctYW5kLXdoeS1kb2VzLWl0LXJlbWFpbi1zby1wb3B1bGFyLwo+Pgo+IAo+IFdlIHVzZSB0
ZXJtICJNb29ubGlnaHQiIGFzIHJlZmVyZW5jZSBzYXlzCj4gIldoZW4geW91IGFyZSB0cnlpbmcg
dG8gaW1pdGF0ZSBtb29ubGlnaHQgeW91IG5lZWQgdG8gdXNlIGxvdyB2b2x0YWdlLAo+IHNvZnRl
ciBsaWdodGluZy4gWW91IGRvbuKAmXQgd2FudCBzb21ldGhpbmcgdGhhdOKAmXMgdG9vIGJyaWdo
dCIKPiB3aGljaCBpcyBmb2N1cyBvbiBicmlnaHRuZXNzIGluc3RlYWQgb2YgY29sb3IuCj4gCj4g
U28gd2Ugc3VycG9zZSBNb29ubGlnaHQgY2FuIGJlIHdoaXRlIG9yIGFtYmVyLgo+IAo+IFNob3Vs
ZCBJIGFkZCBMRURfRlVOQ1RJT05fTU9PTkxJR0hUIGFuZCBzZXQgTEVEX0NPTE9SX0lEX1dISVRF
PwoKUmVnYXJkaW5nIHRoZSBmdW5jdGlvbiAtIHllcywgdGhlIHJlZmVyZW5jZSBiYWNrcyB0aGF0
IHVwLgpSZWdhcmRpbmcgdGhlIGNvbG9yIC0gaWYgeW91IGZlZWwgdGhhdCBpdCBwcm9wZXJseSBk
ZXNjcmliZXMgdGhlCkxFRCBjb2xvciB0aGVuIGdvIGZvciBpdC4KCi0tIApCZXN0IHJlZ2FyZHMs
CkphY2VrIEFuYXN6ZXdza2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbWVkaWF0ZWsK
