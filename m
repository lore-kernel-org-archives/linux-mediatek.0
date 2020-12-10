Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7CFBC4167B
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 15:50:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C4F323101
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 15:50:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C4F323101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sElmKeSXyYs2rvpseNVdsz2m40AylECKCcJwfKps8t4=; b=tZjGkST7gqjx8FhVOPQitRDMZ
	c6D//udCyxY0U2cNjBES+3dhAlRE+94GQPSVP7mwHnwYgJCiHggOJV9SlLXKX0g1i9GcZuVRwIDqi
	SC1WSJpekttSu9qva2CqEI7J/ZEPiOuNu+KV3cjpwmynY5iRRaic4A3yIqh4KHBnQnFmW+2qTz8Xb
	ReWqz0IrP1rpUeUzxvQiRGAP5bSGNUU+VwU+4Nn/VtNDfATbNNHW8jeRGlfMjdUPGkZd0mhvwmzS2
	ZyQx3evEhLTeI3BLweJA2w895biBp+NW3mD4FsguhcKcGZvXg4Gfi4LzRb2kFpfeGIQ0DEbND1WU/
	g+/Ut84CA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knODL-0003UT-94; Thu, 10 Dec 2020 15:50:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knOD8-0003KN-3U; Thu, 10 Dec 2020 15:50:31 +0000
X-Gm-Message-State: AOAM533JlTXGsFOIhGdhORs3UoQ7SQQ/OvWP61co4UWSmybIB9Ir3dzq
 HnW5c64NOXJ5UW5pnNT4DQUHuhQS30blEwayYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607615429;
 bh=JswAsdHWyxMnvC+dTai6TVtWwh9Dj+cpwNchJF8bnPo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=u4vlNxk5gZO0CNj3V9ovmXkU8Ld269fUM1zfcIXmVogxFNzaTn9yG8x2ztsLM4Ur/
 nX/gR+bkNweRpLwlcut21M19lVWWwrfkh1vGwtO2bKy/3JiUpCjly809+gbZObR/i6
 bdvDXyP0hgjzNMFuoM00bgq01lVMolh2pfLtrFRer6SHq7pe+7GGnXwp5n+UgjfHT7
 RNgu4aVuPlOt+dY4LDm9YpFmOO00MANM3AtkfXeX8FuQXiTBsWsjjBp0JylYmQ5Xz/
 iZ79sr3Lm6Cjo2aNOk9vPt9jtNfUgpFyqotyViLCrK+WWr2x+sLy4vwOdWido36iUy
 sQPjnfa0mc9jQ==
X-Google-Smtp-Source: ABdhPJwtcxVDc6Q2bu5uvq6r1O0IW7GMG0SyjPcCWYbsaNRsfJcxcmQwSG/LXBiPJ0zdfQUzcOkO6cQLrj6rQ7eo7AI=
X-Received: by 2002:a05:6402:845:: with SMTP id
 b5mr7518636edz.38.1607615427120; 
 Thu, 10 Dec 2020 07:50:27 -0800 (PST)
MIME-Version: 1.0
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607591262-21736-6-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 10 Dec 2020 23:50:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-aYFz1Xg6r2ur+BF_k_35F3qNLLb16_2c0MaMsYre-+w@mail.gmail.com>
Message-ID: <CAAOTY_-aYFz1Xg6r2ur+BF_k_35F3qNLLb16_2c0MaMsYre-+w@mail.gmail.com>
Subject: Re: [PATCH v8, 5/6] drm/mediatek: add RDMA fifo size error handle
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_105030_320479_F48B4A9A 
X-CRM114-Status: GOOD (  17.02  )
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
PiDmlrwgMjAyMOW5tDEy5pyIMTDml6Ug6YCx5ZubIOS4i+WNiDU6MDjlr6vpgZPvvJoKPgo+IFRo
aXMgcGF0Y2ggYWRkIFJETUEgZmlmbyBzaXplIGVycm9yIGhhbmRsZQo+IHJkbWEgZmlmbyBzaXpl
IHdpbGwgbm90IGFsd2F5cyBiaWdnZXIgdGhhbiB0aGUgY2FsY3VsYXRlZCB0aHJlc2hvbGQKPiBp
ZiB0aGF0IGNhc2UgaGFwcGVuZWQsIHdlIG5lZWQgc2V0IGZpZm8gc2l6ZSBhcyB0aGUgdGhyZXNo
b2xkCj4KPiBTaWduZWQtb2ZmLWJ5OiBZb25ncWlhbmcgTml1IDx5b25ncWlhbmcubml1QG1lZGlh
dGVrLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEu
YyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kaXNwX3JkbWEuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMKPiBpbmRleCA3OTRhY2M1Li4wNTA4Mzky
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jCj4gQEAgLTE1
MSw2ICsxNTEsMTAgQEAgc3RhdGljIHZvaWQgbXRrX3JkbWFfY29uZmlnKHN0cnVjdCBtdGtfZGRw
X2NvbXAgKmNvbXAsIHVuc2lnbmVkIGludCB3aWR0aCwKPiAgICAgICAgICAqIGFjY291bnQgZm9y
IGJsYW5raW5nLCBhbmQgd2l0aCBhIHBpeGVsIGRlcHRoIG9mIDQgYnl0ZXM6Cj4gICAgICAgICAg
Ki8KPiAgICAgICAgIHRocmVzaG9sZCA9IHdpZHRoICogaGVpZ2h0ICogdnJlZnJlc2ggKiA0ICog
NyAvIDEwMDAwMDA7Cj4gKwo+ICsgICAgICAgaWYgKHRocmVzaG9sZCA+IHJkbWFfZmlmb19zaXpl
KQo+ICsgICAgICAgICAgICAgICB0aHJlc2hvbGQgPSByZG1hX2ZpZm9fc2l6ZTsKCklmIHRoZSBm
b3JtdWxhIGlzIG5vdCBjb3JyZWN0LCB5b3Ugc2hvdWxkIGZpeCB0aGUgZm9ybXVsYSBub3Qgd29y
ayBhcm91bmQuCgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPiArCj4gICAgICAgICByZWcgPSBSRE1B
X0ZJRk9fVU5ERVJGTE9XX0VOIHwKPiAgICAgICAgICAgICAgIFJETUFfRklGT19QU0VVRE9fU0la
RShyZG1hX2ZpZm9fc2l6ZSkgfAo+ICAgICAgICAgICAgICAgUkRNQV9PVVRQVVRfVkFMSURfRklG
T19USFJFU0hPTEQodGhyZXNob2xkKTsKPiAtLQo+IDEuOC4xLjEuZGlydHkKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1h
aWxpbmcgbGlzdAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
