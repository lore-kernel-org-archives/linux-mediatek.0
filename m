Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A387AC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Dec 2021 10:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JOCBEFAltHirCin91FzNRV8ZMyQXgF/lXDNZmX4x1Po=; b=rUHuNNKICezp2W
	vB3Zr/ZTjKY4uta+AVxi4uCkU9QTVMtj6ZOhpHE0/bD3htYPGcXz8SungKyaaOVizGTcNREur9GIa
	XKpw3bbnzn4aU6PDTyqgEjj5IT0J/+cOnTQlb9/VcJS80QZeWly4rrmZPoRxrtOmxLKx6FzlL1qXS
	aOIuVfmDhMJd+k8E9dIwJKS6CD/nkYyDUANIs+SWGcN2RDzisYWSPAY7ga7GQwYhl3SHqjDEOtWk5
	TWRFhaBrUtJ+srH7YKz3xL27hKqQAWgbXWc1rfuWppgnmVP7F9dB+W0dPSvrfddLKU0Yr7XvdpV93
	vwRFwXCLVZEhYO3AXf/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myX7k-00DZNE-Pa; Sat, 18 Dec 2021 10:39:32 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11] helo=mx1.molgen.mpg.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myWyb-00DXDc-PG
 for linux-mediatek@lists.infradead.org; Sat, 18 Dec 2021 10:30:08 +0000
Received: from [192.168.0.3] (ip5f5aecf3.dynamic.kabel-deutschland.de
 [95.90.236.243])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 6A60661E5FE00;
 Sat, 18 Dec 2021 11:30:03 +0100 (CET)
Message-ID: <638a2506-c410-d98c-b704-6f16f72e0bc6@molgen.mpg.de>
Date: Sat, 18 Dec 2021 11:30:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 2/3] Bluetooth: btmtksdio: Enable SCO over I2S function
Content-Language: en-US
To: Sean Wang <sean.wang@mediatek.com>, Mark Chen <mark-yw.chen@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Soul.Huang@mediatek.com,
 YN.Chen@mediatek.com, Leon.Yen@mediatek.com, Eric-SY.Chang@mediatek.com,
 Deren.Wu@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com,
 Eddie.Chen@mediatek.com, ch.yeh@mediatek.com, posh.sun@mediatek.com,
 ted.huang@mediatek.com, Eric.Liang@mediatek.com, Stella.Chang@mediatek.com,
 Tom.Chou@mediatek.com, steve.lee@mediatek.com, jsiuda@google.com,
 frankgor@google.com, jemele@google.com, abhishekpandit@google.com,
 michaelfsun@google.com, mcchou@chromium.org, shawnku@google.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <632534014b9b8a38e81dfb5749dcd75e2088adb1.1639787634.git.objelf@gmail.com>
 <e17b4b3aec942828ef017592df155e554a3d766b.1639787634.git.objelf@gmail.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <e17b4b3aec942828ef017592df155e554a3d766b.1639787634.git.objelf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211218_023006_043432_A3BC0D5D 
X-CRM114-Status: GOOD (  19.96  )
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

Dear Sean, dear Mark,


Am 18.12.21 um 02:08 schrieb sean.wang@mediatek.com:
> From: Mark Chen <mark-yw.chen@mediatek.com>
> 
> For MediaTek chipset, the driver has to issue the specific command to
> enable Bluetooth SCO support over the I2S/PCM interface.

Please document the datasheet name, revision and section, where this is 
described.

Please add how SCO support can be tested. Are all Mediatek chipsets 
supported?

> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Mark Chen <mark-yw.chen@mediatek.com>
> ---
>   drivers/bluetooth/btmtk.h     | 20 +++++++++
>   drivers/bluetooth/btmtksdio.c | 76 +++++++++++++++++++++++++++++++++++
>   2 files changed, 96 insertions(+)
> 
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index 2be1d2680ad8..fc57ef09d132 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -7,8 +7,12 @@
>   
>   #define HCI_WMT_MAX_EVENT_SIZE		64
>   
> +#define BTMTK_WMT_REG_WRITE 0x1
>   #define BTMTK_WMT_REG_READ 0x2
>   
> +#define MT7921_PINMUX_0 0x70005050
> +#define MT7921_PINMUX_1 0x70005054
> +
>   enum {
>   	BTMTK_WMT_PATCH_DWNLD = 0x1,
>   	BTMTK_WMT_TEST = 0x2,
> @@ -76,6 +80,22 @@ struct btmtk_wakeon {
>   	__le16 wakeup_delay;
>   } __packed;
>   
> +struct btmtk_sco {
> +	u8 clock_config;
> +	u8 transmit_format_config;
> +	u8 channel_format_config;
> +	u8 channel_select_config;
> +} __packed;
> +
> +struct reg_write_cmd {
> +	u8 type;
> +	u8 rsv;
> +	u8 num;
> +	__le32 addr;
> +	__le32 data;
> +	__le32 mask;
> +} __packed;
> +
>   struct btmtk_hci_wmt_params {
>   	u8 op;
>   	u8 flag;
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
> index 771733ce362b..8e4d8c2da824 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -830,6 +830,74 @@ static int btsdio_mtk_reg_read(struct hci_dev *hdev, u32 reg, u32 *val)
>   	return err;
>   }
>   
> +static int btsdio_mtk_reg_write(struct hci_dev *hdev, u32 reg, u32 val, u32 mask)
> +{
> +	struct btmtk_hci_wmt_params wmt_params;
> +	struct reg_write_cmd reg_write = {
> +		.type = 1,
> +		.num = 1,
> +		.addr = cpu_to_le32(reg),
> +		.data = cpu_to_le32(val),
> +		.mask = cpu_to_le32(mask),
> +	};
> +	int err, status;
> +
> +	wmt_params.op = BTMTK_WMT_REGISTER;
> +	wmt_params.flag = BTMTK_WMT_REG_WRITE;
> +	wmt_params.dlen = sizeof(reg_write);
> +	wmt_params.data = &reg_write;
> +	wmt_params.status = &status;
> +
> +	err = mtk_hci_wmt_sync(hdev, &wmt_params);
> +	if (err < 0)
> +		bt_dev_err(hdev, "Failed to write reg(%d)", err);
> +
> +	return err;
> +}
> +
> +static int btsdio_mtk_sco_setting(struct hci_dev *hdev)
> +{
> +	struct btmtk_sco sco_setting = {
> +		.clock_config = 0x49,
> +		.channel_format_config = 0x80,
> +	};
> +	struct sk_buff *skb;
> +	u32 val;
> +	int err;
> +
> +	/* Enable SCO over i2s/pcm for Mediatek Chipset */

s/Chipset/chipset/

> +	skb =  __hci_cmd_sync(hdev, 0xfc72, sizeof(sco_setting),
> +			      &sco_setting, HCI_CMD_TIMEOUT);
> +	if (IS_ERR(skb))
> +		return PTR_ERR(skb);
> +
> +	err = btsdio_mtk_reg_read(hdev, MT7921_PINMUX_0, &val);
> +	if (err < 0) {
> +		bt_dev_err(hdev, "Failed to read register (%d)", err);
> +		return err;
> +	}
> +
> +	val |= 0x11000000;
> +	err = btsdio_mtk_reg_write(hdev, MT7921_PINMUX_0, val, ~0);
> +	if (err < 0) {
> +		bt_dev_err(hdev, "Failed to write register (%d)", err);
> +		return err;
> +	}
> +
> +	err = btsdio_mtk_reg_read(hdev, MT7921_PINMUX_1, &val);
> +	if (err < 0) {
> +		bt_dev_err(hdev, "Failed to read register (%d)", err);
> +		return err;
> +	}
> +
> +	val |= 0x00000101;
> +	err = btsdio_mtk_reg_write(hdev, MT7921_PINMUX_1, val, ~0);
> +	if (err < 0)
> +		bt_dev_err(hdev, "Failed to write register (%d)", err);
> +
> +	return err;
> +}
> +
>   static int btmtksdio_setup(struct hci_dev *hdev)
>   {
>   	struct btmtksdio_dev *bdev = hci_get_drvdata(hdev);
> @@ -862,6 +930,14 @@ static int btmtksdio_setup(struct hci_dev *hdev)
>   		err = mt79xx_setup(hdev, fwname);
>   		if (err < 0)
>   			return err;
> +
> +		/* Enable sco over i2s/pcm */

s/sco/SCO/

> +		err = btsdio_mtk_sco_setting(hdev);
> +		if (err < 0) {
> +			bt_dev_err(hdev, "Failed to enable sco setting (%d)", err);

s/sco/SCO/

> +			return err;
> +		}
> +
>   		break;
>   	case 0x7663:
>   	case 0x7668:


Kind regards,

Paul

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
