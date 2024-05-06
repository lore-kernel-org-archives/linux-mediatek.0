Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85070C10F16
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 09:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:To:From:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sKPdXJ8uCz8DBedDCnGkQFF2YxU/6BiuydBYhGET2M=; b=TNyGmOphQJ+iyiYlres6goCEcf
	ZYasGuDq7NYLlewfwQkQ0W7yLWi5kgPRNuI8VlmZgyljmSZvfgWOU0CuECt9bznKf+Xk9YwJE/Hni
	P+mzdvx4S65i/RqWg62bpM8UMX3RQ8txY4O2Ui5foup4/aZWUVxJ7COtKATLx9Ze5Vl0IxZ3axnfh
	9/Yzo78pU76Y0+qJE9vIAmMpPQaH6mCLbjc0s6moo2YzMlWLEIx97Y9hMrE1iRrv/Av/3pzAtlbXW
	PC4cyhiUS7D9KEt74Nsz0gkR0cZkkxTY+HBf/sIW47ny/C47JQmV/Tt6oHdgS6S7JyQN93EIwGaMe
	V0PgFlYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3uO7-00000006ktZ-0DV7;
	Mon, 06 May 2024 09:11:59 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3uO2-00000006krn-0UEs;
	Mon, 06 May 2024 09:11:57 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4340:6430:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 782101B1;
	Mon,  6 May 2024 11:11:36 +0200 (CEST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 May 2024 11:11:36 +0200
Message-Id: <D12G1NPU2H06.3LBLR19XYUAA6@kernel.org>
Cc: <robh@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
 <shawn.sung@mediatek.com>, <yu-chang.lee@mediatek.com>,
 <ck.hu@mediatek.com>, <jitao.shi@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <wenst@chromium.org>,
 <kernel@collabora.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 3/3] drm/mediatek: Implement OF graphs support for
 display paths
X-Mailer: aerc 0.16.0
References: <20240409120211.321153-1-angelogioacchino.delregno@collabora.com> <20240409120211.321153-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240409120211.321153-4-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_021154_431286_D4747775 
X-CRM114-Status: GOOD (  11.47  )
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

Hi Angelo,

On Tue Apr 9, 2024 at 2:02 PM CEST, AngeloGioacchino Del Regno wrote:
> +static int mtk_drm_of_get_ddp_ep_cid(struct device_node *node,
> +				     int output_port, enum mtk_drm_crtc_path crtc_path,

Not sure what's your base branch is, but "enum mtk_drm_crtc_path"
was renamed to "enum mtk_crtc_path" in commit 9e149879038f5
('drm/mediatek: Rename "mtk_drm_crtc" to "mtk_crtc"').

> +/**
> + * mtk_drm_of_ddp_path_build_one - Build a Display HW Pipeline for a CRT=
C Path
> + * @dev:          The mediatek-drm device
> + * @cpath:        CRTC Path relative to a VDO or MMSYS
> + * @out_path:     Pointer to an array that will contain the new pipeline
> + * @out_path_len: Number of entries in the pipeline array
> + *
> + * MediaTek SoCs can use different DDP hardware pipelines (or paths) dep=
ending
> + * on the board-specific desired display configuration; this function wa=
lks
> + * through all of the output endpoints starting from a VDO or MMSYS hard=
ware
> + * instance and builds the right pipeline as specified in device trees.
> + *
> + * Return:
> + * * %0       - Display HW Pipeline successfully built and validated
> + * * %-ENOENT - Display pipeline was not specified in device tree
> + * * %-EINVAL - Display pipeline built but validation failed
> + * * %-ENOMEM - Failure to allocate pipeline array to pass to the caller
> + */
> +static int mtk_drm_of_ddp_path_build_one(struct device *dev, enum mtk_dr=
m_crtc_path cpath,

likewise

> +					 const unsigned int **out_path,
> +					 unsigned int *out_path_len)

-michael

