Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BC9C5AE59
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 May 2025 07:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/U8XG6jnnQQiMtVP/j5uubmP4mLNXHLq+MztZ05aPbw=; b=jsTsmEFiBUYjRiVga9YIusSBZY
	Fa50sUNz2pKT+V1AtOiUIX8j534j4WQPYAMNd98nrDnPJz20CGwsFOkZDTdnC0l6/lxZWr54vKAHZ
	HN7G7ixK9MPh6CqOYK4mPKCqAVeeNY0nVszOWeoBK190/NyprQloj4+vLB5exe2VKeeuur+WCkhQ1
	uJE2J9tpEZAK9O8RKvYY7p7gQzSGbIVRy4rlheNE8aW4DUSFGat4BbL+/lLu4LYaUMmFu7J1lCTPL
	3R0ypSgI4JzDLn45Umh84wIF3rFJ39ql90pFZRgb0biCYvVXrVNNZwn+LZLKKgNibZatz1Wta1Loy
	Zz/3p/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBWU-0000000CTE4-2C64;
	Wed, 28 May 2025 07:48:26 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKBUO-0000000CT1L-0Rbw
	for linux-mediatek@lists.infradead.org;
	Wed, 28 May 2025 07:46:17 +0000
Received: from [192.168.0.192] (ip5f5af669.dynamic.kabel-deutschland.de [95.90.246.105])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 62EFA601EBE87;
	Wed, 28 May 2025 09:46:10 +0200 (CEST)
Message-ID: <140ac32d-432c-496d-b62d-d4254735dc4c@molgen.mpg.de>
Date: Wed, 28 May 2025 09:46:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: BT Driver: mediatek: add gpio pin to reset bt
To: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Von Dentz <luiz.dentz@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Deren Wu <deren.Wu@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
 Chris Lu <chris.lu@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20250528070323.14902-1-ot_zhangchao.zhang@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250528070323.14902-1-ot_zhangchao.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_004616_430124_AE41557A 
X-CRM114-Status: GOOD (  29.89  )
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

Dear Zhangchao,


Thank you for your patch. For the summary, I’d just use:

Bluetooth: btmtk: Add gpio pin to reset bt


Am 28.05.25 um 09:03 schrieb Zhangchao Zhang:
> This patch provides some methods btmtk_reset_by_gpio,

some → the two

> btmtk_reset_by_gpio_work_for mediatek controller.
> 
> The pin is configured in dts files, bluetooth is reset by pulling
> the pin, when an exception or coredump occurs, the above method will
> be used to reset the bluetooth.

How did you test this? Could you please add that to the commit message.

> Co-developed-by Hao qin <hao.qin@mediatek.com>

qin → Qin

> Co-developed-by Chirs lu <chris.lu@mediatek.com>

Chirs → Chris
lu → Lu

> Co-developed-by Jiande lu <jiande.lu@mediatek.com>

lu → Lu

> Signed-off-by: Zhangchao Zhang <ot_zhangchao.zhang@mediatek.com>
> ---
>   drivers/bluetooth/btmtk.c | 59 +++++++++++++++++++++++++++++++++++++++
>   drivers/bluetooth/btmtk.h |  5 ++++
>   2 files changed, 64 insertions(+)
> 
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 4390fd571dbd..16542c724b40 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -6,6 +6,8 @@
>   #include <linux/firmware.h>
>   #include <linux/usb.h>
>   #include <linux/iopoll.h>
> +#include <linux/of.h>
> +#include <linux/of_gpio.h>
>   #include <linux/unaligned.h>
>   
>   #include <net/bluetooth/bluetooth.h>
> @@ -109,6 +111,59 @@ static void btmtk_coredump_notify(struct hci_dev *hdev, int state)
>   	}
>   }
>   
> +static void btmtk_reset_by_gpio_work(struct work_struct *work)
> +{
> +	struct btmtk_reset_gpio *reset_gpio_data =
> +			container_of(work, struct btmtk_reset_gpio, reset_work.work);
> +
> +	gpio_direction_output(reset_gpio_data->gpio_number, 1);
> +	kfree(reset_gpio_data);
> +}
> +
> +static int btmtk_reset_by_gpio(struct hci_dev *hdev)
> +{
> +	struct btmtk_data *data = hci_get_priv(hdev);
> +	struct btmtk_reset_gpio *reset_gpio_data;
> +	struct device_node *node;
> +	int reset_gpio_number;
> +
> +	node = of_find_compatible_node(NULL, NULL, "mediatek,usb-bluetooth");
> +	if (node) {
> +		reset_gpio_number = of_get_named_gpio(node, "reset-gpios", 0);
> +		if (!gpio_is_valid(reset_gpio_number)) {
> +			bt_dev_warn(hdev, "invalid reset gpio, use SW reset");

gpio → GPIO
SW → software
reet → reset?

Please also log the GPIO number. Also, a hint, what the user should do 
in this situation would be great.

> +			return -EINVAL;
> +		}
> +	} else {
> +		bt_dev_warn(hdev, "no reset gpio, use SW reet");

gpio → GPIO
SW → software
reet → reset?

> +		return -ENODEV;
> +	}
> +
> +	/* Toggle the hard reset line. The Mediatek device is going to
> +	 * yank itself off the USB and then replug. The cleanup is handled
> +	 * correctly on the way out (standard USB disconnect), and the new
> +	 * device is detected cleanly and bound to the driver again like
> +	 * it should be.
> +	 */
> +
> +	if (test_and_set_bit(BTMTK_HW_RESET_ACTIVE, &data->flags)) {
> +		bt_dev_err(hdev, "last reset failed? Not resetting again");

It’d be great, if this error message could be rephrased, so users know 
what is wrong, and what to do.

> +		return 0;
> +	}
> +
> +	reset_gpio_data = kzalloc(sizeof(*reset_gpio_data), GFP_KERNEL);
> +	if (!reset_gpio_data)
> +		return -ENOMEM;
> +
> +	INIT_DELAYED_WORK(&reset_gpio_data->reset_work, btmtk_reset_by_gpio_work);
> +	reset_gpio_data->gpio_number = reset_gpio_number;
> +
> +	gpio_direction_output(reset_gpio_number, 0);
> +	schedule_delayed_work(&reset_gpio_data->reset_work, msecs_to_jiffies(200));

A 200 ms delay is quite long. Maybe add the datasheet section as a 
reference in a comment?

> +
> +	return 0;
> +}
> +
>   void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver,
>   			   u32 fw_flavor)
>   {
> @@ -364,6 +419,10 @@ void btmtk_reset_sync(struct hci_dev *hdev)
>   	struct btmtk_data *reset_work = hci_get_priv(hdev);
>   	int err;
>   
> +	/*Toggle reset gpio if the platform provieds one*/

1.  Please add a space in the beginning and end.
2.  provides (A spell checker should have found this.)

> +	err = btmtk_reset_by_gpio(hdev);
> +	if (!err)
> +		return;
>   	hci_dev_lock(hdev);
>   
>   	err = hci_cmd_sync_queue(hdev, reset_work->reset_sync, NULL, NULL);
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index 5df7c3296624..8a265ce367d1 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -179,6 +179,11 @@ struct btmtk_data {
>   	spinlock_t isorxlock;
>   };
>   
> +struct btmtk_reset_gpio {
> +	struct delayed_work reset_work;
> +	int gpio_number;
> +};
> +
>   typedef int (*wmt_cmd_sync_func_t)(struct hci_dev *,
>   				   struct btmtk_hci_wmt_params *);
>   


Kind regards,

Paul

