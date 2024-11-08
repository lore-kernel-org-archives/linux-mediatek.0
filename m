Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5A1D5E148
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Nov 2024 08:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/xy7hkSqnyzRfUcmfn484yg3RGvUKfp5HRqEKGLGDKQ=; b=0pPGAs2wkStyi0BHelj91gu2kX
	ooj5K7mvqVFx7RJFaeffu8BTqZK4o5pzWR73W30kDulFfpV8WpaRkFpMXZ5xWZ1aXemt1ZQ8zjMEP
	tipO2YXZh69j15RZwedAOjTcgalHP3WHeROuKEuiB8wwYh5pFDH03dPBOlz/QVQDM2R20scM0mgWi
	dpQOUP8DMjc54mZJT+vsplIR9xRmJIloCpg0Rs48G8mQT6jBZelZq436/RIzdG/+/KUcZdO4zXWph
	0YaXAHZVrzxyz3q9toLqGBgLh2y5hd9HDC1YIkHXhKrubObKzxonQCV/G+tC6sn6Pn10lRSLlk3CC
	mqaYHOrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Kfn-00000009pzo-1sYZ;
	Fri, 08 Nov 2024 08:48:55 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KVW-00000009o8a-3rmh
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Nov 2024 08:38:20 +0000
Received: from [192.168.0.2] (unknown [95.90.242.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id BDE3A600AA639;
	Fri, 08 Nov 2024 09:37:44 +0100 (CET)
Message-ID: <46444b60-2d1a-45c2-9a96-8352d1879516@molgen.mpg.de>
Date: Fri, 8 Nov 2024 09:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] linux-firmware: update firmware for mediatek bluetooth
 chip (MT7920)
To: Chris Lu <chris.lu@mediatek.com>
Cc: Josh Boyer <jwboyer@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Ben Hutchings <ben@decadent.org.uk>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Allan Wang <allan.wang@mediatek.com>, Aaron Hou <aaron.hou@mediatek.com>,
 Steve Lee <steve.lee@mediatek.com>, linux-bluetooth@vger.kernel.org,
 linux-firmware@kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20241108082515.19817-1-chris.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20241108082515.19817-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_003819_115046_323726F7 
X-CRM114-Status: GOOD (  11.79  )
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


Thank you for your patch. Maybe include the version in the 
summary/title? `linux-firmware` also seems redundant. Maybe:

mediatek MT7920: Update BT_RAM_CODE_MT7961_1a_2_hdr to 20241104091246

mediatek MT7920: Update BT_RAM_CODE_MT7961_1a_2_hdr from 20240930111457 
to 20241104091246

Am 08.11.24 um 09:25 schrieb Chris Lu:
> Update binary firmware for MT7920 BT devices.
> 
> File: mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin

The summary says MT7920, but the file name has MT7961. Is MT7961 a part 
of MT7920?

> Version: 20241104091246

It’d be great if you added a change-log.

> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>   WHENCE                                   |   2 +-
>   mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin | Bin 493809 -> 493809 bytes
>   2 files changed, 1 insertion(+), 1 deletion(-)


Kind regards,

Paul

