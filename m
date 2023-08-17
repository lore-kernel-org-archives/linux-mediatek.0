Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AB19C2FC0E
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6UalgFGN0l1ulWyf08LUfx22RUHg0HY+3Vqj0JEgamM=; b=of3JaojKK0babP
	buwsAnVOQYQyncgdWtR/txR8sTa/VUeMHWFhBIs8hgxBriZIygCEJV198DFW/vnP8hqZwPrdvYA9a
	9+tUCXRdmaA2AdFRe/bveC42W8yga3jdUnOJRh30FpUXbp0uroqa07fhN8svQg8a0MUD4ntQi5MoJ
	rv6eTeEwKQOA2xfGg/8M1WeFPvB4gJfzc0rRTav2ZbyFurGHk1w3IxY2QkIuY7/g9SOooV/ceDVsu
	W9T5XyGelRe+gz0zKJnNWG92FYinch/l5A6QzA3ohmrmMYGXCc/EZEekGM3lr2wzsGjcG+5ZMmzdh
	eLoXcs8NIkq0mANv1+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZjJ-005z88-2p;
	Thu, 17 Aug 2023 09:55:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWZj9-005z4o-3C;
	Thu, 17 Aug 2023 09:55:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 822DE63944;
	Thu, 17 Aug 2023 09:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B3FC433CC;
	Thu, 17 Aug 2023 09:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692266138;
	bh=pXiGancAeYKnPcvOFhUswbg11PDFY6ZLcz2zikEUJVg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=brXns1YmUYp1vyVgROcwnPjf7nbY3k2odTOaRRIPfWHHZ7WMV1Rw+ZQdpvvtLe1Es
	 CG+otVE+H4qlFvN8qoV0Z4ZGjKYCdwLZ+05f+I/kRQf1383ISYuJg81eLSY0qC6NZ5
	 SP8uShxTY5gRC7/w5RPLAf2I0PN1LQl/riWzj+6tGdy/lVuykGoj5dF3cFVAplmSRf
	 5r/1GbONOFOIRZ3AQ+RFAJxmAgXEq3CZEMYdeTrIuzomhjanU8DnQnoKomzC5eCAkp
	 tavvCchX8+cCNvXuUmHSMcEgM/9GhoqUeLH+LKP8Tymw+wGSjJtBj3PG71HBQyd/IU
	 9xMkTBlrvXe+A==
From: Vinod Koul <vkoul@kernel.org>
To: linux-mediatek@lists.infradead.org, 
 Eugen Hristev <eugen.hristev@collabora.com>
In-Reply-To: <20230814093931.9298-1-eugen.hristev@collabora.com>
References: <20230814093931.9298-1-eugen.hristev@collabora.com>
Subject: Re: (subset) [PATCH v2 1/2] dt-bindings: phy: mediatek,tphy: allow
 simple nodename pattern
Message-Id: <169226613323.81413.1101515821069495424.b4-ty@kernel.org>
Date: Thu, 17 Aug 2023 15:25:33 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_025540_092007_B50509C9 
X-CRM114-Status: UNSURE (   7.76  )
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
Cc: kishon@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, kernel@collabora.com, sam.shih@mediatek.com, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chris.obbard@collabora.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Mon, 14 Aug 2023 12:39:30 +0300, Eugen Hristev wrote:
> The pattern for the nodename only allows t-phy@... , however, for the case
> when the t-phy has no `reg` and only `ranges` (basically when the t-phy
> is just a parent node), dtc will throw this warning:
> 
> Warning (unit_address_vs_reg): /t-phy@1a243000: node has a unit name, but no reg or ranges property
> 
> For a node like this:
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: phy: mediatek,tphy: allow simple nodename pattern
      commit: e4077ca4ebdefa1b4616e4dafcb67b621253b233

Best regards,
-- 
~Vinod



