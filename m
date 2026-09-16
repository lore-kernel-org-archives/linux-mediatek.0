Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 753C5C982C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6wIAcEKWE9nqg7/k3qdRoBKRXzso0r5nn1/whrKqBA=; b=wn2OOT1ToFbL8LmIuXbRxi6iAZ
	zcgg+zTAEkJ8NL80fJPXe8OoV8ay23lAXim/963oW5wv4qlid9jfUoVyNE24Dt4jP+c5n8SfO1xy6
	E0YwRklgypzG1MjcWJiQ8S2rs8t+f+722WbW7MgkUt04hXPqjcnnyDVkQHHWX7+flGEld58PCSeQh
	zuypceUsUmEL+iS1dV7c4YtA1jb+ntGLw8O4K5h9/eyPlYSrhBNrt9STKgzz4dkpSCPFfQqS9HQbq
	aTk8iNRUcq0dKPs1hE0Zb+lSD64frxnEESo6VlC3vYEpPNzw0OYrJxj4uiDSbkhM7K5peygGxdsLR
	wgPRehhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jsi-00000008ZRx-088P;
	Wed, 16 Sep 2026 07:16:36 +0000
Received: from mail-pz2-x10.google.com ([2607:f8b0:4864:3b::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6jsg-00000008ZQr-0EWL
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 07:16:35 +0000
Received: by mail-pz2-x10.google.com with SMTP id d2e1a72fcca58-85469e211a0so554646b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 00:16:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789542993; cv=none;
        d=google.com; s=arc-20260327;
        b=CCHQQGBpcQIsk/6m5J3uXFfwm0fbIQqOjHGOOjs4XLOgCNZGoDKK3JgTDavOMSKQK/
         JFLuQbbhWBMoasDkhQ/iU1gwQ3FvfaARO1KtDAeP0VwgLCygMZNU1SPav2t5dctsqP6U
         XO2T4AU5aBisGCzHWkdmVHWAipv4S1ImPLld1XLqC9Y4VGN3Zk5E9EkN4hTyHaHX/z82
         PuQbi/l8mn6HuLD7pp4mp2L8TEVkTDla305wBjA/2nkHlw8zd4uVCLZZsuXYhb5q+kNP
         gNdEaJRLE4eOyHbWaN1S+UxBvEDmXt0UX9SXNFtLpqRxCkmWSs4kN6No5Yha87BJAtA3
         rUBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y6wIAcEKWE9nqg7/k3qdRoBKRXzso0r5nn1/whrKqBA=;
        fh=/Q7q0kEboFF+YRN7KaCrUPKdp+CQ2SjJkxRyuP0wVls=;
        b=d+F0XoVrOE+iPJmXOZ6SrNf79pGoto0AY2FZCU6HAnIQFOpxa6mkksnMTTE8okOp7C
         fkuQJJ5U/9qWc9MpaDKe/lwdnavEMkuzxJdj0bYH6frO2I478gnHJa9h3h32Jd8WkBtv
         rywOdmiF4lFtFWD8KERmzbR/J3GkwNvfJluPRhJS5Be5w+pW8AaFOeZFun0w/R3OLtkX
         aOV+DJcVI1W1Yz+VuzTQKyNWT2QpO++WisQagn3EXZp77cWTrW3RoeDWbCp7yVcWGuOB
         2f/+za4th/xbGmRxAq1STawsmRiF/uNCaCsjSoLfPg166BS6qCKqDiQamaRBdi3AWyzH
         Dimw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789542993; x=1790147793; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y6wIAcEKWE9nqg7/k3qdRoBKRXzso0r5nn1/whrKqBA=;
        b=Qo4oSmxc6YfNMGNSzkp87X9Pp5/onseq0VabZH6IKo+GnodhyzDWISCEFOr8RvPh9Q
         wJ7h8VLAE6t77MBV9UYc44DPau6rbLp+YEUsDUenHKJjZb1SahXCRZNQA6X7DYJPRI9O
         3UyUS2JIzqA6NlXPNzPrd1joqSGrczxmA9vH8JQ9gNGY4cC6drf/0Jft25ykGpsgMHUX
         qqy4R2lyWJLbi/bGuP27ZvX6QDeScTzIi2w3xbPZ022Jljfu5kfhROfBnD6pZ9I41ic5
         z0vxkg7lqOpeyYPdeM9gTkPNnWPCGgyf8f6sd0wOhnfHCdFVUrn2PAngJnIm0POXjcV1
         X+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789542993; x=1790147793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y6wIAcEKWE9nqg7/k3qdRoBKRXzso0r5nn1/whrKqBA=;
        b=K2pjpAe4hX79mBoh4wRLcrsoWHzzO0Si2oLmWJrKZXlq7dwLQcbpMgv0P4iT9ByX1V
         gRx0WWaKTuEEL0AxioY2Qv6NeIWad/BfE/yJlZmOTbH8AjRy1bzzC2RdsITd6I2rDtp6
         3ygK+mUn/CYwEXJROHmrI2SKkecdxo3HL7HHuIOU7OkxSmvtn/kd/XiQ013q6lwQoVIg
         zf9IsPCybWWnyzzZP/7Pfe+sRYLYaK9/kZo6cxsLiicOGnCqzpeTpKw8jSbXb2IOXhpr
         VV4JpoLdFTuI1NZwtYy5EgMzjU8OoGU32hVYt7/aTR+rlEkuQ2cqJsjqNgq3Q6mu5TNT
         yRTg==
X-Forwarded-Encrypted: i=1; AKwUvBw2pEJzA1Sog8Qoed/Qk4h2bFwCKKejgvv+IYETiXkGt8dKgA9UY8s60ZsiqoaPzE1ay1PT8eJXm22LEmipSg==@lists.infradead.org
X-Gm-Message-State: AFuF++lpyvLuS6EQBu3j1RnzmnghsGPqZgA6/Ca5folDOaNUaEVm1DUI
	Yc4JZ7+57N40GELxegNFesgg51nZFrTmrM0YnxWr0grEt4HPOHpErdtp+/3qWVjCb9WpaAHaPDN
	FCzImC0S1ypk0bFCg+YtO8vRI6EeahI0=
X-Gm-Gg: AYBFou2rs8Uo2MAtLpDI2La6Ndk660FQL023B3Mvqf2350f0gmQ+T+EJJyaBhFz7ECF
	ag0F1ooOvgKkT6oQfVYnJW5fuqk+7yzxQ9uS6HRTsTvYrpQYFZ2GHC0CAgUO+S9YT+VuLq/rXMu
	QHPa6qbgMerfmJ4Nnb7gnYlpPOiqvDV0ZGK42TqIENhbSZ4VEDTWbpgsI1zbD7vSvZgj45pPgzc
	RLQDI5dHeWkEyGoICIK0R9o7BzeRHEdm2ARMSYXObhaBGX/nXTlUZ92BLUX/mZ0WkjeIIT/jUTw
	NN2VxcPzMUxz+WJK2+XAo7qUV/p5AOL70ZrKcx7tNlDNv0awZmZ0oEO27e3Dmu8DmPVpIlE8Y+V
	MFwjzYLiYPJeI0dl8dMmTieE=
X-Received: by 2002:a05:6a21:6b10:b0:3da:1e7b:ea27 with SMTP id
 adf61e73a8af0-3dd5f6fcf23mr4128744637.21.1789542992705; Wed, 16 Sep 2026
 00:16:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-drm-bridge-drm_panel-cleanup-v4-0-30401d9406f3@bootlin.com>
 <20260915-drm-bridge-drm_panel-cleanup-v4-8-30401d9406f3@bootlin.com>
In-Reply-To: <20260915-drm-bridge-drm_panel-cleanup-v4-8-30401d9406f3@bootlin.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 16 Sep 2026 10:16:21 +0300
X-Gm-Features: AcwNN1Wu02WhbDbGzw2qQ55m0JlviTMXZEyfe2ujg7uZXtgVBYhdlrVFke0bQq4
Message-ID: <CAPVz0n3kwZJTpanbCFzYKj=ysXQ_V=+uXjD5hY_n6OcDvnrx1A@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] drm/bridge: ssd2825: select DRM_PANEL_BRIDGE
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
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_001634_105612_B7099D36 
X-CRM114-Status: GOOD (  13.91  )
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

=D0=B2=D1=82, 15 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 19:47 Luca=
 Ceresoli <luca.ceresoli@bootlin.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> This driver uses drm_panel_bridge_add_typed() and
> drm_panel_bridge_remove(), which are enabled by DRM_PANEL_BRIDGE.
>
> Leave the 'select DRM_PANEL' because it is needed for drm_panel_put() and
> drm_panel_enable() which the driver uses.
>
> Cc: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index 73e13ad59a93..92938df3b747 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -351,6 +351,7 @@ config DRM_SOLOMON_SSD2825
>         select DRM_MIPI_DSI
>         select DRM_KMS_HELPER
>         select DRM_PANEL
> +       select DRM_PANEL_BRIDGE
>         help
>           Say Y here if you want support for the Solomon SSD2825 RGB/DSI
>           SPI bridge driver.
>
> --
> 2.55.0
>

LGTM

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>

