Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2DA2C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 17:57:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 559C460174
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 17:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 559C460174
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JNIWROixJ/vpjmo1yM9tv56kaIsd7ACRR7Xvt/FbMmo=; b=OrV2RfhNuDTT88
	WAn7sJ5GoeIURkHYYOc6xAgG7PzHDAJZxvuwpstY82OLt0nJ/pwbgSa4l0/bntgtrhu3ctxNwR2l2
	3qau3223K2/rAUmhWUy9hAY1ji4OAwv/tR1Br6ToIwS2tDcaUfIsBkUlTnE75qOAed3OfoqVLrWo3
	4DgRA4Pf79/VGeSjMHoPILABIdByvfaNOWJ+qYhz53jmj0xLXRO6pQXd5yWqdZtYdF+wpZDLOzRNO
	JYPZRmVkDpbu5Qwk+JQm9FZo1m2mrmiKKQIsGs8QJbYawHpasjjflQugGDF/lZMrAFIudsZUuS8+0
	1ITB5WzM4wMUKF/7gv/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maiUv-000ETQ-Hb; Wed, 13 Oct 2021 17:57:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maiUo-000ESe-Sg
 for linux-mediatek@lists.infradead.org; Wed, 13 Oct 2021 17:56:58 +0000
X-UUID: 268498dd12ab4336a0856eb7a564f7a8-20211013
X-UUID: 268498dd12ab4336a0856eb7a564f7a8-20211013
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 943857705; Wed, 13 Oct 2021 10:56:49 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 13 Oct 2021 10:56:46 -0700
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 14 Oct 2021 01:56:34 +0800
From: <sean.wang@mediatek.com>
To: <lorenzo.bianconi@redhat.com>
CC: <nbd@nbd.name>, <sean.wang@mediatek.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>,
 <Eric-SY.Chang@mediatek.com>, <Mark-YW.Chen@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <robin.chiu@mediatek.com>,
 <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>, <posh.sun@mediatek.com>,
 <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>,
 <steve.lee@mediatek.com>, <jsiuda@google.com>, <frankgor@google.com>,
 <jemele@google.com>, <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v4 11/16] mt76: sdio: extend sdio module to support CONNAC2
Date: Thu, 14 Oct 2021 01:56:33 +0800
Message-ID: <1634147793-9956-1-git-send-email-sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <YWcJe27HQMS7B85j@lore-desk--annotate>
References: <YWcJe27HQMS7B85j@lore-desk--annotate>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_105654_970929_CAB88351 
X-CRM114-Status: GOOD (  16.37  )
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

From: Sean Wang <sean.wang@mediatek.com>

>> From: Sean Wang <sean.wang@mediatek.com>
>>
>> Extend sdio module to support CONNAC2 hw that mt7921s rely on.
>>
>> Tested-by: Deren Wu <deren.wu@mediatek.com>
>> Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
>> Co-developed-by: Deren Wu <deren.wu@mediatek.com>
>> Signed-off-by: Deren Wu <deren.wu@mediatek.com>
>> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
>> ---
>>  drivers/net/wireless/mediatek/mt76/mt76.h     |  5 +-
>>  .../net/wireless/mediatek/mt76/mt7615/sdio.c  |  5 +-
>>  drivers/net/wireless/mediatek/mt76/sdio.c     | 23 ++++++-
>>  drivers/net/wireless/mediatek/mt76/sdio.h     | 50 ++++++++++++++-
>>  .../net/wireless/mediatek/mt76/sdio_txrx.c    | 62 ++++++++++++++++---
>>  5 files changed, 128 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h
>> b/drivers/net/wireless/mediatek/mt76/mt76.h
>> index e2f33956a122..06f0d1348d52 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt76.h
>> +++ b/drivers/net/wireless/mediatek/mt76/mt76.h
>> @@ -505,6 +505,8 @@ struct mt76_sdio {
>>
>>	struct sdio_func *func;
>>	void *intr_data;
>> +	int intr_size;
>> +	u8 hw_ver;
>>
>>	struct {
>>		int pse_data_quota;
>> @@ -1249,7 +1251,8 @@ int mt76s_alloc_queues(struct mt76_dev *dev);
>> void mt76s_deinit(struct mt76_dev *dev);  void mt76s_sdio_irq(struct
>> sdio_func *func);  void mt76s_txrx_worker(struct mt76_sdio *sdio);
>> -int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func);
>> +int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func,
>> +		  int hw_ver);
>>  u32 mt76s_rr(struct mt76_dev *dev, u32 offset);  void mt76s_wr(struct
>> mt76_dev *dev, u32 offset, u32 val);
>>  u32 mt76s_rmw(struct mt76_dev *dev, u32 offset, u32 mask, u32 val);
>> diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
>> b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
>> index f47e25f6dedb..a6b5d536d962 100644
>> --- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
>> +++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
>> @@ -100,7 +100,7 @@ static int mt7663s_probe(struct sdio_func *func,
>>	if (ret < 0)
>>		goto error;
>>
>> -	ret = mt76s_hw_init(mdev, func);
>> +	ret = mt76s_hw_init(mdev, func, MT76_CONNAC_SDIO);
>>	if (ret)
>>		goto error;
>>
>> @@ -108,8 +108,9 @@ static int mt7663s_probe(struct sdio_func *func,
>>		    (mt76_rr(dev, MT_HW_REV) & 0xff);
>>	dev_dbg(mdev->dev, "ASIC revision: %04x\n", mdev->rev);
>>
>> +	mdev->sdio.intr_size = sizeof(struct mt76_connac_sdio_intr);
>>	mdev->sdio.intr_data = devm_kmalloc(mdev->dev,
>> -					    sizeof(struct mt76s_intr),
>> +					    mdev->sdio.intr_size,
>>					    GFP_KERNEL);
>>	if (!mdev->sdio.intr_data) {
>>		ret = -ENOMEM;
>> diff --git a/drivers/net/wireless/mediatek/mt76/sdio.c
>> b/drivers/net/wireless/mediatek/mt76/sdio.c
>> index 82fb4c110b90..bb40cc3e9c2b 100644
>> --- a/drivers/net/wireless/mediatek/mt76/sdio.c
>> +++ b/drivers/net/wireless/mediatek/mt76/sdio.c
>> @@ -221,11 +221,13 @@ int mt76s_rd_rp(struct mt76_dev *dev, u32 base,
>> }  EXPORT_SYMBOL_GPL(mt76s_rd_rp);
>>
>> -int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func)
>> +int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func, int
>> +hw_ver)
>>  {
>>	u32 status, ctrl;
>>	int ret;
>>
>> +	dev->sdio.hw_ver = hw_ver;
>> +
>>	sdio_claim_host(func);
>>
>>	ret = sdio_enable_func(func);
>> @@ -255,12 +257,27 @@ int mt76s_hw_init(struct mt76_dev *dev, struct sdio_func *func)
>>		goto disable_func;
>>
>>	ctrl = WHIER_RX0_DONE_INT_EN | WHIER_TX_DONE_INT_EN;
>> +	if (hw_ver == MT76_CONNAC2_SDIO)
>> +		ctrl |= WHIER_RX1_DONE_INT_EN;
>>	sdio_writel(func, ctrl, MCR_WHIER, &ret);
>>	if (ret < 0)
>>		goto disable_func;
>>
>> -	/* set WHISR as read clear and Rx aggregation number as 16 */
>> -	ctrl = FIELD_PREP(MAX_HIF_RX_LEN_NUM, 16);
>> +	switch (hw_ver) {
>> +	case MT76_CONNAC_SDIO:
>> +		/* set WHISR as read clear and Rx aggregation number as 16 */
>> +		ctrl = FIELD_PREP(MAX_HIF_RX_LEN_NUM, 16);
>> +		break;
>> +	default:
>> +		ctrl = sdio_readl(func, MCR_WHCR, &ret);
>> +		if (ret < 0)
>> +			goto disable_func;
>> +		ctrl &= ~MAX_HIF_RX_LEN_NUM_CONNAC2;
>> +		ctrl &= ~W_INT_CLR_CTRL; /* read clear */
>> +		ctrl |= FIELD_PREP(MAX_HIF_RX_LEN_NUM_CONNAC2, 0);
>> +		break;
>> +	}
>> +
>>	sdio_writel(func, ctrl, MCR_WHCR, &ret);
>>	if (ret < 0)
>>		goto disable_func;
>> diff --git a/drivers/net/wireless/mediatek/mt76/sdio.h
>> b/drivers/net/wireless/mediatek/mt76/sdio.h
>> index 03877d89e152..7d2ec044dcb1 100644
>> --- a/drivers/net/wireless/mediatek/mt76/sdio.h
>> +++ b/drivers/net/wireless/mediatek/mt76/sdio.h
>> @@ -21,7 +21,12 @@
>>  #define MCR_WHCR			0x000C
>>  #define W_INT_CLR_CTRL			BIT(1)
>>  #define RECV_MAILBOX_RD_CLR_EN		BIT(2)
>> +#define WF_SYS_RSTB			BIT(4) /* supported in CONNAC2 */
>> +#define WF_WHOLE_PATH_RSTB		BIT(5) /* supported in CONNAC2 */
>> +#define WF_SDIO_WF_PATH_RSTB		BIT(6) /* supported in CONNAC2 */
>>  #define MAX_HIF_RX_LEN_NUM		GENMASK(13, 8)
>> +#define MAX_HIF_RX_LEN_NUM_CONNAC2	GENMASK(14, 8) /* supported in CONNAC2 */
>> +#define WF_RST_DONE			BIT(15) /* supported in CONNAC2 */
>>  #define RX_ENHANCE_MODE			BIT(16)
>>
>>  #define MCR_WHISR			0x0010
>> @@ -29,6 +34,7 @@
>>  #define WHIER_D2H_SW_INT		GENMASK(31, 8)
>>  #define WHIER_FW_OWN_BACK_INT_EN	BIT(7)
>>  #define WHIER_ABNORMAL_INT_EN		BIT(6)
>> +#define WHIER_WDT_INT_EN		BIT(5) /* supported in CONNAC2 */
>>  #define WHIER_RX1_DONE_INT_EN		BIT(2)
>>  #define WHIER_RX0_DONE_INT_EN		BIT(1)
>>  #define WHIER_TX_DONE_INT_EN		BIT(0)
>> @@ -100,7 +106,37 @@
>>
>>  #define MCR_SWPCDBGR			0x0154
>>
>> -struct mt76s_intr {
>> +#define MCR_H2DSM2R			0x0160 /* supported in CONNAC2 */
>> +#define MCR_H2DSM3R			0x0164 /* supported in CONNAC2 */
>> +#define MCR_D2HRM3R			0x0174 /* supported in CONNAC2 */
>> +#define MCR_WTQCR8			0x0190 /* supported in CONNAC2 */
>> +#define MCR_WTQCR9			0x0194 /* supported in CONNAC2 */
>> +#define MCR_WTQCR10			0x0198 /* supported in CONNAC2 */
>> +#define MCR_WTQCR11			0x019C /* supported in CONNAC2 */
>> +#define MCR_WTQCR12			0x01A0 /* supported in CONNAC2 */
>> +#define MCR_WTQCR13			0x01A4 /* supported in CONNAC2 */
>> +#define MCR_WTQCR14			0x01A8 /* supported in CONNAC2 */
>> +#define MCR_WTQCR15			0x01AC /* supported in CONNAC2 */
>> +
>> +enum mt76_connac_sdio_ver {
>> +	MT76_CONNAC_SDIO,
>> +	MT76_CONNAC2_SDIO,
>> +};
>> +
>> +struct mt76_connac2_sdio_intr {
>> +	u32 isr;
>> +	struct {
>> +		u32 wtqcr[16];
>> +	} tx;
>> +	struct {
>> +		u16 num[2];
>> +		u16 len0[16];
>> +		u16 len1[128];
>> +	} rx;
>> +	u32 rec_mb[2];
>> +} __packed;
>> +
>> +struct mt76_connac_sdio_intr {
>>	u32 isr;
>>	struct {
>>		u32 wtqcr[8];
>> @@ -112,4 +148,16 @@ struct mt76s_intr {
>>	u32 rec_mb[2];
>>  } __packed;
>>
>> +struct mt76s_intr {
>> +	u32 isr;
>> +	struct {
>> +		u32 *wtqcr;
>> +	} tx;
>> +	struct {
>> +		u16 num[2];
>> +		u16 *len[2];
>> +	} rx;
>> +	u32 rec_mb[2];
>> +};
>> +
>>  #endif
>> diff --git a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> index ceb3dc0613d6..73289a9845d7 100644
>> --- a/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> +++ b/drivers/net/wireless/mediatek/mt76/sdio_txrx.c
>> @@ -81,7 +81,7 @@ static int
>>  mt76s_rx_run_queue(struct mt76_dev *dev, enum mt76_rxq_id qid,
>>		   struct mt76s_intr *intr)
>>  {
>> -	struct mt76_queue *q = &dev->q_rx[qid];
>> +	struct mt76_queue *q = &dev->q_rx[0];
>
>why qid is always 0 here?
>

In the current driver, we can see we only created one Rx queue (dev->q_rx with qid = 0)
in mt76s_alloc_queues for processing all incoming packets including MCU events and wifi packets.

And from the point of view of the device,
mt7663s use the hardware queue 0 for all MCU events and wifi packets;
mt7921s use the hardware queue 1 for all MCU events and wifi packets.

So if we don't remap from hardware queue 1 to dev->q_rx[0] for mt7921s to handle incoming packets,
we will get the kernel panic on accessing the invalid pointer on dev->q_rx[1].

	Sean

>Regards,
>Lorenzo
>

<snip>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
