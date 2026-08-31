Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0255BC624C6
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Aug 2026 15:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tTvXG2rpMdNnMtH4efVDaA6Y1oiD9kVL+nK2bMsJxg=; b=HY0x0YioLFVEgC1iHX+s4Z3A74
	BytAdIzDywn5WzPtvEeGeMfxPKqn0JNzyEAEVV2s45WWn2qJm10n6RNbGHve7N5V0a04giH/OMCVK
	SwQsurtPgL8pcrp8i2zHlvKy3jPZ/lR827Wtn+P+maf/5aM5euKruigQC4xBUwVzJM12RgN2lhdS6
	kATtgqYEDhJaMPzp/t5J0KWDZg1o3XltjM2QnqBaHGUjOwlN3HfLrAH95ODAXhtSftiHYds5axf/p
	Xjv6PpVuH49s2NIU6kSHImhknXm+Yrg3PL9CG2tE8kt4X7cabMYL63CABlcEZaZlwP6dS0ehKK0nT
	zaxsy4Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13bE-00000009npY-3EOQ;
	Mon, 31 Aug 2026 15:07:04 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13bC-00000009noZ-0Qz0
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Aug 2026 15:07:03 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-3a1981228f8so31637121fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Aug 2026 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788188820; x=1788793620; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/tTvXG2rpMdNnMtH4efVDaA6Y1oiD9kVL+nK2bMsJxg=;
        b=bpm5RFX9hgp8oHLFfEIbXdboHIwhx0ADekNgHe7KJTAngvyo/Q1uxKl68fX0ux3GOf
         EWH1N35UuE4Y8PYNjWZlNbGRf9yx20iszYeadjEor5HNj3Fx2XOPaHmIbviCDr4kXxcE
         gaVgmMHIXl8OCohqLJAbVoN5YlcIuDhR2kb10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188820; x=1788793620;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/tTvXG2rpMdNnMtH4efVDaA6Y1oiD9kVL+nK2bMsJxg=;
        b=XbJV75nmJhk2Kf5urZI7q4KEktSo3wa9gPPI9/N21WTCbwEayPDmzK8I/hAaGrHBU7
         Aojyp858N1zHkcQ/jeZ1XCn0m4G8jB1RYcwAvk9x+47UCI49dNPveFjFfbvjlS/b/SUv
         0YaCpgpHwSXZHj+hndi6xI4QEKf10Jt0g86buTOKtrKay7EKINTGfTHpX52hAQdf5+b2
         t1bBEyPElmfNoMlRolB7l6GkpRolBN3OZu+/8UUkOhkIocNpSHiydKXYAwvJIz5FuToF
         jk+yNPDLXNZ48jqqWcdmSgzLdFDSsIKrMKjfWKYjNMSJ2Oh3i1EckL45jzc8BF3+x3J7
         mTVA==
X-Forwarded-Encrypted: i=1; AKwUvBxjqwW70outVMv3M2vQAB64aga/9f8g3lW/quSTt29fswtMj5PP3AN4roHpSRG2wf/ABjE17AOGOfmZobv6dQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nXSxKN3OpTuYogDFSTaL/Xjme4ei9xbVfIhuB9VEVPRiDwacEg
	CqXiYI4jZx9+vxHCdB/FiYZ2LKZSslCBwqdSIy6evhSUTdz4tT3O7GsLPNptBY7Ru6wIh3v96g/
	CFE77MnEd
X-Gm-Gg: AYBFou2oqofuTyLhK1Q0LV1Rrt6Y00c3HQJOiKS99z4Y34nVN0rweV2GJ70hE8OS7N/
	I1A3D5X+YW8LEjko0xyZ9gMbHEAfgg1UmBXHq3P5Oogbh2kmj8DbaK5SG68IgfxZZ0moGB/zz91
	GuEKFmxH9IHw4FcqKlo8aI683Og8bzNxtlpZdl5PM0e5Ncf3hA9TmLQfiiYzjw1Kxm76OvtmDVq
	KntN7N+4Gqlc4aD9wRzhrTWtRs5DJY2ccxJ2CoxJoM3ueQS2BSLZifxGWtmT6BDzQsl1CKHkmNF
	ImE/+iGkNsdtoVb+Zsw54vA8e1NoT4M3SFp0SeBB5aBuN0BxhEFvjNuby0ceQIpmYBY2uaJ1X5e
	Vr+Ym9cHK2fgwWV80N0itnjkoSE4kavEFMXW0XbmXXGrXaikJ6dkzpdMduYrXc8gdglsp8wv71F
	RH14kSPikIwJrLuxOYz86+nXTw48q0HnyyDZ6rokhPvCjId6lveHIX1mYkDJkf0z7ss/jgcXhhY
	Mi1HKtECZONUt/FT8hWjL8AoYY=
X-Received: by 2002:a05:651c:31d2:b0:3a2:d26:3eb5 with SMTP id 38308e7fff4ca-3a30189a083mr60346711fa.4.1788188819733;
        Mon, 31 Aug 2026 08:06:59 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com. [209.85.167.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a06a3csm2212757e87.44.2026.08.31.08.06.59
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 08:06:59 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b4aa47bc97so2876544e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Aug 2026 08:06:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxmGwAsmI521XzVrmyOmLLx/zQ2GLQI9LZ5YEXWfkqI0n2MfGG33fw/JD8lVYZsLWwfec5wmlEDOYC/UY7A7w==@lists.infradead.org
X-Received: by 2002:a05:6000:2403:b0:484:3310:f394 with SMTP id
 ffacd0b85a97d-4843310f432mr23509935f8f.23.1788188332108; Mon, 31 Aug 2026
 07:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
 <20260825-drm-bridge-drm_panel-cleanup-v2-8-c6c88ba7ffd2@bootlin.com>
 <CAD=FV=Xdj_foBqt9A9EVVoCA2BxAV3UZNz3SuVPu2ZoNXgnS=w@mail.gmail.com> <DL308Z0JXJ31.2V3H29DTG4MSM@bootlin.com>
In-Reply-To: <DL308Z0JXJ31.2V3H29DTG4MSM@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 31 Aug 2026 07:58:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UOwWdVc8p1js+28C1u7=iRqRpv86PkwWf5g8yL-Uq5kw@mail.gmail.com>
X-Gm-Features: AcwNN1Uwe20Iwwe3Thag0bGUZKeQo9OpK0wBSimBjMptkSoLanhwYwfNst4yWiY
Message-ID: <CAD=FV=UOwWdVc8p1js+28C1u7=iRqRpv86PkwWf5g8yL-Uq5kw@mail.gmail.com>
Subject: Re: [PATCH v2 08/12] drm/bridge: parade-ps8640: select DRM_PANEL_BRIDGE
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Ian Ray <ian.ray@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
	Pin-yen Lin <treapking@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_080702_184655_F8C3EBA8 
X-CRM114-Status: GOOD (  16.10  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Aug 31, 2026 at 2:01=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hi,
>
> On Thu Aug 27, 2026 at 6:23 PM CEST, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Aug 25, 2026 at 3:11=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bo=
otlin.com> wrote:
> >>
> >> This driver uses the drm_panel_bridge API and not the drm_panel API so=
 it
> >> should select DRM_PANEL_BRIDGE and not DRM_PANEL.
> >
> > Which exact "drm_panel_bridge" API does it use? I don't see any...
>
> It calls devm_drm_of_get_bridge() [0], which is in bridge/panel.c [1],
> which is enabled by CONFIG_DRM_PANEL_BRIDGE [2].
>
> [0] https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/bridge=
/parade-ps8640.c#L636
> [1] https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/bridge=
/panel.c#L483-L515
> [2] https://elixir.bootlin.com/linux/v7.2.2/source/drivers/gpu/drm/Makefi=
le#L159

Ah, indeed! I missed that since it didn't have "panel" in the name.
FWIW, then I think for this patch:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...but, ironically, that means that for the other patch I looked at
(ti-sn65dsi86.c) we're missing the "select DRM_PANEL_BRIDGE" since it
uses the same API call, doesn't it?

-Doug

