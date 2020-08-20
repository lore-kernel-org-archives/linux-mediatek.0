Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30DCC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:28:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A3D920748
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 23:28:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KcECzP7c";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfZ+2cwj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A3D920748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2YoFarL7NGOkpp0ea6QSZ4nb6sI2hTn7zztlGz1575w=; b=KcECzP7coAxWfsyctPnxzYfY+
	kELSKyAjMwVa+rrzFW7OfH78TcxcCMBQtsKaZF1/xDIu4aBaO7r+kbi/p4mBO+onYAyD7G1FXYkwx
	BfrSgsD6uycMRMrBtfbqq1DERVe2htc+mGP8pjCAmdUk6MCoQqrXmKkxjb6UbuULPJLYvd3Fmk3qo
	XTRax6ivFSoQIlPUuXyGmdvVynZhCfxofeoztEBowwa95+i8aA+zVBdboTd2GKPwAFu6xVIu96SHX
	0KHqrAIx6NaFoAOyxhWrPrin2mkKhwy6tbDlZ179smk+8hQxaiZVY0S0igi1cC9cDyMJ3rgLikF1w
	ZRAO+nVOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8tyh-0002gY-7K; Thu, 20 Aug 2020 23:28:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8tyf-0002fo-8Y
 for linux-mediatek@lists.infradead.org; Thu, 20 Aug 2020 23:28:14 +0000
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3306C20748
 for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2020 23:28:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597966092;
 bh=y1Wgqh1GAoyYsV2k+q2fc4yzCIr9vvCD20G5Zf/a4wU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TfZ+2cwjuT/n2Iv8QQEjGOa3CPaMieV05fFA+Oi7nEB4k7Hb4LDkEK0Db8aE1f2ym
 ewjv5j0/yOOFYVtyDctGcmmJZ5HDkRDAnaJv6cIFaTwzVq3yUI3TnvOzrRJi80NIqR
 XCd7dRHy3CdaiJfllFYq7XcfZHl1rNBSnSEkYv0Y=
Received: by mail-ed1-f43.google.com with SMTP id w17so2982754edt.8
 for <linux-mediatek@lists.infradead.org>; Thu, 20 Aug 2020 16:28:12 -0700 (PDT)
X-Gm-Message-State: AOAM532417cKzRCJHRgVEa634JtpyPsOIMUt72rMTijjFzgzviQaa2ua
 00tkVJI/aAL8a9wanM2nUt8Kyl3DecHkWPqpmQ==
X-Google-Smtp-Source: ABdhPJwuSJgrsrEJbwW4ZqpZR1tI1e3gpAbID/lO2xREIPczRxBkfkEvXEqYrYh6exUoPX+WCswHFsJtNmhFGKdT6SM=
X-Received: by 2002:a50:d2c7:: with SMTP id q7mr239405edg.61.1597966090804;
 Thu, 20 Aug 2020 16:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200819154421.7013-1-chunkuang.hu@kernel.org>
 <20200819154421.7013-3-chunkuang.hu@kernel.org>
 <eec33300-f921-03d1-5bcf-788e4e2ce342@infradead.org>
In-Reply-To: <eec33300-f921-03d1-5bcf-788e4e2ce342@infradead.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Fri, 21 Aug 2020 07:27:58 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-RZptS25adw7qoqZ-+dkK0vd+D_rd6KqChfm9ryF2RAw@mail.gmail.com>
Message-ID: <CAAOTY_-RZptS25adw7qoqZ-+dkK0vd+D_rd6KqChfm9ryF2RAw@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] drm/mediatek: Separate mtk_hdmi_phy to an
 independent module
To: Randy Dunlap <rdunlap@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_192813_391915_8111047B 
X-CRM114-Status: GOOD (  17.20  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFJhbmR5OgoKUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5vcmc+IOaWvCAyMDIw
5bm0OOaciDE55pelIOmAseS4iSDkuIvljYgxMTo1OOWvq+mBk++8mgo+Cj4gT24gOC8xOS8yMCA4
OjQ0IEFNLCBDaHVuLUt1YW5nIEh1IHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcK
PiA+IGluZGV4IGFhNzRhYWMzY2JjYy4uY2EzY2Q4NzFhMzUwIDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL0tjb25maWcKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9LY29uZmlnCj4gPiBAQCAtMjQsNiArMjQsMTMgQEAgY29uZmlnIERSTV9NRURJQVRF
S19IRE1JCj4gPiAgICAgICB0cmlzdGF0ZSAiRFJNIEhETUkgU3VwcG9ydCBmb3IgTWVkaWF0ZWsg
U29DcyIKPiA+ICAgICAgIGRlcGVuZHMgb24gRFJNX01FRElBVEVLCj4gPiAgICAgICBzZWxlY3Qg
U05EX1NPQ19IRE1JX0NPREVDIGlmIFNORF9TT0MKPiA+IC0gICAgIHNlbGVjdCBHRU5FUklDX1BI
WQo+ID4gKyAgICAgc2VsZWN0IFBIWV9NVEtfSERNSQo+ID4gICAgICAgaGVscAo+ID4gICAgICAg
ICBEUk0vS01TIEhETUkgZHJpdmVyIGZvciBNZWRpYXRlayBTb0NzCj4gPiArCj4gPiArY29uZmln
IFBIWV9NVEtfSERNSQo+ID4gKyAgICB0cmlzdGF0ZSAiTWVkaWFUZWsgSERNSS1QSFkgRHJpdmVy
Igo+ID4gKyAgICBkZXBlbmRzIG9uIEFSQ0hfTUVESUFURUsgJiYgT0YKPiA+ICsgICAgc2VsZWN0
IEdFTkVSSUNfUEhZCj4gPiArICAgIGhlbHAKPiA+ICsgICAgICAgICAgRW5hYmxlIHRoaXMgdG8g
c3VwcG9ydCBIRE1JLVBIWQo+Cj4gUGxlYXNlIGZpeCBhbGwgb2YgdGhlc2UgbmV3bHkgYWRkZWQg
bGluZXMuCj4KPiBmcm9tIERvY3VtZW50YXRpb24vcHJvY2Vzcy9jb2Rpbmctc3R5bGUucnN0Ogo+
Cj4gTGluZXMgdW5kZXIgYSBgYGNvbmZpZ2BgIGRlZmluaXRpb24KPiBhcmUgaW5kZW50ZWQgd2l0
aCBvbmUgdGFiLCB3aGlsZSBoZWxwIHRleHQgaXMgaW5kZW50ZWQgYW4gYWRkaXRpb25hbCB0d28K
PiBzcGFjZXMuCj4KCk9LLAoKUmVnYXJkcywKQ2h1bi1LdWFuZy4KCj4KPiAtLQo+IH5SYW5keQo+
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1t
ZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVr
Cg==
