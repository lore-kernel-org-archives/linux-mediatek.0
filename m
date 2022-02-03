Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA09C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Feb 2022 09:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uk7LTLxSG+7u3FR4UOecUo3jMEjU1rCi5GOdQMcnSyI=; b=sXz2pFm5OP2X5V
	V8rMh8vmXkaJR+qdPdNcriMIfj/oVOfbe96bfoztSZFO3BRg0ywVgRARDoPwdtX0FghSymYpSqkf/
	Z7L1Cn4EUoOZ7b2UjPAOXjmeuM8Ek0EqvwAEdRd68skZ/iLO2qyXb5Z9eSWc3NDrS7JE2B7M8xpzJ
	2e4SXXByjeKYDrAbggYB1/YaJJEKORAPIUxbWtEV2rsUCQK++O5M/mZyFEi8qMvDLWO4V7x7XMySe
	dG7/NGP5SAtqfTAtDsgHynh+LtgG42rfiQONhtY8jyICl1Uf5TXz7kUpbTghBKWxjaAhSL7YnKHDT
	RioSONSs2HCIj0P5+wCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nFYsP-000dgW-RC; Thu, 03 Feb 2022 09:58:05 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nFYlD-000a6m-2c; Thu, 03 Feb 2022 09:50:40 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 67EF71F45311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643881837;
 bh=mzOFXDAXAzLAhEhLjMCEupxX73tzuR4dAS6Der8FZvs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=buShtQpzXhsuTNYzJseURVnMRXIHBdpF7xQC3T/3BehhB4p8CJ5c7TQ/1LcychNtg
 +ou5gLa/21biMSRzfpJ1N0RlJdHvzMoRqGqY2/wvpc6w19zUoRMHdn/oAzTWMkFiUd
 h3DAsnrM7LKlF3JsxmDmXOVuhAI2PnNmlWROEJnYCnoiUUA9iypMUMmArVOe3artHC
 jggksN1XsxIUbU1kaAO9kSOcT7q9yseXtPZ9U72xHuBj7PNE8bB96DxGBBzO9w1WPQ
 w1fxdz6FoHNs1ILJ5c5wKn4xW3y7mkeMd0FU1xdZrdocaqwjZdSuQez2WQ0MRKW5IQ
 6M97ZjcU0ajjA==
Message-ID: <60067d0d-fc48-0af5-c182-d36388a89f45@collabora.com>
Date: Thu, 3 Feb 2022 10:50:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 12/31] clk: mediatek: pll: Split definitions into
 separate header file
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220202134834.690675-1-wenst@chromium.org>
 <20220202134834.690675-13-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220202134834.690675-13-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220203_015039_314440_6EE50AF5 
X-CRM114-Status: GOOD (  10.31  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 02/02/22 14:48, Chen-Yu Tsai ha scritto:
> When the PLL type clk was implemented in the MediaTek clk driver
> library, the data structure definitions and function declaration
> were put in the common header file.
> 
> Since it is its own type of clk, and not all platform clk drivers
> utilize it, having the definitions in the common header results
> in wasted cycles during compilation.
> 
> Split out the related definitions and declarations into its own
> header file, and include that only in the platform clk drivers that
> need it.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
