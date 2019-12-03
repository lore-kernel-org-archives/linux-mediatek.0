Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066C6C432C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 13:25:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEDA42073B
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 13:25:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TXkSo0RA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xvis201g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEDA42073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7anTzhfoLj/Z2Z8VG+j9keDFubjQxQeNOuHIq8sA8c=; b=TXkSo0RAdX/n1J
	/2BM3Tq5CFq88KHgLeCmFXiJyUy5akm9eXkIU+o+8trpAao1h50jmmOPEYGZzl72dp1mfyIWFIjI+
	MmNeZbwn20+yApEyRqH+W+oltaKOYES53BbSdZCgQ404GFp7Hw7FXMtAEv+BAPvo4y9GV6ICsOSYW
	yzRz7VXZY1sLZnj92XsuHaLlJzSofwnkIXbnSErazH3IUO5MM2mRYhiiwEQr6prBOjGprhfi55sQ2
	WEWf/vD8ObuHcw9UYnRC34PC2Mgj3vgUMhMhRuSLDsH+V8kUwyK5EJSqLEjCfFkC5CQ1tK5GV6kLj
	GbkIIY0xDiu1td8gEz4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic8B7-0008Pn-EV; Tue, 03 Dec 2019 13:25:21 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic8B4-0008Ov-Bk
 for linux-mediatek@lists.infradead.org; Tue, 03 Dec 2019 13:25:19 +0000
Received: by mail-lf1-x142.google.com with SMTP id y5so2945344lfy.7
 for <linux-mediatek@lists.infradead.org>; Tue, 03 Dec 2019 05:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9a1hL+PexI1M8Jq7K439+8ni7/mVSuwFTy8tepPE5ag=;
 b=xvis201gXI3TiO7rQvoI1mKBfSgzASqAd5iNB/gKNTcG/vn4Yqzhacn1uV/53tfqU8
 kD2NRTag5a/3oe4AJYonE/5qZUY9d/e3gtDw1PcpmJ/wbepHuPFpAO2vAYkoiRl+EaUf
 eNzFxpDgdSJ7gWNidrFThpe2xiov+axfIBro+R28+EWkRF0w07eNS6dozJjhFBRBpmMt
 usXLfgmME3MTm5zAC5CIERmWX1iAN+xefTx1Q2ApRqbMrUAp3Ylf9AiZA9HwCUstvsYg
 6tssUWKZp25YEHHE3kRX0wSoNqFps0sLQNBE4276+BCka+7PILtOjKGV7mxPqc5LGtcR
 hgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9a1hL+PexI1M8Jq7K439+8ni7/mVSuwFTy8tepPE5ag=;
 b=m7e9TzFdpe3YU3BSK3pnYhWevNEn+MolfWpr1jP0HKz3ectZclgGlt3Df3FXjwj/rM
 L+ec1LzCmraw7WHYePLleZ1eTCUbEKvu2UOg7aJiyUhy8dEvgL9KL7mGlmyyi6hFpF2s
 Y2yzxnF/JoSPTPCnFRoJbcIVmwOyxCZv09BlWSERR0phbfIoK5QAj08brvv61DxjzT32
 YX+OAwrrK2lvdt4NTh8WIEyDVebkNLXaimL7BPmjhXABVFt11v4sV5z3sg6TnUbp/6oZ
 SzQXJBlaSIGu5KAZm6iEfUV5qPfaxiocyctx806anIWCGRHYeoBlh2XkptDY8efjpfQO
 Ncgw==
X-Gm-Message-State: APjAAAW9xE5IJQ0z+/Thd8z6bGAgmYiKjPx1GaHi8ScGIvtwXDRA2n7n
 L+F7N9hl4M11G8rlKQ2TPjB2cT0lSVY9TpYK0mZRVQ==
X-Google-Smtp-Source: APXvYqxTXADDPAMH7cAkcCdHzl2vjK+aV5Roq/rNhp0U0HmtoXe1KfDsidebtQJoYG7+XHWaVda6PVL/JLS+4QQ0S+k=
X-Received: by 2002:a19:7611:: with SMTP id c17mr2569127lff.86.1575379516980; 
 Tue, 03 Dec 2019 05:25:16 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-6-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-6-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Dec 2019 14:25:04 +0100
Message-ID: <CACRpkdb9c__FUBWE6j6g9uFwYRE6CrX8gu2gbHZ-xPpZ+YkF6Q@mail.gmail.com>
Subject: Re: [PATCH v1 05/26] drm/panel: add drm_connector argument to
 get_modes()
To: Sam Ravnborg <sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_052518_411343_03393297 
X-CRM114-Status: UNSURE (   8.88  )
X-CRM114-Notice: Please train this message.
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Stefan Agner <stefan@agner.ch>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Stefan Mavrodiev <stefan@olimex.com>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Robert Chiras <robert.chiras@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Purism Kernel Team <kernel@puri.sm>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gTW9uLCBEZWMgMiwgMjAxOSBhdCA4OjMzIFBNIFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3Jn
Lm9yZz4gd3JvdGU6Cgo+IFRvZGF5IHRoZSBicmlkZ2UgY3JlYXRlcyB0aGUgZHJtX2Nvbm5lY3Rv
ciwgYnV0IHRoYXQgaXMgcGxhbm5lZAo+IHRvIGJlIG1vdmVkIHRvIHRoZSBkaXNwbGF5IGRyaXZl
cnMuCj4gVG8gZmFjaWxpdGF0ZSB0aGlzLCB1cGRhdGUgZHJtX3BhbmVsX2Z1bmNzLmdldF9tb2Rl
cygpIHRvCj4gdGFrZSBkcm1fY29ubmVjdG9yIGFzIGFuIGFyZ3VtZW50Lgo+IEFsbCBwYW5lbCBk
cml2ZXJzIGltcGxlbWVudGluZyBnZXRfbW9kZXMoKSBhcmUgdXBkYXRlZC4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzogVGhpZXJyeSBSZWRp
bmcgPHRoaWVycnkucmVkaW5nQGdtYWlsLmNvbT4KPiBDYzogTGF1cmVudCBQaW5jaGFydCA8bGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgo+IENjOiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+Cj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBs
aW51eC5pbnRlbC5jb20+Cj4gQ2M6IE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9yZz4K
PiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWxAZmZ3bGwuY2g+Cj4gQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGlu
YXJvLm9yZz4KPiBDYzogSmFnYW4gVGVraSA8amFnYW5AYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4g
Q2M6IFN0ZWZhbiBNYXZyb2RpZXYgPHN0ZWZhbkBvbGltZXguY29tPgo+IENjOiBSb2JlcnQgQ2hp
cmFzIDxyb2JlcnQuY2hpcmFzQG54cC5jb20+Cj4gQ2M6ICJHdWlkbyBHw7xudGhlciIgPGFneEBz
aWd4Y3B1Lm9yZz4KPiBDYzogUHVyaXNtIEtlcm5lbCBUZWFtIDxrZXJuZWxAcHVyaS5zbT4KClRo
aXMgbG9va3MgcmVhc29uYWJsZSB0byBtZS4KClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
