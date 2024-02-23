Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B43AC54798
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Feb 2024 14:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igE7RetRUozVhxZmLANY7vcB5fZZoXzt8fVMjisZk9M=; b=op/1WqAsTJuSoIDtdpr1xSVEaT
	pfEfLmBULNuk0wRvuSyjvVjSHt/VCwO+Wg8xsHHmWJ06PsKMrAQYhBM2b4eLZ0Ae6jsU9W0qFuqgC
	9XPO2cdlOLxb10MzG57tT9EGY3H554AvMao+Le8D5QwcuaNqp3THdZnusvKSFCrV/5Bg9og0vgitf
	QHOLsOzNq4eXJ3ATZf7QZRKlBmjxTaorHYsCGruhBB3cV2F5y6csO+omOfxmDjVKIWxgJxLyMhDJ/
	EG8/yw61sq0OxnPp3YW3GXLFGsX2ZP5TnxNTR+37hc07L3d9Qy8p3ETo4rox1ZpsJ/0K9g4aUufQr
	E2pC7bJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdWap-00000009lUr-1SiP;
	Fri, 23 Feb 2024 14:32:03 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdWaS-00000009lPz-39G8
	for linux-mediatek@lists.infradead.org;
	Fri, 23 Feb 2024 14:31:49 +0000
Received: from [141.14.220.34] (g34.guest.molgen.mpg.de [141.14.220.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id D53F261E5FE05;
	Fri, 23 Feb 2024 15:30:34 +0100 (CET)
Message-ID: <de2d4d3c-1a4e-4399-aa96-9e8217621fa7@molgen.mpg.de>
Date: Fri, 23 Feb 2024 15:30:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] linux-firmware: update firmware for mediatek bluetooth
 chip (MT7921)
Content-Language: en-US
To: Chris Lu <chris.lu@mediatek.com>
Cc: Josh Boyer <jwboyer@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Ben Hutchings <ben@decadent.org.uk>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Deren Wu <deren.Wu@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
 KM Lin <km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>,
 Steve Lee <steve.lee@mediatek.com>, linux-bluetooth@vger.kernel.org,
 linux-firmware@kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20240223095044.7824-1-chris.lu@mediatek.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20240223095044.7824-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_063147_042489_CC5DB010 
X-CRM114-Status: GOOD (  15.14  )
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


Thank you for your patch. Some nits.

Am 23.02.24 um 10:50 schrieb Chris Lu:
> Update binary firmware for MT7921 BT devices.
> 
> File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
> Version: 20240219111427

The title is very unspecific for `git log --oneline`. Could you mention 
the version number in there? Maybe:

linux-firmware: Update MediaTek MT7921 Bluetooth chip FW to 20240219111427

Also, could you please add a change-log of what changed between version 
20231109191416 and 20240219111427?

> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>   WHENCE                                  |   2 +-
>   mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin | Bin 532206 -> 530926 bytes
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/WHENCE b/WHENCE
> index 576f8d73..f7dcc6db 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -5645,7 +5645,7 @@ Licence: Redistributable. See LICENCE.mediatek for details.
>   Driver: mt7921 - MediaTek MT7921 bluetooth chipset
>   
>   File: mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
> -Version: 20231109191416
> +Version: 20240219111427
>   
>   Licence: Redistributable. See LICENCE.mediatek for details.
>   
> diff --git a/mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin b/mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin
> index c7a96755b122ef7aa601eb40fbd7abb9ca85a545..34b791b7cc66780a80a18a631a9d578b2a744546 100644
> GIT binary patch
> literal 530926

[…]


Kind regards,

Paul

