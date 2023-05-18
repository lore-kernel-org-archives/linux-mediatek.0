Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0771C77B7D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 May 2023 09:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoVZoesze3amaWX0xfs/f4s6bWxEh5hp0tbIuqdcZBY=; b=zsg2NJytavq+LupW6JpEIW/D2k
	Pej2sCIzXBI6q9rLiVhWEY4MzuAOVlBh5QQmhueKEOtOqHumkXkYW+2hdTRfqeU0sqEjggQu+Brms
	/4ubKOM97zp/JadaGDZd+vQMvJ5wHK0qGp3yDFOYxbK8c6IwdMvfWOatnohTIqBdSbePxTaNq5jce
	IpCPcjlL6UgJa/RiqTGosdDTJX++5tfYshlAYGM2/0wqwrxOvnNaVhBnD7lZFszBr/W958GxOkB2i
	bAk+FJtalIaxKSwWYutGzeeOvxZMHrf8izO0gwasn1SuKiCnO9cqHkEqlx76DHnw1Nb3qVSzjNiN9
	NyUqy8pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzZhV-00CQfK-0U;
	Thu, 18 May 2023 09:13:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzZhR-00CQeA-2o;
	Thu, 18 May 2023 09:13:31 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7DD8B6605942;
	Thu, 18 May 2023 10:13:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684401206;
	bh=8uYZao2Gz/azmiXJrOpzRQOcMD2LDe0Wm+O2Lm2g7iQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TkJkfi/ThVubzoWNirgKKz5OWpZRClL0L32odQhqkK+CicD/6VpS1ppZbjUw9+d4A
	 E2VK/TtBwzqtMbPaltZDLQQKAganjQWKb/4sXU6RVOajVOTAI/NjS5dXOsVKq/6TUn
	 0BH76JtPMHqUyFGuQSFxlh2Emrz1w54SN4mG5TGSGM+Crdfuyq11AjZroujKvFAeD5
	 Wli8zM/wssawdhRe0Zm3LSIGgJNHJTYuRdlmSG5+P53jYc90E3MXL6qXo+xGt4uGHg
	 dhaLW3HwSfJTigc5+j7curd6xZV9fTMX+hcoBxu7HmVoMH10oxt+hyjmdffSpWe1ZU
	 UesehU5oMYX2g==
Message-ID: <0df3968e-da34-b36c-4cb4-92d66508a46a@collabora.com>
Date: Thu, 18 May 2023 11:13:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2] mmc: mtk-sd: reduce CIT for better performance
To: Wenbin Mei <wenbin.mei@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230510015851.11830-1-wenbin.mei@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230510015851.11830-1-wenbin.mei@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_021330_087060_CA607269 
X-CRM114-Status: GOOD (  21.70  )
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

Il 10/05/23 03:58, Wenbin Mei ha scritto:
> CQHCI_SSC1 indicates to CQE the polling period to use when using periodic
> SEND_QUEUE_STATUS(CMD13) polling.
> The default value 0x1000 that corresponds to 150us, let's decrease it to

The default value 0x1000 (4096) corresponds to 4096 * 52.08uS = 231.33uS
...so the default is not 150uS.

If I'm wrong, this means that the CQCAP field is not 0, which would mean
that the expected 3uS would be wrong.

Also, since the calculation can be done dynamically, this is what we should
actually do in the driver, as this gives information to the next engineer
checking this piece of code.

Apart from this, by just writing 0x40 to the CQHCI_SSC1 register, you are
assuming that the CQCAP value requirement is fullfilled, but you cannot
assume that the bootloader has set the CQCAP's ITCFVAL and ITCFMUL fields
as you expect on all platforms: this means that implementing this takes
a little more effort.

You have two ways to implement this:
  *** First ***
  1. Read ITCFMUL and ITCFVAL, then:
     tclk_mul = itcfmul_to_mhz(ITCFMUL); /* pseudo function interprets reg value*/
     tclk = ITCFVAL * tclk_mul;

  2. Set SSC1 so that we get 3nS:
     #define CQHCI_SSC1_CIT GENMASK(15, 0)
     poll_time = cit_time_ns_to_regval(3);
     sscit = FIELD_PREP(CQHCI_SSC1_CIT, poll_time)
     cqhci_writel( ... )

  *** Second **

  1. Pre-set ITCFMUL and ITCFVAL to
     ITCFVAL = 192 (decimal)
     ITCFMUL = 2 (where 2 == 0.1MHz)

  2. Set SSC1 so that we get 3nS:
     #define CQHCI_SSC1_CIT GENMASK(15, 0)
     poll_time = cit_time_ns_to_regval(3);
     sscit = FIELD_PREP(CQHCI_SSC1_CIT, poll_time)
     cqhci_writel( ... )

I would implement the first way, as it paves the way to extend this to different
tclk values if needed in the future.

Regards,
Angelo

> 0x40 that corresponds to 3us, which can improve the performance of some
> eMMC devices.
> 
> Signed-off-by: Wenbin Mei <wenbin.mei@mediatek.com>
> ---
>   drivers/mmc/host/mtk-sd.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index edade0e54a0c..ffeccddcd028 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2453,6 +2453,7 @@ static void msdc_hs400_enhanced_strobe(struct mmc_host *mmc,
>   static void msdc_cqe_enable(struct mmc_host *mmc)
>   {
>   	struct msdc_host *host = mmc_priv(mmc);
> +	struct cqhci_host *cq_host = mmc->cqe_private;
>   
>   	/* enable cmdq irq */
>   	writel(MSDC_INT_CMDQ, host->base + MSDC_INTEN);
> @@ -2462,6 +2463,9 @@ static void msdc_cqe_enable(struct mmc_host *mmc)
>   	msdc_set_busy_timeout(host, 20 * 1000000000ULL, 0);
>   	/* default read data timeout 1s */
>   	msdc_set_timeout(host, 1000000000ULL, 0);
> +
> +	/* decrease the send status command idle timer to 3us */
> +	cqhci_writel(cq_host, 0x40, CQHCI_SSC1);
>   }
>   
>   static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)


