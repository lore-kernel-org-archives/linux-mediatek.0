Return-Path: <SRS0=EBBG=AP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC6DC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 22:32:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 878C720771
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jul 2020 22:32:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gf2FpbEP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OU2Bcdj8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 878C720771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uw+xCi7BL7WaHD9Hy5PWzO0y6A6PO0KBC6CsC8OCIwc=; b=Gf2FpbEPqzRDnAQ30OHjQsnd3
	70iP5312KcL6QpXnEaF58QpVYHHa10tBACQqOIx/Am8s+e8QXoNZsdWZ/r1/UYZmyfSo0pLrp4cLI
	HNFigjs+ZcRHxTl1YtJAn+u4o8rLMyDphjvWSye7lfN1TSCwF7w1aTrLchxze49Wf2YihMdKNOFRl
	6p+z97NeY09uWTU1YAsP3QscLtyogj3XHSOiR8EgENS2/VqMsVpa3bASaV+BZ48mrGTY/BEpmjPlc
	AitK51Sev164wOz1OQYneYNIE5C7zT6cLZiXqhd3VkVZVAVTs826Ai+OTph37YM5rxqsI9Wj/pIaF
	UlHE+b7Yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrqi7-0002Th-87; Sat, 04 Jul 2020 22:32:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrqhx-0002Sg-QQ; Sat, 04 Jul 2020 22:32:30 +0000
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82E0520771;
 Sat,  4 Jul 2020 22:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593901948;
 bh=JDgxeDc0q77mn2Bfmub/zIa2vh8KeOhsnmJmESnVl2I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OU2Bcdj8eCRQq8bAmhgE0cftlYY58Yxm5cABJyNij191smRipqOnrccERDDwgDzvh
 0MbRVPb51d4BQjFO2kjLhRMssRQ/uR5jhrGvor4tNUsC39LEY4vE568Hl4KKZZy/AR
 hil1WKo3XVAUlPSWNvZD0kFhNY/zehPelTPTa/P0=
Received: by mail-ed1-f43.google.com with SMTP id n2so22168161edr.5;
 Sat, 04 Jul 2020 15:32:28 -0700 (PDT)
X-Gm-Message-State: AOAM530o8AdPGvz7VsY/0U5f0/W/lZd3kQndR1IZqYpAXUS93xkHGw8s
 EfCdCk1wbpfX5dEE/NyjfPj2Hv3kfB6gw521gA==
X-Google-Smtp-Source: ABdhPJxIh4GPX7JSDq52xIUF04T9azFXrk5ce1qys5ZdT5X5tZvDB1t9DiHPJQy7D2fBh8P/jxN/It9MNTUvgHMpkkk=
X-Received: by 2002:a05:6402:203c:: with SMTP id
 ay28mr38014412edb.271.1593901947136; 
 Sat, 04 Jul 2020 15:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200519094045.2447940-1-enric.balletbo@collabora.com>
 <CAAOTY_-m67cCrrgb=Ot9gnj22Ks3qDCDFQhELMA=m0xSB9mwWQ@mail.gmail.com>
In-Reply-To: <CAAOTY_-m67cCrrgb=Ot9gnj22Ks3qDCDFQhELMA=m0xSB9mwWQ@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 5 Jul 2020 06:32:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY__YSVs5dFPSBcAfpkxZLQcc+Ky_MaO7QmCnXKXYa82=7A@mail.gmail.com>
Message-ID: <CAAOTY__YSVs5dFPSBcAfpkxZLQcc+Ky_MaO7QmCnXKXYa82=7A@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: mtk_mt8173_hdmi_phy: Remove unnused const
 variables
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200704_183230_055468_AA49518D 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIEVucmljOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaWvCAy
MDIw5bm0NeaciDE55pelIOmAseS6jCDkuIvljYgxMToxMuWvq+mBk++8mgo+Cj4gSGksIEVucmlj
Ogo+Cj4gRW5yaWMgQmFsbGV0Ym8gaSBTZXJyYSA8ZW5yaWMuYmFsbGV0Ym9AY29sbGFib3JhLmNv
bT4g5pa8IDIwMjDlubQ15pyIMTnml6Ug6YCx5LqMIOS4i+WNiDU6NDDlr6vpgZPvvJoKPiA+Cj4g
PiBUaGVyZSBhcmUgc29tZSBgc3RhdGljIGNvbnN0IHU4YCB2YXJpYWJsZXMgdGhhdCBhcmUgbm90
IHVzZWQsIHRoaXMKPiA+IHRyaWdnZXJzIGEgd2FybmluZyBidWlsZGluZyB3aXRoIGBtYWtlIFc9
MWAsIGl0IGlzIHNhZmUgdG8gcmVtb3ZlIHRoZW0sCj4gPiBzbyBkbyBpdCBhbmQgbWFrZSB0aGUg
Y29tcGlsZXIgbW9yZSBoYXBweS4KPiA+Cj4KPiBSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8
Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+CgpBcHBsaWVkIHRvIG1lZGlhdGVrLWRybS1maXhlcyBb
MV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tZml4ZXMK
ClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFbnJpYyBCYWxsZXRi
byBpIFNlcnJhIDxlbnJpYy5iYWxsZXRib0Bjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPgo+ID4g
IC4uLi9ncHUvZHJtL21lZGlhdGVrL210a19tdDgxNzNfaGRtaV9waHkuYyAgICB8IDQ4IC0tLS0t
LS0tLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNDggZGVsZXRpb25zKC0pCj4gPgo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX2hkbWlf
cGh5LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX210ODE3M19oZG1pX3BoeS5jCj4g
PiBpbmRleCAxYzM1NzUzNzIyMzAuLjgyN2I5Mzc4NmZhYyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX2hkbWlfcGh5LmMKPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfbXQ4MTczX2hkbWlfcGh5LmMKPiA+IEBAIC0xMDcsNTQg
KzEwNyw2IEBACj4gPiAgI2RlZmluZSBSR1NfSERNSVRYXzVUMV9FREcgICAgICAgICAgICAgKDB4
ZiA8PCA0KQo+ID4gICNkZWZpbmUgUkdTX0hETUlUWF9QTFVHX1RTVCAgICAgICAgICAgIEJJVCgw
KQo+ID4KPiA+IC1zdGF0aWMgY29uc3QgdTggUFJFRElWWzNdWzRdID0gewo+ID4gLSAgICAgICB7
MHgwLCAweDAsIDB4MCwgMHgwfSwgICAvKiAyN01oeiAqLwo+ID4gLSAgICAgICB7MHgxLCAweDEs
IDB4MSwgMHgxfSwgICAvKiA3NE1oeiAqLwo+ID4gLSAgICAgICB7MHgxLCAweDEsIDB4MSwgMHgx
fSAgICAvKiAxNDhNaHogKi8KPiA+IC19Owo+ID4gLQo+ID4gLXN0YXRpYyBjb25zdCB1OCBUWERJ
VlszXVs0XSA9IHsKPiA+IC0gICAgICAgezB4MywgMHgzLCAweDMsIDB4Mn0sICAgLyogMjdNaHog
Ki8KPiA+IC0gICAgICAgezB4MiwgMHgxLCAweDEsIDB4MX0sICAgLyogNzRNaHogKi8KPiA+IC0g
ICAgICAgezB4MSwgMHgwLCAweDAsIDB4MH0gICAgLyogMTQ4TWh6ICovCj4gPiAtfTsKPiA+IC0K
PiA+IC1zdGF0aWMgY29uc3QgdTggRkJLU0VMWzNdWzRdID0gewo+ID4gLSAgICAgICB7MHgxLCAw
eDEsIDB4MSwgMHgxfSwgICAvKiAyN01oeiAqLwo+ID4gLSAgICAgICB7MHgxLCAweDAsIDB4MSwg
MHgxfSwgICAvKiA3NE1oeiAqLwo+ID4gLSAgICAgICB7MHgxLCAweDAsIDB4MSwgMHgxfSAgICAv
KiAxNDhNaHogKi8KPiA+IC19Owo+ID4gLQo+ID4gLXN0YXRpYyBjb25zdCB1OCBGQktESVZbM11b
NF0gPSB7Cj4gPiAtICAgICAgIHsxOSwgMjQsIDI5LCAxOX0sICAgICAgIC8qIDI3TWh6ICovCj4g
PiAtICAgICAgIHsxOSwgMjQsIDE0LCAxOX0sICAgICAgIC8qIDc0TWh6ICovCj4gPiAtICAgICAg
IHsxOSwgMjQsIDE0LCAxOX0gICAgICAgIC8qIDE0OE1oeiAqLwo+ID4gLX07Cj4gPiAtCj4gPiAt
c3RhdGljIGNvbnN0IHU4IERJVkVOWzNdWzRdID0gewo+ID4gLSAgICAgICB7MHgyLCAweDEsIDB4
MSwgMHgyfSwgICAvKiAyN01oeiAqLwo+ID4gLSAgICAgICB7MHgyLCAweDIsIDB4MiwgMHgyfSwg
ICAvKiA3NE1oeiAqLwo+ID4gLSAgICAgICB7MHgyLCAweDIsIDB4MiwgMHgyfSAgICAvKiAxNDhN
aHogKi8KPiA+IC19Owo+ID4gLQo+ID4gLXN0YXRpYyBjb25zdCB1OCBIVFBMTEJQWzNdWzRdID0g
ewo+ID4gLSAgICAgICB7MHhjLCAweGMsIDB4OCwgMHhjfSwgICAvKiAyN01oeiAqLwo+ID4gLSAg
ICAgICB7MHhjLCAweGYsIDB4ZiwgMHhjfSwgICAvKiA3NE1oeiAqLwo+ID4gLSAgICAgICB7MHhj
LCAweGYsIDB4ZiwgMHhjfSAgICAvKiAxNDhNaHogKi8KPiA+IC19Owo+ID4gLQo+ID4gLXN0YXRp
YyBjb25zdCB1OCBIVFBMTEJDWzNdWzRdID0gewo+ID4gLSAgICAgICB7MHgyLCAweDMsIDB4Mywg
MHgyfSwgICAvKiAyN01oeiAqLwo+ID4gLSAgICAgICB7MHgyLCAweDMsIDB4MywgMHgyfSwgICAv
KiA3NE1oeiAqLwo+ID4gLSAgICAgICB7MHgyLCAweDMsIDB4MywgMHgyfSAgICAvKiAxNDhNaHog
Ki8KPiA+IC19Owo+ID4gLQo+ID4gLXN0YXRpYyBjb25zdCB1OCBIVFBMTEJSWzNdWzRdID0gewo+
ID4gLSAgICAgICB7MHgxLCAweDEsIDB4MCwgMHgxfSwgICAvKiAyN01oeiAqLwo+ID4gLSAgICAg
ICB7MHgxLCAweDIsIDB4MiwgMHgxfSwgICAvKiA3NE1oeiAqLwo+ID4gLSAgICAgICB7MHgxLCAw
eDIsIDB4MiwgMHgxfSAgICAvKiAxNDhNaHogKi8KPiA+IC19Owo+ID4gLQo+ID4gIHN0YXRpYyBp
bnQgbXRrX2hkbWlfcGxsX3ByZXBhcmUoc3RydWN0IGNsa19odyAqaHcpCj4gPiAgewo+ID4gICAg
ICAgICBzdHJ1Y3QgbXRrX2hkbWlfcGh5ICpoZG1pX3BoeSA9IHRvX210a19oZG1pX3BoeShodyk7
Cj4gPiAtLQo+ID4gMi4yNi4yCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVr
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1tZWRpYXRlawo=
