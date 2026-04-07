Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356F4EDB7C5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2026 07:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ct66h3ks0TCkZpnAPLTecdDjDaAg6BW6U9iVsPjRtm4=; b=ZF/67lG7tsx7gm3xICo+N838Z/
	y5x2WWs1Rs3Wk0ruMFCyQlP84WyMDbEwf5D/BLTwFkLqO8tdAyxjOhdz5shwbJQifzu8/uikMrZ1S
	mE1Vjl6tIijrgDZbmkH+C1/Z416M6eiHs9Io0o6aUcbD0EnqUyNKFQTji9/23P/iH5wI9xkWKH0uv
	sqfEB7+HyDC3QM93SoIztQOykwA6fQrLWvbP0sTIKTgxOCjIzhlYKM26nUaFdd1u3upapbkJm80tO
	1r1+Kvbnvm2biwKmTXkjYGKjdbvjGEqB53YxO72nxJIfvcNcB9Fl+FRGDEQyE5jy2wvUWhN/SAYrH
	VRh3u+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0eL-000000063LY-1jCW;
	Tue, 07 Apr 2026 07:15:01 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0eG-000000063HS-1NBF
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Apr 2026 07:14:59 +0000
Received: from [192.168.44.15] (unknown [185.238.219.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 49A204C2C37D7A;
	Tue, 07 Apr 2026 09:14:33 +0200 (CEST)
Message-ID: <abdf652a-f7e1-4641-bfd9-c0cfc20cca6d@molgen.mpg.de>
Date: Tue, 7 Apr 2026 09:14:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] Bluetooth: btmtk: add event filter to filter specific
 event
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Von Dentz <luiz.dentz@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Will Lee <will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>,
 Steve Lee <steve.lee@mediatek.com>, linux-bluetooth@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org
References: <20260407064759.3036650-1-chris.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20260407064759.3036650-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_001456_527014_3E99D131 
X-CRM114-Status: GOOD (  17.92  )
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

Dear Chris,


Thank you for the patch.

Am 07.04.26 um 08:47 schrieb Chris Lu:
> Due to some Bluetooth hosts have mechanism to detect invalid events,
> causing abnormal behavior.

Sorry, this description is much too short and general. Please elaborate, 
and document details.

> Add a event filter to prevent debugging events from being sent to host.

a*n*

What are debugging events, and how can they be detected?

> Signed-off-by: Chris Lu <chris.lu@mediatek.com>

Should there be a Fixes: tag, so it gets backported?

> ---
>   drivers/bluetooth/btmtk.c | 22 ++++++++++++++++++++++
>   drivers/bluetooth/btmtk.h |  7 +++++++
>   drivers/bluetooth/btusb.c |  2 ++
>   3 files changed, 31 insertions(+)
> 
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 55516b4602db..302d6ddf9062 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -1503,6 +1503,28 @@ int btmtk_usb_shutdown(struct hci_dev *hdev)
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(btmtk_usb_shutdown);
> +
> +int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
> +{
> +	struct hci_event_hdr *hdr = (void *)skb->data;
> +
> +	if (hdr->evt == HCI_EV_CMD_COMPLETE) {
> +		struct hci_ev_cmd_complete *ec;
> +		u16 opcode;
> +
> +		ec = (void *)(skb->data + HCI_EVENT_HDR_SIZE);
> +		opcode = __le16_to_cpu(ec->opcode);
> +
> +		/* Filter vendor opcode */
> +		if (opcode == 0xfc5d) {
> +			kfree_skb(skb);
> +			return 0;
> +		}
> +	}
> +
> +	return hci_recv_frame(hdev, skb);
> +}
> +EXPORT_SYMBOL_GPL(btmtk_recv_event);
>   #endif
>   
>   MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index adaf385626ee..08b73927c8f3 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -218,6 +218,8 @@ int btmtk_usb_suspend(struct hci_dev *hdev);
>   int btmtk_usb_setup(struct hci_dev *hdev);
>   
>   int btmtk_usb_shutdown(struct hci_dev *hdev);
> +
> +int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb);
>   #else
>   
>   static inline int btmtk_set_bdaddr(struct hci_dev *hdev,
> @@ -296,4 +298,9 @@ static inline int btmtk_usb_shutdown(struct hci_dev *hdev)
>   {
>   	return -EOPNOTSUPP;
>   }
> +
> +static inline int btmtk_recv_event(struct hci_dev *hdev, struct sk_buff *skb)
> +{
> +	return -EOPNOTSUPP;
> +}
>   #endif
> diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
> index f9d515ee9124..daf8a387e660 100644
> --- a/drivers/bluetooth/btusb.c
> +++ b/drivers/bluetooth/btusb.c
> @@ -4150,6 +4150,8 @@ static int btusb_probe(struct usb_interface *intf,
>   	} else if (id->driver_info & BTUSB_MEDIATEK) {
>   		/* Allocate extra space for Mediatek device */
>   		priv_size += sizeof(struct btmtk_data);
> +
> +		data->recv_event = btmtk_recv_event;
>   	}
>   
>   	data->recv_acl = hci_recv_frame;


Kind regards,

Paul

