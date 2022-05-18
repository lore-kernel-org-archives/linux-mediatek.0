Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E0FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 16:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uwNLLq91i9zYM1egsSp7y1z5mnE37rCjVF5ZQ5tdP6Q=; b=UJxDp9R3ofhAdi
	NN1bw/oBmUhOHHkXyCTZb92VBStunSZG6sZxpT7udD/uXfU5yMQOr/YHjkno9vL3j7MyEskJqD1T2
	6g2DOE2udtdk5SAFlKQTIJvb4X43i9AGKtGi6vKKiYjTevyfB9hxNSfj8veG+BawWT7wd/xA3fY+G
	/22SQJlrZ7+5Y8HPt7NZ+DXXRcWfPHon074WDkLLjRqqUjQlPs+9ItzbQxJItf+MuRwI/TL4KBag3
	LEML91FKUDnfBMKQ4dpecY0rtVfJgb9dZnm/ozgF1OjF4wxkr4EmZsRLmgYKGKcEDZ5XdP9ptRXcL
	lMtACrmjCL02wbv43uLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrME6-002xjr-A9; Wed, 18 May 2022 16:08:42 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrME3-002xic-4G
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 16:08:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 53B65CE20F8;
 Wed, 18 May 2022 16:08:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F284C385A5;
 Wed, 18 May 2022 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652890112;
 bh=W7E9g3JMLtIZ3H/YFH9zLcuoF3SoQXamU8auRb68lfQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Py+Y7NnHtpyPAjWcqKmdCOBQXC+1lKKcHiecFav2N+Vn0Pqxx6smfPcEisOCboQ/t
 D4QCvYh9RyhFaQqW5X2wxjHSP/TMZP/Uy0dziQAtLhDIuT2SFXo4SyQNixa63eqXB3
 e41Lic6nLZj18Oh37YdAmsVs+8KyTIj8ulrQnZXr7Xkxo/4rGudIy0nXiJeolqdyfh
 1iAsacaOEXjI8IfIQTu0Ok9blVU4B06BQEr08/vdM1V1HlltTlMHPrpkdEzinr3cv2
 m/1wTQ3LTmf4eV3EkMtKsNaH1uK7CeA+ZVRfprc1Nyvu1rM4Nu8vkEf3G3hrUHqw7C
 aS5eZiuypTG5g==
Date: Wed, 18 May 2022 09:08:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, netdev@vger.kernel.org,
 john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 Sam.Shih@mediatek.com, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v2 net-next 12/15] net: ethernet: mtk_eth_soc: introduce
 MTK_NETSYS_V2 support
Message-ID: <20220518090830.59ab629f@kernel.org>
In-Reply-To: <4b3283c7-772f-9969-b3c6-d28b4c032326@nbd.name>
References: <cover.1652716741.git.lorenzo@kernel.org>
 <cc1bd411e3028e2d6b0365ed5d29f3cea66223f8.1652716741.git.lorenzo@kernel.org>
 <20220517184433.3cb2fd5a@kernel.org> <YoTCCAKpE5ijiom0@lore-desk>
 <20220518084740.7947b51b@kernel.org>
 <4b3283c7-772f-9969-b3c6-d28b4c032326@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_090839_373176_1624C34C 
X-CRM114-Status: GOOD (  13.22  )
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

On Wed, 18 May 2022 17:50:12 +0200 Felix Fietkau wrote:
> On 18.05.22 17:47, Jakub Kicinski wrote:
> >> I used this approach just to be aligned with current codebase:
> >> https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/mediatek/mtk_eth_soc.c#L1006
> >> https://github.com/torvalds/linux/blob/master/drivers/net/ethernet/mediatek/mtk_eth_soc.c#L1031
> >> 
> >> but I guess we can even convert the code to use barrier instead. Agree?  
> > 
> > Oh, I didn't realize. No preference on converting the old code
> > but it looks like a cargo cult to me so in the new code let's
> > not WRITE_ONCE() all descriptor writes unless there's a reason.  
> If I remember correctly, the existing places use WRITE_ONCE to prevent 
> write tearing to uncached memory.

Okay, makes sense then. 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
