Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1731DC4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 15:17:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A08BE233CE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 15:17:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A08BE233CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GUnuSSREWIgMxioynEHIU8WLwnShCXJdF28/U2BuU+0=; b=Op8ltaeUuLDhuUza7kPc2rtTi
	jEQ/MuBrHCy09as/1aec367IylfOgqVQBMSso2WTzXoKVvzHKopRSScd5TpVJFRRLTwRfCR6Io9KM
	nkIBTVurSSj8j2fKS5Q9tAFTPEZ4eukl2yxhIb+xtwXHGZcmX2wJOKsURv4Gg8YRnqWrSS31wKmdS
	ivK7Njtap9Ub3gdZQ9r5Fw9FecU5w4H/Tocg//gfJLn6wLAz7rBFMYetJSFgw/C5AbB4377/QfL5a
	BBpNovx7ILOX0cUyrbIEOPpI4VJ6Ub4Qm6fwJBhENEhAH1BQjbmRzBRY5JrBUoY9cn3urAMRGi7g9
	s+28Ivktg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpYYY-0003Ht-Tp; Wed, 16 Dec 2020 15:17:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpYYV-0003H0-6l; Wed, 16 Dec 2020 15:17:32 +0000
X-Gm-Message-State: AOAM530NeyYAqxPKpb0Wa0xduPH04mzXVl9jDcQ3WyytFOTav1NGkmxI
 YkSEHGCDkC0C+nxiFgv/EofoH5QA1IljFxgbuw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608131850;
 bh=YOC88DJH1Ldr/FjwTLsg5NLtJ+aB+EfBl/k2z67zy1U=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=d3zPyyMVKaYdL5mltO4VQCc6Hwjmj9nRQPDH6TpXWUQOQ8tS2RTsGSUMuyMGmxQuG
 vt1J6iptJANrfVh0GdiXg2hqdmT38JHCJdvDA5WNs6nb4RPpeBslQuiAyi5EiM0WUl
 Ry6gG/cr5UJiSxuA3OUgt/+Oo51YGH/WCvv02r468d3Wn93Sca7Mmi+OyfY0t9GK3D
 7UZukCc5eNzrKPfF3jt74uit73q6Gge2zvm58xHWt3vjz+fFi34JTndsNRFj/Rj/gn
 JbuZ+Xwo5xOYaOWE7qnWYYto/8aBCdstxFLBE72PdvH4XHQ+VXHHfp+ppkAjvtAHpc
 HT76siTDS9xwg==
X-Google-Smtp-Source: ABdhPJxAAxsNxeLlUnTnLtNubQg6skrY+y2JxetX9D6LYAb9dpqNodHx3+yLdJbf7zIjVVvZiAZDbQ98NMhP+W08ATE=
X-Received: by 2002:a05:600c:25c2:: with SMTP id
 2mr3941456wml.170.1608131848789; 
 Wed, 16 Dec 2020 07:17:28 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-3-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-3-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 16 Dec 2020 23:17:14 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-YjP50QrBKfoCqVnMWp41efbs9wdon4gts5QhUfZO8OA@mail.gmail.com>
Message-ID: <CAAOTY_-YjP50QrBKfoCqVnMWp41efbs9wdon4gts5QhUfZO8OA@mail.gmail.com>
Subject: Re: [PATCH v2, 02/17] dt-bindings: mediatek: add CLK_MM_DISP_CONFIG
 control description for mt8192 display
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_101731_378533_7014ED2F 
X-CRM114-Status: GOOD (  15.94  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCllvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29t
PiDmlrwgMjAyMOW5tDEy5pyIMTLml6Ug6YCx5YWtIOS4i+WNiDEyOjEy5a+r6YGT77yaCj4KPiBh
ZGQgQ0xLX01NX0RJU1BfQ09ORklHIGNvbnRyb2wgZGVzY3JpcHRpb24gZm9yIG10ODE5MiBkaXNw
bGEKCmRpc3BsYXkKCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcu
bml1QG1lZGlhdGVrLmNvbT4KPiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgfCAzICsrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQgYi9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRl
ayxkaXNwLnR4dAo+IGluZGV4IDE5NzJmYTcuLmRmYmVjNzYgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlz
cC50eHQKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9t
ZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+IEBAIC01NCw2ICs1NCw5IEBAIFJlcXVpcmVkIHBy
b3BlcnRpZXMgKGFsbCBmdW5jdGlvbiBibG9ja3MpOgo+ICAgIERQSSBjb250cm9sbGVyIG5vZGVz
IGhhdmUgbXVsdGlwbGUgY2xvY2sgaW5wdXRzLiBUaGVzZSBhcmUgZG9jdW1lbnRlZCBpbgo+ICAg
IG1lZGlhdGVrLGRzaS50eHQgYW5kIG1lZGlhdGVrLGRwaS50eHQsIHJlc3BlY3RpdmVseS4KPiAg
ICBBbiBleGNlcHRpb24gaXMgdGhhdCB0aGUgbXQ4MTgzIG11dGV4IGlzIGFsd2F5cyBmcmVlIHJ1
bm5pbmcgd2l0aCBubyBjbG9ja3MgcHJvcGVydHkuCj4gKyAgQW4gZXhjZXB0aW9uIGlzIHRoYXQg
dGhlIG10ODE5MiBkaXNwbGF5IGFkZCAyIG1vcmUgY2xvY2tzKENMS19NTV9ESVNQX0NPTkZJRywg
Q0xLX01NXzI2TUhaKSwKPiArICBhbmQgdGhlc2UgMiBjbG9ja3MgbmVlZCBlbmFibGVkIGJlZm9y
ZSBkaXNwbGF5IG1vZHVsZSB3b3JrIGxpa2UgbXV0ZXggY2xvY2ssIHNvIHdlIGFkZCB0aGVzZQo+
ICsgIDIgY2xvY2tzIGNvbnRyb2xlZCBzYW1lIHdpdGggbXV0ZXggY2xvY2suCgpJZiBldmVyeSBk
aXNwbGF5IG1vZHVsZSBuZWVkcyB0aGVzZSB0d28gY2xvY2ssIGFkZCB0aGVzZSB0d28gY2xvY2sg
dG8KYWxsIHRoZSBkaXNwbGF5IG1vZHVsZSB3aGljaCBuZWVkIHRoZW0uCgpSZWdhcmRzLApDaHVu
LUt1YW5nLgoKPgo+ICBSZXF1aXJlZCBwcm9wZXJ0aWVzIChETUEgZnVuY3Rpb24gYmxvY2tzKToK
PiAgLSBjb21wYXRpYmxlOiBTaG91bGQgYmUgb25lIG9mCj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
