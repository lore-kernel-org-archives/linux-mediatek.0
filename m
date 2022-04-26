Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E58C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 00:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WbZYMHfXhSosUvQ5FkvrWLPK9e80H1hm89yVeNRRThE=; b=RqcuDoIvGMFJCw
	ttm3OogY+7HDmUSVGR18uXLTgTq8Um0ccL1XWErPOPxagUEHL0I1iZ4FRhYnV/7a49Jpu/aVLmMXO
	ZHg/EJa+CLS02RYNWpOLWcWaXb1d2lo3FS3y6P5inWWodf7smTl0PfTmJgZVc4BDCQXeSxdMD53us
	X5AtqoGHaIqFm0nAZmOZhL2Vv12XaAqkTOn4I3qW/oZBO2ukBkymsc2bna3q0o2ANGtB5K86L7ZVZ
	DWmg/98U1on9lNIXmfXGEqXUhbwj+lsgeXbJq9Mhg9a1qE+iNfCjsNldKJaxWoe4s3+siL9OHG6J8
	n5mvzFIKJfrcU08Iy1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj8qP-00Bq0o-0Q; Tue, 26 Apr 2022 00:14:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj8pF-00BpJy-5M; Tue, 26 Apr 2022 00:13:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AEA7361670;
 Tue, 26 Apr 2022 00:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E4FC385A7;
 Tue, 26 Apr 2022 00:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650931984;
 bh=Hrh1VQOQSxMXh2r9jSxNFGh79oV4DZwnQhUUgmt9wNI=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=iUNtM2bvex+d7TZEr1gpe9H6tZBpSWAwUA4rgzANJjviS+rHpawWhpqOpBIj2nadt
 9GUlPORNZm92b8O6VWKFOqC5pZU7Mmj5mgB06vHWonkU1Yf5wiA90X4K3+fbVrIMvz
 ytCFVsPJKtk1bMycpepOT7yMLHcbNEEcRFMOAMR9iqC0VrY1cM2iU9SMZfLOZ7tbjE
 DMAyUBj/cnWPCW3Yf7JWDmjnnLaHEBj9r9Ux8pKFiVCQ7m5NiBYYkqj6FP1VBvEFEF
 j6LXD/jDzi55Zksr6Am81fKtGXg1DftdzNzYxdVEX4/Ku+1llAEQmHmKX+WJLWXupg
 Z9TPZ1QhkKVUg==
MIME-Version: 1.0
In-Reply-To: <20220409132251.31725-8-chun-jie.chen@mediatek.com>
References: <20220409132251.31725-1-chun-jie.chen@mediatek.com>
 <20220409132251.31725-8-chun-jie.chen@mediatek.com>
Subject: Re: [PATCH v5 07/15] clk: mediatek: Add MT8186 mfgsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 25 Apr 2022 17:13:02 -0700
User-Agent: alot/0.10
Message-Id: <20220426001304.10E4FC385A7@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_171305_264255_A3AE80A6 
X-CRM114-Status: UNSURE (   7.72  )
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

Quoting Chun-Jie Chen (2022-04-09 06:22:43)
> Add MT8186 mfg clock controller which provides clock gate
> control for GPU.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
