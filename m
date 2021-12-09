Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F52C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 17:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAs5jxOp1hDoAYZA/MRKA8YKvgq9Wo8hs6vpGK9/4z0=; b=B2YJ61Vqf48NlA
	uTmzICjHHaVNra+doquDky3QA1ogZLT+eK4RHKhmLpn8uDXzEHElUZmWZ2cOe4wqOX200KNYsDq0C
	R+KsYUt/bjiQM0y1NGPyRe5U5K9ophJWqWjml7Sj5Q2icIXCgXFGGcV+K9+QbXG8Rnmz3F/dqBrqp
	knlclSr5JZ/0udCTdxJrmAWkJAI0+DvH40OZe053pDuhSAsHEoO8p5n4xWTIF15tAdr3e+rmVeHAK
	HnVrJWEJ2NK6ZxvvIX8ZvIwaIm8iF1wCoMCrupPiTtVy7+KFFpDBoMzC+SAhCrAVJ1+73KYETKdNv
	zqqQa/VfC5yHWIHH93qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvNQI-00H1QK-M0; Thu, 09 Dec 2021 17:41:38 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvNPc-00H1CZ-62
 for linux-mediatek@lists.infradead.org; Thu, 09 Dec 2021 17:40:57 +0000
Received: by mail-lf1-x133.google.com with SMTP id m27so13360198lfj.12
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Dec 2021 09:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zJn8EMJ3bNTEj0rup3ByEhFgEv6FqrmSjpgYx9Y6/fs=;
 b=THwfLzEETO2LotDmBtfbO7GVo9RpDWd/aau1pNnNfsL6iDlKF9rpdpO1h3BsBtGnhA
 oNeqsvZXCU1qeXPhTr4vG+yWl6NMh8+Wsfo7HT50hxY+ZjFl3uYp4t18U4MpPo4ln7eZ
 SxdNiF7oQN9JM2NE+8KH++oZIRxEumMj/LFAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zJn8EMJ3bNTEj0rup3ByEhFgEv6FqrmSjpgYx9Y6/fs=;
 b=w61mOrlymKuGVG7FyBuT6Ktaa23PkieqwxT1mn9+ltXSKw8zLBJF8hSywhyn8Bx11g
 tcxdK7mu9g2uYm3jruUZ7ZbCwQfoj6wkEYWBTpnnNwoEltF0j/Z8WlXx37cAwilCLGdc
 Dsd22SPESUd4rST8uk+4FRbQJZJSMlYRnqEqPPZ7Yxxf0SsmZQjqooimYTU+c8qLNKBz
 JzZzVl8lbDf6ngogEd1ZrgfTQ7q+aBALBpzm9Zcnnx28NIojpd82cAw6wLqGhfVQVEqK
 uA00xw3Vv6REDgxD805UelaNXGdb/Q85zO5VC+zxHBZPzkh9vs7mQkJfh7b3XiwTKhYo
 A9Ag==
X-Gm-Message-State: AOAM533dVY5H3X0FIIQZdaSzkbJJdSA5zSNvETDpJ2dPSXCeXUP2HWCV
 9Z8nZw20qCVClr0rp4H9k9fCsb/vle+KufuQd4yxoA==
X-Google-Smtp-Source: ABdhPJxRc2UmoPypurDhZ/h36kJMpMBzWRNG3CHeSoDYXQgKpHDaTngOxX39repphKbLrvMBnrfWmkuPkEZQBYrwrUQ=
X-Received: by 2002:a05:6512:1510:: with SMTP id
 bq16mr6888001lfb.628.1639071654062; 
 Thu, 09 Dec 2021 09:40:54 -0800 (PST)
MIME-Version: 1.0
References: <20211027162806.2014022-1-markyacoub@chromium.org>
 <CAAOTY_9xG5NrPZjxcV-SY1q+44WDLLk3UsDJt74FEEnx6kVYug@mail.gmail.com>
In-Reply-To: <CAAOTY_9xG5NrPZjxcV-SY1q+44WDLLk3UsDJt74FEEnx6kVYug@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 9 Dec 2021 12:40:43 -0500
Message-ID: <CAJUqKUrZcd4KX3zHbPMS=XJddqedSmdELSdv5jzU9ouB9JdSBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Set the default value of rotation to
 DRM_MODE_ROTATE_0
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Sean Paul <seanpaul@chromium.org>, Mark Yacoub <markyacoub@google.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_094056_284093_E092B9A5 
X-CRM114-Status: GOOD (  18.18  )
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

T24gV2VkLCBEZWMgOCwgMjAyMSBhdCA3OjE2IFBNIENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5o
dUBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEhpIE1hcms6Cj4KPiBNYXJrIFlhY291YiA8bWFya3lh
Y291YkBjaHJvbWl1bS5vcmc+IOaWvCAyMDIx5bm0MTDmnIgyOOaXpSDpgLHlm5sg5LiK5Y2IMTI6
Mjjlr6vpgZPvvJoKPiA+Cj4gPiBGcm9tOiBNYXJrIFlhY291YiA8bWFya3lhY291YkBnb29nbGUu
Y29tPgo+ID4KPiA+IEF0IHRoZSByZXNldCBob29rLCBjYWxsIF9fZHJtX2F0b21pY19oZWxwZXJf
cGxhbmVfcmVzZXQgd2hpY2ggaXMKPiA+IGNhbGxlZCBhdCB0aGUgaW5pdGlhbGl6YXRpb24gb2Yg
dGhlIHBsYW5lIGFuZCBzZXRzIHRoZSBkZWZhdWx0IHZhbHVlIG9mCj4gPiByb3RhdGlvbiBvbiBh
bGwgcGxhbmVzIHRvIERSTV9NT0RFX1JPVEFURV8wIHdoaWNoIGlzIGVxdWFsIHRvIDEuCj4KPiBU
aGlzIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUsIGJ1dCBwbGVhc2UgZml4IHRoaXMgY2hlY2twYXRj
aCB3YXJuaW5nOgpVcGxvYWRlZCBhIG5ldyByZXZpc2lvbi4gVGhhbmtzIQo+Cj4gV0FSTklORzog
RnJvbTovU2lnbmVkLW9mZi1ieTogZW1haWwgYWRkcmVzcyBtaXNtYXRjaDogJ0Zyb206IE1hcmsK
PiBZYWNvdWIgPG1hcmt5YWNvdWJAZ29vZ2xlLmNvbT4nICE9ICdTaWduZWQtb2ZmLWJ5OiBNYXJr
IFlhY291Ygo+IDxtYXJreWFjb3ViQGNocm9taXVtLm9yZz4nCj4KPiB0b3RhbDogMCBlcnJvcnMs
IDEgd2FybmluZ3MsIDExIGxpbmVzIGNoZWNrZWQKPgo+IFJlZ2FyZHMsCj4gQ2h1bi1LdWFuZy4K
Pgo+ID4KPiA+IFRlc3RlZCBvbiBKYWN1enppIChNVEspLgo+ID4gUmVzb2x2ZXMgSUdUQGttc19w
cm9wZXJ0aWVzQHBsYW5lLXByb3BlcnRpZXMte2xlZ2FjeSxhdG9taWN9Cj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogTWFyayBZYWNvdWIgPG1hcmt5YWNvdWJAY2hyb21pdW0ub3JnPgo+ID4gLS0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYyB8IDMgKystCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jIGIvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fcGxhbmUuYwo+ID4gaW5kZXggZTZkY2IzNGQz
MDUyMi4uYWNjZDI2NDgxYjlmYiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHJtX3BsYW5lLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9t
dGtfZHJtX3BsYW5lLmMKPiA+IEBAIC00NCw5ICs0NCwxMCBAQCBzdGF0aWMgdm9pZCBtdGtfcGxh
bmVfcmVzZXQoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUpCj4gPiAgICAgICAgICAgICAgICAgc3Rh
dGUgPSBremFsbG9jKHNpemVvZigqc3RhdGUpLCBHRlBfS0VSTkVMKTsKPiA+ICAgICAgICAgICAg
ICAgICBpZiAoIXN0YXRlKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4g
LSAgICAgICAgICAgICAgIHBsYW5lLT5zdGF0ZSA9ICZzdGF0ZS0+YmFzZTsKPiA+ICAgICAgICAg
fQo+ID4KPiA+ICsgICAgICAgX19kcm1fYXRvbWljX2hlbHBlcl9wbGFuZV9yZXNldChwbGFuZSwg
JnN0YXRlLT5iYXNlKTsKPiA+ICsKPiA+ICAgICAgICAgc3RhdGUtPmJhc2UucGxhbmUgPSBwbGFu
ZTsKPiA+ICAgICAgICAgc3RhdGUtPnBlbmRpbmcuZm9ybWF0ID0gRFJNX0ZPUk1BVF9SR0I1NjU7
Cj4gPiAgfQo+ID4gLS0KPiA+IDIuMzMuMC4xMDc5Lmc2ZTcwNzc4ZGM5LWdvb2cKPiA+CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
