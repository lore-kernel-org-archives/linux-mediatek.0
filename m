Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDEB6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f73B6sEsfCnO4pjppoTMVXgMEqf68x6WlPBY9Wqt/rA=; b=gnxoy8B0YoZdmy
	84AsIkKC2bC342LCYrJ5eeb50aX1uNI3Lxjki1ITLPPo4m7Xvhz1rTo/aCwg1aEec0BW25I186i9D
	hs3DEybxqewiRuqqa4/jBfGsjNbTHJ+xGBE/Lv6UHYYPTKYCD2yMMkzuyXfwG38kX0/87EC8vahJh
	OeenIB5jKMkqwu0k/1v5G2PPyksQm/5ru1uGK0jWtZKJAduzqBkQa6O6cIJ2V2ZgRJHoasJAUax+i
	n8kDZzWE21M0kNYatVJKVYpSI1fHXIUxjBqvkK3Qk5qD+x94fULh+N+z2BXmA8nxYhnVTAc0rSFou
	1c/uVi8hXC1APuiifYNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnRv-00C7Ch-JR; Thu, 17 Feb 2022 20:32:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnLz-00C4KD-Jt; Thu, 17 Feb 2022 20:26:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 18C7561DA5;
 Thu, 17 Feb 2022 20:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6074EC340E8;
 Thu, 17 Feb 2022 20:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129574;
 bh=YDiQDTJ+CjvxKVpah8P3iijxt5wx2VTPTsXT5mpZmow=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=sIap85mOJ3YoJEf7RXtfiT8PQES3d2WQ+ffuMOChmNvsBNGDUMuEOnBFX4Ohy/UXB
 TPoBniuzhgE7M0S+e1V1ShxkzNBfWTZZBVsmmb+6ELlEaKm70Ap1pakF68voaRpax9
 OK//9C+LDI7/blVZYcGp5WWUTaa12d/MUdmXsNIrUHfAXnyTZwvbwG8Mm3LCgEkCRc
 CxWu3FCdD17QyTIqjNhmsjXi/d49X+7dMkJ6Sj14gg41aEVAC0nPAndAzFR0WLQukT
 N8cWIheXqQWHLVo3nY2iU/2f8rY3QNR3qlyAYqZXd+LhP3WepG/fCop1c34acs0enI
 Yi/wLrQ3Nns0w==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-18-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-18-wenst@chromium.org>
Subject: Re: [PATCH v3 17/31] clk: mediatek: Implement
 mtk_clk_unregister_divider_clks() API
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
Date: Thu, 17 Feb 2022 12:26:12 -0800
User-Agent: alot/0.10
Message-Id: <20220217202614.6074EC340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122615_738372_8EE8D7A3 
X-CRM114-Status: GOOD (  10.92  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:20)
> mtk_clk_register_divider_clks(), as the name suggests, is used to register
> a given list of divider clks. However it is lacking a counterpart
> unregister API.
> 
> Implement said unregister API so that the various clock platform drivers
> can utilize it to do proper unregistration, cleanup and removal.
> 
> In the header file, the register function's declaration is also
> reformatted to fit code style guidelines.
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
