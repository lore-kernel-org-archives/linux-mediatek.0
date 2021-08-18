Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A60B7C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 14:21:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63CE460187
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 14:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63CE460187
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjJYCCTQp6P9iyZi++wsVycWQD5hKMDU011QxtPQxzA=; b=zr56OlrYMYw9dj
	yRfRgEV3Hj4oOP6aRDdjTnmo6LUVyNhH1xprvD0i7uPeNYSoROjgMBIIFfny+KG5ZEi6xDbNmMG5g
	TwE59OEuEpHAqinLYUSzT5gp/62bgifX6N7B2FSu1enMEazeljYwuYXGRgUs6IfcB0RJY6BpaWWlO
	7ICrlGI385llOmQQPdc0K0MBfhwEGCm/kdpso8RS1V+ObZcIa9wVn2l3r38ZqtB6QGfZgUtRtsmqh
	gH9o/6keD59oJo12kC2uKZim3feyBVrtof5NsI46oQxX8AdxI0pHuRvuxtax2cqSuI3kHXjoXJ2R5
	wgcSZrS/hYqltoqimfdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGMRE-005s8g-HC; Wed, 18 Aug 2021 14:21:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGMR1-005s6l-KQ; Wed, 18 Aug 2021 14:20:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55F5A60560;
 Wed, 18 Aug 2021 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629296451;
 bh=3VS49PGFx4ovf7scM6iEYT6DejL6yh/QZoZo2qPj/q8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QJ73Eui4czENjaz6g7tVNraMOzz+ewMq2xoRXjlcV5PicbPKNO3nq3+g2ebGjcm/O
 yMQAylbBGQG8TS7yePMvPNWtqZI4IH9OYEccnPDIjejhobznoEVLtOpw1FZIOebruh
 ZAe7Cxrzy3h/VuTil2W8I9NXUcQrczN6zhlg52/SUx0reJO4bRxuU56Xj+W0ECPNhb
 An/horOkpo2q9zpfUjt4VWb6QfHqjjIyAHI3VRTAMPdZW1p4ShdKT1fukO3LtTVxwm
 fmmhdGTm3dPCHYg6/5+HRWdSRBeDLyAuGDrnzSZ5SZJiFKCvtLDGZfJXrdpmd6+b+X
 ja4ItdpTNzQpQ==
Received: by mail-ej1-f53.google.com with SMTP id x11so5525100ejv.0;
 Wed, 18 Aug 2021 07:20:51 -0700 (PDT)
X-Gm-Message-State: AOAM531zxqNDzxUQY0dAGMCc5Xe1Nw+0FNyt2E78O0mZEKEwDau8/xEa
 jS+Jfs9xFi2hibm0zGe/EX9wdcK9hu6MP1mq6w==
X-Google-Smtp-Source: ABdhPJxNH/3NPVuu5JiFruQ2uSA2icEz290Z3VRMLhmiLOVcWxKi46n4hLgcFPmUOoiY1+Arx9MBFmAPSQHUvawgGpU=
X-Received: by 2002:a17:906:fa92:: with SMTP id
 lt18mr10107051ejb.359.1629296448282; 
 Wed, 18 Aug 2021 07:20:48 -0700 (PDT)
MIME-Version: 1.0
References: <1627635002-24521-1-git-send-email-chunfeng.yun@mediatek.com>
 <1627635002-24521-3-git-send-email-chunfeng.yun@mediatek.com>
 <YQ2e6AGFi7beqp6Q@robh.at.kernel.org>
 <cd1662f5f47fe7539d2c01bd280ad8b9d9d25b3e.camel@mediatek.com>
In-Reply-To: <cd1662f5f47fe7539d2c01bd280ad8b9d9d25b3e.camel@mediatek.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 18 Aug 2021 09:20:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKjjPqArmhoXuYrk+1C-vXFSKNA_gxtOfLFsGTGBq20aQ@mail.gmail.com>
Message-ID: <CAL_JsqKjjPqArmhoXuYrk+1C-vXFSKNA_gxtOfLFsGTGBq20aQ@mail.gmail.com>
Subject: Re: [PATCH 03/11] dt-bindings: usb: mtk-xhci: add compatible for
 mt8195
To: =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "mathias.nyman@intel.com" <mathias.nyman@intel.com>, 
 =?UTF-8?B?RWRkaWUgSHVuZyAo5rSq5q2j6ZGrKQ==?= <Eddie.Hung@mediatek.com>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_072051_710482_3CB63C5C 
X-CRM114-Status: GOOD (  18.94  )
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

T24gV2VkLCBBdWcgMTEsIDIwMjEgYXQgMzowMiBBTSBDaHVuZmVuZyBZdW4gKOS6keaYpeWzsCkK
PENodW5mZW5nLll1bkBtZWRpYXRlay5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCAyMDIxLTA4LTA2
IGF0IDE0OjQzIC0wNjAwLCBSb2IgSGVycmluZyB3cm90ZToKPiA+IE9uIEZyaSwgSnVsIDMwLCAy
MDIxIGF0IDA0OjQ5OjU0UE0gKzA4MDAsIENodW5mZW5nIFl1biB3cm90ZToKPiA+ID4gVGhlcmUg
YXJlIDQgVVNCIGNvbnRyb2xsZXJzIG9uIE1UODE5NSwgdGhlIGNvbnRyb2xsZXJzIChJUDF+SVAz
LAo+ID4gPiBleGNsdWRlIElQMCkgaGF2ZSBhIHdyb25nIGRlZmF1bHQgU09GL0lUUCBpbnRlcnZh
bCB3aGljaCBpcwo+ID4gPiBjYWxjdWxhdGVkIGZyb20gdGhlIGZyYW1lIGNvdW50ZXIgY2xvY2sg
MjRNaHogYnkgZGVmYXVsdCwgYnV0Cj4gPiA+IGluIGZhY3QsIHRoZSBmcmFtZSBjb3VudGVyIGNs
b2NrIGlzIDQ4TWh6LCBzbyB3ZSBzaG91bGQgc2V0Cj4gPiA+IHRoZSBhY2N1cmF0ZSBpbnRlcnZh
bCBhY2NvcmRpbmcgdG8gNDhNaHouIEhlcmUgYWRkIGEgbmV3IGNvbXBhdGlibGUKPiA+ID4gZm9y
IE1UODE5NSwgaXQncyBhbHNvIHN1cHBvcnRlZCBpbiBkcml2ZXIuIEJ1dCB0aGUgZmlyc3QgY29u
dHJvbGxlcgo+ID4gPiAoSVAwKSBoYXMgbm8gc3VjaCBpc3N1ZSwgd2UgcHJlZmVyIHRvIHVzZSBn
ZW5lcmljIGNvbXBhdGlibGUsCj4gPiA+IGUuZy4gbXQ4MTkyJ3MgY29tcGF0aWJsZS4KPiA+Cj4g
PiBUaGF0IG9ubHkgd29ya3MgdW50aWwgeW91IGZpbmQgc29tZSA4MTk1IGJ1ZyBjb21tb24gdG8g
YWxsCj4gPiBpbnN0YW5jZXMuCj4gSXQncyBhbHNvIE9LIGZvciBJUDAgdG8gdXNlIG10ODE5NSdz
IGNvbXBhdGlibGUsIHRoZXNlIHNldHRpbmcgdmFsdWUgaXMKPiB0aGUgc2FtZSBhcyBJUDAncyBk
ZWZhdWx0IHZhbHVlLCB1c2UgbXQ4MTkyJ3MgbWF5IGF2b2lkIHRoZXNlIGR1bW15Cj4gc2V0dGlu
Zy4KCkkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZC4gQnkgdXNlIG10ODE5MidzIGNvbXBhdGlibGUs
IHRoYXQgbWVhbnMgeW91CmhhdmUgZm9yIElQMDoKCmNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXQ4
MTkyLXhoY2kiLCAibWVkaWF0ZWssbXRrLXhoY2kiOwoKQW5kIGZvciB0aGUgcmVzdDoKY29tcGF0
aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUteGhjaSIsICJtZWRpYXRlayxtdGsteGhjaSI7CgpJZiB0
aGVyZSdzIGEgODE5NSBxdWlyayB5b3UgbmVlZCB0byB3b3JrIGFyb3VuZCwgdGhlbiB5b3UgY2Fu
J3Qgb24KSVAwLiBZb3UgbmVlZCB0byBiZSBhYmxlIHRvIGFkZHJlc3MgcXVpcmtzIGluIHRoZSBm
dXR1cmUgd2l0aG91dApjaGFuZ2luZyB0aGUgRFRCLiBUaGF0IGlzIHdoeSB3ZSByZXF1aXJlIFNv
QyBzcGVjaWZpYyBjb21wYXRpYmxlcyBldmVuCndoZW4gSVAgYmxvY2tzIGFyZSAndGhlIHNhbWUn
LgoKUm9iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
