Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56E5C28B28
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 06:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LarXv2hqhK7gT58WfyiOsxwadeMvyj9TRwWyojsiZy4=; b=0yBwTgkrN/kf/ejJr6KUGL86MR
	MalDr74ACakbBKqqa5W0XcWzugt7YiYK+XkpuYSHkqbDbPCylk1xtr0XuTaMxkbbLocckTFOLN5NY
	c/ClYpjgOSruuF187Nt28MEGUf+JOiczM2rAehNenoU1fWH0qAX0Lzz6Am7HGzqczOH1XUHYCBSFL
	L1n2/zi+dzlSrSvUT5rsLV5UV8ZnRSeIqEMDDOUL9aHhJSZiMC4qLLV1R4rkUvyol2eNimb4lys5k
	MhgNzfQosYZPlx/BAUn3tK7ao9fUWm5nofVQywlz0S/yzw/fRGWQLYiJfqPKLz5ZSDNX/WQNAOSDM
	92v3MwZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsFlD-00000007bvB-1BU7;
	Wed, 12 Mar 2025 06:40:11 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsFl9-00000007btK-1lgM
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 06:40:09 +0000
Received: from [192.168.0.224] (ip5f5ae865.dynamic.kabel-deutschland.de [95.90.232.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 391EE61E646F9;
	Wed, 12 Mar 2025 07:39:48 +0100 (CET)
Message-ID: <24204a3f-836d-4767-a9ec-08b22a27b76b@molgen.mpg.de>
Date: Wed, 12 Mar 2025 07:39:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btmtk: delay usb_autopm_put_interface until
 WMT event received
To: Sean Wang <sean.wang@mediatek.com>, Yake Yang <yake.yang@mediatek.com>
Cc: marcel@holtmann.org, johan.hedberg@gmail.com, luiz.dentz@gmail.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250311231630.35255-1-sean.wang@kernel.org>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250311231630.35255-1-sean.wang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_234007_606857_23E4451F 
X-CRM114-Status: GOOD (  17.21  )
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

Dear Sean, dear Yake,


Thank you for the patch.

Am 12.03.25 um 00:16 schrieb sean.wang@kernel.org:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Delay calling usb_autopm_put_interface until the WMT event response is
> received to ensure proper synchronization and prevent premature power
> management actions.

Do you have a reproducer? It’d be great if you could add that to the 
commit message.


Kind regards,

Paul


> Co-developed-by: Yake Yang <yake.yang@mediatek.com>
> Signed-off-by: Yake Yang <yake.yang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
>   drivers/bluetooth/btmtk.c | 15 +++++++--------
>   1 file changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 68846c5bd4f7..01832bc6a259 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -620,17 +620,14 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
>   
>   	if (err < 0) {
>   		clear_bit(BTMTK_TX_WAIT_VND_EVT, &data->flags);
> -		usb_autopm_put_interface(data->intf);
> -		goto err_free_wc;
> +		goto err_pm_put;
>   	}
>   
>   	/* Submit control IN URB on demand to process the WMT event */
>   	err = btmtk_usb_submit_wmt_recv_urb(hdev);
>   
> -	usb_autopm_put_interface(data->intf);
> -
>   	if (err < 0)
> -		goto err_free_wc;
> +		goto err_pm_put;
>   
>   	/* The vendor specific WMT commands are all answered by a vendor
>   	 * specific event and will have the Command Status or Command
> @@ -646,18 +643,18 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
>   	if (err == -EINTR) {
>   		bt_dev_err(hdev, "Execution of wmt command interrupted");
>   		clear_bit(BTMTK_TX_WAIT_VND_EVT, &data->flags);
> -		goto err_free_wc;
> +		goto err_pm_put;
>   	}
>   
>   	if (err) {
>   		bt_dev_err(hdev, "Execution of wmt command timed out");
>   		clear_bit(BTMTK_TX_WAIT_VND_EVT, &data->flags);
>   		err = -ETIMEDOUT;
> -		goto err_free_wc;
> +		goto err_pm_put;
>   	}
>   
>   	if (data->evt_skb == NULL)
> -		goto err_free_wc;
> +		goto err_pm_put;
>   
>   	/* Parse and handle the return WMT event */
>   	wmt_evt = (struct btmtk_hci_wmt_evt *)data->evt_skb->data;
> @@ -700,6 +697,8 @@ static int btmtk_usb_hci_wmt_sync(struct hci_dev *hdev,
>   err_free_skb:
>   	kfree_skb(data->evt_skb);
>   	data->evt_skb = NULL;
> +err_pm_put:
> +	usb_autopm_put_interface(data->intf);
>   err_free_wc:
>   	kfree(wc);
>   	return err;


