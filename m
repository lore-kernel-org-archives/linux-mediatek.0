Return-Path: <SRS0=13eL=E5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FF6C2D0E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 20:53:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E04B206B7
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2020 20:53:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mTTFSoCk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XalzOCON"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E04B206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FIo9w08zkDez+CtwxrHjW1cdtX/qHCeIgTMBHbVYDo4=; b=mTTFSoCk+9JIMQf8BWpdSxPhc
	qa1w1aeexKoIic0Q/FzKtOslm5+SJcBlcgZFKVl9nkR292L6R51KzqyXKMJGhZ6UJnqqpEyXc6Y2i
	+6oJ2dXxz8WI21YdbV527wF7E+jzixmmiUm7RCgsTZbk5deFxa/LaTbbdzDIej2hl80yqT/grCqpk
	rFbfyiSKQhggMQo+EOrFhT3qC2QrJLKYrqpgXrz3mlZ/pSWH+6pEXtC3ePZla7PXMPSuZte94yAQa
	HNiuG55Bvm3SLkVB0iwhJdrsgTTwq9ApdZDXel5w20+xOsig4/Nx64g5tckqNUNHc8cx4IMArumNJ
	+FSdrckJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khIpc-0000cv-U9; Mon, 23 Nov 2020 20:53:05 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khIpZ-0000cW-H3; Mon, 23 Nov 2020 20:53:03 +0000
Received: by mail-wm1-x344.google.com with SMTP id s13so753394wmh.4;
 Mon, 23 Nov 2020 12:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TklskZDnCVeTGWPgpS/EioL+kUbmsF81Ea3U/G7UyjM=;
 b=XalzOCONIhWS9jkNG1EunxZBVEy7yc8msz02bgtym8eiZJFJEZRHy1JQTXBOjyeF9Q
 4URaCOA6xTWvoKVsf2WQLh1rdy4ArdnXv5iBb3mFok8XX0V3DGk5FVw5OAjUD9h3E3PQ
 T4sa48kAMq3wdKEePwAUpx9KLTQJ4GBcucX5AM2/c69fVSnP5VSN5Sy1148iyMqgbgPW
 /tZY3+JA7KqsST89d2tfLGpkdGeZVv4wT84vJKubQBIccNfrdnB85q1SNABgvanqyYts
 7FXxIzk1A1R4lbI5YbTNDqWtWMHn2hT5Yl/GdwFHBWHG0Ehloqc2VXXD1VngfDCwIJRa
 oqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TklskZDnCVeTGWPgpS/EioL+kUbmsF81Ea3U/G7UyjM=;
 b=YLPBpGQ5PRvKAAhj0op+xp7xg4h/sF0Kxav8WPEnBax+W3TyHwXJPRK2oIwjlUVoeR
 l/8bXtRBxBpaDdSU16fxi5T1I6NqcNVCudhAp1S6gtAt3YFzSEZJP7PPQEWsGYT7M3Fj
 FQAME3/MhYLJke7bvk84N66AGNQcrJ4HJtZr0cinKobf8EE8Zgm7CLwQEm3NDoplG4XE
 UAcyWum14FDt9b9jsUIHxQVWy6BNtA9q96220DF2i3QfiTT8vDZ3PB5Td6QGToaXnGsd
 md/zRu56Bi4+3aOPyZwnaJq37hmoGtmNTIzhhDx0HnzNKefyq6h7E16KCx5tK+a8R/5e
 1EEA==
X-Gm-Message-State: AOAM530sxZZvqDTyfgdnXpfhRYwbrEgbIoEPQtxZ17vsy7fR+zRFnBNx
 oz0QNVnnOQTjnqpXN5BNZOw++JfRVks=
X-Google-Smtp-Source: ABdhPJzJyKRYbtdA9Cx+e50La8cu1sTApANl+eqq31Z3u2jcpquwGMQrfTZIEq4gm1VUzJpDGUK3FA==
X-Received: by 2002:a1c:3b07:: with SMTP id i7mr760093wma.118.1606164778848;
 Mon, 23 Nov 2020 12:52:58 -0800 (PST)
Received: from ?IPv6:2a01:110f:b59:fd00:7836:e682:dddf:6361?
 ([2a01:110f:b59:fd00:7836:e682:dddf:6361])
 by smtp.gmail.com with ESMTPSA id b4sm1109779wmc.1.2020.11.23.12.52.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 12:52:58 -0800 (PST)
Subject: Re: [PATCH v7 2/5] dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT
 definitions
To: Gene Chen <gene.chen.richtek@gmail.com>
References: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
 <1605696462-391-3-git-send-email-gene.chen.richtek@gmail.com>
 <20201118213712.GA22371@amd> <6068b1e3-a4c8-6c7d-d33d-f2238e905e43@gmail.com>
 <20201119215721.GA5337@amd> <0700c32d-643b-fedb-06f0-21547b18205d@gmail.com>
 <CAE+NS363BpytNGZzfZHLa7KLKL8gjGj14oNvRi3oaH9KT79REg@mail.gmail.com>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Message-ID: <25fef924-634d-7f60-7e1d-0290d1701fab@gmail.com>
Date: Mon, 23 Nov 2020 21:52:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAE+NS363BpytNGZzfZHLa7KLKL8gjGj14oNvRi3oaH9KT79REg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201123_155301_672703_4BCE22E9 
X-CRM114-Status: GOOD (  19.66  )
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

T24gMTEvMjMvMjAgNDowMCBBTSwgR2VuZSBDaGVuIHdyb3RlOgo+IEphY2VrIEFuYXN6ZXdza2kg
PGphY2VrLmFuYXN6ZXdza2lAZ21haWwuY29tPiDmlrwgMjAyMOW5tDEx5pyIMjDml6Ug6YCx5LqU
IOS4iuWNiDY6Mjblr6vpgZPvvJoKPj4KPj4gT24gMTEvMTkvMjAgMTA6NTcgUE0sIFBhdmVsIE1h
Y2hlayB3cm90ZToKPj4+IE9uIFRodSAyMDIwLTExLTE5IDIyOjAzOjE0LCBKYWNlayBBbmFzemV3
c2tpIHdyb3RlOgo+Pj4+IEhpIFBhdmVsLCBHZW5lLAo+Pj4+Cj4+Pj4gT24gMTEvMTgvMjAgMTA6
MzcgUE0sIFBhdmVsIE1hY2hlayB3cm90ZToKPj4+Pj4gSGkhCj4+Pj4+Cj4+Pj4+PiBGcm9tOiBH
ZW5lIENoZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPj4+Pj4+Cj4+Pj4+PiBBZGQgTEVEX0NP
TE9SX0lEX01PT05MSUdIVCBkZWZpbml0aW9ucwo+Pj4+Pgo+Pj4+PiBXaHkgaXMgbW9vbmxpZ2h0
IGEgY29sb3I/IENhbWVyYSBmbGFzaGVzIGFyZSB1c3VhbGx5IHdoaXRlLCBubz8KPj4+Pj4KPj4+
Pj4gQXQgbGVhc3QgaXQgbmVlZHMgYSBjb21tZW50Li4uCj4+Pj4KPj4+PiBUaGF0J3MgbXkgZmF1
bHQsIEluIGZhY3QgSSBzaG91bGQgaGF2ZSBhc2tlZCBhYm91dCBhZGRpbmcKPj4+PiBMRURfRlVO
Q1RJT05fTU9PTkxJR0hULCBpdCB3YXMgZXZpZGVudGx5IHRvbyBsYXRlIGZvciBtZSB0aGF0IGV2
ZW5pbmcuLi4KPj4+Cj4+PiBBaGEsIHRoYXQgbWFrZXMgbW9yZSBzZW5zZS4KPj4+Cj4+PiBCdXQg
cGxlYXNlIGxldCdzIGNhbGwgaXQgInRvcmNoIiBpZiB3ZSBkbyB0aGF0LCBhcyB0aGF0IGlzIGFs
cmVhZHkKPj4+IHVzZWQgaW4ga2VybmVsIHNvdXJjZXMuLi4gYW5kIHByb2JhYmx5IGluIHRoZSBp
bnRlcmZhY2UsIHRvbzoKPj4KPj4gSSdkIHNheSB0aGF0IHRvcmNoIGlzIHNvbWV0aGluZyBkaWZm
ZXJlbnQgdGhhdCBtb29ubGlnaHQsCj4+IGJ1dCB3ZSB3b3VsZCBuZWVkIG1vcmUgaW5wdXQgZnJv
bSBHZW5lIHRvIGxlYXJuIG1vcmUgYWJvdXQKPj4gdGhlIG5hdHVyZSBvZiBsaWdodCBlbWl0dGVk
IGJ5IE1MIExFRCBvbiBoaXMgZGV2aWNlLgo+Pgo+PiBQbGVhc2Ugbm90ZSB0aGF0IHRvcmNoIGlz
IHVzdWFsbHkgbWVhbnQgYXMgdGhlIG90aGVyIG1vZGUgb2YKPj4gZmxhc2ggTEVEIChzb21ldGlt
ZXMgaXQgaXMgY2FsbGVkICJtb3ZpZSBtb2RlIiksIHdoaWNoIGlzIGFscmVhZHkKPj4gaGFuZGxl
ZCBieSBicmlnaHRuZXNzIGZpbGUgb2YgTEVEIGNsYXNzIGZsYXNoIGRldmljZSAoaS5lLiBpdHMg
TEVEIGNsYXNzCj4+IHN1YnNldCksIGFuZCB3aGljaCBhbHNvIG1hcHMgdG8gdjRsMi1mbGFzaCBU
T1JDSCBtb2RlLgo+Pgo+IAo+IEl0J3MgdXNlZCB0byBmcm9udCBjYW1lcmEgZmlsbCBsaWdodC4K
PiBNb3JlIGJyaWdodG5lc3MgdGhhbiBzY3JlZW4gYmFja2xpZ2h0LCBhbmQgbW9yZSBzb2Z0IGxp
Z2h0IHRoYW4gZmxhc2guCj4gSSB0aGluayBMRURfSURfQ09MT1JfV0hJVEUgaXMgb2theS4KClNv
IHdoeSBpbiB2NiB5b3UgYXNzaWduZWQgTEVEX0NPTE9SX0lEX0FNQkVSIHRvIGl0PwoKUmVnYXJk
bGVzcyBvZiB0aGF0LCBub3cgd2UncmUgdGFsa2luZyBhYm91dCBMRUQgZnVuY3Rpb24gLSB5b3Ug
Y2hvc2UKTEVEX0ZVTkNUSU9OX0lORElDQVRPUiBmb3IgaXQsIGJ1dCBpbmZlcnJpbmcgZnJvbSB5
b3VyIGFib3ZlIGRlc2NyaXB0aW9uCi0gaXQgY2VydGFpbmx5IGRvZXNuJ3QgZml0IGhlcmUuCgpB
bHNvIHJlZ2lzdGVyIG5hbWVzLCBjb250YWluaW5nIHBhcnQgIk1MIiBpbmRpY2F0ZSB0aGF0IHRo
aXMgTEVEJ3MKaW50ZW5kZWQgZnVuY3Rpb24gaXMgbW9vbmxpbmdodCwgd2hpY2ggeW91ciBkZXNj
cmlwdGlvbiBzb21laG93CmNvcnJvYm9yYXRlcy4KCk1vb25saWdodCBMRURzIGJlY29tZSB1Ymlx
dWl0b3VzIG5vd2FkYXlzIHNvIHNvb25lciBvciBsYXRlciB3ZSB3aWxsCm5lZWQgdG8gYWRkIHRo
aXMgZnVuY3Rpb24gYW55d2F5IFswXS4KClswXSAKaHR0cHM6Ly9sYW5kc2NhcGVsaWdodGluZ29h
a3ZpbGxlLmNvbS93aGF0LWlzLW1vb24tbGlnaHRpbmctYW5kLXdoeS1kb2VzLWl0LXJlbWFpbi1z
by1wb3B1bGFyLwoKLS0gCkJlc3QgcmVnYXJkcywKSmFjZWsgQW5hc3pld3NraQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
