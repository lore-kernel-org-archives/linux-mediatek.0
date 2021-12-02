Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FCB7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 23:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhLl+R7iuGQSij5ZgsA9K+EEHF5V6XOZ5qHZ8EaY1OY=; b=0YgZYv3v9v9+RS
	fItfSDmn7Zgrn54FPuHTzjurY5tPZRyl7FCmNip/tywellGz1iyMm1H6ixZRqD1AsktcR158u2uzL
	kqKhHBwi/7sAg1zcHf86/Jb6XI40vWXJ5bLlX0NCewY7bEv8U4hi8mHSlhvaQAnLXsLHGh8V4mALy
	/lBzv0iSRuHyTjDdW8Z9hCYKZXNHBK+CnlO/sQTBlXuCe66idCtk3q3GbTwS2StW+SLWdBkEbchy+
	J6RlL6MR5tvYsLIg1ZFC4TcYu1Egg8SMHNO+i6r7p7EyMDpDM5VI/O8jN/I7IlOpMN5QE0IAIHOIu
	GjrzxTBB/uLgBvJJ0Cww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msvOr-00DgMS-5E; Thu, 02 Dec 2021 23:22:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msvOe-00DgKB-GS; Thu, 02 Dec 2021 23:21:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A4DB6B823BF;
 Thu,  2 Dec 2021 23:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6079AC00446;
 Thu,  2 Dec 2021 23:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638487303;
 bh=Z/jGQpnQw3oofLGE8VWrIcjp8qGhDD1OVv0BpGn7Qgg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mlYHgMKec+DhMMXhHU1g0cDORzZcX7nj5KqnMZNaNWmF7xi9pjFZI8yBQcpZxWMsb
 Qdu9Q7PoKtrtbtC9LoHmy3xeIRJL3TzzmcVBjv50y0oaGGF4OsgdNL0ursrUG6B1iq
 M8mz3RvBfsbvXbO3Uiv9fWxdzdFWJriWGq5K5mXhZsAqY6hFMNCmgcG9AdMcjImxGF
 rTmAy/kJrCgzg11ffalhjhrb1nyyFU4RoXSwBrC0CDfK13+vXVI5dYYX9PmTwq+R6h
 ctZsigXk/rBsRKreV/5bSdrX/IHQ+AiuCMx36pM0POjjMtMXVkoGzFjQrps9rh53zi
 YEgw1WQeuC+lw==
Received: by mail-ed1-f47.google.com with SMTP id t5so4514639edd.0;
 Thu, 02 Dec 2021 15:21:43 -0800 (PST)
X-Gm-Message-State: AOAM533pJFql6rrYIsu8vvVbCpeJxYkG9zWSwQT0pEzd9NWO3oMnj8nm
 ITpJzvFFVvY46MMtqZdVlB2HwHQ8SQxOh+Cvdg==
X-Google-Smtp-Source: ABdhPJyFOGRgjggt/MCtPqpiPE8ypTDbLIj9hicoONLcDCjRcwAqVaW2ilRFZht6FsdbQPlGHYiK+3BWBezOz8iUxvs=
X-Received: by 2002:a05:6402:5110:: with SMTP id
 m16mr21955080edd.15.1638487301695; 
 Thu, 02 Dec 2021 15:21:41 -0800 (PST)
MIME-Version: 1.0
References: <20211202064039.20797-1-jason-jh.lin@mediatek.com>
 <20211202064039.20797-2-jason-jh.lin@mediatek.com>
In-Reply-To: <20211202064039.20797-2-jason-jh.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 3 Dec 2021 07:21:30 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-59wtqprA+fRc6dvQRoVLr7HiNktYgvvt9pi_=CcYrYA@mail.gmail.com>
Message-ID: <CAAOTY_-59wtqprA+fRc6dvQRoVLr7HiNktYgvvt9pi_=CcYrYA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/mediatek: add wait_for_event for crtc disable
 by cmdq
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, tzungbi@google.com, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Fei Shao <fshao@chromium.org>, Nancy Lin <nancy.lin@mediatek.com>,
 singo.chang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_152148_894522_510EA1E5 
X-CRM114-Status: GOOD (  21.19  )
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

SGksIEphc29uOgoKamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPiDmlrwg
MjAyMeW5tDEy5pyIMuaXpSDpgLHlm5sg5LiL5Y2IMjo0MeWvq+mBk++8mgo+Cj4gbXRrX2RybV9j
cnRjX2F0b21pY19kaXNhYmxlIHdpbGwgc2VuZCBhbiBhc3luYyBjbWQgdG8gY21kcSBkcml2ZXIs
Cj4gc28gaXQgbWF5IG5vdCBmaW5pc2ggd2hlbiBjbWRxX3N1c3BlbmQgaXMgY2FsbGVkIHNvbWV0
aW1lcy4KPgo+IEFkZCB3YWl0X2Zvcl9ldmVudCBhZnRlciBzZW5kaW5nIGFzeW5jIGRpc2FibGUg
cGxhbmUgY21kIHRvIG1ha2UKPiBzdXJlIHRoZSBsYXN0ZXN0IGNtZCBpcyBkb25lIGJlZm9yZSBj
bWRxX3N1c3BlbmQuCgpSZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtl
cm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogamFzb24tamgubGluIDxqYXNvbi1qaC5saW5A
bWVkaWF0ZWsuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9j
cnRjLmMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMo
KykKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9jcnRjLmMKPiBpbmRleCA2MjUy
OWE5NTRiNjIuLjBiNDAxMjMzNWU3YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2RybV9jcnRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9jcnRjLmMKPiBAQCAtNTYsNiArNTYsNyBAQCBzdHJ1Y3QgbXRrX2RybV9jcnRjIHsKPiAg
ICAgICAgIHN0cnVjdCBjbWRxX3BrdCAgICAgICAgICAgICAgICAgY21kcV9oYW5kbGU7Cj4gICAg
ICAgICB1MzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNtZHFfZXZlbnQ7Cj4gICAgICAg
ICB1MzIgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNtZHFfdmJsYW5rX2NudDsKPiArICAg
ICAgIHdhaXRfcXVldWVfaGVhZF90ICAgICAgICAgICAgICAgY2JfYmxvY2tpbmdfcXVldWU7Cj4g
ICNlbmRpZgo+Cj4gICAgICAgICBzdHJ1Y3QgZGV2aWNlICAgICAgICAgICAgICAgICAgICptbXN5
c19kZXY7Cj4gQEAgLTMxNCw2ICszMTUsNyBAQCBzdGF0aWMgdm9pZCBkZHBfY21kcV9jYihzdHJ1
Y3QgbWJveF9jbGllbnQgKmNsLCB2b2lkICptc3NnKQo+ICAgICAgICAgfQo+Cj4gICAgICAgICBt
dGtfY3J0Yy0+Y21kcV92YmxhbmtfY250ID0gMDsKPiArICAgICAgIHdha2VfdXAoJm10a19jcnRj
LT5jYl9ibG9ja2luZ19xdWV1ZSk7Cj4gIH0KPiAgI2VuZGlmCj4KPiBAQCAtNzAwLDYgKzcwMiwx
MyBAQCBzdGF0aWMgdm9pZCBtdGtfZHJtX2NydGNfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9j
cnRjICpjcnRjLAo+ICAgICAgICAgbXRrX2NydGMtPnBlbmRpbmdfcGxhbmVzID0gdHJ1ZTsKPgo+
ICAgICAgICAgbXRrX2RybV9jcnRjX3VwZGF0ZV9jb25maWcobXRrX2NydGMsIGZhbHNlKTsKPiAr
I2lmIElTX1JFQUNIQUJMRShDT05GSUdfTVRLX0NNRFEpCj4gKyAgICAgICAvKiBXYWl0IGZvciBw
bGFuZXMgdG8gYmUgZGlzYWJsZWQgYnkgY21kcSAqLwo+ICsgICAgICAgaWYgKG10a19jcnRjLT5j
bWRxX2NsaWVudC5jaGFuKQo+ICsgICAgICAgICAgICAgICB3YWl0X2V2ZW50X3RpbWVvdXQobXRr
X2NydGMtPmNiX2Jsb2NraW5nX3F1ZXVlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbXRrX2NydGMtPmNtZHFfdmJsYW5rX2NudCA9PSAwLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbXNlY3NfdG9famlmZmllcyg1MDApKTsKPiArI2VuZGlmCj4gICAg
ICAgICAvKiBXYWl0IGZvciBwbGFuZXMgdG8gYmUgZGlzYWJsZWQgKi8KPiAgICAgICAgIGRybV9j
cnRjX3dhaXRfb25lX3ZibGFuayhjcnRjKTsKPgo+IEBAIC05ODAsNiArOTg5LDkgQEAgaW50IG10
a19kcm1fY3J0Y19jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYsCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBtdGtfY3J0Yy0+Y21kcV9jbGllbnQuY2hhbiA9IE5VTEw7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+ICAgICAgICAgICAgICAgICB9Cj4gKwo+ICsg
ICAgICAgICAgICAgICAvKiBmb3Igc2VuZGluZyBibG9ja2luZyBjbWQgaW4gY3J0YyBkaXNhYmxl
ICovCj4gKyAgICAgICAgICAgICAgIGluaXRfd2FpdHF1ZXVlX2hlYWQoJm10a19jcnRjLT5jYl9i
bG9ja2luZ19xdWV1ZSk7Cj4gICAgICAgICB9Cj4gICNlbmRpZgo+ICAgICAgICAgcmV0dXJuIDA7
Cj4gLS0KPiAyLjE4LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
