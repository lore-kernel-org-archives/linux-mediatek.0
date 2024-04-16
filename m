Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6835C04FF6
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Apr 2024 14:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NyD7CJia6dqQdPW0B5XtV/th76QRRg/WSyHypuuA1Ic=; b=GFchMn3WkPvpWZDSzp/sqdYgFb
	TFvQso1R4U5U0hseJk4ephVut/UIFrFL8OTzfwfSI5ZTCic8gM5nW34nJ35gB7Autiy66K5P2PLWj
	/Qy03nfo0+NjeoFa9wtZQjkf8PEQxbLcbTtWZjIjr+74SBIlSgvgwY2B1n95yY91PEkZFLzMAR0fR
	iAXIncQc+q+zAT43WNju4xeViEhIUnMxNc7RSJe9MD3wO2Z1ZgEIdGf98PSHkV3PQzmzUP1SMt1aR
	13IxFannJ2x4ppkO9/KTnxPFYNJHeYvgEPl8B9ckLn901Ne87HLsiIFpvn/vE8MaIhU1tBPxuwoPE
	oYurfxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwjV8-0000000CS2z-1R95;
	Tue, 16 Apr 2024 14:09:34 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwjV0-0000000CRwQ-0jVX
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Apr 2024 14:09:32 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-78edc3e7cd9so178485385a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Apr 2024 07:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1713276560; x=1713881360; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NyD7CJia6dqQdPW0B5XtV/th76QRRg/WSyHypuuA1Ic=;
        b=Kp1b3ykbwdrj2XdqpNDwfsH/TvVoRwAXiPmAJNxsU53pzNwWZyeHRSJH1SpmybImgL
         GKPgLY07CMEfzXP3SuqGqRQL+Xl7img+ZOGizqBjHtD/IMkQxM6XQPc4nMuWMZp7J6KB
         IvTSzw/hrJ0hNjsOYGpLfdVJD/brPVHVvlIl9x4PCjLTsk4vM/SVQeEtHwjVunts6X0m
         x2ZN5HQAKybtOUb7mzo/R582fbD/cnPQLGGeLXWEquRRWgQp5Lufe/bRK0nEiFK0FswV
         z6/efF5ONWDzZFahoTxI96PGMuifOfvY4YtjK3tm8h8N7CSnupIsCmaaQhFQG9OmyBHJ
         4HSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713276560; x=1713881360;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NyD7CJia6dqQdPW0B5XtV/th76QRRg/WSyHypuuA1Ic=;
        b=f4vjhb/ykVPEwDIS+i09/hyPX+TwwFgDjWbz7h1j61w8EP3b8VlYvvas6P/N4B+m1f
         s4lgYVAmPSK9h9iHF8NcsU0D92Hhkm3YcIQ4/3Cu0cJ62hiogwiRGVR6Vu5hKLubmmsT
         0vUbz681oyHbbWH2fDSfMBS3TedDepG5qGhJFTjjrRWmgBFWiH4vlhr7kNtnqUo+LFPr
         6r5Evub19ik9cGm/OVHUtAkwoZgYetC8LA9270ms4AaRN9iM+ndUD9y2poDKz3xNvwIj
         PowKSsH47poeLadIYQVcgbh5fdZuNburtdNQPIxn2cImFqP820IqKXE+9H3inLVI/ma7
         l0kQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqLA89IqeDAR8OaVGnJ1eC0D+MydylJmZ8hnw+Eq2Q5zEBguw+03BPbQ8GIt4X5hrwJ4ZngUPjHZjG2tUQtZcozjzrWkcCANaPgOdEpLpQ/1hS
X-Gm-Message-State: AOJu0Yw/YSGYUpKr0RYPkn2QxFtsIjlBoC74azcRG8CkrKc8Uxlg6ag9
	RyHpm6MsXIiIkb3Ene+5tPgpPWe8mnXJFC6R3UAtRHx9xcA/18EF3AvdPNjO3W8=
X-Google-Smtp-Source: AGHT+IHTZXOlhLzrZJKOCo7oGobPLBHBqfpA1Y9jlLfjJ81O6tnjovWTxBF2SvorngJtfMN3Z4Hm+g==
X-Received: by 2002:ad4:44a7:0:b0:69f:f2ae:cad6 with SMTP id n7-20020ad444a7000000b0069ff2aecad6mr1244518qvt.11.1713276560547;
        Tue, 16 Apr 2024 07:09:20 -0700 (PDT)
Received: from nicolas-tpx395.localdomain ([2606:6d00:17:6448::7a9])
        by smtp.gmail.com with ESMTPSA id dd10-20020ad4580a000000b0069b563d5d8fsm6128137qvb.20.2024.04.16.07.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 07:09:20 -0700 (PDT)
Message-ID: <70733fe5c919527796bd3d9735ced522bcdd7a25.camel@ndufresne.ca>
Subject: Re: [PATCH v5 1/9] drm/mediatek/uapi: Add
 DRM_MTK_GEM_CREATE_ENCRYPTED flag
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Shawn Sung <shawn.sung@mediatek.com>, Chun-Kuang Hu
	 <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie
 <airlied@gmail.com>,  Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Date: Tue, 16 Apr 2024 10:09:19 -0400
In-Reply-To: <20240403102701.369-2-shawn.sung@mediatek.com>
References: <20240403102701.369-1-shawn.sung@mediatek.com>
	 <20240403102701.369-2-shawn.sung@mediatek.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual; keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_070926_544551_BBC1019A 
X-CRM114-Status: GOOD (  12.77  )
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

Le mercredi 03 avril 2024 =C3=A0 18:26 +0800, Shawn Sung a =C3=A9crit=C2=A0=
:
> From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
>=20
> Add DRM_MTK_GEM_CREATE_ENCRYPTED flag to allow user to allocate

Is "ENCRYPTED" a proper naming ? My expectation is that this would hold dat=
a in
a PROTECTED memory region but that no cryptographic algorithm will be invol=
ved.

Nicolas

> a secure buffer to support secure video path feature.
>=20
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  include/uapi/drm/mediatek_drm.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/uapi/drm/mediatek_drm.h b/include/uapi/drm/mediatek_=
drm.h
> index b0dea00bacbc4..e9125de3a24ad 100644
> --- a/include/uapi/drm/mediatek_drm.h
> +++ b/include/uapi/drm/mediatek_drm.h
> @@ -54,6 +54,7 @@ struct drm_mtk_gem_map_off {
> =20
>  #define DRM_MTK_GEM_CREATE		0x00
>  #define DRM_MTK_GEM_MAP_OFFSET		0x01
> +#define DRM_MTK_GEM_CREATE_ENCRYPTED	0x02
> =20
>  #define DRM_IOCTL_MTK_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + \
>  		DRM_MTK_GEM_CREATE, struct drm_mtk_gem_create)


