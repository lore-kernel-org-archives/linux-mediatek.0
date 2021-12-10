Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A168AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 08:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ReBT4H/vGwZtxQvVrPK5jX26BG7nfjP84z/ghhw+5yI=; b=z0e2nWwrmQArGD
	7qui+/7pYPOuQP2Omzj90FNd8XEYeFhzQfXZH1ZW/zY1kMNP9SlDkyHFQoGPq9GTSFfxFjLhO+zlP
	ZxdARk1cBCzFIpvl8ttjkW+XPH5PAzpmbImxeQvCRIZ0kje6ej/vqh5ipfodQD4YJgEIm1uaL3RLI
	MdnZnl9iAxIsQlha0MoayvAm/Jthduh4KTDrJTtHzp5lXFTHFd17xBi8Dob4QNUtSIKPZkrmaDgxy
	RKxHO3Abs/0JdOHCdd47wVIMx53md7Nvn+DSN4npbm37H3WSPK1gMMal+YEMWi2lb9Ng5V8gkqqY9
	PEFAke/CQ5QDV1gPsOFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvbau-001EMr-QM; Fri, 10 Dec 2021 08:49:32 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvbah-001EM1-Jz; Fri, 10 Dec 2021 08:49:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E5108CE29F0;
 Fri, 10 Dec 2021 08:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57B65C00446;
 Fri, 10 Dec 2021 08:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639126156;
 bh=sHJ2K4HWmLNgcWaZ8JeGY7iqpMYUyAqbVSIEietNe9M=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=Bh9Av8Z5EEvQ8cY1y+SAorgyDjQ0IWWJMPaYpK7yS+UeyGWPng0QFsgXG8lQUm219
 y0ZMClZdU9+JAoAa6s+qMy9pjdOJGIICPkul6+NJ9PYkMwZzRkM7ISRVtFzaqs6Cyq
 jQFgcqFeS3HC/SwVeKUitDZViJd9Y5qaWiFt/uu1kcMpZor1mTkFX9VtEgCPpNyU6O
 RVVV5A7h2OtU/xoxvpwewEhpmNYvY0vM2RRdK7nhaJfGC8MMrqOaEqfa5QMn7w/CGZ
 QPDt4rC3XFjo6FCdfZTtN/nzo3iMjxAG8/2Ou19iX92OcAu6khlTQoHjvfGwrEbabw
 4dw5w0A3CBzag==
From: Kalle Valo <kvalo@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 shayne.chen@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] mt76: mt7921: reduce log severity levels for informative
 messages
References: <20211210082247.977043-1-tzungbi@google.com>
Date: Fri, 10 Dec 2021 10:49:11 +0200
In-Reply-To: <20211210082247.977043-1-tzungbi@google.com> (Tzung-Bi Shih's
 message of "Fri, 10 Dec 2021 16:22:47 +0800")
Message-ID: <8735n0oneg.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_004919_870349_6E29767D 
X-CRM114-Status: GOOD (  14.77  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Tzung-Bi Shih <tzungbi@google.com> writes:

> "ASIC revision" and "Firmware init done" shouldn't be error messages.
> Reduces the severity level to info.
>
> Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/mcu.c | 2 +-
>  drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> index 6ada1ebe7d68..99b144fd8db5 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -882,7 +882,7 @@ static int mt7921_load_firmware(struct mt7921_dev *dev)
>  	dev->mt76.hw->wiphy->wowlan = &mt76_connac_wowlan_support;
>  #endif /* CONFIG_PM */
>  
> -	dev_err(dev->mt76.dev, "Firmware init done\n");
> +	dev_info(dev->mt76.dev, "Firmware init done\n");

Shouldn't that be a debug message? Hard to see how's that useful in
normal operation.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
