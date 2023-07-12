Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A1B5EB64D9
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jul 2023 06:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pptjXiv7maz5HEAYPq8AC/Si9K8SuKRDxkIjerh2sWo=; b=vqU06VRaTDkX0soeKYHJLaEkUV
	b1JWXpQGUIKvKTF1t150GoI/9oYF++CIhsar3SUlSawmVXDNgjJ5be+4WHYY7egrXLq+S3njTInbY
	9a2TRW/+9FbM7SNoSvdKHFkdk9wUQ2woyxM7ZN3vipSp7qA5RrW1pxjDYHb+haS6VUhb/EsBdPYQZ
	mhbT2EXsaDAOkHkrO8seeM0FoDu17CBl3SK8wLcLp8RwtmwUExmO6jqzlS3BadXzgB/JyD1mwL9s1
	acB0WsbDXlWJnkESGrofZV+5PN4VHE35ZvTJRTjatpSMNYd6jxyYQ8/uBP1PcP9E7hCShYZqSbSit
	TgxSPWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJT5M-00Ge9r-2N;
	Wed, 12 Jul 2023 06:12:24 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJT5J-00Ge7j-14
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Jul 2023 06:12:23 +0000
Received: from [192.168.0.2] (ip5f5aed4f.dynamic.kabel-deutschland.de [95.90.237.79])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 147F861E5FE01;
	Wed, 12 Jul 2023 08:11:42 +0200 (CEST)
Message-ID: <0cb29d27-a76f-47f2-86c3-f39ba25e8bc2@molgen.mpg.de>
Date: Wed, 12 Jul 2023 08:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3] Bluetooth: btmtk: Fix null pointer when processing
 coredump
Content-Language: en-US
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Von Dentz <luiz.dentz@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230712051857.13812-1-chris.lu@mediatek.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20230712051857.13812-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_231221_527924_31983CD0 
X-CRM114-Status: GOOD (  17.41  )
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


Am 12.07.23 um 07:18 schrieb Chris Lu:
> There may be a potential null pointer risk if offset value is
> less than 0 when doing memcmp in btmtk_process_coredump().
> Checking offset is valid before doing memcmp.

Use imperative mood: Check offset …

> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> Co-developed-by: Sean Wang <sean.wang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> ---
> v2: fix typo
> v3: fix bot checking error
> ---
>   drivers/bluetooth/btmtk.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 786f775196ae..0f290430ae0e 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -370,7 +370,7 @@ EXPORT_SYMBOL_GPL(btmtk_register_coredump);
>   int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
>   {
>   	struct btmediatek_data *data = hci_get_priv(hdev);
> -	int err;
> +	int err, offset;
>   
>   	if (!IS_ENABLED(CONFIG_DEV_COREDUMP))
>   		return 0;
> @@ -392,15 +392,15 @@ int btmtk_process_coredump(struct hci_dev *hdev, struct sk_buff *skb)
>   		if (err < 0)
>   			break;
>   		data->cd_info.cnt++;
> +		offset = skb->len - sizeof(MTK_COREDUMP_END);

For `sizeof()` shouldn’t you use `size_t`? But that is unsigned of 
course. Maybe ssize_t then?

>   
>   		/* Mediatek coredump data would be more than MTK_COREDUMP_NUM */
> -		if (data->cd_info.cnt > MTK_COREDUMP_NUM &&
> -		    skb->len > sizeof(MTK_COREDUMP_END) &&
> -		    !memcmp((char *)&skb->data[skb->len - sizeof(MTK_COREDUMP_END)],
> -			    MTK_COREDUMP_END, sizeof(MTK_COREDUMP_END) - 1)) {
> -			bt_dev_info(hdev, "Mediatek coredump end");
> -			hci_devcd_complete(hdev);
> -		}
> +		if (data->cd_info.cnt > MTK_COREDUMP_NUM && offset > 0)

Why not keep it like before, and just add the condition `skb->len < 
sizeof(MTK_COREDUMP_END)`? The compiler is probably going to optimize so 
the value is not calculated twice.


Kind regards,

Paul


> +			if (!memcmp((char *)&skb->data[offset], MTK_COREDUMP_END,
> +				    sizeof(MTK_COREDUMP_END) - 1)) {
> +				bt_dev_info(hdev, "Mediatek coredump end");
> +				hci_devcd_complete(hdev);
> +			}
>   
>   		break;
>   	}

