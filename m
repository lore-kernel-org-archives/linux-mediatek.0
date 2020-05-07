Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC69C38A24
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 09:46:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C28F9207DD
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 09:46:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EYSnQG6L";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bmEMJmFp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C28F9207DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JShlIGLqjWr30RY+w6zUK5lLFqUaIav+aeZyDtEmfCw=; b=EYSnQG6LJBeSyH
	bqZoNRA1GlbQOaeyHYVu9nSolPBN1n2fGAdcQs4ofVKbWZLo0YjZMHm8TAqe7eJ4ew7NfQ03kXXv7
	8++a+TO1m8OtqCsNJNaFJB3Cqzf72kTBvGvWiXQquLXYy5jw2dcXezaAY23KPM80JP/18entxBINU
	40b9L/uUn6+gj+CBFCOfO69AuFwoFUb2irS1pQ4ukjcqyBPzb6Pp8DYtCdCNLrhI0kSJeQPFv461C
	mKngDR4QzINacYDlHWSSBYNFWImHZIVTe8FblWCw9JPgkLXzVXx8ysE9ZFvXj9xQGJrRkxn54QWBO
	P+4pv4S4kFFdOU/jJCgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWd77-0005JJ-Bg; Thu, 07 May 2020 09:46:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWd6y-00057T-GL; Thu, 07 May 2020 09:46:38 +0000
X-UUID: f8e9161d124f4067a4c28ed893f921af-20200507
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=e6D3t8ns2OxS2Hrj/apZ7zCNfjedd09SDWEHt2azXbE=; 
 b=bmEMJmFpr2muEY2l2mGadZ/sE7Pxvzv/EmmmR3SVaiycjXy6OZepWSXA2WM4q4VJmiwR34+6zLyfPLqCBG4foKLcrRX9Ma06s8B9FlZSbMu9VwUIiOQzoyNVhP+BvJ4zG1334uCJjLnzaO/Hd/LR0Lc43t5IktjTYqPauQA1Z10=;
X-UUID: f8e9161d124f4067a4c28ed893f921af-20200507
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <mark-mc.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2016373190; Thu, 07 May 2020 01:46:29 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 May 2020 02:46:25 -0700
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 7 May 2020 17:46:10 +0800
Message-ID: <1588844771.5921.27.camel@mtksdccf07>
Subject: Re: [PATCH 06/11] net: ethernet: mtk-eth-mac: new driver
From: Mark-MC.Lee <Mark-MC.Lee@mediatek.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 7 May 2020 17:46:11 +0800
In-Reply-To: <20200505140231.16600-7-brgl@bgdev.pl>
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-7-brgl@bgdev.pl>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_024636_551975_104CCA13 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: devicetree@vger.kernel.org, Felix
 Fietkau <nbd@openwrt.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bartosz:
 I think the naming of this driver and its Kconfig option is too generic
that will confuse with current mediatek SoCs eth driver architecture(for
all mt7xxx SoCs). 
  Since mtk_eth_mac.c is not a common MAC part for all mediatek SoC but
only a specific eth driver for mt85xx, it will be more reasonable to
name it as mt85xx_eth.c and change NET_MEDIATEK_MAC to
NET_MEDIATEK_MT85XX. How do you think?


On Tue, 2020-05-05 at 16:02 +0200, Bartosz Golaszewski wrote:
> 
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> 
> This adds the driver for the MediaTek Ethernet MAC used on the MT8*
> SoC
> family. For now we only support full-duplex.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  drivers/net/ethernet/mediatek/Kconfig       |    6 +
>  drivers/net/ethernet/mediatek/Makefile      |    1 +
>  drivers/net/ethernet/mediatek/mtk_eth_mac.c | 1476
> +++++++++++++++++++
>  3 files changed, 1483 insertions(+)
>  create mode 100644 drivers/net/ethernet/mediatek/mtk_eth_mac.c
> 
> diff --git a/drivers/net/ethernet/mediatek/Kconfig
> b/drivers/net/ethernet/mediatek/Kconfig
> index 5079b8090f16..5c3793076765 100644
> --- a/drivers/net/ethernet/mediatek/Kconfig
> +++ b/drivers/net/ethernet/mediatek/Kconfig
> @@ -14,4 +14,10 @@ config NET_MEDIATEK_SOC
>           This driver supports the gigabit ethernet MACs in the
>           MediaTek SoC family.
>  
> +config NET_MEDIATEK_MAC
How about rename to NET_MEDIATEK_MT85XX ?

> +       tristate "MediaTek Ethernet MAC support"
> +       select PHYLIB
> +       help
> +         This driver supports the ethernet IP on MediaTek MT85**
> SoCs.
> +
>  endif #NET_VENDOR_MEDIATEK
> diff --git a/drivers/net/ethernet/mediatek/Makefile
> b/drivers/net/ethernet/mediatek/Makefile
> index 3362fb7ef859..f7f5638943a0 100644
> --- a/drivers/net/ethernet/mediatek/Makefile
> +++ b/drivers/net/ethernet/mediatek/Makefile
> @@ -5,3 +5,4 @@
>  
>  obj-$(CONFIG_NET_MEDIATEK_SOC) += mtk_eth.o
>  mtk_eth-y := mtk_eth_soc.o mtk_sgmii.o mtk_eth_path.o
> +obj-$(CONFIG_NET_MEDIATEK_MAC) += mtk_eth_mac.o 
How about rename to mt85xx_eth.c?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
