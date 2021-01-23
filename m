Return-Path: <SRS0=NTS1=G2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93920C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 23:48:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DEB322B2D
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 23:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DEB322B2D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tInvtqjcO7li0pOaVpL64eO4tbRF1tgZ3B1mLcholq8=; b=jBzx8DNrwQZlLDxsVE4DgdUnr
	3coU0XIb/m8sFSrRUopNxbIg3ODStEcvM75oW/jSiv4cYjk8bFF+WXo8mzxem03eLoYdTenG+zZP7
	vQ0HEckS/j4BvDn0HvWFDLyMY1eX+CsB2H2NHuz7b5FvW88RPwEO2M6PTWl/k2IjzQ4Q//1hr+b74
	qPQ1kZN1agXO/1leQmegDjkTUfcd76NfMalmu3y2FKzOeR2WHiOMvLGT8FEsQyiWCpfQfIg4n32O2
	uWmrXd8JJMlNzMbBYBM2ZdBdfW1Y0KSkGcf7fiEu8pjqkOVjJSKiqUkTcRslxVJMAiNjGrWGlZDVe
	YSaNX7xag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3Sdu-0001Zb-EC; Sat, 23 Jan 2021 23:48:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3Sdr-0001ZC-2C
 for linux-mediatek@lists.infradead.org; Sat, 23 Jan 2021 23:48:32 +0000
X-UUID: 373a8545eb364a5b93190ef53230c715-20210123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sipCTNiyfLcu08xZ57wmAIKixRkKdm7AYW5KCq64fzg=; 
 b=UuViojXI7BS1c9tQYeeDeRnFOKF58qVbJYWKkQ60L2+0Y0QLyeVs/WB2MLV3ncMaCHH8GKz2oTH4n1ujzKnBqKTqMLzHJQBHjtqzwMoxiCtywBcXjfQpsNENEfEehbZC8KVMiGysjcg2iaeE1OariWbMrk8kY/E5PorcN69Yjdw=;
X-UUID: 373a8545eb364a5b93190ef53230c715-20210123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1403500470; Sat, 23 Jan 2021 15:48:23 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 15:48:21 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 24 Jan 2021 07:48:07 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 24 Jan 2021 07:48:01 +0800
Message-ID: <1611445681.17541.2.camel@mtkswgap22>
Subject: Re: [PATCH -next v7 08/22] mt76: mt7921: add module support
From: Ryder Lee <ryder.lee@mediatek.com>
To: <sean.wang@mediatek.com>
Date: Sun, 24 Jan 2021 07:48:01 +0800
In-Reply-To: <feac135d366a16bd554eeccd18ecdc5f6ab619e2.1611389300.git.objelf@gmail.com>
References: <cover.1611389300.git.objelf@gmail.com>
 <feac135d366a16bd554eeccd18ecdc5f6ab619e2.1611389300.git.objelf@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_184831_885163_254E61C5 
X-CRM114-Status: GOOD (  18.36  )
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
Cc: robin.chiu@mediatek.com, ch.yeh@mediatek.com, Eric.Liang@mediatek.com,
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 Lorenzo Bianconi <lorenzo@kernel.org>, Soul.Huang@mediatek.com, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2021-01-23 at 16:34 +0800, sean.wang@mediatek.com wrote:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Add mt7921 as the pci driver module.
> 
> The purpose of the patch is to check about if the following patches are
> able to compile properly.
> 
> Co-developed-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> Co-developed-by: Soul Huang <Soul.Huang@mediatek.com>
> Signed-off-by: Soul Huang <Soul.Huang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  drivers/net/wireless/mediatek/mt76/Kconfig         |  1 +
>  drivers/net/wireless/mediatek/mt76/Makefile        |  1 +
>  drivers/net/wireless/mediatek/mt76/mt7921/Kconfig  | 10 ++++++++++
>  drivers/net/wireless/mediatek/mt76/mt7921/Makefile |  5 +++++
>  4 files changed, 17 insertions(+)
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/Kconfig
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/Makefile
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/Kconfig b/drivers/net/wireless/mediatek/mt76/Kconfig
> index 74f99f08d0b5..9ff43f1fc50d 100644
> --- a/drivers/net/wireless/mediatek/mt76/Kconfig
> +++ b/drivers/net/wireless/mediatek/mt76/Kconfig
> @@ -33,3 +33,4 @@ source "drivers/net/wireless/mediatek/mt76/mt76x2/Kconfig"
>  source "drivers/net/wireless/mediatek/mt76/mt7603/Kconfig"
>  source "drivers/net/wireless/mediatek/mt76/mt7615/Kconfig"
>  source "drivers/net/wireless/mediatek/mt76/mt7915/Kconfig"
> +source "drivers/net/wireless/mediatek/mt76/mt7921/Kconfig"
> diff --git a/drivers/net/wireless/mediatek/mt76/Makefile b/drivers/net/wireless/mediatek/mt76/Makefile
> index eac419c64788..94efe3c29053 100644
> --- a/drivers/net/wireless/mediatek/mt76/Makefile
> +++ b/drivers/net/wireless/mediatek/mt76/Makefile
> @@ -34,3 +34,4 @@ obj-$(CONFIG_MT76x2_COMMON) += mt76x2/
>  obj-$(CONFIG_MT7603E) += mt7603/
>  obj-$(CONFIG_MT7615_COMMON) += mt7615/
>  obj-$(CONFIG_MT7915E) += mt7915/
> +obj-$(CONFIG_MT7921E) += mt7921/
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7921/Kconfig
> new file mode 100644
> index 000000000000..24932d2e8dee
> --- /dev/null
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/Kconfig
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: ISC
> +config MT7921E
> +	tristate "MediaTek MT7921E (PCIe) support"
> +	select MT76_CORE
> +	depends on MAC80211
> +	depends on PCI
> +	help
> +	  This adds support for MT7921E 802.11ax 2x2:2SS wireless devices.
> +
> +	  To compile this driver as a module, choose M here.
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
> new file mode 100644
> index 000000000000..09d1446ad933
> --- /dev/null
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
> @@ -0,0 +1,5 @@
> +#SPDX-License-Identifier: ISC
> +
> +obj-$(CONFIG_MT7921E) += mt7921e.o
> +
> +mt7921e-y := pci.o mac.o mcu.o dma.o eeprom.o main.o init.o debugfs.o

I think it's more reasonable to move this into 'mt76: mt7921: introduce
mt7921e support' to make it complete.

Ryder
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
