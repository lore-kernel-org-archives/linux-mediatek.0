Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B765C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPs9jt3heYSPhq+byj3/mAhaEDhKU+xRVyX7TPd88tk=; b=LJ/wiqdq7KsEzC
	kxGRH8HWmULA2KzqcMlc5l9Q8WOd40c8Eol40EyJRhYrJ6MVVzCRuWMMhMCMC+S9cGRM0ELsVTl5H
	OxY9mJSvAD9c6iBZoaoKPSTpzGpwtKNDOmVWHZsnHDn/FJwIFPiX5ZAk3TcfBs0bgt4I0VPO+aTiO
	3UmX/SbPOclxffItf88R7EZUKOcH9czxxfat7bEuGVEXZBL2rLk9Lph/QsAWtjZxnD7CHsLxLFTNF
	VbRxfDPNhIT+KH8qAt2qTVFh2pLHVID7Sqh+aarJL8oCMT3ITYckxJzpneh01cBySTsdcq6Or+Bj9
	R/GLLyXPPex0L8uUtgXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnL4-00C3tQ-Nw; Thu, 17 Feb 2022 20:25:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnKZ-00C3gi-Gd; Thu, 17 Feb 2022 20:24:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 155CB61D7D;
 Thu, 17 Feb 2022 20:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68380C340E8;
 Thu, 17 Feb 2022 20:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129486;
 bh=3LLAv+5AYdopAMuygwfCxsYm6q5pitMBEoimriSUwPY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ascf3dU0/uOUEeQpF9O+vB3WyZbsUPRDPrQOA+52md2cgYGeqLptM7ThXsnbSImQi
 VRx30v/sWVMIIy+DsBm7v7SdpdhB8/bNSezEhNwWl7izLqYmJqxKgNsKf7NnVy2xFO
 +XLiZn3uqTv55odbRaGHU1ssE90IijareLVl/ogviSTtq6JiPUsjFC6ma3C3rLgHc1
 dCJY9y/ty2sJ7o5Xsl2Uwe3wyTEIZ2/hDkxoycm4cqQ5HUfa/cRb6HeIzJOoeKtXco
 vpIdnyw+9rZ+1S6UQUD86MEsI/9qYoWea23TBJfaUPu9ILkYwvE6g4warCI8R+bovf
 Se+7LS1DZc2mg==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-10-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-10-wenst@chromium.org>
Subject: Re: [PATCH v3 09/31] clk: mediatek: mux: Implement unregister API
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 17 Feb 2022 12:24:44 -0800
User-Agent: alot/0.10
Message-Id: <20220217202446.68380C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122447_621016_74D0BD26 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:12)
> The mux clk type within the MediaTek clk driver library only has a
> register function, and no corresponding unregister function. This
> means there is no way for its users to properly implement cleanup
> and removal.
> 
> Add a matching unregister function for the mux type clk.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
