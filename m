Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A62C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 12:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRGsRKN1xBJLnx3jxqLZXz1Qr34zNeXkxt1I94ryKIM=; b=WjxMn8csZPKW4p
	wXunWdwKC066E811PHoJ+iBIauspZ3ggVnagV7RzsdH3zyUz0uJIccCNpgcGxfCUofwpkMios01YN
	yuS/PKmVhrCV0jEzYIRDV922FKfF8io3iGAYnQ5FpPyoMqy7UhRZkag4nmgYrplio+X7xPdGDQhqM
	fhkjALjTLWOrE/qlig8GStNjE2YjBwYMGSZS4Dw5UFs3uShOxSt/EFaEcqEhzV1I27ke/V74Sq7AG
	6jaPjUU1B3KGn3j/IjNDASptPMWJYcaBCH68GZ1Pe9AUXf2ByWOAsTLRj7l2kG6eO6XPzVqbtfMKO
	rh289YvF4TQqqp9/fd9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no2Lj-00EJKa-Om; Mon, 09 May 2022 12:18:51 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no2LX-00EJGX-PQ; Mon, 09 May 2022 12:18:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1F08E1F43BA5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652098717;
 bh=/ElfDQ7Z0+LPIiP82VOSR/z6/oF6F1kOGCw4zRzqtM0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SFNDAWZ+B9j/a0+7UlWwDPvBoOHehJzS5iBQT9zXO/qZkN3if5DX5LWbW2aFUP5vQ
 UcwkEtUhhnJTuuOXAHUCQdF1D8NBNFVLuBHz+xv2PpuOdxhRV38LsVehwOT8P2YEOR
 2jd9vsL03Pc5W0D/lKKlY3CeNu80kOd+9kJZ1hxq0xEr3g3cxZ1lDOB5SxY3WiQc42
 uhoq5OdtWrv6zvXO3G0M25Qk2DG/TcJodNMPDvUKPRSf8Rg2OAmQ4Pbs6IAEkwMbcO
 g4vghNiQAExBdJUJGc4Ci4AYscSw0+Cps3vuO50jOxVQKb78S1jAAuKlMKuJiRadOb
 rLNLAKw/Bmo8w==
Message-ID: <e9839acf-e334-d73d-a0b3-57d951fb8796@collabora.com>
Date: Mon, 9 May 2022 14:18:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] PCI: mediatek-gen3: Assert resets to ensure expected init
 state
Content-Language: en-US
To: ryder.lee@mediatek.com
Cc: jianjun.wang@mediatek.com, lorenzo.pieralisi@arm.com, robh@kernel.org,
 kw@linux.com, bhelgaas@google.com, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 nfraprado@collabora.com
References: <20220404144858.92390-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220404144858.92390-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_051840_020184_654E0FC7 
X-CRM114-Status: GOOD (  17.60  )
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

Il 04/04/22 16:48, AngeloGioacchino Del Regno ha scritto:
> The controller may have been left out of reset by the bootloader,
> in which case, before the powerup sequence, the controller will be
> found preconfigured with values that were set before booting the
> kernel: this produces a controller failure, with the result of
> a failure during the mtk_pcie_startup_port() sequence as the PCIe
> link never gets up.
> 
> To ensure that we get a clean start in an expected state, assert
> both the PHY and MAC resets before executing the controller
> power-up sequence.
> 
> Fixes: d3bf75b579b9 ("PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Friendly ping for an important fix :-)

Regards,
Angelo

> ---
>   drivers/pci/controller/pcie-mediatek-gen3.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
> index f7048ea4c020..dccdfce12b1c 100644
> --- a/drivers/pci/controller/pcie-mediatek-gen3.c
> +++ b/drivers/pci/controller/pcie-mediatek-gen3.c
> @@ -838,6 +838,14 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
>   	if (err)
>   		return err;
>   
> +	/*
> +	 * The controller may have been left out of reset by the bootloader
> +	 * so make sure that we get a clean start by asserting resets here.
> +	 */
> +	reset_control_assert(pcie->phy_reset);
> +	reset_control_assert(pcie->mac_reset);
> +	usleep_range(10, 20);
> +
>   	/* Don't touch the hardware registers before power up */
>   	err = mtk_pcie_power_up(pcie);
>   	if (err)



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
