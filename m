Return-Path: <SRS0=Jt7l=BW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A155C433E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 13:26:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A28820855
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Aug 2020 13:26:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ALwvyXqN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="lIPY4fVS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="j6q48Ofk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A28820855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bG6sKrtxj48kSL48ckqnuROVVGweqEmSywQxS7e7dqg=; b=ALwvyXqNTiM948zASpa0EilL5
	2ur3qbdjhbxeBeLuHkW9BkkHS3T/W4nYyhiQucO5qLX4Pm2If6afIzC8yNvQ2USDnRvhONsLw2KGl
	b868FlP3GEbgFKFuRdvdDq9WY6rp78MCJehjA4se3Ei8j4O/QkVLClsXOXpkPBlsBvGWg4rzCfYMv
	0Sb9Twk/9uhi2Ab/biu2M7xubu/LeVYwn3J5ktnTK4VCxRH7GIYX+m5Y9SjCsVWkeTdyT7Zp2XaBC
	ROZ0cTQFKpAiDZturEvwS2hG27n+eB8JyxQ9h4esH+lOkNuIJTgT3S066SvfRXrJJ6MsAliJfIgsv
	iBUK1wLIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k5qlK-000378-DM; Wed, 12 Aug 2020 13:25:50 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k5qlE-000347-RN; Wed, 12 Aug 2020 13:25:46 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id A6F7E5803D8;
 Wed, 12 Aug 2020 09:25:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 12 Aug 2020 09:25:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=ogsRn8UJvYnJnHmnmoJD8EeRCxv
 OuB0FI3xBqc0qcuQ=; b=lIPY4fVS/yyIBCu1HgDe/hcTkqorszv3Knz35oiXGxo
 25RZMhsPABOSsbX5pqdYE7aD/GPKLPdNTxSqyNvdDo9EEEbwRTDiuckF00b9FEXL
 PeLn/goTNMAHalcs/sK07UwI2HAcYuOn1xMso0zGO2ln5TLDAonjPwJeEd6ozHs1
 mdUb3o/rg98N+6CK+/x1+5s5bT81wkZ/tR+oxA7TEezvyHXcUzidJUck18HaX13/
 h/YcciJ92M359yzD5dqDq2t7+Ymn7fzfyx4yFfTH6HTXecZEtydoiDYROW3TOUaI
 qFS/vw7gw248kdqHLwq5oqjRd1dI2BcTFMsFDK0LI7Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ogsRn8
 UJvYnJnHmnmoJD8EeRCxvOuB0FI3xBqc0qcuQ=; b=j6q48OfkZkL6IhRSVkrHag
 3QhD/klT3dNA5dOCQ6K6Dw+8cNat4Zorh/qx+KOQC6dHElclKdVrD+TCLpivJevO
 Obq6M0lG1E37fC814+uhcOWEQb2UyW4/vzUX4t8qT4CjmYRBJUSplSYookVg/WUD
 6yiCdPsUORGpkNjZl773Pf1qSGEunmVf9zIt8LzJUUfTHoYztR/wuttth1VvdFix
 NOFgCfDDfIw4DY9AhTWGDRjlRs7rQhTMZcGkclPmanxYH+BiOg2MicJspeRR26e+
 R9pmxkLrx8SWNtOcuxs/bgMBPuY/PDsYFgY2KFZROy5ddQaPtNN+K55DhKRsrPyw
 ==
X-ME-Sender: <xms:2O0zX5T5Qj95O1-mTPmVA_mMJte538fKlYq_YAkw-8B3nNGF1rNeBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrledvgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
 jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepueelledthe
 ekleethfeludduvdfhffeuvdffudevgeehkeegieffveehgeeftefgnecuffhomhgrihhn
 pehkvghrnhgvlhdrohhrghenucfkphepkeefrdekiedrkeelrddutdejnecuvehluhhsth
 gvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghh
 rdgtohhm
X-ME-Proxy: <xmx:2O0zXyxYJdCmoSSma5ECQPwlNv1CvWD6_PNcNGK6vxqeJUkh0lcx5g>
 <xmx:2O0zX-1qDpX9rRtegMpKmfcTRHbdD7_oC2X5UB3wbEXZVpmm6IsxPg>
 <xmx:2O0zXxDhk8h2P_vhj0t36IKfEcnaHsbKL-pZhpw7yxGBmY1sosxbnQ>
 <xmx:2O0zX9Nloy36PNgGgACebPlvIfM1zIlboHBNMPEWroLg42gjgO89EA>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0A9F0328005D;
 Wed, 12 Aug 2020 09:25:44 -0400 (EDT)
Date: Wed, 12 Aug 2020 15:25:55 +0200
From: Greg KH <greg@kroah.com>
To: Wenbin Mei <wenbin.mei@mediatek.com>
Subject: Re: [v2,3/3] mmc: mediatek: add optional module reset property
Message-ID: <20200812132555.GD2489711@kroah.com>
References: <20200812130129.13519-1-wenbin.mei@mediatek.com>
 <20200812130129.13519-4-wenbin.mei@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200812130129.13519-4-wenbin.mei@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200812_092545_108230_156B5DC1 
X-CRM114-Status: GOOD (  22.39  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 12, 2020 at 09:01:29PM +0800, Wenbin Mei wrote:
> This patch fixs eMMC-Access on mt7622/Bpi-64.
> Before we got these Errors on mounting eMMC ion R64:
> [   48.664925] blk_update_request: I/O error, dev mmcblk0, sector 204800 op 0x1:(WRITE)
> flags 0x800 phys_seg 1 prio class 0
> [   48.676019] Buffer I/O error on dev mmcblk0p1, logical block 0, lost sync page write
> 
> This patch adds a optional reset management for msdc.
> Sometimes the bootloader does not bring msdc register
> to default state, so need reset the msdc controller.
> 
> Fixes: 966580ad236e ("mmc: mediatek: add support for MT7622 SoC")
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  drivers/mmc/host/mtk-sd.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 39e7fc54c438..2b243c03c9b2 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -22,6 +22,7 @@
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/interrupt.h>
> +#include <linux/reset.h>
>  
>  #include <linux/mmc/card.h>
>  #include <linux/mmc/core.h>
> @@ -434,6 +435,7 @@ struct msdc_host {
>  	struct msdc_save_para save_para; /* used when gate HCLK */
>  	struct msdc_tune_para def_tune_para; /* default tune setting */
>  	struct msdc_tune_para saved_tune_para; /* tune result of CMD21/CMD19 */
> +	struct reset_control *reset;
>  };
>  
>  static const struct mtk_mmc_compatible mt8135_compat = {
> @@ -1516,6 +1518,12 @@ static void msdc_init_hw(struct msdc_host *host)
>  	u32 val;
>  	u32 tune_reg = host->dev_comp->pad_tune_reg;
>  
> +	if (!IS_ERR(host->reset)) {
> +		reset_control_assert(host->reset);
> +		usleep_range(10, 50);
> +		reset_control_deassert(host->reset);
> +	}
> +
>  	/* Configure to MMC/SD mode, clock free running */
>  	sdr_set_bits(host->base + MSDC_CFG, MSDC_CFG_MODE | MSDC_CFG_CKPDN);
>  
> @@ -2273,6 +2281,11 @@ static int msdc_drv_probe(struct platform_device *pdev)
>  	if (IS_ERR(host->src_clk_cg))
>  		host->src_clk_cg = NULL;
>  
> +	host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
> +								"hrst");
> +	if (PTR_ERR(host->reset) == -EPROBE_DEFER)
> +		return PTR_ERR(host->reset);
> +
>  	host->irq = platform_get_irq(pdev, 0);
>  	if (host->irq < 0) {
>  		ret = -EINVAL;
> -- 
> 2.18.0

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
