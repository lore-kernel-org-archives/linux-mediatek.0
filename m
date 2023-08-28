Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5F6C71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 09:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlIAoeo8/FaLvtB6gJF8gPX1h2zSEiLFiGzYP+wNWSM=; b=olcegXW0csP99L3ztZlKhK8R2P
	sT11f1CuVgyoH1DEa1WRS4+N2B+QyV2kGEyaxTjm7W0XHzVMKDma3MjaotEUkyT5iIqTuX5uCjXVu
	skJ1tLv0UTp/qbLys9DS1mtFir5vLFNIQX71+eDVYX0I5cI9Q907MSMf7esFhQ75ntRelR0EttADD
	tf6sQholbX3FFmoLlnHR0xe2AMFTRocEMWlFqYzwUH4AUFLIGZHbR/bortPkGMA5YORFjMv8DCt53
	X7b8JUn8PXVzlBD/xs4FYgscgH9LRXlaNVakQ73Ge8h12nK3qHN0f6ktoVQP62ExEioABnZH6QP4v
	9cJRkxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaYd1-009Ebf-2E;
	Mon, 28 Aug 2023 09:33:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaYcx-009Eav-34;
	Mon, 28 Aug 2023 09:33:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B2BB961359;
	Mon, 28 Aug 2023 09:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FE0CC433C8;
	Mon, 28 Aug 2023 09:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693215222;
	bh=+ZA8KikFnAGsBsfoNqy/fVpDbZJ0zOlAuvqXE/frRxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A2GrYkJHtJKUagZq409xqq5xehkqsk2FgM2+97UL6tdTJT7xKcmrWGKMglRcDkaG+
	 ciGaX6lGwOUCzccZRmVCsvJpumVo2BT522tvF9PeohmII06N3kNCSfczv4GQM8zMOb
	 H5zNiGylEssQgDR+cFVk4aWLfw7CaudjAvoXk8AwDPWCYmglD+wvbYyYHCQBn8KKsK
	 HO1q2bw7N7OSL6Jke6I1w5Mz8H83mFmHPonicLmVH+3kzm0WUBlarPjFg+dPX66QT7
	 ApdtaSoBKSow6zTmvy2otCgJ50VpWEXLsoKvMK1KzJbjjwmhAYrK07eMmbswWLYNfk
	 cxdToLzvof5HA==
From: Michael Walle <mwalle@kernel.org>
To: macpaul.lin@mediatek.com
Cc: angelogioacchino.delregno@collabora.com,
	bear.wang@mediatek.com,
	broonie@kernel.org,
	chunfeng.yun@mediatek.com,
	fparent@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-spi@vger.kernel.org,
	macpaul@gmail.com,
	matthias.bgg@gmail.com,
	pablo.sun@mediatek.com,
	Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH] spidev: add compatible string for MediaTek IoT (Genio) boards
Date: Mon, 28 Aug 2023 11:33:26 +0200
Message-Id: <20230828093326.3255275-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230828080909.16610-1-macpaul.lin@mediatek.com>
References: <20230828080909.16610-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_023344_051353_1E3E622F 
X-CRM114-Status: GOOD (  13.12  )
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

> Add compatible string for MediaTek IoT (Genio) boards.

This has already be discussed [1] and was naked.

https://lore.kernel.org/lkml/20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com/

-michael

> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> ---
>  drivers/spi/spidev.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/spi/spidev.c b/drivers/spi/spidev.c
> index d13dc15cc191..9d7952dbbaa6 100644
> --- a/drivers/spi/spidev.c
> +++ b/drivers/spi/spidev.c
> @@ -714,6 +714,7 @@ static const struct spi_device_id spidev_spi_ids[] = {
>  	{ .name = "spi-authenta" },
>  	{ .name = "em3581" },
>  	{ .name = "si3210" },
> +	{ .name = "genio-board" },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(spi, spidev_spi_ids);
> @@ -742,6 +743,7 @@ static const struct of_device_id spidev_dt_ids[] = {
>  	{ .compatible = "semtech,sx1301", .data = &spidev_of_check },
>  	{ .compatible = "silabs,em3581", .data = &spidev_of_check },
>  	{ .compatible = "silabs,si3210", .data = &spidev_of_check },
> +	{ .compatible = "mediatek,genio-board", .data = &spidev_of_check },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, spidev_dt_ids);
> -- 
> 2.18.0

