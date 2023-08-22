Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63211EE49AC
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 15:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S2nWE3aQXFlKdqzDmsVrOKSeJqyIatEgKjU2+rJLr14=; b=ZF6s2U50M7+qRJeYhH62RZdg7o
	ozR2qdyYiaagqPE5DtJU3CFSaeeLEJ6M2pUxFH8V0KBNlXgiLCY69xLeYp2bJCCR+oBM1OKeJF1Tt
	gXnMCTD9l128eqPyV8n1RLzW3hvQLhspZ97CAGU+IjTrI97no1VzLdPuk9otN4M9cgIcD8tDrSUXj
	yYipiLy60uIGimbX0Q7cAVWPTgnVyVn2ID8nyub+MCY3EafKy6xpBpRxoJaAnwKsyI9d+9VpeVRZ+
	yCBsiK+U7tlMcWv4D9nbDlvtnH3V+rDl0tvuSVZqnOOSBKNTfqyinNBw3XkKRDweMcH5ruAyZevOl
	8dVuNbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYTjZ-00GQ2n-0t;
	Tue, 22 Aug 2023 15:55:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYTjW-00GQ17-2B;
	Tue, 22 Aug 2023 15:55:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=S2nWE3aQXFlKdqzDmsVrOKSeJqyIatEgKjU2+rJLr14=; b=h3LZMwRi//eYTY51C/zEUbk/KO
	Dho7q3CkJYHxVIdRK7/rrnp2+YNqLZsktupbQMebaIvDmYa2YpqGHA+7yqU06Kk5vULxXH6q5Yu7c
	TShQ8Zjh3ocqJrA+BI2sDEi0aCjfHO5B09W19cbvlWyOfjnwbBfXDn3fcId9awHN6fr2zKv0iRjTN
	E+mdjMh1TTg7K1Qe9lTSxVSkwrpC/pq/aA8jTZtrU1bpNAI/guBoyXTppDH//j0Fa7aGkIaJGb+I4
	yVR8i++m+9VzLZYOu0ehN0C7gdOllVaqbLI3wHpp0GLVWL09SwiXkydAgQW5n1LXP7EOnzd2lOfbT
	PyTaKutA==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYTjR-002rSb-0Q;
	Tue, 22 Aug 2023 15:55:53 +0000
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RVYnd4n4Yz6D8d1;
	Tue, 22 Aug 2023 23:54:45 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 16:55:25 +0100
Date: Tue, 22 Aug 2023 16:55:24 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Li Zetao <lizetao1@huawei.com>
CC: <broonie@kernel.org>, <chin-ting_kuo@aspeedtech.com>, <clg@kaod.org>,
	<joel@jms.id.au>, <andrew@aj.id.au>, <florian.fainelli@broadcom.com>,
	<rjui@broadcom.com>, <sbranden@broadcom.com>,
	<bcm-kernel-feedback-list@broadcom.com>, <fancer.lancer@gmail.com>,
	<olteanv@gmail.com>, <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<avifishman70@gmail.com>, <tmaimon77@gmail.com>, <tali.perry1@gmail.com>,
	<venture@google.com>, <yuenn@google.com>, <benjaminfair@google.com>,
	<linus.walleij@linaro.org>, <heiko@sntech.de>, <linux-spi@vger.kernel.org>,
	<linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH -next 02/25] spi: armada-3700: Use helper function
 devm_clk_get_prepared()
Message-ID: <20230822165524.000062a8@Huawei.com>
In-Reply-To: <20230822131237.1022815-3-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
	<20230822131237.1022815-3-lizetao1@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_165549_254497_F2D4CCAF 
X-CRM114-Status: UNSURE (   6.50  )
X-CRM114-Notice: Please train this message.
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


> @@ -909,10 +901,6 @@ static int a3700_spi_probe(struct platform_device *pdev)
>  
>  static void a3700_spi_remove(struct platform_device *pdev)
>  {
> -	struct spi_controller *host = platform_get_drvdata(pdev);
> -	struct a3700_spi *spi = spi_controller_get_devdata(host);
> -
> -	clk_unprepare(spi->clk);
Hi.

No point in keeping an empty remove function.  Drop the whole thing now
there is nothing to do.

Jonathan

>  }
>  
>  static struct platform_driver a3700_spi_driver = {


