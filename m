Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457D0C11F65
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 20:13:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ED106100B
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 20:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ED106100B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t9f4pUgmUkbDdjDanI+ChVaY9mVaTS8JP5JNrRja1rU=; b=f3JRKGlUQfZX6R
	IKrv6FTxF62+NtpbxLCRU2X6M05T/kYfBC8Nj8EPBE9+3+XFMvoOdjWw0MNWPyeINhbMM2gsAvBg2
	XGQxWuK27GxiZ/o1988/VSXNXlQop9twweY4MOtFIXZS5PGygftq5GHiY4MQUB9+k+nk0/HIvq4gA
	n6qI1f6ipKjYEOB+fVhCvyVGSZnqV/RjslNOvOKw3hV34b+SEFBe29kXrXCh6161AVeFRSKVcJ4Gk
	dDRIpM5IL0pofokirGkNNYnxwad3Vr/c+FZsxPuUGwKBMkyX5STjsRAMbbk4g1QTNRGRU3ip8nT8o
	V6KWR3ODZxqmo1w5eUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyga1-00FBtW-11; Wed, 30 Jun 2021 20:13:05 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lygZv-00FBoP-V1
 for linux-mediatek@lists.infradead.org; Wed, 30 Jun 2021 20:13:04 +0000
Received: from smtpclient.apple (tmo-122-159.customers.d1-online.com
 [80.187.122.159])
 by mail.holtmann.org (Postfix) with ESMTPSA id 68983CED24;
 Wed, 30 Jun 2021 22:12:51 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.100.0.2.22\))
Subject: Re: [PATCH v3 1/1] Bluetooth: btusb: Record debug log for Mediatek
 Chip.
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210629190934.11710-1-mark-yw.chen@mediatek.com>
Date: Wed, 30 Jun 2021 22:12:48 +0200
Cc: Johan Hedberg <johan.hedberg@gmail.com>, chris.lu@mediatek.com,
 will-cy.lee@mediatek.com, Sean Wang <sean.wang@mediatek.com>,
 Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>, michaelfsun@google.com,
 shawnku@google.com, jemele@google.com, apusaka@google.com
Message-Id: <54B58ECB-2931-4020-BE22-0DCEFD1F1ABA@holtmann.org>
References: <20210629190934.11710-1-mark-yw.chen@mediatek.com>
To: Mark-YW.Chen@mediatek.com
X-Mailer: Apple Mail (2.3654.100.0.2.22)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_131300_192368_34529D95 
X-CRM114-Status: GOOD (  24.47  )
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

Hi Mark,

> Mediatek Bluetooth Controller send the fw log via EP2, this patch
> create callback(data->recv_acl) for processing acl packet.
> 
> 1. create callback(data->recv_acl) for processing acl packet.
> 2. Add btusb_recv_acl_mtk to dispatch acl packet.
> 3. Send mediatek debug log and coredump via hci_recv_diag channel.
> 4. The upper layerd can use hci_channel_minitor to receive
>   these packets.

can you be more specific in what the logs do. I think the changes are easy to understand. I rather have an example btmon from this or more details on what is in these traces. Or even how they can be enabled etc.

> 
> Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
> ---
> drivers/bluetooth/btusb.c | 37 ++++++++++++++++++++++++++++++++++++-
> 1 file changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index b015dcecfb13..cabf6eba2d95 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -569,6 +569,7 @@ struct btusb_data {
> 	int suspend_count;
> 
> 	int (*recv_event)(struct hci_dev *hdev, struct sk_buff *skb);
> +	int (*recv_acl)(struct hci_dev *hdev, struct sk_buff *skb);
> 	int (*recv_bulk)(struct btusb_data *data, void *buffer, int count);
> 
> 	int (*setup_on_usb)(struct hci_dev *hdev);
> @@ -776,7 +777,7 @@ static int btusb_recv_bulk(struct btusb_data *data, void *buffer, int count)
> 
> 		if (!hci_skb_expect(skb)) {
> 			/* Complete frame */
> -			hci_recv_frame(data->hdev, skb);
> +			data->recv_acl(data->hdev, skb);
> 			skb = NULL;
> 		}
> 	}
> @@ -3075,6 +3076,10 @@ static int btusb_shutdown_intel_new(struct hci_dev *hdev)
> 	return 0;
> }
> 
> +#define MTK_FW_DUMP	0xfc6f
> +#define MTK_FW_LOG_1	0x05ff
> +#define MTK_FW_LOG_2	0x05fe
> +
> #define FIRMWARE_MT7663		"mediatek/mt7663pr2h.bin"
> #define FIRMWARE_MT7668		"mediatek/mt7668pr2h.bin"
> 
> @@ -3851,6 +3856,33 @@ static int btusb_mtk_shutdown(struct hci_dev *hdev)
> 	return 0;
> }
> 
> +static int btusb_recv_acl_mtk(struct hci_dev *hdev, struct sk_buff *skb)
> +{
> +	struct btusb_data *data = hci_get_drvdata(hdev);
> +	int err;
> +	u16 handle = le16_to_cpu(hci_acl_hdr(skb)->handle);
> +
> +	switch (handle) {
> +	case MTK_FW_DUMP:
> +		/* It's MediaTek firmware dump from device. When the firmware
> +		 * hang, the device can't be suspend successfully.
> +		 */
> +		usb_disable_autosuspend(data->udev);
> +		err = hci_recv_diag(data->hdev, skb);
> +		break;
> +	case MTK_FW_LOG_1:
> +	case MTK_FW_LOG_2:
> +		/* It's MediaTek fw debug log */
> +		err = hci_recv_diag(data->hdev, skb);
> +		break;
> +	default:
> +		err = hci_recv_frame(data->hdev, skb);
> +		break;
> +	}
> +
> +	return err;


	switch (handle) {
	case 0xfc6f:		/* Firmware dump from device */
		/* When the firmware hangs, the device can no longer
		 * suspend and thus disable auto-suspend.
		 */
		usb_disable_autosuspend(data->udev);
		/* fall through */

	case 0x05ff:		/* Firmware debug logging 1 */
	case 0x05fe:		/* Firmware debug logging 2 */
		return hci_recv_diag(data->hdev, skb);
	}

	return hci_recv_frame(data->hdev, skb);
}

> +}
> +
> MODULE_FIRMWARE(FIRMWARE_MT7663);
> MODULE_FIRMWARE(FIRMWARE_MT7668);
> 
> @@ -4543,6 +4575,8 @@ static int btusb_probe(struct usb_interface *intf,
> 		data->recv_bulk = btusb_recv_bulk;
> 	}
> 
> +	data->recv_acl = hci_recv_frame;
> +
> 	hdev = hci_alloc_dev();
> 	if (!hdev)
> 		return -ENOMEM;
> @@ -4669,6 +4703,7 @@ static int btusb_probe(struct usb_interface *intf,
> 		hdev->setup = btusb_mtk_setup;
> 		hdev->shutdown = btusb_mtk_shutdown;
> 		hdev->manufacturer = 70;
> +		data->recv_acl = btusb_recv_acl_mtk;
> 		set_bit(HCI_QUIRK_NON_PERSISTENT_SETUP, &hdev->quirks);

Move this change after the quirk setting since it is local to btusb and not the hdev.

> 	}

Regards

Marcel


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
