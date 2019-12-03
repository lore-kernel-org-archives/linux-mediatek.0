Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9368C432C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 13:27:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B512073B
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 13:27:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mdw/yW6R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kf2TrLzo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0B512073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zj2axd5QxqHLfIMeubal1Xy2q1gX6rKhsyaeoPiKh/Q=; b=mdw/yW6RaZkIzF
	6bYUbGcFitb/vpZwGL/89Z+DkJpkoJ4k57s4BhlKV9iDWW90dM5du73mcPGp0K7jAgrH4XHGpjLod
	NjrFpY2S4CDH7Tdc8J+MLKp1yFrLSo5TVMUmuAzs67rrXw7OVokEXX8ytaIWZJ12LT//6bVUktTDl
	8wmGi2/N8q/PaoVuX4S6ww0EQon1NZTxfu5a5C2++SVLSTUHzjfhzBF79EBoUC4YwmT4wxJ5H3mbJ
	jmJxuxgrMSAiI5oSNvuNS1AyACR2+EL/ZXwFfL+sAF/3bWL4e9XJM9oc9EUQylVsgtHwz8NV/1lfI
	oqNAWNtxuOIn5g0IaTEg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic8DX-000144-Ab; Tue, 03 Dec 2019 13:27:51 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic8DT-00012G-Bw
 for linux-mediatek@lists.infradead.org; Tue, 03 Dec 2019 13:27:48 +0000
Received: by mail-lf1-x142.google.com with SMTP id y5so2952701lfy.7
 for <linux-mediatek@lists.infradead.org>; Tue, 03 Dec 2019 05:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w5kvvsNqTWUYowCw16IbU3x1YCmaOiYf5tGr6DU/4Oo=;
 b=Kf2TrLzoeW7GPO93jICax9H7npFli7nKkPrAa/7pensbMPErLdSyO5cAPXKjgJ5SwW
 dQrNoMOKIZ0oZKLp96BDVuif4EmGi5MgCrhh0N20691gPfYKiIWpucl1bpxPv8HyWwEO
 sV/o0T5vo3zUWjf4mn/5JFm4iQ9eVy7Qwu71lDN9Y0jhqghCBoOVDyB/uDoKZVeoM5qE
 lirCwRmMcZeJCvVkm4a8hz6Ijs6Aw/lR6XRBXo/Au/eoIX7M/1cljIRGuyDeppCzGaRX
 SiP6V0C53L9KztUCT76fN77bWsENOXX1T2+wgpTdxmhUZRMwMYpW+0PGCrTHVh2H+JbJ
 2ZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w5kvvsNqTWUYowCw16IbU3x1YCmaOiYf5tGr6DU/4Oo=;
 b=VrewxziMvKkv1IB9D+OXBICAWZygP1BsXrTqFNpZq+nYP+kGrSDDtfHpXly0WcP2jf
 YhxvQiH+coJrPa6ny33YV9Wsp8YuM0m+Cp9ehAPqJ4MEy6nIcPLGq3GslSXIwE+O2WkB
 OLl3R5VkDUh6EuH4uFr8q2eH+0GG1oHCq3FNcApxFXPoXjjhguaia6sspfmw3I/UZm0t
 NP2F7tnFEGAmn3WVFVBPUZ14Z/vb20F32wauNNy/Im4snaeUKBCimO56iqwhMajMSahd
 ZqaGc0sHjcL/5OM+ZdsCx1DBcoErWPsU93r8bIpzEf3L9JZML/zojCiba+akm+nz4WDH
 koLg==
X-Gm-Message-State: APjAAAXLRLC8qbpr1Ug4D+pqmEpheanC0LvZkhkNijvVV+m54izsBPSu
 qDwc+AfVnWK+GwhTzQnkCo0k34ujMXoAzbw/0Ix3xA==
X-Google-Smtp-Source: APXvYqyofMBPFWLLzB1STopamPLWqp8a6SLsme2LKB0JzU+G9blqUgnpYL5l6F2TBybbdU6uzjI0Yo9WQ+oH5mP/T40=
X-Received: by 2002:a19:f701:: with SMTP id z1mr2657953lfe.133.1575379666036; 
 Tue, 03 Dec 2019 05:27:46 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-9-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-9-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Dec 2019 14:27:34 +0100
Message-ID: <CACRpkdbiyVcUDrxuCK_wgsB6Vn+XZptsc9H3zB0cXxjeOtw+Ug@mail.gmail.com>
Subject: Re: [PATCH v1 08/26] drm/panel: drop drm_device from drm_panel
To: Sam Ravnborg <sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_052747_414266_AE57DA93 
X-CRM114-Status: GOOD (  12.56  )
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
Lm9yZz4gd3JvdGU6Cgo+IFRoZSBwYW5lbCBkcml2ZXJzIHVzZWQgZHJtX3BhbmVsLmRybSBmb3Ig
dHdvIHB1cnBvc2VzOgo+IDEpIEFyZ3VtZW50IHRvIGRybV9tb2RlX2R1cGxpY2F0ZSgpCj4gMikg
ZHJtLT5kZXYgd2FzIHVzZWQgaW4gZXJyb3IgbWVzc2FnZXMKPgo+IFRoZSBmaXJzdCB1c2FnZSBp
cyByZXBsYWNlZCB3aXRoIGRybV9jb25uZWN0b3IuZGV2Cj4gLSBkcm1fY29ubmVjdG9yIGlzIGFs
cmVhZHkgY29ubmVjdGVkIHRvIGEgZHJtX2RldmljZQo+ICAgYW5kIHdlIGhhdmUgYSB2YWxpZCBj
b25uZWN0b3IKPgo+IFRoZSBzZWNvbmQgdXNhZ2UgaXMgcmVwbGFjZWQgd2l0aCBkcm1fcGFuZWwu
ZGV2Cj4gLSB0aGlzIG1ha2VzIGRyaXZlcnMgbW9yZSBjb25zaXN0ZW50IGluIHRoZWlyIGRldiBh
cmd1bWVudAo+ICAgdXNlZCBmb3IgZGV2X2VycigpIGFuZCBmcmllbmRzCj4KPiBXaXRoIHRoZXNl
IHJlcGxhY2VtZW50cyB0aGVyZSBhcmUgbm8gbW9yZSB1c2VzIG9mIGRybV9wYW5lbC5kcm0sCj4g
c28gaXQgaXMgcmVtb3ZlZCBmcm9tIHN0cnVjdCBkcm1fcGFuZWwuCj4gV2l0aCB0aGlzIGNoYW5n
ZSBkcm1fcGFuZWxfYXR0YWNoKCkgYW5kIGRybV9wYW5lbF9kZXRhY2goKQo+IG5vIGxvZ25lciBo
YXMgYW55IHVzZSBhcyB0aGV5IGFyZSBlbXB0eSBmdW5jdGlvbnMuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+Cj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0
aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+Cj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQu
cGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJv
cmcub3JnPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXgu
aW50ZWwuY29tPgo+IENjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+Cj4gQ2M6
IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsQGZmd2xsLmNoPgo+IENjOiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+Cj4gQ2M6IEphZ2FuIFRla2kgPGphZ2FuQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgo+IENjOiBT
dGVmYW4gTWF2cm9kaWV2IDxzdGVmYW5Ab2xpbWV4LmNvbT4KPiBDYzogUm9iZXJ0IENoaXJhcyA8
cm9iZXJ0LmNoaXJhc0BueHAuY29tPgo+IENjOiAiR3VpZG8gR8O8bnRoZXIiIDxhZ3hAc2lneGNw
dS5vcmc+Cj4gQ2M6IFB1cmlzbSBLZXJuZWwgVGVhbSA8a2VybmVsQHB1cmkuc20+CgpSZXZpZXdl
ZC1ieTogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgoKWW91cnMsCkxp
bnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
