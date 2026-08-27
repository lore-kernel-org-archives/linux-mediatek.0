Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD772C61DC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 16:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mzMGBct2T5j19pFzqr+r438MOOPyyfPFxEllccYYNUA=; b=VlmruJF1MKVsaVDluMkMD5mAU1
	tGngsx8J+PIuwUMGqFSmOdxJvRdzXXrpU0TYkorBH2sY2fpGFcVg17BU8TKoeoo9RIyHjGztbi88U
	qSltfDeVjkQO6pFw3DzsTuQJwfdwcZ8ABi0ngTZytOBTED6/XDjBSM943nuWMGYnKaNowxkMqUNi/
	XC3r03Dq/1Q+8vmT6YrI1Au6jai5eGWdimF5E3eEm82La6oASuG/BrgcIFAtyozIREUmUKdAkTkS+
	DycUyiwzLN+v3C7JPZ9AndlmoxmtFvGNvogu0NiG3OkYzX1KfFoAcy5Ppi2LClxj/ehx5QZtyPQyb
	k0NkjkYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzctm-00000004Jev-2tXp;
	Thu, 27 Aug 2026 16:24:18 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzctk-00000004JeV-0Sj5
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 16:24:17 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6a3fda88184so3840464a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787847854; x=1788452654; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mzMGBct2T5j19pFzqr+r438MOOPyyfPFxEllccYYNUA=;
        b=k/uytxxHXk+QTMnaCB0zi+aal+M8882/dGNs+p+ll3upShdHCAOAvCtEYGn1GuK9ov
         HTUtT3adS/cyLWoGpjXkIs/Qchjj9jYaFN+cN3UUoMn5ebW0C9KN3bnaMnuNXdbdzgY+
         9jqEPkq0hAHbY3t2o6vVNgb0rE+F6cUkMAWN4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787847854; x=1788452654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mzMGBct2T5j19pFzqr+r438MOOPyyfPFxEllccYYNUA=;
        b=Wv+MTlgkmGFO98hob/qYQmPsHS+QvCrJCf//NyQnadBl7XId5CH1yzpiF6yCa9Yntt
         Fktp79gVx5+GUHN0LacYWyHzBfZ0SgiIXYqQo+i5XzoeQamUonz/4noOw4snUtLHmfif
         10hRph9CeBjrFwGi/UEnm2IURd3hV0qJ+iW0x/pBU+MB6cWwuBL6VBmIJTN0d4D/hqBw
         Rkwjqsh3w4gj/Dn9BsZIaa4rSbEzDTS6oiBCQZNSHKEJqGTRlRykOF5l7z10c/rnOcrC
         gSFkrxFsy8PhAOt8T/Uuij3TkouztZ5jR5T2E3DNn/78GgpAhdMt9HbSl2/2o717rszA
         RLZg==
X-Forwarded-Encrypted: i=1; AHgh+RpIpg3p/6kmFZQMNm5I5ZCaXmkHIdGonldJCunPENGPHbyiIliy5e0XrtN4f0tvUfiZDER7UQ1as6oPAJ4kEw==@lists.infradead.org
X-Gm-Message-State: AFuF++lKSLb2KmJIl5aQLfG2fENlmSOWLUY4yTJWJwzWPpVHl20lb6Pa
	eN2CSelLZ60sazoWg/aWICsnWePpBx1KO0uSfxPaFcUNJD3wJFYzCW/egKZurKCRyvyKoPzgW8H
	2uZT8JA==
X-Gm-Gg: AR+sD11E8vKVfZssimDsyVUcLdV5HLm2q/USnxKQeucTMJciOi5SskJcjBPG84nHEA4
	EVrIGTjixSrDbY7aeabR7UHf832OEDNJwUJvYyZkwyRwSIn2kU/c8ILSGKMvMt4MjfAgGVHhyfZ
	r20aHH40zX4Gvs2NmzysDVYIkrblhspSkmOqvFiLQVg7a5VXgpkDl4XIwTtDjVJuAc/Jz5hwedH
	73ZQ08vf7zlb9NmBOe6SQMGI2wim6IuTnL5EgY6AlfHnDBilCMOhbCmbuoicdo2hlPq+Otm6jh3
	0ORRGjxE3/uOs0CaNTgItXf2QeTbIRXVhh//aNOGXpsi4yYEdroR/ck5bWUR0F6bEf3KFgWf3et
	qvLPoCwsdzntyzeovYW5QUSRdFlA3kNQUndka4IoFzUE6/LN1g6RxP0wZ8H9t5zsu9vvqEDhWor
	xIn3BqamKf7ZCJ0hlKBHpyRsx+YVgu7MpV4EkobTyBNzB0x5wA/qbKqODiegHBGkAolJ0aTHC/8
	CndoqlMmD2lphFhuRiNdNBuBvM=
X-Received: by 2002:a05:6402:21dc:b0:6a0:a4ce:1b8e with SMTP id 4fb4d7f45d1cf-6a5df31c716mr15916863a12.0.1787847854186;
        Thu, 27 Aug 2026 09:24:14 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5deae9a75sm5666642a12.28.2026.08.27.09.24.13
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2026 09:24:14 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49800c6a846so21764735e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 09:24:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrNueYBsaIxyN34aznBCc8l0SDjc9l0uS+l/Az1lZAidhcSmpyN1pRh643y2dEqHqHC5oTu3LOpM/u25oUx9Q==@lists.infradead.org
X-Received: by 2002:a05:600c:1d8c:b0:49b:916f:1471 with SMTP id
 5b1f17b1804b1-49b91c1df21mr2431435e9.3.1787847852763; Thu, 27 Aug 2026
 09:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260825-drm-bridge-drm_panel-cleanup-v2-0-c6c88ba7ffd2@bootlin.com>
 <20260825-drm-bridge-drm_panel-cleanup-v2-4-c6c88ba7ffd2@bootlin.com>
In-Reply-To: <20260825-drm-bridge-drm_panel-cleanup-v2-4-c6c88ba7ffd2@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 Aug 2026 09:24:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VtDHWX5yXDE_CSMEZY9nTAd9372kkUAuti1K09zLywig@mail.gmail.com>
X-Gm-Features: AcwNN1VF3py5doozl6LD9Pr4fEpbkFlfT_OL-hoHyQ67imrOzi930oQk0T6UzBQ
Message-ID: <CAD=FV=VtDHWX5yXDE_CSMEZY9nTAd9372kkUAuti1K09zLywig@mail.gmail.com>
Subject: Re: [PATCH v2 04/12] drm/bridge: ti-sn65dsi86: don't select unused DRM_PANEL
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
	Sandeep Panda <spanda@codeaurora.org>, Franz Schnyder <franz.schnyder@toradex.com>, 
	John Ripple <john.ripple@keysight.com>, Michael Walle <mwalle@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_092416_173716_05F52ECD 
X-CRM114-Status: GOOD (  16.64  )
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

On Tue, Aug 25, 2026 at 3:11=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver does not use the drm_panel APIs at all, so no need to select
> DRM_PANEL.
>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Sandeep Panda <spanda@codeaurora.org>
> Cc: Franz Schnyder <franz.schnyder@toradex.com>
> Cc: John Ripple <john.ripple@keysight.com>
> Cc: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index 043596801a65..d46aa2eb01b5 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -474,7 +474,6 @@ config DRM_TI_SN65DSI86
>         select DRM_BRIDGE_CONNECTOR
>         select DRM_KMS_HELPER
>         select REGMAP_I2C
> -       select DRM_PANEL
>         select DRM_MIPI_DSI
>         select AUXILIARY_BUS
>         select DRM_DISPLAY_DP_AUX_BUS

Looks right to me. Ages ago it used panel APIs directly, but not today.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I assume you have a plan for landing the series. If you want me to
land this patch on its own to drm-misc-next, please yell.

