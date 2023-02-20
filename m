Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000DEC64EC7
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Feb 2023 13:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OPCHjNqeuLu9vw91rGChYQ3hMNzpRgz5gYKIqzFkF5I=; b=AtJDHxZWrIjFW6EP3Zo01xnQcT
	ALmxmndsfIwgrBvFD8On9D/cHtEVUCOiTMyFi6gtzQRkgfUmgq20L7fJ9g2mP2I/KHOA8bJ4x8no9
	9Rc0aX+LiJ6mlQvKnSs3Ck2V/r7RJoAodiU4B+ckF5NzNwPamyeYW1siUpmyNVg57iP2q9bTtlwWJ
	bLnfPkI3o9Qn/D/C0c5pNDltJOCOc9tAcTYorAqfoVgCDJZ/5cWpibuYROfXu3kijAgUK8H6pDT1T
	GskccnBtRQPpM9makVLviVpmZxGPK14aopDo5BwuTINzIlNINIWSs+BjBqR9jsbvXqA9BItoYYMmN
	/xD7Hkjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU6gm-004FMu-3n; Mon, 20 Feb 2023 13:58:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU6ga-004FJd-QK; Mon, 20 Feb 2023 13:58:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5CF246602149;
	Mon, 20 Feb 2023 13:58:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676901511;
	bh=SsOeXt+P4iwbX9REZy4GabzaEzha82/twxsj56mbnP0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ApwaLqnSxqZSACmOYBRcautqtgPCym4zXwmdQy3gJ8+JNxQGjJZz79agFwnCkU8qO
	 68q3OZBddtmNffxG7S29M9BYVR13x5iZcc8tBQ/uqzbg4s4vsceyZyI5gLMFlCBnXK
	 Q5uo2o3jWuosSwCatSLGMt981Q9+dHxZqEFBCJH3HuH2XJsLum95myMvAcU9hn7+vV
	 RNo6NQOwouOekReWXxCnO12RdNJZNvtBuxA+jantW3I2fsKKMgeAQnz8j4QdcIinBj
	 BDJLh9wQ19ZPmHBmDpghBon1bzqvglddr95ejGgiWlWhJmPg3G6E9nTuGFBkI2BcyT
	 fFjQdUfgJb0tA==
Message-ID: <c6058eb2-0cb5-4cbd-e7d9-5ae5975be86f@collabora.com>
Date: Mon, 20 Feb 2023 14:58:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] scsi: ufs: Add select to CONFIG_PM in Kconfig
Content-Language: en-US
To: Stephen Zhang <starzhangzsd@gmail.com>, jejb@linux.ibm.com,
 artin.petersen@oracle.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 bvanassche@acm.org, avri.altman@wdc.com, yoshihiro.shimoda.uh@renesas.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 zhangshida@kylinos.cn, k2ci <kernel-bot@kylinos.cn>
References: <20230220083256.997470-1-zhangshida@kylinos.cn>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230220083256.997470-1-zhangshida@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_055833_069389_6E5B8D92 
X-CRM114-Status: GOOD (  15.25  )
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

Il 20/02/23 09:32, Stephen Zhang ha scritto:
> From: Shida Zhang <zhangshida@kylinos.cn>
> 
> From: Shida Zhang <zhangshida@kylinos.cn>
> 
> In a configuration with CONFIG_SCSI_UFS_MEDIATEK set to 'm' and
> CONFIG_PM set to 'n', errors occur at compile time:
> 
> ====
> ../drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_runtime_suspend’:
> ../drivers/ufs/host/ufs-mediatek.c:1621:8: error: implicit declaration of function ‘ufshcd_runtime_suspend’; did you mean ‘ufs_mtk_runtime_suspend’? [-Werror=implicit-function-declaration]
> ../drivers/ufs/host/ufs-mediatek.c: In function ‘ufs_mtk_runtime_resume’:
> ../drivers/ufs/host/ufs-mediatek.c:1636:9: error: implicit declaration of function ‘ufshcd_runtime_resume’; did you mean ‘ufs_mtk_runtime_resume’? [-Werror=implicit-function-declaration]
> ====
> 

That's wrong. This driver should be made to compile for both !CONFIG_PM
and CONFIG_PM.

Regards,
Angelo

> This patch fixes these by selecting CONFIG_PM from CONFIG_SCSI_UFS_MEDIATEK.
> 
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Shida Zhang <zhangshida@kylinos.cn>
> ---
>   drivers/ufs/host/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/ufs/host/Kconfig b/drivers/ufs/host/Kconfig
> index 4cc2dbd79ed0..f9786f085b54 100644
> --- a/drivers/ufs/host/Kconfig
> +++ b/drivers/ufs/host/Kconfig
> @@ -71,6 +71,7 @@ config SCSI_UFS_QCOM
>   config SCSI_UFS_MEDIATEK
>   	tristate "Mediatek specific hooks to UFS controller platform driver"
>   	depends on SCSI_UFSHCD_PLATFORM && ARCH_MEDIATEK
> +	select PM
>   	select PHY_MTK_UFS
>   	select RESET_TI_SYSCON
>   	help



