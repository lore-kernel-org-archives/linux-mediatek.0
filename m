Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A58C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lZkFZm+v025h9f5i+v6rOmtTCIKShHXgAq1YFo9g2Tg=; b=aCGRMp7Gef77Sj
	8zpsdYGj0yF34Pac1B+ZdARgKOC08hREnNzUFBodwWP44qgoIQcgSR05yN7fjm3WcRemepOIVFKhn
	r2FkQcig03MnMkk6EQm9vrCWx1xiVX3bIrmrpqhCykO4o+3gqi/M29binydFbu/DDeHreHh/O7gLx
	WFA6kvgmyEu+51OXSnM/ACE2LqjK+S77G10mA9lxByCh+IKq7gVCEkt3W77g1DPooC/dKLKifBML6
	v4DlBqOJhB/pc9RzPWgrKA7RC3wWmyeiCbiR5g6htO6nt2hEnLEn6xvswYjRNlruxl7XzLMzSl4Mj
	hySoknyzJDIJSafgM0Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8sp-009gJl-Ks; Tue, 15 Mar 2022 15:14:47 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8ry-009g5i-5T
 for linux-mediatek@lists.infradead.org; Tue, 15 Mar 2022 15:13:55 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 lj8-20020a17090b344800b001bfaa46bca3so2578277pjb.2
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Mar 2022 08:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=f5nlUBLV7MqYfh3uZWTTZlE6PzgMGo6+9eel+nmzmEc=;
 b=FOwkB/9cds0wWFfxicB/tnGCM5m9Apu7u2pJ9B1T/auQbXakW0HkJaBq35LO7cLx81
 fjXhiKYXerKnkoS2pnLwW2BFKxFYEqy/DihUnOQtYuffg0GRhC/ssczMhIKCgzOLYCqz
 XOOwwWfhDHK+MvYre/j3pCg3vn5p2Nyooy8d9elwNJqRPd+njeHvbpD+6iSQwqSrKKwJ
 aBgYpRwN5T52sPrV9hFqzxZGMhT9JV1vn9TRIzxBm3y6wCgkJv958FD1S6r57UxKViOc
 YazUs0ItazTbiwfZ/o9QYGuJ6cHmULxnpnwa285vg+0/+ooM61+Jrus0/Bzo4185YXDE
 BwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f5nlUBLV7MqYfh3uZWTTZlE6PzgMGo6+9eel+nmzmEc=;
 b=JtHBoqmZJPR7D6P5KqCLjUHL4UdwqUSQfUVEnk+KNwES0dE1g7m1Q+IgyqF91x7bKY
 01xHTvOH0pfKg5cFtvitByhj0QGI+WRX6ChZpOBjMBQXu6FsjAhCjnpmA5aUQPzuKYFE
 x7ICEU68T0YhmtWt1gCq7LH1YlEGRtWgEND0Fs10YvHi9ImHxQBm7LqkdwqrLESlti7O
 1nXVEFRG5PGE4cDKR0UqyU7EWzACErBlAx8SuvsgwXgIbVcjy2mJqAdW76GCRsi8B3Bw
 N5Q6+YGJowpE4c6hgx8fjmKrvjAXOXCZEBuckV4CJSI5uNaBC23iWirFNqzuPqC6r8/4
 2c7w==
X-Gm-Message-State: AOAM531osPuF0JzwKjBSQcyl9g/SwaznmVrULsiIRFsszb8pYZHfLbu0
 CmYo/MC5XJSpGFCvKO4XKfmkUw==
X-Google-Smtp-Source: ABdhPJyCccpeCH49rFaMMSFeIBQyW65dhNtaeYGUV8VzcCpHA9uN79iBq6oEDbJcgl1AlM7YYXcfZg==
X-Received: by 2002:a17:902:8b87:b0:14b:47b3:c0a2 with SMTP id
 ay7-20020a1709028b8700b0014b47b3c0a2mr28439314plb.51.1647357232685; 
 Tue, 15 Mar 2022 08:13:52 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
 by smtp.gmail.com with ESMTPSA id
 a38-20020a056a001d2600b004f72acd4dadsm24861405pfx.81.2022.03.15.08.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 08:13:51 -0700 (PDT)
Date: Tue, 15 Mar 2022 09:13:49 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 angelogioacchino.delregno@collabora.com
Cc: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v6 2/2] remoteproc: mediatek: Support mt8186 scp
Message-ID: <20220315151349.GA2479752@p14s>
References: <20220315124747.30144-1-allen-kh.cheng@mediatek.com>
 <20220315124747.30144-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220315124747.30144-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_081354_266446_02EDFDAF 
X-CRM114-Status: GOOD (  22.89  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 15, 2022 at 08:47:47PM +0800, Allen-KH Cheng wrote:
> From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> 
> Add SCP support for mt8186

V5 of this patchset is already in rproc-next and as such this one does not
apply.

> 
> Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

As far as I can see from the mailing list interactions, Angelo did not review
the new section about cache initialisation and yet his RoB is present.  And to
make matters worse he was not on the recipient list, which I have corrected.

Thanks,
Mathieu

> ---
>  drivers/remoteproc/mtk_common.h |  3 +++
>  drivers/remoteproc/mtk_scp.c    | 42 +++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
> index 5ff3867c72f3..71ce4977cb0b 100644
> --- a/drivers/remoteproc/mtk_common.h
> +++ b/drivers/remoteproc/mtk_common.h
> @@ -32,6 +32,9 @@
>  #define MT8183_SCP_CACHESIZE_8KB	BIT(8)
>  #define MT8183_SCP_CACHE_CON_WAYEN	BIT(10)
>  
> +#define MT8186_SCP_L1_SRAM_PD_P1	0x40B0
> +#define MT8186_SCP_L1_SRAM_PD_p2	0x40B4
> +
>  #define MT8192_L2TCM_SRAM_PD_0		0x10C0
>  #define MT8192_L2TCM_SRAM_PD_1		0x10C4
>  #define MT8192_L2TCM_SRAM_PD_2		0x10C8
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index dcddb33e9997..11be6b4235eb 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -383,6 +383,35 @@ static void mt8192_power_off_sram(void __iomem *addr)
>  		writel(GENMASK(i, 0), addr);
>  }
>  
> +static int mt8186_scp_before_load(struct mtk_scp *scp)
> +{
> +	/* Clear SCP to host interrupt */
> +	writel(MT8183_SCP_IPC_INT_BIT, scp->reg_base + MT8183_SCP_TO_HOST);
> +
> +	/* Reset clocks before loading FW */
> +	writel(0x0, scp->reg_base + MT8183_SCP_CLK_SW_SEL);
> +	writel(0x0, scp->reg_base + MT8183_SCP_CLK_DIV_SEL);
> +
> +	/* Turn on the power of SCP's SRAM before using it. Enable 1 block per time*/
> +	mt8192_power_on_sram(scp->reg_base + MT8183_SCP_SRAM_PDN);
> +
> +	/* Initialize TCM before loading FW. */
> +	writel(0x0, scp->reg_base + MT8183_SCP_L1_SRAM_PD);
> +	writel(0x0, scp->reg_base + MT8183_SCP_TCM_TAIL_SRAM_PD);
> +	writel(0x0, scp->reg_base + MT8186_SCP_L1_SRAM_PD_P1);
> +	writel(0x0, scp->reg_base + MT8186_SCP_L1_SRAM_PD_p2);
> +
> +	/*
> +	 * Set I-cache and D-cache size before loading SCP FW.
> +	 * SCP SRAM logical address may change when cache size setting differs.
> +	 */
> +	writel(MT8183_SCP_CACHE_CON_WAYEN | MT8183_SCP_CACHESIZE_8KB,
> +	       scp->reg_base + MT8183_SCP_CACHE_CON);
> +	writel(MT8183_SCP_CACHESIZE_8KB, scp->reg_base + MT8183_SCP_DCACHE_CON);
> +
> +	return 0;
> +}
> +
>  static int mt8192_scp_before_load(struct mtk_scp *scp)
>  {
>  	/* clear SPM interrupt, SCP2SPM_IPC_CLR */
> @@ -874,6 +903,18 @@ static const struct mtk_scp_of_data mt8183_of_data = {
>  	.ipi_buf_offset = 0x7bdb0,
>  };
>  
> +static const struct mtk_scp_of_data mt8186_of_data = {
> +	.scp_clk_get = mt8195_scp_clk_get,
> +	.scp_before_load = mt8186_scp_before_load,
> +	.scp_irq_handler = mt8183_scp_irq_handler,
> +	.scp_reset_assert = mt8183_scp_reset_assert,
> +	.scp_reset_deassert = mt8183_scp_reset_deassert,
> +	.scp_stop = mt8183_scp_stop,
> +	.scp_da_to_va = mt8183_scp_da_to_va,
> +	.host_to_scp_reg = MT8183_HOST_TO_SCP,
> +	.host_to_scp_int_bit = MT8183_HOST_IPC_INT_BIT,
> +};
> +
>  static const struct mtk_scp_of_data mt8192_of_data = {
>  	.scp_clk_get = mt8192_scp_clk_get,
>  	.scp_before_load = mt8192_scp_before_load,
> @@ -900,6 +941,7 @@ static const struct mtk_scp_of_data mt8195_of_data = {
>  
>  static const struct of_device_id mtk_scp_of_match[] = {
>  	{ .compatible = "mediatek,mt8183-scp", .data = &mt8183_of_data },
> +	{ .compatible = "mediatek,mt8186-scp", .data = &mt8186_of_data },
>  	{ .compatible = "mediatek,mt8192-scp", .data = &mt8192_of_data },
>  	{ .compatible = "mediatek,mt8195-scp", .data = &mt8195_of_data },
>  	{},
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
