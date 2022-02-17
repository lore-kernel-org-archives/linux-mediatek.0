Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD5DC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 20:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSlggRZg8m1aH0iKtygm28t5Y8XkqrbBXRPBs/ujeE0=; b=Gd5ZB8ymXupJFw
	ag02CHO3Ht+RrpcQtiYfs9jG1EN2y817QqarcD/YP0w9NwdFfiYzSz/RiSvoFp6NCHrEXONb+3U/p
	UlkPyp0OWHyiA99mov5YZ0Vk/bAjBwD8uDfVD1d/Jd5+IenoBLZ1IWyxEbatECYXMFPsInbh/BOD4
	2k+iIWot2q3UOVaUvu6mkcCHwKT1bPMIZWm1B1SLKGW5hfZVzoIT8qgJgEdPgG2hYgGG/dL2vXYJa
	I6rg+KYkcPkfBOzf/5t5wKTdPfMuEl1JvgK409BctqnjW+y5MLfIvHUZuBweWDJ0q3vZsyx7LcsdP
	jG8gBnfoEn+I0QH301NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKnUM-00C8Wk-KW; Thu, 17 Feb 2022 20:34:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKnMp-00C4kA-5e; Thu, 17 Feb 2022 20:27:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9FE6E61C7B;
 Thu, 17 Feb 2022 20:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03691C340E8;
 Thu, 17 Feb 2022 20:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645129626;
 bh=qFslgy9Zc+iKVRWaMOWnNLrhzKHJklAO5QBOWjbz0ts=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=tHgd/MrGAYyt2xk5BCf7El2DggYP+6xNARgED3xyZtDN/yyklK5HDdTu2VlCiOWoZ
 FEP9ldCgarGMOmRk/bxjuTpUgv1zL+xtkkrvTJgCXnb3xifNYIsRMTP1LWbc6PD/oM
 sq5mwgg/5+Dg6CFpRKtQI+rxwjJ71CnA4H8Gf4VGhAkuT7PxxUMvdDfeCn5muxT9vD
 Dv2e6K38uzHuxvYTXLv5iaENHkbhsW0kHnBMsdZo9Qmu0Z6etrikbC6HTPNk3IPBHI
 f/q8wCXs2G3S25hUDejsbNVhh4iAAqGyZmO3JzA9Sf25cg9vq53E4muMq3fkTiRUx3
 PekV0DfEZfyDw==
MIME-Version: 1.0
In-Reply-To: <20220208124034.414635-22-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
 <20220208124034.414635-22-wenst@chromium.org>
Subject: Re: [PATCH v3 21/31] clk: mediatek: cpumux: Implement error handling
 in register API
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
Date: Thu, 17 Feb 2022 12:27:04 -0800
User-Agent: alot/0.10
Message-Id: <20220217202706.03691C340E8@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220217_122707_358586_3D4B2AAC 
X-CRM114-Status: GOOD (  10.32  )
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

Quoting Chen-Yu Tsai (2022-02-08 04:40:24)
> The cpumux clk type registration function does not stop or return errors
> if any clk failed to be registered, nor does it implement an error
> handling path. This may result in a partially working device if any
> step failed.
> 
> Make the register function return proper error codes, and bail out if
> errors occur. Proper cleanup, i.e. unregister any clks that were
> successfully registered, is done in the new error path.
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
