Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60DDBC432C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 13:20:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2CB25205F4
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 13:20:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ggw7a7nv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZrU6IFrN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2CB25205F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZfaCjVAeUzk58i7kF9Z04CKCgil49ZNn2okOkuv8sk=; b=ggw7a7nvgX7WFN
	cslnHpNknPkEVegOvPxK5QyBaKYvzIikmHzkiaZJ7dj1q4H6Ypg93gpBK0VMnYoaEBSEealB8ApnV
	t2jeHM2ATckWL7qHfWgQMGyA3/ZdaCAQ0w4I2QAH/OmcQXyBVvvlNoP8bI9C45Aic2fxXUPGJu0qM
	7U0+oLsmTB5+yq6Dbr87+wQet0a4Qc0OUk3oaif181xgXX60BFhPXuoeQ4lL7rDqctGDhpPsEmrOd
	m/IeszBHdck3l9CIJHw9MwxmtcsQAu0ER+oTldmxTvK/G1buo+XGtr7b6+FaRSSWIROhUEXFfWcVb
	M6CzepeznqqjtrUMpCzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic86a-0005xT-RG; Tue, 03 Dec 2019 13:20:40 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic86Y-0005wi-8W
 for linux-mediatek@lists.infradead.org; Tue, 03 Dec 2019 13:20:39 +0000
Received: by mail-lj1-x241.google.com with SMTP id h23so3754217ljc.8
 for <linux-mediatek@lists.infradead.org>; Tue, 03 Dec 2019 05:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dM7DxIKsuRuWaeq1kSkAx5tZP4LQ1yRPP8TIc6mxOpk=;
 b=ZrU6IFrNs/v9Z2rJ1KSkzGUV8fZWcRdhMKoXG6DN0M3+iAn1ApiRmE3ZgJ94Uo+9wZ
 DzuzeCNox0Z3xZRWRhWq9NS7Kq69iqJ360qMic+xi3WSoWvVfcJIHPlubUEr1YqjPC6n
 SXn0dfovwrRDvRAR6nMb9zlsIw6BuH674zeFIB8i/F1/gIumJJ3bD7wOLIyyAD+Ch5OE
 m/5UDp46mghUjs7ZT/ryJZOV8cAlXyc2Lu2UOO2gh5yc7puCj66NVcdtTPnHrWtBY2u6
 W3zW+ts6HbCNkFX+sFqM/OCNNJVzIuEg+uhrXbWD/7147S61i6ovPikcw7eFS0ik9JEC
 sNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dM7DxIKsuRuWaeq1kSkAx5tZP4LQ1yRPP8TIc6mxOpk=;
 b=bWIi9hYi7T+viSoQT2yMirSpGIBNfUTJILS+VtLGxTsmU5U0VImKyW2oDSPc/3BjtF
 SE6kZowIwMhVtD+i5I0FDreYcF2x1iYFEKTTpjEd46oHz7JKx8100Vw4xQgsgtjcfAHc
 A+QfV6Od0xPxKiS8WWZdfYMkfcgTWOAWwhU7ydIukZXAVjojQhuH3bGzzEZJqHR5w2nf
 iFDZ4VAQC9YxayibGxG9n+0y6VfT/qi7v841s4LczmfUpqPJdzm5E/NjfqTGNu6iJVqO
 x+dyCdwqnanO3xq99Q9HiQBOjQ2cJ0L9SWhzgiJ5UZHj6eCgp38lYMf+CVBMcBCLvQzj
 GSaw==
X-Gm-Message-State: APjAAAU9v3/lnZkd5K6dVR2oTdDRE+8EJxcxR/RC6GnAg/+rPmWSv/Wz
 zB+E3wH29GXDvXrUbYRsT/9YeNoBTJMbmpOt4G0AKw==
X-Google-Smtp-Source: APXvYqzTzhKdgwJ8WJIcY2A5WR+ez0+zwm8p5MUMtgC+M9HuNmXbczoLdnQOw0NdPlAjvpjtAI7gsHbZmOicQtBst1Q=
X-Received: by 2002:a2e:8045:: with SMTP id p5mr2556134ljg.251.1575379236563; 
 Tue, 03 Dec 2019 05:20:36 -0800 (PST)
MIME-Version: 1.0
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-27-sam@ravnborg.org>
In-Reply-To: <20191202193230.21310-27-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 3 Dec 2019 14:20:25 +0100
Message-ID: <CACRpkdZcLeJuOiPPa81qj17ifi3T0YxPq0zPP0oqNv-8pvzeKg@mail.gmail.com>
Subject: Re: [PATCH v1 26/26] drm/panel: tpo-tpg110: use drm_panel backlight
 support
To: Sam Ravnborg <sam@ravnborg.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_052038_332913_5990D47A 
X-CRM114-Status: UNSURE (   6.99  )
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
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Stefan Agner <stefan@agner.ch>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jitao Shi <jitao.shi@mediatek.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 2, 2019 at 8:33 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> Use the backlight support in drm_panel to simplify the driver
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for cleaning all of this up!

Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
