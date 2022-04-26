Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D5AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 00:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsTqPWaEmDjxy+71eaPd9gA5giLOXw4J4Cbf2rkxp5A=; b=CTHHmcKVnCw/k4
	zv07AvR1QFGmfoe5IfZY/xhy+5xOmRsrxksG7F7T5J6zuHQNRAo0c1phFRdz+pjh4PT/DqhcN2P95
	lwPe84Encd7haxLtGdt/+BMvwCgdxlOWmJORjh4pqKSxx1w3Xj9Ww8rey6Bww5IslF/uWF7pNCRyV
	IbPuIkeJI5IeB4zFQgDa3mI5QybfnOb43ZkmWDvqdV/yvjMPdx7xyX+IJxUskBKWe23Nmusi03w1f
	irCRnrx2VQMobAAW3NqAoQFl99AlhutotL3urPFM5Ub0iTqt3rUW+dmXJ3fjXKVbb1kM27M+URit1
	sFwhhEc6Ws5GMuJFGFOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj8tg-00BrwD-JB; Tue, 26 Apr 2022 00:17:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj8qR-00Bq0X-JG; Tue, 26 Apr 2022 00:14:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D2A65B81BA9;
 Tue, 26 Apr 2022 00:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF98C385A4;
 Tue, 26 Apr 2022 00:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650932054;
 bh=QEJdt0UF+tcaaYi/1FBeIDbmE6yAI30SB+nMUM/acVY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=Xa23/1HeSPEmrAY+7btpsAjJaEMl6FCq0pvD2lCqvOPrCwtvxYLTtKLy82oac81uC
 lr9xQV9AcEuhSEmPK9bpEPM3eVTR2YQZNC0kidP8I5w4VjgMntGYs3A+7NT25jhaBS
 e+8vqnTTTgI2LuyV5tDbG878OJP43HKDfr8jf/7ZJc2+eE4IqkfLUVfOauIRLRpYk5
 +EzHcG3NEpdalYvhOSZvKsMVvoji5U87FQ9MG97gn3LLB+aZfO9B3XKOK3gVPRGhPD
 5nVezUJx8ORAU9rqRmbI0xx6FwGCRbRYqLQLkSwlM9pbwfbVhn4rxX1/a6MwGqnfzK
 lZBbIVnDITaRA==
MIME-Version: 1.0
In-Reply-To: <20220409132251.31725-16-chun-jie.chen@mediatek.com>
References: <20220409132251.31725-1-chun-jie.chen@mediatek.com>
 <20220409132251.31725-16-chun-jie.chen@mediatek.com>
Subject: Re: [PATCH v5 15/15] clk: mediatek: Add MT8186 ipesys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 25 Apr 2022 17:14:12 -0700
User-Agent: alot/0.10
Message-Id: <20220426001414.6FF98C385A4@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_171419_906089_86A3C2B4 
X-CRM114-Status: UNSURE (   7.34  )
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

Quoting Chun-Jie Chen (2022-04-09 06:22:51)
> Add MT8186 ipesys clock controller which provides clock gate
> control for Image Process Engine.
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
