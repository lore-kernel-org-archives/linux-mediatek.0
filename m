Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF79C001DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Sep 2023 23:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pzU6bhR27CiAM2LhdFwGGPpMyRf5NAYqgaiGsnveqC4=; b=DfsdpHJHtURvdQTaeqfmMu366R
	hThlVka+6XdzbRUxV5d+TlfX6dJ1+qAOtuwKe9lEzY/DoBWDHNOXCyZCyAVD8sKN2Lr3yEc2ZgGIU
	tuqH9ndirAcUZtWBk9McfpS1ql1qlc8pzXmqKmCKsrDLjiOo6hHYbQeVxWAPL1YWQYuD9X5n71kdO
	D+91W7MLD9OqKahu1bvVjP0vAQJcNCbiCu9Y5MheLSKc+DiQNjvD3gOLsQQaC6QtuN1G/+UtprQCf
	st1n/TGVrokNfwLsdfn6b+PnOmOF1M+pKrv+779s2JytTUmGxlIWFSjjpp/j6WvDRhNjTgGeGhTkP
	xkNu9Mfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qcaNH-001uEb-2f;
	Sat, 02 Sep 2023 23:49:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qcaNE-001uEB-1B;
	Sat, 02 Sep 2023 23:49:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A261E60A66;
	Sat,  2 Sep 2023 23:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B78AC433C8;
	Sat,  2 Sep 2023 23:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693698587;
	bh=WLEg/L2hnbjXRMoDJB1stlTmgT1yeFxRUJokuo7n30I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FXDbWWilw3KNrXl/6piZouse9X1uKcko4VfRhRhqeBv1zyLyv2jT/ydm1ajUnEWqY
	 D3tUy7Avam1IeaGbvliex9uUxtSFyUnWoDOvmRhA9TzT+OOT7DSUxJTjmzEQN4cFHD
	 JuNnsxyhjOH5SvdPq+AyqW/MbVwRp9NMNgP4CnI9haiPQGZHJOw6T3iZBj9SmK/D23
	 mOYWjVs45C6a3SonW/5TvSBj+kOv6W0jfAzDwyuc8KZ/tDfERGXtbD8LoHnO+fjcye
	 +8v9Fo3IFvdR88okr98BoQhiqoGNq98tNYuxRRu8pKLx9JgEQsFvoT6FtomomOJiSm
	 24puQNt/G1HpQ==
Date: Sun, 3 Sep 2023 01:49:43 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Qii Wang <qii.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?utf-8?B?6YOt5bCP5qGl?= <joe@gainstrong.cn>
Subject: Re: [PATCH] i2c: mt65xx: allow optional pmic clock
Message-ID: <20230902234943.sua22ocjjviq2ymj@zenone.zhora.eu>
References: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bf827929a44c17bfb1bf1000b143c02ce26a929.1693102324.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230902_164952_471980_56603051 
X-CRM114-Status: GOOD (  25.56  )
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

Hi Daniel,

On Sun, Aug 27, 2023 at 03:13:30AM +0100, Daniel Golle wrote:
> Using the I2C host controller on the MT7981 SoC requires 4 clocks to
> be enabled. One of them, the pmic clk, is only enabled in case
> 'mediatek,have-pmic' is also set which has other consequences which
> are not desired in this case.
> 
> Allow defining a pmic clk even in case the 'mediatek,have-pmic' propterty
> is not present and the bus is not used to connect to a pmic, but may
> still require to enable the pmic clock.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index 1a9b5a068ef1b..a8b5719c33729 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -1442,15 +1442,19 @@ static int mtk_i2c_probe(struct platform_device *pdev)
>  	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk))
>  		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_ARB].clk);
>  
> +	i2c->clocks[I2C_MT65XX_CLK_PMIC].clk = devm_clk_get_optional(&pdev->dev, "pmic");
> +	if (IS_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk)) {
> +		dev_err(&pdev->dev, "cannot get pmic clock\n");
> +		return PTR_ERR(i2c->clocks[I2C_MT65XX_CLK_PMIC].clk);

you could have used dev_err_probe() here, but on the other hand
it would be inconsistent because it's not used anywhere in this
driver... so that it looks good to me:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi

