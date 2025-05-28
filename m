Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33D0C5AE59
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 May 2025 07:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PT1F1Srhb49vJhq/gbmO4Tffco4ksVS2YDUHz4vctQ=; b=Mk5KDiuocAcuIS1P0ShDhaBJSL
	obFyJKH2hRsXwjxrSxOTOB1mi0aJ0enhcjLoaR0z2cVfw2VHFm9bLSCyDnQiRl9dBKU7NnfRTln4M
	2h6mxYmgf7BX5fMHendHRop1vMfHvCVVJALK634mK/+PkkMjAWq1xwj05BcHzKufj8C+KJz3rjpRN
	oNS+AFXWXRp0+KRevKBU3RujY8/QY3/sRVMy/4Tqwr+P+TCZtElEif6SefqOJkmxVttj1VBaUEXpD
	HnvTp491FvFkeURPibj6qrlXz11q2VswvgcTkdCDfxR8tlC8OkIbk+2+v708ZTX1On0xBf9tQ177h
	8BQ5PTkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAtQ-0000000COds-2yTm;
	Wed, 28 May 2025 07:08:04 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKAtN-0000000COd7-23kH
	for linux-mediatek@lists.infradead.org;
	Wed, 28 May 2025 07:08:03 +0000
Received: from [192.168.0.192] (ip5f5af669.dynamic.kabel-deutschland.de [95.90.246.105])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id AE289601EEA61;
	Wed, 28 May 2025 09:07:21 +0200 (CEST)
Message-ID: <afe65c91-9120-4327-84a0-faf2d341ebb0@molgen.mpg.de>
Date: Wed, 28 May 2025 09:07:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mediatek MT7925: update bluetooth firmware to
 20250526153203
To: Chris Lu <chris.lu@mediatek.com>
Cc: Josh Boyer <jwboyer@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Ben Hutchings <ben@decadent.org.uk>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Jiande Lu <jiande.lu@mediatek.com>,
 Will Lee <will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>,
 Steve Lee <steve.lee@mediatek.com>, linux-firmware@kernel.org,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20250528064625.533578-1-chris.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250528064625.533578-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_000801_691551_D52503D2 
X-CRM114-Status: GOOD (  14.73  )
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


Thank you for updating the firmware file


Am 28.05.25 um 08:46 schrieb Chris Lu:
> Update binary firmware for MT7925 BT devices.
> 
> File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
> Version: 20250526153203

It’d be great if you could add some kind of change-log compared to the 
previous version 20250425073330.

> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>   WHENCE                                        |   2 +-
>   .../mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin     | Bin 459695 -> 459887 bytes
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/WHENCE b/WHENCE
> index 93f849c4..c653db09 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -6225,7 +6225,7 @@ Licence: Redistributable. See LICENCE.mediatek for details.
>   Driver: mt7925 - MediaTek MT7925 bluetooth chipset
>   
>   File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
> -Version: 20250425073330
> +Version: 20250526153203
>   
>   Licence: Redistributable. See LICENCE.mediatek for details.
>   
> diff --git a/mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin b/mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
> index cce1ddaeefac5a70d7ac9172ef78ce6043bf1334..9263027786aa73ad3de420ff14131492ad7f16a6 100644

[…]


Kind regards,

Paul

