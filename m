Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45141C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 09:20:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05180207D3
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 09:20:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GO2mot1d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="gr9GMxtd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05180207D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZYEG0cs/q5J0lGkYbo0D1xQ7+7vljvcZ9pM74j3AcU=; b=GO2mot1db5G9Zp
	X40OV0eBxuS/VxrLOB2dmTX2wZYtI4CS/ccUkVwzvQwlkR7hrooGqF9qJNATR+wOL3K1QSUorZZHU
	q4VT6fSYc2c1+Hzur9l2p0sSfk3UCrmQDpDczUVQf9roYwh+IvkmrB/chYu90jrsIJ2kCbuFfzEaf
	vKqTrKyr7zp3GExAEap9c2ng1Xl4OvYw2MVY3N6br7CrrRVFbcNnysQEMW/1/lorIlINZZTX6GW0H
	HRT5V6uZ+khh7zPa490NqotE+LdGQCkKUnO/PiMrYCJvnb4eOs+qhG0iVIe+h0fdmVA+7uIGDhsW8
	pxVSS6Q2C22ePti97LzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbKtb-00073Z-TB; Wed, 20 May 2020 09:20:15 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbKt7-0005IA-W5
 for linux-mediatek@lists.infradead.org; Wed, 20 May 2020 09:19:47 +0000
Received: by mail-io1-xd42.google.com with SMTP id j8so2302718iog.13
 for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2020 02:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4MtCeXtYJztBAdny7JMpr9tFuQgehgsjdymzaj9y89A=;
 b=gr9GMxtdJnZ4/HGUFlPqG3223EEHFYHgbywWo5fZ7nEcHZ/0L6m/rPRz9EMomdinGX
 gw+4y2Ot7K3hqcXBlicBJGhv59sV6FTdDVXFBbOpizlDxwLs1N1BwdpncaefpyUFWwiT
 2J4oHkfgE9Q7nJ/GxD0HVIozJ54ni07wwhAoUxEzFtI34chD+Iv01o/teHe3Gqw7nvHW
 V2Rks6kPST1qvYf+/zQ49dKrWE79INi0q4sdTLF9TbU36N9xr5znY/VfLju3YaIUC3Zl
 oldzyJFzVLpQtquHM9cyLQrc+K1nX2S9NO+aqt/tmtrmU/a97iKz1e8XIocgiaitIdS7
 UccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4MtCeXtYJztBAdny7JMpr9tFuQgehgsjdymzaj9y89A=;
 b=fvcVqNetzkz4Qb98lzL22pKH5kQhTN/S/rbYVfdtT/FA8Um1A799pXqabML6PjqTcc
 lOS1u2N2YJweOZKaU07Ait8ZOHwCHinbg/7QB10ynPOogy+obhnoUeYKMbwle85VOPAD
 MggGMBrzTAqQitqpW9AiX6duCMBRty+D1zmc45dxjyyVYilQydX5GGHdidvQvr9uTAVj
 qJWR70c6WY7y8UVABAJ6Z+j7spUUfepNhk5Td+F/hpfecsAYzOXm+B60EP8YwqLwSblS
 rWsdO2DqZ8IKTvL7lLnzG9mnBoqJwFC6jMSbqui+fjkH4rhqV7YCM7k5YgV9h3PhB+tW
 31dw==
X-Gm-Message-State: AOAM53387EQIlHN4Y9JRx+1DP1PNQTI97ADEHh8uFWYZnG8Y5eDLwScD
 I25vmCMDwLjupOyWCvp9faCSSRU/PJOZEnpzMYIevw==
X-Google-Smtp-Source: ABdhPJxfcMFcRpgMe3jPhIr7dlnaeApgO41HN00hg/DL0f0uo79Shv8ju19FCk5CWaCaCcGPEVG3ppJTh2gjtP/n54o=
X-Received: by 2002:a5d:9e11:: with SMTP id h17mr2551601ioh.119.1589966383474; 
 Wed, 20 May 2020 02:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200511150759.18766-1-brgl@bgdev.pl>
 <20200511150759.18766-2-brgl@bgdev.pl>
 <20200519182831.GA418402@bogus>
In-Reply-To: <20200519182831.GA418402@bogus>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 May 2020 11:19:32 +0200
Message-ID: <CAMRc=Md6Be41XEu3ZnR1Du_hSMaAcPn4t4Ci9jAOZ1VXz6vbfA@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] dt-bindings: arm: add a binding document for
 MediaTek PERICFG controller
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_021946_108004_645B80D2 
X-CRM114-Status: GOOD (  14.12  )
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
Cc: Edwin Peer <edwin.peer@broadcom.com>,
 devicetree <devicetree@vger.kernel.org>,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Fabien Parent <fparent@baylibre.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

d3QuLCAxOSBtYWogMjAyMCBvIDIwOjI4IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IG5h
cGlzYcWCKGEpOgo+Cj4gT24gTW9uLCBNYXkgMTEsIDIwMjAgYXQgMDU6MDc6NDZQTSArMDIwMCwg
QmFydG9zeiBHb2xhc3pld3NraSB3cm90ZToKPiA+IEZyb206IEJhcnRvc3ogR29sYXN6ZXdza2kg
PGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4gPgo+ID4gVGhpcyBhZGRzIGEgYmluZGluZyBk
b2N1bWVudCBmb3IgdGhlIFBFUklDRkcgY29udHJvbGxlciBwcmVzZW50IG9uCj4gPiBNZWRpYVRl
ayBTb0NzLiBGb3Igbm93IHRoZSBvbmx5IHZhcmlhbnQgc3VwcG9ydGVkIGlzICdtdDg1MTYtcGVy
aWNmZycuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraSA8YmdvbGFz
emV3c2tpQGJheWxpYnJlLmNvbT4KPiA+IC0tLQo+ID4gIC4uLi9hcm0vbWVkaWF0ZWsvbWVkaWF0
ZWsscGVyaWNmZy55YW1sICAgICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLHBlcmlj
ZmcueWFtbAo+ID4KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvYXJtL21lZGlhdGVrL21lZGlhdGVrLHBlcmljZmcueWFtbCBiL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWsscGVyaWNmZy55YW1sCj4g
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi43NGIyYTYxNzNm
ZmIKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWsscGVyaWNmZy55YW1sCj4gPiBAQCAtMCwwICsx
LDM0IEBACj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTIt
Q2xhdXNlKQo+ID4gKyVZQU1MIDEuMgo+ID4gKy0tLQo+ID4gKyRpZDogImh0dHA6Ly9kZXZpY2V0
cmVlLm9yZy9zY2hlbWFzL2FybS9tZWRpYXRlay9tZWRpYXRlayxwZXJpY2ZnLnlhbWwjIgo+ID4g
KyRzY2hlbWE6ICJodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMi
Cj4gPiArCj4gPiArdGl0bGU6IE1lZGlhVGVrIFBlcmlwaGVyYWwgQ29uZmlndXJhdGlvbiBDb250
cm9sbGVyCj4gPiArCj4gPiArbWFpbnRhaW5lcnM6Cj4gPiArICAtIEJhcnRvc3ogR29sYXN6ZXdz
a2kgPGJnb2xhc3pld3NraUBiYXlsaWJyZS5jb20+Cj4gPiArCj4gPiArcHJvcGVydGllczoKPiA+
ICsgIGNvbXBhdGlibGU6Cj4gPiArICAgIG9uZU9mOgo+Cj4gRG9uJ3QgbmVlZCBvbmVPZiBoZXJl
Lgo+Cj4gPiArICAgICAgLSBpdGVtczoKPiA+ICsgICAgICAgIC0gZW51bToKPiA+ICsgICAgICAg
ICAgLSBtZWRpYXRlayxwZXJpY2ZnCj4KPiBEb2Vzbid0IG1hdGNoIHRoZSBleGFtcGxlICh3aGlj
aCBpcyBjb3JyZWN0KS4KPgoKSGkgUm9iLAoKRllJIHRoaXMgd2FzIHN1cGVyc2VkZWQgYnkgdjMg
d2hpY2ggc2hvdWxkIG5vdyBiZSBjb3JyZWN0LgoKQmFydAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
