Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48653C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 14:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zb1dfyEpZJAdTwtkXEcyqFpCUaMz9xBVMCRubsrsBzA=; b=3FWx+59dmNjYop
	uYGI/1wjTKYskRk24h8yRUO0W4tV5ZDyxg8z54WYrARgGubqvkEMna20GXtJ4Y9Xy77KU3nY+NKhP
	AnqdD/TMREKgYM7X+Ow4IKJQDnaNGpDnG7NhPYfkfnxKlRVitak+UKuSqf7kuSlvitOr39K5OnriF
	yzv0TbThCA+JBUH2D/w87LUAZLIlPEceVbMM6CepwAKRD8vsNxr28wlYXVtajG4Z1XAge0HpFpecC
	/WeP9KQogkYaDHQAw8erBaawUqn15ueKTrqkvJOoBjEvMTogh6CBZdCN6dB6Y+XTzQwSjfByroTf3
	DRK/96iYWcdGPUUh2b9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM9ji-006Dli-Hz; Mon, 21 Feb 2022 14:32:22 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM9iP-006CvG-JZ; Mon, 21 Feb 2022 14:31:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 62EB71F437D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645453860;
 bh=uHyvQnRcX2j54qKQCC3UrIix0zhsBCTFiwo3BQ/UxV0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GSqvWgY2B6oVYyJDve3B5XxVuNeBu65AC7yHmuDp6GS2Mvt+I2fY3pTTLZ/xzBsgy
 GmSDLT+cNZO+FYzBBR2waHln4c4cJ24elj95PIuXEvU+PW+ApwrM1wKzaJ3SJFOVvt
 v1FY/5dNMhVVoQBQhFOh6kfYKMEl99vEMd6GeE5FztlaI07VaLmEmOiLvl4iUkwYSU
 7HlFPJlhoP+lZ1mRf8sYabVpPEjwD0xFNc6jCFvQZtTXdjjmZ/Mc3CC5g9ULH2H1GE
 CU/xbs9kw3SSFXz7ybdpLlYTVvCL/stu0B5Qja7oMQs//saJpoa0X4nllVGr6kCZYU
 I/CZv/0z7ycNQ==
Message-ID: <27d7af65-588d-9811-3d01-863fd0334298@collabora.com>
Date: Mon, 21 Feb 2022 15:30:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v8 08/19] drm/mediatek: dpi: move dimension mask to board
 config
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, matthias.bgg@gmail.com, chunfeng.yun@mediatek.com,
 kishon@ti.com, vkoul@kernel.org, deller@gmx.de, ck.hu@mediatek.com,
 jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-9-granquet@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220218145437.18563-9-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_063101_824554_EDD5AE55 
X-CRM114-Status: GOOD (  10.80  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/02/22 15:54, Guillaume Ranquet ha scritto:
> Add flexibility by moving the dimension mask to the board config
> 

s/board/SoC/g


> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c | 26 ++++++++++++++++----------
>   1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 454f8563efae4..8ca3455ed64ee 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -127,6 +127,8 @@ struct mtk_dpi_conf {
>   	u32 num_output_fmts;
>   	bool is_ck_de_pol;
>   	bool swap_input_support;
> +	// Mask used for HWIDTH, HPORCH, VSYNC_WIDTH and VSYNC_PORCH (no shift)

Also, C-style comments, please.

After the change,
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



> +	u32 dimension_mask;
>   	const struct mtk_dpi_yc_limit *limit;
>   };
>   


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
