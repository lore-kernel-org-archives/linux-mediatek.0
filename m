Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5E6C28B2B
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 18:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/j60EG4aje7Ee2eUMKbtvaa6NlfJAHCz0dRCg1qhdc=; b=aVZvH5G11Bck6PtuFSPcENUNJc
	VNa5zuiq0axl9XbV2Z8AUgxnh8q6MxSNmZeaAcXcH7WsmYMSe9+S3UR5+9HTa+vEug5jAhsaR0hgZ
	yvZyTtjg1TdMw1g27cZUpq8PZYNgkPnHjNOtA8NYpio+jhzTkJb2yqix5nQ/70opUS3ELKK4Tl4rX
	4nXkt8c3SrFWKsvOtmy0Q2NmMf6iTmOQiZGnMOGqs+hkmP6BbvGAQ8Xwi3ANRXPfV5f7nbO5O0RgQ
	HzPqwWI+Nz/9L93bSEA7z4Lqkhey8DTHt77FNKkRYptdWonc/9AHN4JGc2IWkKP0jqP1lMJ6QgYap
	3Pyvd7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP6xy-00BF7G-OX; Fri, 19 Aug 2022 18:43:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP6xm-00BEzO-3Z; Fri, 19 Aug 2022 18:43:23 +0000
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9C89A6601DC8;
	Fri, 19 Aug 2022 19:43:15 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660934597;
	bh=ILaOGVh98GDP5+WP//VmaaaeeN+NdUHFMp8L/cMJ5N8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lH9AI9hI05AHE6WW4SzFYv4TAgWaES0kDR13kjkSxM1QozCHO3NlvGg94EZQK0/Ml
	 Z6r4sRJ1rHw9aSqfVYt/CDSaeLcFjjz57YkuosP4VP2WyW9tODcPE8bpewMO3ykOmC
	 Da4DKqfgfQITTEM1iBSJviPoT21mGxtQZ26YXr93ufEUuuHP4y0tsrNJCFzbs0Z548
	 OWnokVbyNkXP8FAb6VhG83aZKDxeS2gnLvHjMFRw2x6cYc5T7pLupE93M9+pE1et+m
	 6FbAvTmED0dfwLwQ4a8kyuxRQn8wLeMT00o4D88gVHY2q6AVooxcOgZmTisbXxuh94
	 ZM3Mo+4wsnzSw==
Date: Fri, 19 Aug 2022 14:43:11 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: xinlei.lee@mediatek.com
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@linux.ie,
	daniel@ffwll.ch, matthias.bgg@gmail.com,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v2,2/2] drm: mediatek: Adjust the dpi output format to
 MT8186
Message-ID: <20220819184311.4ty3hkzfdrrdg4sd@notapiano>
References: <1659693461-27057-1-git-send-email-xinlei.lee@mediatek.com>
 <1659693461-27057-3-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1659693461-27057-3-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_114322_381097_40966F08 
X-CRM114-Status: GOOD (  13.47  )
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

Hi Xinlei,

On Fri, Aug 05, 2022 at 05:57:41PM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Dpi output needs to adjust the output format to dual edge for MT8186.

Could you explain a bit more why this is needed? What does this configuration
do? And why is MMSYS involved in a DPI configuration?

Also, is this a configuration specific to MT8186? I enabled the flag on MT8192
just to test and didn't see any difference in behavior.

> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>

If Jitao also helped in the writing of this code, then there should also be a
co-developed-by tag for Jitao before the Signed-off-by [1].

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
[..]
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
[..]
> @@ -151,6 +154,7 @@ struct mtk_dpi_conf {
>  	u32 yuv422_en_bit;
>  	u32 csc_enable_bit;
>  	u32 pixels_per_iter;
> +	bool rgb888_dual_enable;

You're missing a description of this property in the struct's comment above:

drivers/gpu/drm/mediatek/mtk_dpi.c:160: warning: Function parameter or member 'rgb888_dual_enable' not described in 'mtk_dpi_conf'

Thanks,
Nícolas

