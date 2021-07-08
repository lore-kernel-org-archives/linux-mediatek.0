Return-Path: <SRS0=ooiB=MA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D12ABC07E96
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 15:09:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8627D61622
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jul 2021 15:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8627D61622
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aX53qwsI/0NClyr5NFPyEW8viW+c/ic8297GMR8mwu0=; b=ZEqDLQAhqFExQ5
	y0/1EWqwcdVanpFy68dHJyxcYp6DmLn6CxhnFKkr6CIn5MpZss/hju1hvIFdEo9nR+Jl3bpwfigqd
	zWtOhLARiGlgRB/OouNaE/bsNoXT+OkscEi1ZHFaFGQ7HKeJtpYIzDFwRaMlQkcdH3uG/vikZOxIF
	//rFHNGkmYihe7wBnZ/VwWPmusJiErQjT9tqbaxy6IjmNd7KUHnOVfE39dzJaxU+rf15v4OmLdZyj
	ny6wp+M3Q227CFFTbyxby3uoTZqFxpNtWPmkrSvw0J9pyTK6cYsBI6eF2y4/JqAMZ7UyjbDIEF531
	zQDSIMJIR/J04o38m5wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1VeF-00HG9W-Dn; Thu, 08 Jul 2021 15:09:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1Vdz-00HG7Y-L0; Thu, 08 Jul 2021 15:08:56 +0000
X-UUID: a1bffab23b63432d9d1e7de9452a5f68-20210708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:To:From:Subject:Message-ID;
 bh=rmy3vTKrj+13anpiQhZfLEyONls/y6wLF5zWGoxVdF8=; 
 b=hD+qqujji0r8m3P9PDI2pnMaDxCMqpZ2iA7j9kUXLS7Bm41FTMOTTzpROgvrgPodbTxI7zxg2oo1FOLcMcwYXhexU7yj6uPtnpQSDxCXNRy2sadtBPP35cEdUTZFQrUfRZond4eqtm9BT5pLUTEbCse8EbAIynqlYzbCZn3SOTA=;
X-UUID: a1bffab23b63432d9d1e7de9452a5f68-20210708
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <deren.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 19208738; Thu, 08 Jul 2021 08:08:44 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Jul 2021 08:08:43 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Jul 2021 23:08:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 8 Jul 2021 23:08:30 +0800
Message-ID: <1eaab818ef2478b115e1387dcca7427f633cc217.camel@mediatek.com>
Subject: Re: [PATCH] mt76: mt7921: continue to probe driver when fw already
 downloaded
From: Deren Wu <deren.wu@mediatek.com>
To: Aaron Ma <aaron.ma@canonical.com>, <nbd@nbd.name>,
 <lorenzo.bianconi83@gmail.com>, <ryder.lee@mediatek.com>,
 <kvalo@codeaurora.org>, <davem@davemloft.net>, <kuba@kernel.org>,
 <matthias.bgg@gmail.com>, <sean.wang@mediatek.com>,
 <Soul.Huang@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Date: Thu, 8 Jul 2021 23:08:30 +0800
In-Reply-To: <20210708131710.695595-1-aaron.ma@canonical.com>
References: <20210708131710.695595-1-aaron.ma@canonical.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_080854_624760_F981483F 
X-CRM114-Status: GOOD (  17.49  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Aaron,

Thanks for this patch. We verified this is good here.

Could you please add fix tag as well? It's better to backport this
patch.

Fixes: 1c099ab44727c ("mt76: mt7921: add MCU support")


Thanks,
Deren


On Thu, 2021-07-08 at 21:17 +0800, Aaron Ma wrote:
> When reboot system, no power cycles, firmware is already downloaded,
> return -EIO will break driver as error:
> mt7921e: probe of 0000:03:00.0 failed with error -5
> 
> Skip firmware download and continue to probe.
> 
> Signed-off-by: Aaron Ma <aaron.ma@canonical.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> index c2c4dc196802..cd690c64f65b 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -931,7 +931,7 @@ static int mt7921_load_firmware(struct mt7921_dev
> *dev)
>  	ret = mt76_get_field(dev, MT_CONN_ON_MISC,
> MT_TOP_MISC2_FW_N9_RDY);
>  	if (ret) {
>  		dev_dbg(dev->mt76.dev, "Firmware is already
> download\n");
> -		return -EIO;
> +		goto fw_loaded;
>  	}
>  
>  	ret = mt7921_load_patch(dev);
> @@ -949,6 +949,7 @@ static int mt7921_load_firmware(struct mt7921_dev
> *dev)
>  		return -EIO;
>  	}
>  
> +fw_loaded:
>  	mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_FWDL],
> false);
>  
>  #ifdef CONFIG_PM
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
