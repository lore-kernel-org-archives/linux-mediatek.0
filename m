Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2276C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 12:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgCWCuvjRw8lQvoON2QhdIUUVduYl90oA8kz5XZsvEY=; b=0k+lk0nsW5u0RU
	dR65/URiAGIohTKic8pIkSbcHfz4g9WD/iexK4NVD6zg4UXUB16wNz6MQOkVUpvdpy+iNbrVguQc6
	FQMfMOscBBp77ZOB2m3czHkgH8h1/FBlV+G2sqJj+T1s7CVLIqEn86e2R1BMh0sMh8tsWt+c74BAw
	hxJNMkh4Nf/8pbXRVb7geA7LnjwIIqDQuEZdGu/QJ1Vc/tNCtEyRWgGZcHyOmtKxhRUy8ig5L9u/G
	V9he0jmm3YaWA/RmKPUrH0gx2ycAWhYyQj7XPtXxN3Ciq2EgFBhHWaNMHv0mpv3AdCjBk2QeZPM93
	yNM+s6iTkw9UtWauZYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrIda-001y4e-6t; Wed, 18 May 2022 12:18:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrIdN-001y0G-G0; Wed, 18 May 2022 12:18:34 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A7A801F45034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652876312;
 bh=PFgx984+FuMCxbDdd6hqK/nxYtdSH9hLGtbOymoK8NY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=RasqO0zP3KyeUtT66qDWuwaCJ1/Y0wy30WtrFygZfkptrGsCjxo7ZTOwFDi9KTBda
 L67uEr5HdlT7PKBIodRG8JgKanA/4TGhOd9Yrti50h3rTn7MKfFuZ0KSfTKwnB7q1k
 o5ZcddUKS334nPgssh/io9SNq8EVB4dPXZ2WABovKbt1yvHQJjxG7xGz1ZVPkdfp9f
 2tPf7CnBM2qinxKhUhg5EGbXnS+XCOmBsAJXGPAPsZIKICHWpTgoaDPhdmWGyvoR3o
 okLr5Cb97N8hOQHuXO3IiJg2txppFYC6Yi4ybz/c3zLYRzMo8ryyhKTfutowbWh0Q2
 bB+tPbsVK4uCw==
Message-ID: <e06b9256-3fb3-6ac4-9362-b23574f4da6e@collabora.com>
Date: Wed, 18 May 2022 14:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2] clk: mediatek: use en_mask as a pure div_en_mask
Content-Language: en-US
To: Mandy Liu <mandyjh.liu@mediatek.com>, mturquette@baylibre.co,
 sboyd@kernel.org
Cc: miles.chen@mediatek.com, wenst@chromium.org, chun-jie.chen@mediatek.com,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220513073621.12923-1-mandyjh.liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220513073621.12923-1-mandyjh.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_051833_714895_86C3047C 
X-CRM114-Status: UNSURE (   9.98  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 13/05/22 09:36, Mandy Liu ha scritto:
> From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> 
> We no longer allow en_mask to be a combination of
> pll_en_bit and div_en_mask, so remove pll_en_bit(bit0)
> from en_mask to make en_mask a pure en_mask that only
> used for pll dividers.
> 
> This commit continues the work done in commit 7cc4e1bbe300
> ("clk: mediatek: Fix asymmetrical PLL enable and disable
> control") and commit f384c44754b7 ("clk: mediatek:
> Add configurable enable control to mtk_pll_data") to
> clean up en_mask(bit0) default setting.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Signed-off-by: Mandy Liu <mandyjh.liu@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
