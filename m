Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB720C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 08:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14G5Hh/lb2LAueRt6edYjxg5r2MoxI8az3PgUj0f39U=; b=bHfjl91pKFlMjkoBsIlhMBBoAb
	OuQmKHuamK1Inp+CdmobKkLCkbCo8egogrFvrEUDNRMu5k811WQwwZLO2AcdWPU21vzhY6XkP5LsQ
	4T0eO+QFDd1pKHAhuo5SBFvTsJ30wpgDAcugN0EzCVTs0mnfZLpbgpIJS1U0xTLF6P4opkT475xZy
	SURo5wa+OkbfVHcFnVC5jDorsHVtIr9hgwKLvE65a76qc+PCQFA+Kbqq3nic2qaFP/Uq0iXzEwUvM
	XgZ6ycsLAjEp/4zKDKFtcGURfYpVvn4xTH7Ib7+GPUh8gpf9OlmHIrTfAhh8qHUgrf1HPCMNML3US
	mDrzAyWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26P4-00Fv9o-PI; Mon, 05 Dec 2022 08:00:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p26Oi-00Fv1d-6j; Mon, 05 Dec 2022 08:00:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 984D5B80D88;
	Mon,  5 Dec 2022 08:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AA3C433C1;
	Mon,  5 Dec 2022 08:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670227217;
	bh=5oxLWtvApX59L70YDd6ciffZVT6C/AZpgIfnuD5KE4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DXCyY0qNKB3+hUfMSdXLw83ismiriqZvAQptyNL6xGj65Z8I5DU23WkNWbNyNtKIG
	 9q5FWYP22imRbO9o3onPlIOp1/WMvp3k1l+zuHtDV6UlU6cr7VMXNRS4B+vrrsVXGp
	 m3I8HTz71557ZESZH5toRxTQGDZkxXfldkRfufoLHWCNav8JdQu+xJvqgqfC1gwnmW
	 bO8IRsCR+oU75IHQ5lgmuo0h8GbgPa8nCCno5Nd4uZ7PfLvJWzeYb3E/dlseOpjQAB
	 nXYUkyXRYmfEL1UVs9gbfAtIoKcDNQ5SW3jEhOjeeSPAdH7e7e5Y3SoHf4GX7VgMYm
	 aFKAwqJDUJx8Q==
Date: Mon, 5 Dec 2022 10:00:12 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Yuan Can <yuancan@huawei.com>
Cc: nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	matthias.bgg@gmail.com, sujuan.chen@mediatek.com,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2] net: ethernet: mtk_wed: Fix missing
 of_node_put() in mtk_wed_wo_hardware_init()
Message-ID: <Y42lDNzhBeYcevRL@unreal>
References: <20221205034339.112163-1-yuancan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205034339.112163-1-yuancan@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_000021_001196_AC40D0AC 
X-CRM114-Status: GOOD (  12.23  )
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

On Mon, Dec 05, 2022 at 03:43:39AM +0000, Yuan Can wrote:
> The np needs to be released through of_node_put() in the error handling
> path of mtk_wed_wo_hardware_init().
> 
> Fixes: 799684448e3e ("net: ethernet: mtk_wed: introduce wed wo support")
> Signed-off-by: Yuan Can <yuancan@huawei.com>
> ---
> Changes in v2:
> - Replace IS_ERR_OR_NULL() with IS_ERR() to check wo->mmio.regs.
> - Add net-next tag.
> 
>  drivers/net/ethernet/mediatek/mtk_wed_wo.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>

