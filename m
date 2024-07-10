Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D23C3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 11:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuTEygCwbH+bjw+cF7aPM5ImbOxVYW6uwRSbeEoN/r0=; b=KK8E/E+sGHaSEfwDV1aGnkfiyf
	uVkRI22hNXPO5ScfVsJeljzr7yTsJuZZ38fAC4dEtAs6a39rjJKZ5TfvKtuFUFLUG8AWsOWZOBjQ9
	KSnekXVM2zs33NFXq5drlLJAcUiXMD1aSCNp6QKdw0y3yjktTZpQ5kLlOO54kzPsIslWSDkfPfjT9
	LV8vsZb1ueqqMeo1004kM5N/WVh4qJUeFb3uwTyUzYM6WKtw5iyu+NFA0ZCDRIuljA0hIFx17C/jG
	ExrxYMZLAzIFdP5lKsRF/TV+9iAXh8luQ/QJpkZkZecOnDNbsmW3c4YSwcBjCy1tNuVjN2Srzrrrp
	7KECJhDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRV4I-0000000AIgR-0vPJ;
	Wed, 10 Jul 2024 11:01:06 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRV4D-0000000AIe1-1e5P
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jul 2024 11:01:00 +0000
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 406A061E64862;
	Wed, 10 Jul 2024 13:00:39 +0200 (CEST)
Message-ID: <261d8aad-5188-4c08-8c3d-34c2e00db2e6@molgen.mpg.de>
Date: Wed, 10 Jul 2024 13:00:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Bluetooth: btmtk: Fix btmtk.c undefined reference
 build error
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Von Dentz <luiz.dentz@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240710092614.7297-1-chris.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240710092614.7297-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_040057_618255_FD27E669 
X-CRM114-Status: GOOD (  15.81  )
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


Am 10.07.24 um 11:26 schrieb Chris Lu:
> MediaTek move some usb interface related function to btmtk.c which

move*d*

Maybe add … in commit XXX ("yyy") … in that sentence.

> may cause build failed if BT USB Kconfig wasn't enabled.

Is not enabling BT USB Kconfig when using btmtk a valid use-case?

> Fix undefined reference by adding config check.
> 
> btmtk.c:(.text+0x89c): undefined reference to `usb_alloc_urb'
> btmtk.c:(.text+0x8e3): undefined reference to `usb_free_urb'
> btmtk.c:(.text+0x956): undefined reference to `usb_free_urb'
> btmtk.c:(.text+0xa0e): undefined reference to `usb_anchor_urb'
> btmtk.c:(.text+0xb43): undefined reference to `usb_autopm_get_interface'
> btmtk.c:(.text+0xb7e): undefined reference to `usb_autopm_put_interface'
> btmtk.c:(.text+0xf70): undefined reference to `usb_disable_autosuspend'
> btmtk.c:(.text+0x133a): undefined reference to `usb_control_msg'
> 
> Fixes: 39a9e1c69e74 ("Bluetooth: btmtk: move btusb_mtk_hci_wmt_sync to btmtk.c")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202407091928.AH0aGZnx-lkp@intel.com/
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
> Change from v1 to v2:
> -fix and update commit message warning
> ---
>   drivers/bluetooth/btmtk.c | 2 ++
>   drivers/bluetooth/btmtk.h | 4 ++++
>   2 files changed, 6 insertions(+)
> 
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index b7c348687a77..9789296ad4f6 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -437,6 +437,7 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
>   }
>   EXPORT_SYMBOL_GPL(btmtk_process_coredump);
>   
> +#if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
>   static void btmtk_usb_wmt_recv(struct urb *urb)
>   {
>   	struct hci_dev *hdev = urb->context;
> @@ -1487,6 +1488,7 @@ int btmtk_usb_shutdown(struct hci_dev *hdev)
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(btmtk_usb_shutdown);
> +#endif
>   
>   MODULE_AUTHOR("Sean Wang <sean.wang@mediatek.com>");
>   MODULE_AUTHOR("Mark Chen <mark-yw.chen@mediatek.com>");
> diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
> index 453ed5131a37..890dbe9beff8 100644
> --- a/drivers/bluetooth/btmtk.h
> +++ b/drivers/bluetooth/btmtk.h
> @@ -165,6 +165,7 @@ struct btmtk_data {
>   	btmtk_reset_sync_func_t reset_sync;
>   	struct btmtk_coredump_info cd_info;
>   
> +#if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
>   	struct usb_device *udev;
>   	struct usb_interface *intf;
>   	struct usb_anchor *ctrl_anchor;
> @@ -177,6 +178,7 @@ struct btmtk_data {
>   
>   	/* spinlock for ISO data transmission */
>   	spinlock_t isorxlock;
> +#endif
>   };
>   
>   typedef int (*wmt_cmd_sync_func_t)(struct hci_dev *,
> @@ -202,6 +204,7 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb);
>   void btmtk_fw_get_filename(char *buf, size_t size, u32 dev_id, u32 fw_ver,
>   			   u32 fw_flavor);
>   
> +#if IS_ENABLED(CONFIG_BT_HCIBTUSB_MTK)
>   int btmtk_usb_subsys_reset(struct hci_dev *hdev, u32 dev_id);
>   
>   int btmtk_usb_recv_acl(struct hci_dev *hdev, struct sk_buff *skb);
> @@ -216,6 +219,7 @@ int btmtk_usb_suspend(struct hci_dev *hdev);
>   int btmtk_usb_setup(struct hci_dev *hdev);
>   
>   int btmtk_usb_shutdown(struct hci_dev *hdev);
> +#endif
>   #else
>   
>   static inline int btmtk_set_bdaddr(struct hci_dev *hdev,


Kind regards,

Paul

