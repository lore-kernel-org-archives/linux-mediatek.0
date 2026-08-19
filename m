Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E36A5C5DF6D
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 10:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HukbyObVR5fMqPJdqufVjaPpmFUKP0LCkJl35Ps+dG4=; b=noYmB/Y+i1mEgpWdMG+cv4j6vi
	psUVkvNEGN4WNK0nnmv5I42Mga8CGBimjrVJ0B5VkMJNftymWvG91xZhpiY4+kpDpxkQHe+svYkb6
	UDeKwAaAvZf99vqZjMC9hkgLjymlyMUll82JLg0MtbBLAAam6MrbifOsg1R7UAqGCCubQCkPxjyLi
	1Si/bKhHCJ2WW0oy5wrBW0GPk8UAsktfVCzQHdrsM3zb4VXgwbr534c8EBBy4T//VnHnIqZjp5HSL
	xxqGheYS/qv2S8x5EmBJ0n8aYr//yUG+8CY8SDSWtWIyTr4DW1DCKOf6QgpTrENsg01VR27syI+Me
	etKn+WgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdiu-00000009ZbA-1Lw8;
	Wed, 19 Aug 2026 10:40:44 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdip-00000009ZZX-2f6N
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 10:40:42 +0000
Received: from [141.14.220.42] (g42.guest.molgen.mpg.de [141.14.220.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id A2D714C2C37F09;
	Wed, 19 Aug 2026 12:39:45 +0200 (CEST)
Message-ID: <2714ca05-ba70-40d1-ae41-68808bbab7b1@molgen.mpg.de>
Date: Wed, 19 Aug 2026 12:39:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mediatek MT7925: update bluetooth firmware to
 20260813113236
To: Chris Lu <chris.lu@mediatek.com>
Cc: Josh Boyer <jwboyer@kernel.org>, David Woodhouse <dwmw2@infradead.org>,
 Ben Hutchings <ben@decadent.org.uk>, Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>, Will Lee
 <will-cy.Lee@mediatek.com>, SS Wu <ss.wu@mediatek.com>,
 linux-firmware@kernel.org, linux-bluetooth@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org
References: <20260818013413.451943-1-chris.lu@mediatek.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20260818013413.451943-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_034039_824516_2156037F 
X-CRM114-Status: GOOD (  14.47  )
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

Am 18.08.26 um 03:34 schrieb Chris Lu:
> Update binary firmware for MT7925 BT devices.
> 
> File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
> Version: 20260813113236

It’d be great if you added a change-log or some kind of release notes 
for users to look at.

> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>   WHENCE                                        |   2 +-
>   .../mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin     | Bin 446831 -> 448367 bytes
>   2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/WHENCE b/WHENCE
> index 7be795df..07dceaea 100644
> --- a/WHENCE
> +++ b/WHENCE
> @@ -6259,7 +6259,7 @@ Licence: Redistributable. See LICENCE.mediatek for details.
>   Driver: mt7925 - MediaTek MT7925 bluetooth chipset
>   
>   File: mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin
> -Version: 20260605184935
> +Version: 20260813113236
[…]


Kind regards,

Paul

