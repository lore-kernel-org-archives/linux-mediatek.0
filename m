Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37956606A31C
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 12:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sbY6ZZMG;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Nz0KwmXF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=CwowVZ3rKUKS7aekHm2EGIj95zoVj8ccIVxOo6VaL1E=; b=sbY6ZZMGG1Ldfd
	2nCcjJilDNfkcUjPDqnBMiTmijLE9lFrVf8SeVliuiEdFZ6jMas6aG0/qzDucG+2k74nqgWG5WQno
	qMySkTUSGRqLPcAy+YowhNIefTe9lMQeOtI69fAQ9ghCZdSLBqEGrU/p+GGe29SuBlYwXbKQ3g0Hz
	u21a8uOFquRCpGHrQz7AkqUiFZfJ8xS3zOBDBFVReLVCYa/bA0x90Fy/6E4uuAwcgoexLDBW8Jxp1
	RxUknkmriCAcDUyrLlGPaBDhvc0estiZvX1bk0/EWSLmxA6/s8x27F/oSeGhcs7zRL8O2dMNbsnKs
	pmg3iyk6smSCb9NuKnfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWutg-0000000G2gM-3vo0;
	Fri, 27 Nov 2026 12:17:48 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWutd-0000000G2fc-2qTI
	for linux-mediatek@lists.infradead.org;
	Fri, 27 Nov 2026 12:17:47 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2f03920c477so67173325ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2026 04:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795781865; x=1796386665; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CwowVZ3rKUKS7aekHm2EGIj95zoVj8ccIVxOo6VaL1E=;
        b=Nz0KwmXFUtHlLyTXwF2ot2/hFUj7b8Slk39K1y28ArQaPCBV2yovx+4SZ+nl6Y0Avh
         aT34Vi1BF8B/QHaTW9CuwsGUgyGSBo2PKzYP8oeF82uN4ogRY1NLRoQ2DWM9pWBAqqsP
         +CyRTN2m4DY/eIcv73wt2oIpNkYuzfMVeifLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781865; x=1796386665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CwowVZ3rKUKS7aekHm2EGIj95zoVj8ccIVxOo6VaL1E=;
        b=Wn4FofOX9APGYj+SjFXB2MY4XdTd2B5UDDE/uoUQzOVs2v5PPHzEKWB3maYbXFJjYY
         pSlQ+q5l+oODXrhpSef14MlTrW2LerTkDXHwCu0wumg48Ik6iYxSolH5WAwo1hTd9zi8
         K5ZUHYOnsE7xCX2oKJRTg+pfC6L8WcxPKmH3jRiAVTLCV0Zf7FFUWqkNIDLhWOt39F9F
         kNNt3xeRqZKPZPk/X71WR8zx5uwVAt2M88Z4smIuLW/IUQGIc94W3w1IRHF3JfS+VIKs
         Jky7UAvtu9QA0pg737AnDv1JqMRk9QGxdalBSWHyusoFWU4mxZiFNQoIeXv58cnE9asU
         NvyQ==
X-Forwarded-Encrypted: i=1; AL+hErHsft0zb+ZD0jYPnU9UWV/VEo5eMwZvA7+y6t+8v/wzwr1JnSeDifshAZXqXGj9gHaTwIuv+H8YXSDRVCBbnA==@lists.infradead.org
X-Gm-Message-State: APuU4Z97g5JrgPK+s6TWGF08ndwo9pJhfAx/n8G3CRb410j99WVKghQZ
	sIkrvKO7TqA7BoZs4546xZMDPXPui/YuXEqkLYXbzQqDmAdxni2P8rFEx4TO2FZR3BiBb+NJkNd
	E45w=
X-Gm-Gg: AZFdTZdHtgnmes5sjV6SWBokFb+peu8ZU4XLMKcch3Ie58A1C6FVuZeQ/TXf3v3s/u7
	jNBwTKAwLbWAo+jSvWBEK+SJf7NhD8/rR4B/mETN6Um2eQobGVmyKu2ox8eMaQeI3tlUqh/TYD/
	KJZ4dODq2ZmtxJmsNagwzgRyznnzQvzxgzBmgRCnRLRaOLmgmLaYUwqkqzqjU58cSRuDJm2rTtO
	geLXDv9P61g8Auu2i//JUKFXHgU8O1ox2twtlrOs6JEdgY0p09IjmR1GV8gDDytxbdXYJPWq824
	2k4K4dISHtNMpoEJBqUpI85Nb8KBGtJW5EFabXwLEmxlTnfqqk5kViMvmNsgYf5XnYvJ7h3HHns
	QjnlHUAc68n20b3tB6DPeWSZ1mAVhR8GCirxmGR51ByciT5aKiHg7nk/h5Fu7dqEWFhYlmHwtpO
	iO1gkUprYGxhbpMxhhnC/vlj9lGwFpqfFKy4W4YE2MIzIvOuMWJljCRHS3Nqsbar5FoPu33zqKX
	/Fwm7WuQLQR0qYp9iQj1vfruwa8vwXi/t1Og2uclAQaokyVJ0Yzagi/bpO/g2OuJYaIOGzEdcIx
	5Tv9cddrGSynDGfgomTu31gi3W8xpZRSO9OJ/fQQFd+OGBYQNc2wCP95I26SQgrG3XY=
X-Received: by 2002:a17:903:1aa6:b0:2f0:9d08:7add with SMTP id d9443c01a7336-2f09d087ecfmr164296405ad.58.1795781864652;
        Fri, 27 Nov 2026 04:17:44 -0800 (PST)
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com. [74.125.82.174])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0f5a31dcasm23261715ad.66.2026.11.27.04.17.44
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:17:44 -0800 (PST)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-385d8a00598so12059124eec.1
        for <linux-mediatek@lists.infradead.org>; Fri, 27 Nov 2026 04:17:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHDUnTgQcafMmpa1Ow4Syrh79Kz+1PlCT6aMZ9AOcguoaYrKo3eyorPVWUYqhPDsuovMqUSzLekdchVhAUa5g==@lists.infradead.org
X-Received: by 2002:a05:693c:83cf:10b0:386:b526:24d1 with SMTP id
 5a478bee46e88-386b52638e1mr15336839eec.9.1795781862885; Fri, 27 Nov 2026
 04:17:42 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-44-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-44-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 27 Nov 2026 20:17:04 +0800
X-Gmail-Original-Message-ID: <CAC=S1nh0FpfDy8VqHJA=+bBtqZF1K5FYWF25pL1sAi4Q4MSSkg@mail.gmail.com>
X-Gm-Features: Aa3M54pcv7nTzvpglkL8e2ZqGsoE7ZtTuNgXg7WMfrQxU5jsZk3Rpl5MWtMoFKo
Message-ID: <CAC=S1nh0FpfDy8VqHJA=+bBtqZF1K5FYWF25pL1sAi4Q4MSSkg@mail.gmail.com>
Subject: Re: [PATCH v2 43/46] drm/mediatek: Add Two-Dimension Sharpness
 Processor (TDSHP) driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_041745_767327_6337B0BF 
X-CRM114-Status: GOOD (  17.11  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Jul 14, 2026 at 7:47=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The MediaTek 2D Sharpness Processor (TDSHP) is responsible for
> performing image sharpness adjustments/enhancements in a display
> pipeline.
>
> Even though this hardware block supports adjusting the luma and
> contour 2D histograms, frequency weighting, luma-chroma gain and
> others, this only introduces a basic configuration which allows
> to bypass TDSHP processing in an effort to forward the data from
> this block to others.
>
> That is necessary because some components cannot be connected
> directly in specific pipelines; for example, in MT8196/MT6991
> pipelines, when Display Resizer (RSZ) and Color Correction (CCORR)
> components are required, it is necessary to pass through TDSHP as
> direct connection between RSZ and CCORR is not possible due to HW
> limitations.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/Makefile         |   1 +
>  drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |  10 ++
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |   8 ++
>  drivers/gpu/drm/mediatek/mtk_disp_tdshp.c | 167 ++++++++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c    |   3 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h    |   1 +
>  include/linux/soc/mediatek/mtk-mmsys.h    |   2 +
>  7 files changed, 192 insertions(+)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_tdshp.c
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_tdshp.c b/drivers/gpu/drm/=
mediatek/mtk_disp_tdshp.c
> new file mode 100644
> index 000000000000..31f57c567137
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_tdshp.c
[snip]
> +void mtk_tdshp_start(struct device *dev)
> +{
> +       struct mtk_disp_tdshp *tdshp =3D dev_get_drvdata(dev);
> +
> +       writel(DISP_TDSHP_CTRL_EN, tdshp->regs + DISP_REG_TDSHP_CTRL);
> +}

mtk_crtc_ddp_hw_init() calls .config right before .start, so this full
register write overwrites and clears DISP_TDSHP_PWR_SCL_EN that
mtk_tdshp_config() just set for 8-bpc pipelines.
Use a read-modify-write for DISP_TDSHP_CTRL_EN instead (or drop the
redundant write here).

Regards,
Fei

