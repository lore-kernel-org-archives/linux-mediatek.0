Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86047C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QK0KAg4PYaoRl0QvfYSmOBRsyYOzwJhxnD/0Z+Rb7kg=; b=ZwCse70rfRyCcv
	kvEKg6ZTGtBbcWDbSaHzC6gMVTqdTrtgjDmqEH/3z2N/tdxoOUHhOYLKvnzZr+2a99PYQE61YVmrA
	WeLV/+V442K1jf+QkrKkYJYfnZ4lFskXJzvVMIGfIsOhuUUvUNTSgnjbP5VUECyM2yk/iDf6JLxqT
	4D6XcL3eXH0W/emb1A87BN3wPeoWqWps2CRuTfMsYTS0FKXF3YFSAwgApFTS3V5GGIpQNNqVLaGqc
	rhDtCIcmsNtuws6O7qz+o+mmHag7EHEKPThKM3lgxlyVKOy08+iwQo6hequUS8YC+AJ1itk4+hp8I
	jvdomH1NSrmnGGHqc9EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0m3Y-004WWV-Cc; Mon, 13 Jun 2022 15:32:44 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0m3T-004WVP-VQ
	for linux-mediatek@lists.infradead.org; Mon, 13 Jun 2022 15:32:43 +0000
X-UUID: 5d642692204f48c9b25e48f0484563f3-20220613
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:b77ec1c7-141a-44df-b5e5-e4f82a7a75e4,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:f0d06ac6-12ba-4305-bfdf-9aefbdc32516,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 5d642692204f48c9b25e48f0484563f3-20220613
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1574216788; Mon, 13 Jun 2022 08:32:27 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Jun 2022 08:32:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 13 Jun 2022 23:32:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 13 Jun 2022 23:32:24 +0800
Message-ID: <77d3ba88b76dcdb973fb078263513c595e911c14.camel@mediatek.com>
Subject: Re: [PATCH] mt76: mt7921s: fix possible sdio deadlock in command
 fail
From: Deren Wu <deren.wu@mediatek.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, "Soul
 Huang" <Soul.Huang@mediatek.com>, YN Chen <YN.Chen@mediatek.com>, Leon Yen
	<Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Eric Liang
	<Eric.Liang@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>, "Shayne
 Chen" <shayne.chen@mediatek.com>, linux-wireless
	<linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>
Date: Mon, 13 Jun 2022 23:32:24 +0800
In-Reply-To: <YqcrzCbeJUg3s18b@lore-desk>
References: <7122534ce50527e099a23fa198683a0e20c6db38.1654998031.git.deren.wu@mediatek.com>
	 <YqcrzCbeJUg3s18b@lore-desk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_083240_063899_6C703B49 
X-CRM114-Status: GOOD (  20.96  )
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

On Mon, 2022-06-13 at 14:21 +0200, Lorenzo Bianconi wrote:
> > From: Deren Wu <deren.wu@mediatek.com>
> > 
> > Move sdio_release_host() to final resource handing
> > 
> > Fixes: b12deb5e86fa ("mt76: mt7921s: fix
> > mt7921s_mcu_[fw|drv]_pmctrl")
> > Reported-by: YN Chen <YN.Chen@mediatek.com>
> > Signed-off-by: Deren Wu <deren.wu@mediatek.com>
> > ---
> >  drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
> > b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
> > index 54a5c712a3c3..1856d677fff4 100644
> > --- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
> > @@ -156,9 +156,9 @@ int mt7921s_mcu_fw_pmctrl(struct mt7921_dev
> > *dev)
> >  
> >  	err = readx_poll_timeout(mt76s_read_pcr, &dev->mt76, status,
> >  				 !(status & WHLPCR_IS_DRIVER_OWN),
> > 2000, 1000000);
> > +err:
> >  	sdio_release_host(func);
> >  
> > -err:
> >  	if (err < 0) {
> >  		dev_err(dev->mt76.dev, "firmware own failed\n");
> >  		clear_bit(MT76_STATE_PM, &mphy->state);
> > -- 
> > 2.18.0
> > 
> 
> Hi Deren,
> 
> in order to align the code with mt7921e, can you please fold the
> following
> changes into this patch?
> 
> Regards,
> Lorenzo
> 

Hi Lore,

Sure, I will post v2 with your patch.


Thanks,
Deren

> --- a/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/sdio_mcu.c
> @@ -135,8 +135,8 @@ int mt7921s_mcu_fw_pmctrl(struct mt7921_dev *dev)
>  	struct sdio_func *func = dev->mt76.sdio.func;
>  	struct mt76_phy *mphy = &dev->mt76.phy;
>  	struct mt76_connac_pm *pm = &dev->pm;
> -	int err = 0;
>  	u32 status;
> +	int err;
>  
>  	sdio_claim_host(func);
>  
> @@ -147,7 +147,7 @@ int mt7921s_mcu_fw_pmctrl(struct mt7921_dev *dev)
>  					 2000, 1000000);
>  		if (err < 0) {
>  			dev_err(dev->mt76.dev, "mailbox ACK not
> cleared\n");
> -			goto err;
> +			goto out;
>  		}
>  	}
>  
> @@ -155,18 +155,18 @@ int mt7921s_mcu_fw_pmctrl(struct mt7921_dev
> *dev)
>  
>  	err = readx_poll_timeout(mt76s_read_pcr, &dev->mt76, status,
>  				 !(status & WHLPCR_IS_DRIVER_OWN),
> 2000, 1000000);
> -err:
> +out:
>  	sdio_release_host(func);
>  
>  	if (err < 0) {
>  		dev_err(dev->mt76.dev, "firmware own failed\n");
>  		clear_bit(MT76_STATE_PM, &mphy->state);
> -		err = -EIO;
> +		return -EIO;
>  	}
>  
>  	pm->stats.last_doze_event = jiffies;
>  	pm->stats.awake_time += pm->stats.last_doze_event -
>  				pm->stats.last_wake_event;
>  
> -	return err;
> +	return 0;
>  }
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
