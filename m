Return-Path: <SRS0=sikH=NS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C1C8C432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 17:04:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2FFD60E52
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Aug 2021 17:04:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E2FFD60E52
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9wIySACbS5rY1IUE7Zmp4MtyWSv0l8tJ3E8k6OJJ/uA=; b=LpOUTqxxZVsXIuJPM0BNf8tkkv
	JQxlV8B5kkwZe6VqUaUynRhxe6/IiF8FxoCX30pfIneh/FNo//liARw4XQ5AEtffqJ98lFvE0XlAG
	Uham8/8bk5VgLGX+LHcbRx5HlsP3azNxg7pF9z4bb4X6n79AP1Ml1nWbc753AgYcqr08W2MGPldIA
	/CwwTmSaIhxlkQkDnRAvkXy8CLaeHyDQpm/IetK9xw9K/wjxpmbV9MWCTmBjaeqGdcFsJ7sVgEUOL
	0ElzakWvp63xPBChMRYW5IsnEoA6Kpd3ClcPExdJCBh3VtyEUvGnP92zLzkYqyi5yiBCUjpqOryGn
	/RYlcc0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJfGx-00CoY1-Sj; Fri, 27 Aug 2021 17:04:07 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJfGs-00CoXL-Ri
 for linux-mediatek@lists.infradead.org; Fri, 27 Aug 2021 17:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zp2Jx2p4tyFPvaHoFkrRw0ec88lvZ1SKolJlkPGdft8=; b=i2J5Q3kjc5aXG+VEbm2JnxnDAb
 mzEeEu22XhGhP6CAKVaZW3tuWWjdJIQpJFx4VzPnb8e286EdnvwLxUclpRCyXxzPTcB0oiQljiYzl
 5GqJ7byPurzj4ZSpE6Fo2kCgjLd6/kApXMe2l4h/eJh7aZzm880fnWQlS/41nn9AvQRE=;
Received: from p4ff13206.dip0.t-ipconnect.de ([79.241.50.6] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mJfGn-0007hd-89; Fri, 27 Aug 2021 19:03:57 +0200
Subject: Re: [PATCH] mt76: mt7915: add LED support
To: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 Money Wang <money.wang@mediatek.com>
References: <20210621141430.17577-1-MeiChia.Chiu@mediatek.com>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <046a19be-b804-94a1-7c8c-5c4f3bfa8eac@nbd.name>
Date: Fri, 27 Aug 2021 19:03:56 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210621141430.17577-1-MeiChia.Chiu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210827_100403_261509_F00D2DE2 
X-CRM114-Status: GOOD (  14.46  )
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


On 2021-06-21 16:14, MeiChia Chiu wrote:
> From: MeiChia Chiu <meichia.chiu@mediatek.com>
> 
> Initialize brightness_set and blink_set callbacks to enable LED support.
> 
> Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> Signed-off-by: Money Wang <money.wang@mediatek.com>
> ---
>  .../net/wireless/mediatek/mt76/mt7915/init.c | 69 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  .../net/wireless/mediatek/mt76/mt7915/mmio.c |  6 +++--
>  .../net/wireless/mediatek/mt76/mt7915/regs.h | 19 ++++++++++++++
>  3 files changed, 92 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
> index af712a9..43f9245 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
> @@ -92,10 +92,12 @@ static u32 __mt7915_reg_addr(struct mt7915_dev *dev, u32 addr)
>  	}
>  
>  	if ((addr >= 0x18000000 && addr < 0x18c00000) ||
> -	    (addr >= 0x70000000 && addr < 0x78000000) ||
> -	    (addr >= 0x7c000000 && addr < 0x7c400000))
> +	    (addr >= 0x70000000 && addr < 0x78000000))
>  		return mt7915_reg_map_l1(dev, addr);
>  
> +	if (addr >= 0x7c000000 && addr < 0x7c400000)
> +		return mt7915_reg_map_l1(dev, addr - 0x64000000);

This part doesn't make any sense to me. So you're defining registers in
the 0x7c000000 range, but subtracting 0x64000000 from the address, which
means we land at 0x18000000, which is already covered by the l1-mapped
ranges.
Why not just skip this weird magic trick and define the registers as
being in the 0x18000000 range?

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
