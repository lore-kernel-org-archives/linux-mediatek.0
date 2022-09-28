Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A076C32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Sep 2022 10:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7/b0If/+1Lg139hgoDsykrCZtoPwMRx4Buly9gemT0=; b=XC+cQJ2rwFtbwNxM/Z04c4rglm
	GKJNo6WtqYoIIoRoBu4hxkRXAuwR5InuNoJ4nXCM8L0NSJgdCMJHZk4N2vLHcnm5KTYMqdspZE0OS
	CoqSmz6y67tFIxqYesh5YUlIOx7+itV7SUCtdUGxO0FlkxmYOCUMraUVeZe1uOarkDOK1y6+Quayc
	FQCUm8Pal/t9bZCw0R+QVexkxTeuhGKnOQ+gBSbs+DDdaLF45mkp+VKYLIdn/yr9jml8mmEJL0JYB
	ALfqJ4ZtyqfSlo99xLvtAWwLtcC8rkrPD6nGLDO/hdtKXoDgkBRTDf+DQeiaGRRfeXxhrblm1Lseo
	254SGzYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odULC-00FdAY-9U; Wed, 28 Sep 2022 10:30:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odUKl-00Fcyh-HB; Wed, 28 Sep 2022 10:30:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCF1761DF2;
	Wed, 28 Sep 2022 10:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35245C433D6;
	Wed, 28 Sep 2022 10:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664361030;
	bh=UzGll+k8wBj+Ek0YtUWqd2Ht46Qd8HsBBj7woBZT0JU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lriRxLomhxJEbw/wrLv0ke0UK4s3oUWcxVbIfkRMPPJgozbbJHN31fiYiMQ5rEguj
	 XykGCfkNkdlAhUSO3gFICVekG/XhZf4BadVDR5M8xyrU6qJO1n0v5cDggL+7aLEiHC
	 BknJQFhzMN0/4yqywDr8UpQdZhREMSSEBAczEIlEL6COPWlE4hmBtzi4J4WlCI6Vt1
	 k+s7eW/Itvo0LAKpfYQDrdOvfqmzdW054T1bkAB1yY94JDAqbj+FfRqpmeiTUizFKR
	 uKHJ/FUVKMlkHgNOOtUZXYPwh7SmJh+PfmXIm7NPLs7Oy8pVMmUIFt8SwKrjKkG3o1
	 jG16SjD1WPHag==
Date: Wed, 28 Sep 2022 11:30:24 +0100
From: Lee Jones <lee@kernel.org>
To: cy_huang <u0084500@gmail.com>
Cc: matthias.bgg@gmail.com, gene_chen@richtek.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	ChiYuan Huang <cy_huang@richtek.com>, stable@vger.kernel.org
Subject: Re: [PATCH] mfd: mt6360: add bound check in regmap read/write
 function
Message-ID: <YzQiQIpwpd8rD2qs@google.com>
References: <1663143973-29254-1-git-send-email-u0084500@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1663143973-29254-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_033031_644279_161163F0 
X-CRM114-Status: GOOD (  20.57  )
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

On Wed, 14 Sep 2022, cy_huang wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Fix the potential risk for null pointer if bank index is over the maximimum.
> 
> Refer to the discussion list for the experiment result on mt6370.
> https://lore.kernel.org/all/20220914013345.GA5802@cyhuang-hp-elitebook-840-g3.rt/
> If not to check the bound, there is the same issue on mt6360.
> 
> Fixes: 3b0850440a06c (mfd: mt6360: Merge different sub-devices I2C read/write)
> Cc: stable@vger.kernel.org
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
>  drivers/mfd/mt6360-core.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
> index 6eaa677..d375333 100644
> --- a/drivers/mfd/mt6360-core.c
> +++ b/drivers/mfd/mt6360-core.c
> @@ -410,6 +410,9 @@ static int mt6360_regmap_read(void *context, const void *reg, size_t reg_size,
>  	u8 crc;
>  	int ret;
>  
> +	if (bank >= MT6360_SLAVE_MAX)
> +		return -EINVAL;
> +

It's too late to check bank's value here, we have already used it to
index into an array by this point.  Please fix that.

>  	if (bank == MT6360_SLAVE_PMIC || bank == MT6360_SLAVE_LDO) {
>  		crc_needed = true;
>  		ret = mt6360_xlate_pmicldo_addr(&reg_addr, val_size);
> @@ -460,6 +463,9 @@ static int mt6360_regmap_write(void *context, const void *val, size_t val_size)
>  	int write_size = val_size - MT6360_REGMAP_REG_BYTE_SIZE;
>  	int ret;
>  
> +	if (bank >= MT6360_SLAVE_MAX)
> +		return -EINVAL;
> +
>  	if (bank == MT6360_SLAVE_PMIC || bank == MT6360_SLAVE_LDO) {
>  		crc_needed = true;
>  		ret = mt6360_xlate_pmicldo_addr(&reg_addr, val_size - MT6360_REGMAP_REG_BYTE_SIZE);

-- 
Lee Jones [李琼斯]

