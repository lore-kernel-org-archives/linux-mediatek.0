Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A540C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 03:20:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D49B60F0F
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 03:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D49B60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HtS7/w9nPx7cNW5vqG+YDfwO4TMYWlS7bhvTU+5Mt4c=; b=3E7FF500nv2bN5
	ASJUbFCPuk80OyrVG2z8QSS1TXx/Rh0adwMhhfi2yt9cKa8KYlhad2Enfiu7fDJ44DXkuioC2B0oW
	53BZz83y4yq/GEQpszm1gyfpAr4TNIKQQBLcYcCX1nlvT01B1o/KB6gyV/O8tFbeyP1Zl8KNyWgym
	HFTr6a14HRfrTqYuxPvmC52gis6Dp/67a7aoFgk0ySgSVgi0H9GgPTwDTelfrFnUPX/p7lwX0SWZU
	tivbL/iQA28wFZ6ujgnYgYp3/0w79VhnFF2B7IjXJp5p3JDxq48l8nU3QNyEak+zYzUVM3vG7be0l
	4ELyYPNurQJAjCcFlb/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfvxD-006ln1-NW; Thu, 28 Oct 2021 03:19:47 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfvxB-006lmP-4h
 for linux-mediatek@lists.infradead.org; Thu, 28 Oct 2021 03:19:47 +0000
Received: by mail-il1-x12b.google.com with SMTP id j6so5298023ila.1
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Oct 2021 20:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8iLqanegbeY/oC5IucoRrB/uNp5p6hrJTUbMi+FyPCg=;
 b=I/BQtp4v9VF9Mrf/HLCEPNJpd/6gyYZZhOoXLzv9PA68p4CmdvxV3LrV9GdRlfmrpY
 DlKSHwbewUBrYPxr7U4RR76y6oWMF7J4K18U/GFNGmhQNyQAsD/o648g3YZOZtci+FaP
 GYLoNR94SVRFEgAyk0lFT5e85rc3gjBq+25ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8iLqanegbeY/oC5IucoRrB/uNp5p6hrJTUbMi+FyPCg=;
 b=LydX97TTebFQylcTQ2dgXRDpI9vNdicbMEGt67YIv1jCZNoixPaX2fFk6jGbAe3sfs
 NRtKgVy4GE8Kg7T9/gxr3AfNdBkj8MZ3vxkIPMh65yXYVLg4wO05F0/j6+9QGYh0f12G
 85bTRcI4/04MFn7qlrUYoKwKQfrhvq0gFdQL7508j0RWTiQLIQEuOpnXpKFwoYc2XT5f
 vJ15gjJbare71viyS+4/3VAwIM9qbsN8VrCyNdx2qejleOZGNg2NlB6YSrxFX9aMMcEE
 PAucXRc377BNhgi/UddBF8kP2g/33ij+w1woEgKHY7rtkHswGIHsyuOOVvxezvur1WqZ
 dR9A==
X-Gm-Message-State: AOAM531WfmEKdh5zLG2+9YNAU6LnicQ1CxgkhZe7qFr4TqglNd0ZtO8H
 o/7dsgBblTHmozXqdaddMyAnQ2jYD5gjZQ==
X-Google-Smtp-Source: ABdhPJzJtHcxY6nadGnEAuqDAA6th09O0QlLvHmRHQh+s+LUnvE7MOXSrpl1PNCrezIgwWqN5YPE4g==
X-Received: by 2002:a05:6e02:2149:: with SMTP id
 d9mr1315693ilv.270.1635391182963; 
 Wed, 27 Oct 2021 20:19:42 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172])
 by smtp.gmail.com with ESMTPSA id x19sm1050302iow.6.2021.10.27.20.19.41
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 20:19:42 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id s3so5343534ild.0
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Oct 2021 20:19:41 -0700 (PDT)
X-Received: by 2002:a05:6e02:687:: with SMTP id
 o7mr1270144ils.222.1635391180904; 
 Wed, 27 Oct 2021 20:19:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211027021857.20816-1-jason-jh.lin@mediatek.com>
 <20211027021857.20816-4-jason-jh.lin@mediatek.com>
 <CAC=S1ng2=XRV9s2t2dxQf1a2V2GsFwhfB8tRxnNDp-QD5eR_xQ@mail.gmail.com>
 <CAAOTY_9sCr-CM6WsZ6q7mtfqr9A5sNccC0bk1vq=Hdqr3rGkQw@mail.gmail.com>
In-Reply-To: <CAAOTY_9sCr-CM6WsZ6q7mtfqr9A5sNccC0bk1vq=Hdqr3rGkQw@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 28 Oct 2021 11:19:04 +0800
X-Gmail-Original-Message-ID: <CAC=S1njhuzPi6gOmGfqhtKMtDTsGPzZ7P=PoVbAviHt1o00U6w@mail.gmail.com>
Message-ID: <CAC=S1njhuzPi6gOmGfqhtKMtDTsGPzZ7P=PoVbAviHt1o00U6w@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/mediatek: Detect CMDQ execution timeout
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Nancy Lin <nancy.lin@mediatek.com>, singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_201945_245095_7B3B5AD7 
X-CRM114-Status: GOOD (  29.69  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2h1bi1LdWFuZywKCk9uIFRodSwgT2N0IDI4LCAyMDIxIGF0IDc6NDcgQU0gQ2h1bi1LdWFu
ZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gSGksIEZlaToKPgo+IEZl
aSBTaGFvIDxmc2hhb0BjaHJvbWl1bS5vcmc+IOaWvCAyMDIx5bm0MTDmnIgyN+aXpSDpgLHkuIkg
5LiL5Y2INTozMuWvq+mBk++8mgo+ID4KPiA+IEhpIEphc29uLAo+ID4KPiA+IE9uIFdlZCwgT2N0
IDI3LCAyMDIxIGF0IDEwOjE5IEFNIGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVr
LmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEZyb206IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5o
dUBrZXJuZWwub3JnPgo+ID4gPgo+ID4gPiBDTURRIGlzIHVzZWQgdG8gdXBkYXRlIGRpc3BsYXkg
cmVnaXN0ZXIgaW4gdmJsYW5rIHBlcmlvZCwgc28KPiA+ID4gaXQgc2hvdWxkIGJlIGV4ZWN1dGUg
aW4gbmV4dCAyIHZibGFuay4gT25lIHZibGFuayBpbnRlcnJ1cHQKPiA+ID4gYmVmb3JlIHNlbmQg
bWVzc2FnZSAob2NjYXNpb25hbGx5KSBhbmQgb25lIHZibGFuayBpbnRlcnJ1cHQKPiA+ID4gYWZ0
ZXIgY21kcSBkb25lLiBJZiBpdCBmYWlsIHRvIGV4ZWN1dGUgaW4gbmV4dCAzIHZibGFuaywKPiA+
ID4gdGllbW91dCBoYXBwZW4uCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IENodW4tS3Vhbmcg
SHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBqYXNvbi1q
aC5saW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+Cj4gPiA+IFJldmlld2VkLWJ5OiBDaHVu
LUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KPiA+ID4gLS0tCj4gPiA+ICBkcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMgfCAyMCArKysrKysrKysrKysrKysr
KystLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiA+
ID4gaW5kZXggZTIzZTMyMjRhYzY3Li5kYWQxZjg1ZWUzMTUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2NydGMuYwo+ID4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiA+ID4gQEAgLTU0LDYgKzU0LDcgQEAg
c3RydWN0IG10a19kcm1fY3J0YyB7Cj4gPiA+ICAjaWYgSVNfUkVBQ0hBQkxFKENPTkZJR19NVEtf
Q01EUSkKPiA+ID4gICAgICAgICBzdHJ1Y3QgY21kcV9jbGllbnQgICAgICAgICAgICAgIGNtZHFf
Y2xpZW50Owo+ID4gPiAgICAgICAgIHUzMiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY21k
cV9ldmVudDsKPiA+ID4gKyAgICAgICB1MzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNt
ZHFfdmJsYW5rX2NudDsKPiA+ID4gICNlbmRpZgo+ID4gPgo+ID4gPiAgICAgICAgIHN0cnVjdCBk
ZXZpY2UgICAgICAgICAgICAgICAgICAgKm1tc3lzX2RldjsKPiA+ID4gQEAgLTIyNyw3ICsyMjgs
MTAgQEAgc3RydWN0IG10a19kZHBfY29tcCAqbXRrX2RybV9kZHBfY29tcF9mb3JfcGxhbmUoc3Ry
dWN0IGRybV9jcnRjICpjcnRjLAo+ID4gPiAgc3RhdGljIHZvaWQgZGRwX2NtZHFfY2Ioc3RydWN0
IG1ib3hfY2xpZW50ICpjbCwgdm9pZCAqbXNzZykKPiA+ID4gIHsKPiA+ID4gICAgICAgICBzdHJ1
Y3QgY21kcV9jYl9kYXRhICpkYXRhID0gbXNzZzsKPiA+ID4gKyAgICAgICBzdHJ1Y3QgY21kcV9j
bGllbnQgKmNtZHFfY2wgPSBjb250YWluZXJfb2YoY2wsIHN0cnVjdCBjbWRxX2NsaWVudCwgY2xp
ZW50KTsKPiA+ID4gKyAgICAgICBzdHJ1Y3QgbXRrX2RybV9jcnRjICptdGtfY3J0YyA9IGNvbnRh
aW5lcl9vZihjbWRxX2NsLCBzdHJ1Y3QgbXRrX2RybV9jcnRjLCBjbWRxX2NsaWVudCk7Cj4gPiA+
Cj4gPiA+ICsgICAgICAgbXRrX2NydGMtPmNtZHFfdmJsYW5rX2NudCA9IDA7Cj4gPiA+ICAgICAg
ICAgY21kcV9wa3RfZGVzdHJveShkYXRhLT5wa3QpOwo+ID4gPiAgfQo+ID4gPiAgI2VuZGlmCj4g
PiA+IEBAIC00ODMsNiArNDg3LDE1IEBAIHN0YXRpYyB2b2lkIG10a19kcm1fY3J0Y191cGRhdGVf
Y29uZmlnKHN0cnVjdCBtdGtfZHJtX2NydGMgKm10a19jcnRjLAo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY21kcV9oYW5kbGUtPnBhX2Jhc2UsCj4gPiA+
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjbWRxX2hhbmRsZS0+
Y21kX2J1Zl9zaXplLAo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgRE1BX1RPX0RFVklDRSk7Cj4gPiA+ICsgICAgICAgICAgICAgICAvKgo+ID4gPiArICAg
ICAgICAgICAgICAgICogQ01EUSBjb21tYW5kIHNob3VsZCBleGVjdXRlIGluIG5leHQgMyB2Ymxh
bmsuCj4gPiA+ICsgICAgICAgICAgICAgICAgKiBPbmUgdmJsYW5rIGludGVycnVwdCBiZWZvcmUg
c2VuZCBtZXNzYWdlIChvY2Nhc2lvbmFsbHkpCj4gPiA+ICsgICAgICAgICAgICAgICAgKiBhbmQg
b25lIHZibGFuayBpbnRlcnJ1cHQgYWZ0ZXIgY21kcSBkb25lLAo+ID4gPiArICAgICAgICAgICAg
ICAgICogc28gaXQncyB0aW1lb3V0IGFmdGVyIDMgdmJsYW5rIGludGVycnVwdC4KPiA+ID4gKyAg
ICAgICAgICAgICAgICAqIElmIGl0IGZhaWwgdG8gZXhlY3V0ZSBpbiBuZXh0IDMgdmJsYW5rLCB0
aW1lb3V0IGhhcHBlbi4KPiA+ID4gKyAgICAgICAgICAgICAgICAqLwo+ID4gPiArICAgICAgICAg
ICAgICAgbXRrX2NydGMtPmNtZHFfdmJsYW5rX2NudCA9IDM7Cj4gPiA+ICsKPiA+ID4gICAgICAg
ICAgICAgICAgIG1ib3hfc2VuZF9tZXNzYWdlKG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFuLCBj
bWRxX2hhbmRsZSk7Cj4gPiA+ICAgICAgICAgICAgICAgICBtYm94X2NsaWVudF90eGRvbmUobXRr
X2NydGMtPmNtZHFfY2xpZW50LmNoYW4sIDApOwo+ID4gPiAgICAgICAgIH0KPiA+ID4gQEAgLTQ5
OSwxMSArNTEyLDE0IEBAIHN0YXRpYyB2b2lkIG10a19jcnRjX2RkcF9pcnEodm9pZCAqZGF0YSkK
PiA+ID4KPiA+ID4gICNpZiBJU19SRUFDSEFCTEUoQ09ORklHX01US19DTURRKQo+ID4gPiAgICAg
ICAgIGlmICghcHJpdi0+ZGF0YS0+c2hhZG93X3JlZ2lzdGVyICYmICFtdGtfY3J0Yy0+Y21kcV9j
bGllbnQuY2hhbikKPiA+ID4gKyAgICAgICAgICAgICAgIG10a19jcnRjX2RkcF9jb25maWcoY3J0
YywgTlVMTCk7Cj4gPiA+ICsgICAgICAgZWxzZSBpZiAobXRrX2NydGMtPmNtZHFfdmJsYW5rX2Nu
dCA+IDAgJiYgLS1tdGtfY3J0Yy0+Y21kcV92YmxhbmtfY250ID09IDApCj4gPiBJIHRoaW5rIGF0
b21pY19kZWNfYW5kX3Rlc3QoKSBkb2VzIHdoYXQgeW91IHdhbnQgdG8gZG8gaGVyZS4KPgo+IEkg
dGhpbmsgdGhpcyBvcGVyYXRpb24gaXMgbm90IG5lY2Vzc2FyeSB0byBiZSBhdG9taWMgb3BlcmF0
aW9uLCBhbmQKPiB0aGlzIHN0YXRlbWVudCBjb3VsZCBiZSByZWR1Y2VkIHRvCj4KPiBlbHNlIGlm
ICgtLW10a19jcnRjLT5jbWRxX3ZibGFua19jbnQgPT0gMCkKCkkgd2FzIHRoaW5raW5nIGFib3V0
IHVzaW5nIGV4aXN0aW5nIGhlbHBlcnMgdG8gd3JhcCB1cCB0aGUgY291bnRlcgpvcGVyYXRpb25z
LCBidXQgSSBhZ3JlZSB0aGF0IGl0J3Mgbm90IG5lY2Vzc2FyeS4KSnVzdCBkcm9wcGluZyB0aGUg
cmVkdW5kYW50IGNoZWNrIHdvdWxkIGJlIGdvb2QgZW5vdWdoLgoKCj4KPiA+Cj4gPiA+ICsgICAg
ICAgICAgICAgICBEUk1fRVJST1IoIm10a19jcnRjICVkIENNRFEgZXhlY3V0ZSBjb21tYW5kIHRp
bWVvdXQhXG4iLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgIGRybV9jcnRjX2luZGV4
KCZtdGtfY3J0Yy0+YmFzZSkpOwo+ID4gPiAgI2Vsc2UKPiA+ID4gICAgICAgICBpZiAoIXByaXYt
PmRhdGEtPnNoYWRvd19yZWdpc3RlcikKPiA+ID4gLSNlbmRpZgo+ID4gPiAgICAgICAgICAgICAg
ICAgbXRrX2NydGNfZGRwX2NvbmZpZyhjcnRjLCBOVUxMKTsKPiA+ID4gLQo+ID4gPiArI2VuZGlm
Cj4gPiA+ICAgICAgICAgbXRrX2RybV9maW5pc2hfcGFnZV9mbGlwKG10a19jcnRjKTsKPiA+ID4g
IH0KPiA+ID4KPiA+ID4gLS0KPiA+ID4gMi4xOC4wCj4gPiA+CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QK
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
