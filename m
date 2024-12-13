Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DABBE7717D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2024 09:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fZyX2bMJsL8Viau+fcXlHCqS76x7TGSOXPZXqdiebmE=; b=TBCgpSBYWPgq9qAuLaF2ahWVkb
	BUbmefMT0Ox5ur89x8LqWBKvzeQmnTK3BQMiiZms7QMCc/rswxKK2MsQQwyVIYH28EV8ivbJjYzgK
	PynD961GM6dy5h1LdQInIqwtJ8+2c05NxrptvGKPLsAWEUUE9b8N1/lWXm/eyJPlU8+Ks4pScxTmy
	QiWCj0Mu0foQC3z0d0h+PBFexYduMjH/SvS4csz0OMiQFkyNvTYDZr05GCY6lk9lEB5ykeBjQkvsc
	feTfK8g+mOxOADsWH5aLZB8eCJyYZanC9F/u/2dg4Jn7VowTJaL/tVgy2BaWTrDSUntowA9bOu5SV
	Q9eBmc4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2FZ-00000003JDt-2mz1;
	Fri, 13 Dec 2024 09:46:21 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2FX-00000003JBI-1Vr1
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Dec 2024 09:46:20 +0000
Received: from [192.168.0.2] (ip5f5af5e3.dynamic.kabel-deutschland.de [95.90.245.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 622D761E646F9;
	Fri, 13 Dec 2024 10:46:01 +0100 (CET)
Message-ID: <6bbe0989-babd-4a99-85ad-fdeea47deb09@molgen.mpg.de>
Date: Fri, 13 Dec 2024 10:46:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Bluetooth: btmtk: add quirk to support
 HCI_QUIRK_SIMULTANEOUS_DISCOVERY
To: Chris Lu <chris.lu@mediatek.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Von Dentz <luiz.dentz@gmail.com>, Hao Qin <hao.qin@mediatek.com>,
 Aaron Hou <aaron.hou@mediatek.com>, Steve Lee <steve.lee@mediatek.com>,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <20241213094118.23647-1-chris.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20241213094118.23647-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_014619_539188_46371F5F 
X-CRM114-Status: GOOD (  12.85  )
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


Thank you for your patch.


Am 13.12.24 um 10:41 schrieb Chris Lu:
> Add quirk to support HCI_QUIRK_SIMULTANEOUS_DISCOVERY feature for MT79xx
> series chipset.

It’d be great if you elaborated. What is the problem. Why is a quirk 
needed? Is a firmware update going to fix it?

> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>   drivers/bluetooth/btmtk.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
> index 8a3f7c3fcfec..562d6ecf0b71 100644
> --- a/drivers/bluetooth/btmtk.c
> +++ b/drivers/bluetooth/btmtk.c
> @@ -1367,6 +1367,9 @@ int btmtk_usb_setup(struct hci_dev *hdev)
>   			return err;
>   		}
>   
> +		/* Apply common HCI quirks for MediaTek chipset */
> +		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
> +

The commit message only talks about MT79xx series chipset. The comment 
talks about all MediaTek chipsets.

>   		hci_set_msft_opcode(hdev, 0xFD30);
>   		hci_set_aosp_capable(hdev);


Kind regards,

Paul

