Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958B0C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 11:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZEDPHHYkN+moIs1O23TOSbdnxlicjL/1zYunkCBHJ4s=; b=l9WbMb93pi//wEOTGsbXEmn0cK
	YE+p9vl1E2B/0XMthtXLsMIuDWttNidGAFHeh/AflfQkgh7YrX5KgTnLpamauSwGTqSuMMnYH3FSW
	27SYN4Z6PlzMxbe1qRq1yafeFFKya/dj5CWgQl1v+FXOhZssFjNcQOWvRHy4P5HSK8FRtMwTYjfXP
	Y5Aql/cLXCZe3kZCCcnRg/N3rh7nFVqVlpKV3Tt+LkNfxlfLlOySmMENEeBiO/WE6plPFIhO1WHvC
	/LYDMrK9Gluzvh+hdfK36ZzPLki4Zq+ZFZ3i7NxIERXD6qWyAiEhaDJh5fcuMpoyt3xJVx6Cyd5Wa
	Xbu/pFIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7a8x-002Lkh-0b;
	Mon, 27 Nov 2023 11:51:15 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7a8t-002Lgq-1Q
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Nov 2023 11:51:13 +0000
Received: from [141.14.220.40] (g40.guest.molgen.mpg.de [141.14.220.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id E026161E5FE01;
	Mon, 27 Nov 2023 12:50:20 +0100 (CET)
Message-ID: <e2f67283-90ea-4f74-977d-dde8bdd0a8ea@molgen.mpg.de>
Date: Mon, 27 Nov 2023 12:50:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] linux-firmware: update firmware for mediatek bluetooth
 chip (MT7922)
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
References: <20231127085827.13060-1-chris.lu@mediatek.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20231127085827.13060-1-chris.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_035111_811194_DF1B5C3B 
X-CRM114-Status: GOOD (  11.77  )
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

Am 27.11.23 um 09:58 schrieb Chris Lu:
> Update binary firmware for MT7922 BT devices.
> 
> File: mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin
> Version: 20231120183620

It’d be great if you added the version in the git commit message 
summary/title too. The `linux-firmware` prefix is probably redundant. No 
idea if a tag exists for it. So, maybe:

mediatek: Update BT MT7921 fw from 20230627144220 to 20231120183620

or

Update Mediatek BT MT7921 fw to 20231120183620

Also, it would be great if you added the change-log to the commit 
message, so people have an idea, what improved.

> Signed-off-by: Chris Lu <chris.lu@mediatek.com>
> ---
>   WHENCE                                  |   2 +-
>   mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin | Bin 512022 -> 513878 bytes
>   2 files changed, 1 insertion(+), 1 deletion(-)

[…]


Kind regards,

Paul

