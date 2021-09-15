Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E214EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:09:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BE8961214
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 13:09:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9BE8961214
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/qVb/aXkMudnkusMCzqkjnSViskbiB0NRxXc4FAJ3c=; b=edPU8OQiVa8xuWVbBFUoMGAIy/
	+UYyPtmPvtJk/ptZg94Dg4rjxiJxGDhFGsE+RMOQaQ5du6HLo3r0z6OyXL1Ps3/XxLBOXkLm2feyl
	rebXzzjjxXxX5xxy70o92QpkKh1oPX0Ch8LB3rqNm10JaiRZfDT8KYueh/1egy6aoNO/OuznAnFe/
	lfLVPXNSxLivYY2AvqqojktPuAvx5YJBWuZrpPorBSZYVpGYUTME918tsKxJyGYb+83ApphUwLbt0
	XCR2NH2w/sKlpC4mGeUJiJgCc1P/RvsEQtWliPzVc6Cl4fGEeyN6m83Hk2nRANj9P4hTWXSfYrim3
	bDY/hLhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQUen-0097nc-Am; Wed, 15 Sep 2021 13:08:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQUek-0097mi-3G
 for linux-mediatek@lists.infradead.org; Wed, 15 Sep 2021 13:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631711333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L1L5T+LvRx5zbYAOR82xGm8GfoYe3XvGclsm5+ANUQo=;
 b=ZskIG4Zlgo57G2XiJiazs6rH7KiCE46CNx5OMoaVVEfLuKeChyhBTIfkVeXmxIYobsboMF
 o4txH/aNfUL+T1AnzZPXYz8igscBw/Z1ubA2ONOLOLuDNH1Trk8IpVxjPbZ7EHVHwwirKe
 R5MCLCa5h/Zf3SAMtY1tP9f/+itTJhs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-320-QU_qY6VkOLmucEglkIyQyw-1; Wed, 15 Sep 2021 09:08:49 -0400
X-MC-Unique: QU_qY6VkOLmucEglkIyQyw-1
Received: by mail-ed1-f69.google.com with SMTP id
 m30-20020a50999e000000b003cdd7680c8cso1584327edb.11
 for <linux-mediatek@lists.infradead.org>; Wed, 15 Sep 2021 06:08:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2phkAjAphKXRM2tPIC1Lk+BS1z90dxAXmo20X8nEyKg=;
 b=VDZHBEiPznNBtwgMt3RpKn0Nx2TyWNJbcA2ODcPA4x89GWoXEoN54bcdTP/aXclMhl
 hRfuq9d69yPMPctTpo5JkVpcCHOzfQ5iumgRjON/GWe0AwZFodMdrDMQEF3ogCk2II8k
 rjwGouJggr6X52n56ye/sWw791LclsrQCuC8UjORucUJFpXQ4q3D6vOSSxnt/wHOOq85
 PQg6IUP7mDfvm5NMoq77ZVCuQPkbqawuDkUvgxjTA3aUNXJjVhjOd7wVzt8Jj5MTiYRI
 faOsvOcrkGuk66peQjdhZByq+se49O/7GCGgRg2v0/cajKw2WR8rHHmHNy8hF3FIgs8O
 h9Nw==
X-Gm-Message-State: AOAM532q/Fs94RDfo//eUqedtrGYTBeJUjrIWF7HBBrJLcdmAuCq0nxj
 8vjbldinzQQny5CVBcMzeSReDlDTnbsMteAgyY87Loml1sMy4tXf0dF9kTpcI97fUrAQPIN2qJs
 DTYktU7Ma+cNqayGhlsoNtvKOEzhRCCTa
X-Received: by 2002:a17:907:76e7:: with SMTP id
 kg7mr23752462ejc.344.1631711328377; 
 Wed, 15 Sep 2021 06:08:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnQp+yx8+9YSszs5tKnBh7VsmYwdaWKOZe8vCfj4yK3ENQePIx3w6l9MEDOp5rFCSo+xMn+Q==
X-Received: by 2002:a17:907:76e7:: with SMTP id
 kg7mr23752423ejc.344.1631711328047; 
 Wed, 15 Sep 2021 06:08:48 -0700 (PDT)
Received: from localhost (net-130-25-199-50.cust.vodafonedsl.it.
 [130.25.199.50])
 by smtp.gmail.com with ESMTPSA id dg18sm4261482edb.44.2021.09.15.06.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Sep 2021 06:08:47 -0700 (PDT)
Date: Wed, 15 Sep 2021 15:08:44 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
To: sean.wang@mediatek.com
Cc: nbd@nbd.name, Soul.Huang@mediatek.com, YN.Chen@mediatek.com,
 Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, steve.lee@mediatek.com,
 jemele@google.com, shawnku@google.com,
 linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v1 03/16] mt76: mt7921: refactor mcu.c to be bus
 independent
Message-ID: <YUHwXG5H7EofWhRw@lore-desk>
References: <cover.1631667941.git.objelf@gmail.com>
 <37519dafa02723a1fff0ccaea73c8b4f860cad7b.1631667941.git.objelf@gmail.com>
MIME-Version: 1.0
In-Reply-To: <37519dafa02723a1fff0ccaea73c8b4f860cad7b.1631667941.git.objelf@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lorenzo.bianconi@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_060854_352948_4D3DAA02 
X-CRM114-Status: GOOD (  18.73  )
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
Content-Type: multipart/mixed; boundary="===============0819389490305446966=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

--===============0819389490305446966==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YA0wuwk9ukjqL77s"
Content-Disposition: inline

--YA0wuwk9ukjqL77s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> From: Sean Wang <sean.wang@mediatek.com>
>=20
> This is a preliminary patch to introduce mt7921s support.
>=20
> Make mcu.c reusable between mt7921s and mt7921e
>=20
> Tested-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>  .../wireless/mediatek/mt76/mt7921/Makefile    |  3 +-
>  .../net/wireless/mediatek/mt76/mt7921/init.c  |  1 +
>  .../net/wireless/mediatek/mt76/mt7921/mac.c   |  5 +-
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 90 ++---------------
>  .../wireless/mediatek/mt76/mt7921/mt7921.h    | 18 +++-
>  .../net/wireless/mediatek/mt76/mt7921/pci.c   |  3 +
>  .../wireless/mediatek/mt76/mt7921/pci_mac.c   |  2 +
>  .../wireless/mediatek/mt76/mt7921/pci_mcu.c   | 97 +++++++++++++++++++
>  .../wireless/mediatek/mt76/mt7921/testmode.c  |  2 +-
>  9 files changed, 129 insertions(+), 92 deletions(-)
>  create mode 100644 drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile b/drivers=
/net/wireless/mediatek/mt76/mt7921/Makefile
> index 554202358470..4cb0b000cfe1 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/Makefile
> @@ -4,5 +4,6 @@ obj-$(CONFIG_MT7921E) +=3D mt7921e.o
> =20
>  CFLAGS_trace.o :=3D -I$(src)
> =20
> -mt7921e-y :=3D pci.o pci_mac.o mac.o mcu.o dma.o eeprom.o main.o init.o =
debugfs.o trace.o
> +mt7921e-y :=3D pci.o pci_mac.o pci_mcu.o mac.o mcu.o dma.o eeprom.o main=
.o \
> +=09     init.o debugfs.o trace.o
>  mt7921e-$(CONFIG_NL80211_TESTMODE) +=3D testmode.o
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/init.c
> index 97b931ea07c1..7c7a26102e11 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> @@ -304,6 +304,7 @@ void mt7921_unregister_device(struct mt7921_dev *dev)
>  =09mt7921_tx_token_put(dev);
>  =09mt7921_mcu_drv_pmctrl(dev);
>  =09mt7921_dma_cleanup(dev);
> +=09mt7921_wfsys_reset(dev);
>  =09mt7921_mcu_exit(dev);
>  =09mt7921_mcu_fw_pmctrl(dev);
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mac.c
> index 580a88b7841e..c26d986e08e6 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
> @@ -1282,12 +1282,9 @@ void mt7921_mac_reset_work(struct work_struct *wor=
k)
>  =09cancel_work_sync(&pm->wake_work);
> =20
>  =09mutex_lock(&dev->mt76.mutex);
> -=09for (i =3D 0; i < 10; i++) {
> -=09=09__mt7921_mcu_drv_pmctrl(dev);
> -
> +=09for (i =3D 0; i < 10; i++)
>  =09=09if (!mt7921_dev_reset(dev))
>  =09=09=09break;
> -=09}
>  =09mutex_unlock(&dev->mt76.mutex);
> =20
>  =09if (i =3D=3D 10)
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index 6ba431347b3b..0648443eb283 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -160,7 +160,7 @@ mt7921_mcu_parse_eeprom(struct mt76_dev *dev, struct =
sk_buff *skb)
>  =09return 0;
>  }
> =20
> -static int
> +int

no new-line here

>  mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
>  =09=09=09  struct sk_buff *skb, int seq)
>  {
> @@ -224,7 +224,7 @@ mt7921_mcu_parse_response(struct mt76_dev *mdev, int =
cmd,
>  =09return ret;
>  }
> =20
> -static int
> +int

no new-line here

>  mt7921_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
>  =09=09=09int cmd, int *wait_seq)
>  {
> @@ -590,7 +590,7 @@ int mt7921_mcu_uni_rx_ba(struct mt7921_dev *dev,
>  =09=09=09=09      enable, false);
>  }
> =20
> -static int mt7921_mcu_restart(struct mt76_dev *dev)
> +int mt7921_mcu_restart(struct mt76_dev *dev)
>  {
>  =09struct {
>  =09=09u8 power_mode;
> @@ -603,20 +603,6 @@ static int mt7921_mcu_restart(struct mt76_dev *dev)
>  =09=09=09=09 sizeof(req), false);
>  }
> =20
> -static int mt7921_driver_own(struct mt7921_dev *dev)
> -{
> -=09u32 reg =3D mt7921_reg_map_l1(dev, MT_TOP_LPCR_HOST_BAND0);
> -
> -=09mt76_wr(dev, reg, MT_TOP_LPCR_HOST_DRV_OWN);
> -=09if (!mt76_poll_msec(dev, reg, MT_TOP_LPCR_HOST_FW_OWN,
> -=09=09=09    0, 500)) {
> -=09=09dev_err(dev->mt76.dev, "Timeout for driver own\n");
> -=09=09return -EIO;
> -=09}
> -
> -=09return 0;
> -}
> -
>  static u32 mt7921_get_data_mode(struct mt7921_dev *dev, u32 info)
>  {
>  =09u32 mode =3D DL_MODE_NEED_RSP;
> @@ -883,7 +869,6 @@ static int mt7921_load_firmware(struct mt7921_dev *de=
v)
>  =09}
> =20
>  fw_loaded:
> -=09mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_FWDL], false);
> =20
>  #ifdef CONFIG_PM
>  =09dev->mt76.hw->wiphy->wowlan =3D &mt76_connac_wowlan_support;
> @@ -911,10 +896,6 @@ int mt7921_run_firmware(struct mt7921_dev *dev)
>  {
>  =09int err;
> =20
> -=09err =3D mt7921_driver_own(dev);
> -=09if (err)
> -=09=09return err;
> -
>  =09err =3D mt7921_load_firmware(dev);
>  =09if (err)
>  =09=09return err;
> @@ -925,23 +906,8 @@ int mt7921_run_firmware(struct mt7921_dev *dev)
>  =09return mt76_connac_mcu_get_nic_capability(&dev->mphy);
>  }
> =20
> -int mt7921_mcu_init(struct mt7921_dev *dev)
> -{
> -=09static const struct mt76_mcu_ops mt7921_mcu_ops =3D {
> -=09=09.headroom =3D sizeof(struct mt7921_mcu_txd),
> -=09=09.mcu_skb_send_msg =3D mt7921_mcu_send_message,
> -=09=09.mcu_parse_response =3D mt7921_mcu_parse_response,
> -=09=09.mcu_restart =3D mt7921_mcu_restart,
> -=09};
> -
> -=09dev->mt76.mcu_ops =3D &mt7921_mcu_ops;
> -
> -=09return mt7921_run_firmware(dev);
> -}
> -
>  void mt7921_mcu_exit(struct mt7921_dev *dev)
>  {
> -=09mt7921_wfsys_reset(dev);
>  =09skb_queue_purge(&dev->mt76.mcu.res_q);
>  }
> =20
> @@ -1231,35 +1197,6 @@ int mt7921_mcu_sta_update(struct mt7921_dev *dev, =
struct ieee80211_sta *sta,
>  =09return mt76_connac_mcu_sta_cmd(&dev->mphy, &info);
>  }
> =20
> -int __mt7921_mcu_drv_pmctrl(struct mt7921_dev *dev)
> -{
> -=09struct mt76_phy *mphy =3D &dev->mt76.phy;
> -=09struct mt76_connac_pm *pm =3D &dev->pm;
> -=09int i, err =3D 0;
> -
> -=09for (i =3D 0; i < MT7921_DRV_OWN_RETRY_COUNT; i++) {
> -=09=09mt76_wr(dev, MT_CONN_ON_LPCTL, PCIE_LPCR_HOST_CLR_OWN);
> -=09=09if (mt76_poll_msec(dev, MT_CONN_ON_LPCTL,
> -=09=09=09=09   PCIE_LPCR_HOST_OWN_SYNC, 0, 50))
> -=09=09=09break;
> -=09}
> -
> -=09if (i =3D=3D MT7921_DRV_OWN_RETRY_COUNT) {
> -=09=09dev_err(dev->mt76.dev, "driver own failed\n");
> -=09=09err =3D -EIO;
> -=09=09goto out;
> -=09}
> -
> -=09mt7921_wpdma_reinit_cond(dev);
> -=09clear_bit(MT76_STATE_PM, &mphy->state);
> -
> -=09pm->stats.last_wake_event =3D jiffies;
> -=09pm->stats.doze_time +=3D pm->stats.last_wake_event -
> -=09=09=09       pm->stats.last_doze_event;
> -out:
> -=09return err;
> -}
> -
>  int mt7921_mcu_drv_pmctrl(struct mt7921_dev *dev)
>  {
>  =09struct mt76_phy *mphy =3D &dev->mt76.phy;
> @@ -1271,7 +1208,7 @@ int mt7921_mcu_drv_pmctrl(struct mt7921_dev *dev)
>  =09if (!test_bit(MT76_STATE_PM, &mphy->state))
>  =09=09goto out;
> =20
> -=09err =3D __mt7921_mcu_drv_pmctrl(dev);
> +=09err =3D mt7921_drv_own(dev);
>  out:
>  =09mutex_unlock(&pm->mutex);
> =20
> @@ -1285,29 +1222,14 @@ int mt7921_mcu_fw_pmctrl(struct mt7921_dev *dev)
>  {
>  =09struct mt76_phy *mphy =3D &dev->mt76.phy;
>  =09struct mt76_connac_pm *pm =3D &dev->pm;
> -=09int i, err =3D 0;
> +=09int err =3D 0;
> =20
>  =09mutex_lock(&pm->mutex);
> =20
>  =09if (mt76_connac_skip_fw_pmctrl(mphy, pm))
>  =09=09goto out;
> =20
> -=09for (i =3D 0; i < MT7921_DRV_OWN_RETRY_COUNT; i++) {
> -=09=09mt76_wr(dev, MT_CONN_ON_LPCTL, PCIE_LPCR_HOST_SET_OWN);
> -=09=09if (mt76_poll_msec(dev, MT_CONN_ON_LPCTL,
> -=09=09=09=09   PCIE_LPCR_HOST_OWN_SYNC, 4, 50))
> -=09=09=09break;
> -=09}
> -
> -=09if (i =3D=3D MT7921_DRV_OWN_RETRY_COUNT) {
> -=09=09dev_err(dev->mt76.dev, "firmware own failed\n");
> -=09=09clear_bit(MT76_STATE_PM, &mphy->state);
> -=09=09err =3D -EIO;
> -=09}
> -
> -=09pm->stats.last_doze_event =3D jiffies;
> -=09pm->stats.awake_time +=3D pm->stats.last_doze_event -
> -=09=09=09=09pm->stats.last_wake_event;
> +=09err =3D mt7921_fw_own(dev);
>  out:
>  =09mutex_unlock(&pm->mutex);
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h b/drivers=
/net/wireless/mediatek/mt76/mt7921/mt7921.h
> index 4c1c7c4eafac..dbace154bfa5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mt7921.h
> @@ -134,8 +134,14 @@ struct mt7921_phy {
>  };
> =20
>  #define mt7921_dev_reset(dev)=09((dev)->hif_ops->reset(dev))
> +#define mt7921_mcu_init(dev)=09((dev)->hif_ops->mcu_init(dev))
> +#define mt7921_drv_own(dev)=09((dev)->hif_ops->drv_own(dev))
> +#define mt7921_fw_own(dev)=09((dev)->hif_ops->fw_own(dev))

mt7921_drv_own and mt7921_fw_own seems a bit misleading, why not something
like:

mt7921_mcu_drv_pmctrl and mt7921_mcu_fw_pmctrl

are they already used?

>  struct mt7921_hif_ops {
>  =09int (*reset)(struct mt7921_dev *dev);
> +=09int (*mcu_init)(struct mt7921_dev *dev);
> +=09int (*drv_own)(struct mt7921_dev *dev);
> +=09int (*fw_own)(struct mt7921_dev *dev);
>  };
> =20
>  struct mt7921_dev {
> @@ -250,7 +256,6 @@ int mt7921_wpdma_reset(struct mt7921_dev *dev, bool f=
orce);
>  int mt7921_wpdma_reinit_cond(struct mt7921_dev *dev);
>  void mt7921_dma_cleanup(struct mt7921_dev *dev);
>  int mt7921_run_firmware(struct mt7921_dev *dev);
> -int mt7921_mcu_init(struct mt7921_dev *dev);
>  int mt7921_mcu_add_key(struct mt7921_dev *dev, struct ieee80211_vif *vif=
,
>  =09=09       struct mt7921_sta *msta, struct ieee80211_key_conf *key,
>  =09=09       enum set_key_cmd cmd);
> @@ -359,7 +364,6 @@ int mt7921_mcu_uni_rx_ba(struct mt7921_dev *dev,
>  =09=09=09 bool enable);
>  void mt7921_scan_work(struct work_struct *work);
>  int mt7921_mcu_uni_bss_ps(struct mt7921_dev *dev, struct ieee80211_vif *=
vif);
> -int __mt7921_mcu_drv_pmctrl(struct mt7921_dev *dev);
>  int mt7921_mcu_drv_pmctrl(struct mt7921_dev *dev);
>  int mt7921_mcu_fw_pmctrl(struct mt7921_dev *dev);
>  void mt7921_pm_wake_work(struct work_struct *work);
> @@ -378,7 +382,17 @@ void mt7921_mac_write_txwi(struct mt7921_dev *dev, _=
_le32 *txwi,
>  =09=09=09   bool beacon);
>  void mt7921_tx_check_aggr(struct ieee80211_sta *sta, __le32 *txwi);
>  void mt7921_mac_sta_poll(struct mt7921_dev *dev);
> +int mt7921_mcu_send_message(struct mt76_dev *mdev, struct sk_buff *skb,
> +=09=09=09    int cmd, int *wait_seq);
> +int mt7921_mcu_parse_response(struct mt76_dev *mdev, int cmd,
> +=09=09=09      struct sk_buff *skb, int seq);
> +int mt7921_mcu_restart(struct mt76_dev *dev);
> +
>  void mt7921e_queue_rx_skb(struct mt76_dev *mdev, enum mt76_rxq_id q,
>  =09=09=09  struct sk_buff *skb);
>  int mt7921e_mac_reset(struct mt7921_dev *dev);
> +int mt7921e_mcu_init(struct mt7921_dev *dev);
> +int mt7921e_mcu_drv_pmctrl(struct mt7921_dev *dev);
> +int mt7921e_mcu_fw_pmctrl(struct mt7921_dev *dev);
> +
>  #endif
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/pci.c
> index b01b9b7c42b4..b16bcee08cd7 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
> @@ -117,6 +117,9 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
> =20
>  =09static const struct mt7921_hif_ops mt7921_pcie_ops =3D {
>  =09=09.reset =3D mt7921e_mac_reset,
> +=09=09.mcu_init =3D mt7921e_mcu_init,
> +=09=09.drv_own =3D mt7921e_mcu_drv_pmctrl,
> +=09=09.fw_own =3D mt7921e_mcu_fw_pmctrl,
>  =09};
> =20
>  =09struct mt7921_dev *dev;
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c b/driver=
s/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> index f211dafa311c..f0734be57dce 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> @@ -286,6 +286,8 @@ mt7921e_mac_reset(struct mt7921_dev *dev)
>  {
>  =09int i, err;
> =20
> +=09mt7921e_mcu_drv_pmctrl(dev);
> +
>  =09mt76_connac_free_pending_tx_skbs(&dev->pm, NULL);
> =20
>  =09mt76_wr(dev, MT_WFDMA0_HOST_INT_ENA, 0);
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c b/driver=
s/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
> new file mode 100644
> index 000000000000..9ac3bc25f067
> --- /dev/null
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: ISC
> +/* Copyright (C) 2021 MediaTek Inc. */
> +
> +#include "mt7921.h"
> +#include "mcu.h"
> +
> +static int mt7921e_driver_own(struct mt7921_dev *dev)
> +{
> +=09u32 reg =3D mt7921_reg_map_l1(dev, MT_TOP_LPCR_HOST_BAND0);
> +
> +=09mt76_wr(dev, reg, MT_TOP_LPCR_HOST_DRV_OWN);
> +=09if (!mt76_poll_msec(dev, reg, MT_TOP_LPCR_HOST_FW_OWN,
> +=09=09=09    0, 500)) {
> +=09=09dev_err(dev->mt76.dev, "Timeout for driver own\n");
> +=09=09return -EIO;
> +=09}
> +
> +=09return 0;
> +}
> +
> +int mt7921e_mcu_init(struct mt7921_dev *dev)
> +{
> +=09static const struct mt76_mcu_ops mt7921_mcu_ops =3D {
> +=09=09.headroom =3D sizeof(struct mt7921_mcu_txd),
> +=09=09.mcu_skb_send_msg =3D mt7921_mcu_send_message,
> +=09=09.mcu_parse_response =3D mt7921_mcu_parse_response,
> +=09=09.mcu_restart =3D mt7921_mcu_restart,
> +=09};
> +=09int err;
> +
> +=09dev->mt76.mcu_ops =3D &mt7921_mcu_ops;
> +
> +=09err =3D mt7921e_driver_own(dev);
> +=09if (err)
> +=09=09return err;
> +
> +=09err =3D mt7921_run_firmware(dev);
> +
> +=09mt76_queue_tx_cleanup(dev, dev->mt76.q_mcu[MT_MCUQ_FWDL], false);
> +
> +=09return err;
> +}
> +
> +int mt7921e_mcu_drv_pmctrl(struct mt7921_dev *dev)
> +{
> +=09struct mt76_phy *mphy =3D &dev->mt76.phy;
> +=09struct mt76_connac_pm *pm =3D &dev->pm;
> +=09int i, err =3D 0;
> +
> +=09for (i =3D 0; i < MT7921_DRV_OWN_RETRY_COUNT; i++) {
> +=09=09mt76_wr(dev, MT_CONN_ON_LPCTL, PCIE_LPCR_HOST_CLR_OWN);
> +=09=09if (mt76_poll_msec(dev, MT_CONN_ON_LPCTL,
> +=09=09=09=09   PCIE_LPCR_HOST_OWN_SYNC, 0, 50))
> +=09=09=09break;
> +=09}
> +
> +=09if (i =3D=3D MT7921_DRV_OWN_RETRY_COUNT) {
> +=09=09dev_err(dev->mt76.dev, "driver own failed\n");
> +=09=09err =3D -EIO;
> +=09=09goto out;
> +=09}
> +
> +=09mt7921_wpdma_reinit_cond(dev);
> +=09clear_bit(MT76_STATE_PM, &mphy->state);
> +
> +=09pm->stats.last_wake_event =3D jiffies;
> +=09pm->stats.doze_time +=3D pm->stats.last_wake_event -
> +=09=09=09       pm->stats.last_doze_event;
> +out:
> +=09return err;
> +}
> +
> +int mt7921e_mcu_fw_pmctrl(struct mt7921_dev *dev)
> +{
> +=09struct mt76_phy *mphy =3D &dev->mt76.phy;
> +=09struct mt76_connac_pm *pm =3D &dev->pm;
> +=09int i, err =3D 0;
> +
> +=09for (i =3D 0; i < MT7921_DRV_OWN_RETRY_COUNT; i++) {
> +=09=09mt76_wr(dev, MT_CONN_ON_LPCTL, PCIE_LPCR_HOST_SET_OWN);
> +=09=09if (mt76_poll_msec(dev, MT_CONN_ON_LPCTL,
> +=09=09=09=09   PCIE_LPCR_HOST_OWN_SYNC, 4, 50))
> +=09=09=09break;
> +=09}
> +
> +=09if (i =3D=3D MT7921_DRV_OWN_RETRY_COUNT) {
> +=09=09dev_err(dev->mt76.dev, "firmware own failed\n");
> +=09=09clear_bit(MT76_STATE_PM, &mphy->state);
> +=09=09err =3D -EIO;
> +=09}
> +
> +=09pm->stats.last_doze_event =3D jiffies;
> +=09pm->stats.awake_time +=3D pm->stats.last_doze_event -
> +=09=09=09=09pm->stats.last_wake_event;
> +
> +=09return err;
> +}
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/testmode.c b/drive=
rs/net/wireless/mediatek/mt76/mt7921/testmode.c
> index 8bd43879dd6f..d22bbd9da58f 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/testmode.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/testmode.c
> @@ -57,7 +57,7 @@ mt7921_tm_set(struct mt7921_dev *dev, struct mt7921_tm_=
cmd *req)
>  =09=09pm->enable =3D false;
>  =09=09cancel_delayed_work_sync(&pm->ps_work);
>  =09=09cancel_work_sync(&pm->wake_work);
> -=09=09__mt7921_mcu_drv_pmctrl(dev);
> +=09=09mt7921_drv_own(dev);
> =20
>  =09=09mt76_wr(dev, MT_WF_RFCR(0), dev->mt76.rxfilter);
>  =09=09phy->test.state =3D MT76_TM_STATE_ON;
> --=20
> 2.25.1
>=20

--YA0wuwk9ukjqL77s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCYUHwWQAKCRA6cBh0uS2t
rAJcAQDbIFQn+lBHFfe7bRLOhiO/7+AImXhGU/KDyRqT66XEbwEAp+nr/UfIznR3
U9MQ0N9/rw1IgkuWkjkaTINVcbWEOgs=
=H5X+
-----END PGP SIGNATURE-----

--YA0wuwk9ukjqL77s--



--===============0819389490305446966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============0819389490305446966==--


