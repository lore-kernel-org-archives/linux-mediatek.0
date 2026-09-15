Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409BAC88E75
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 07:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/K27mxe9awqLXCoqsJ9jRsb86rIPPKQr7g5yuTtOxfw=; b=fW2gJHIPsu+OyOsDwocBsE5I5r
	pXad1MLNrDdegEGkcuud53fKDR5nBP0KCszsIq+oEYjy325swp5f1sjtlP9x88ZViceTShtJs4QFG
	LwPKEaLoNFTJ1FKb6shFP7KKwXn5aA6pPknDG1yT0CrPa1pktgl0IudR52tAJUY2kgFGQ40OUsp09
	DptCdv3z+ENutKP4644WBM51iE6kuloF//M0WnEFWIwaAZbEkWhczKvD+b/94SfOyF/1FugajUGy9
	nahvIXIlSU4MQzrOnL7JY5pSkiOvb2EIBWP7Id/1BQavBw2AkF+VDbzep7WQQzwFU/pMOEJOO+yfV
	vSPoJ1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NIc-00000005QJX-40m9;
	Tue, 15 Sep 2026 07:09:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NIb-00000005QIx-0aJo;
	Tue, 15 Sep 2026 07:09:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E0C0600D1;
	Tue, 15 Sep 2026 07:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8541F00893;
	Tue, 15 Sep 2026 07:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789456187;
	bh=/K27mxe9awqLXCoqsJ9jRsb86rIPPKQr7g5yuTtOxfw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=B1UzSc44GeHez8fe4GxW50BmLJcwpPxJ5MBOv9/9uF4lPIvzChHxfAWDPhIIOrkJa
	 YYuK9g4rNlRXLDEMetEwBg6K9T+RQvb1PQmtRBrcAZCQ7VpiBNN7SjRJSC8tDyL/Fu
	 nxs2tLQO5/rm7IZg5slYRKJwohTxOzJkCT5iBUaBXrLqZxaQdXWObhx8kpLZjMy86x
	 23ubFKkCTRg7poZNwd4p8iONlQz9v5NkWN3+K3AuvRu8Wii9MyBVgJm2K+hqr2MwT4
	 r/ilSy3cPNU629VQofgcuR0hTsOTPZs2HVNcnroJZlhOeKlPR1cpnkMTkC52aoaODe
	 aYeltPa4o9Z8A==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Congcong Yao <congcong.yao@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Zhengnan Chen <zhengnan.chen@mediatek.com>
In-Reply-To: <20260831-8189-smi-support-v4-0-8ae66dd3eeed@mediatek.com>
References: <20260831-8189-smi-support-v4-0-8ae66dd3eeed@mediatek.com>
Subject: Re: [PATCH v4 0/2] memory: mtk-smi: add MT8189 SMI support
Message-Id: <178945618368.44717.5402356332875633769.b4-ty@b4>
Date: Tue, 15 Sep 2026 09:09:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Mon, 31 Aug 2026 14:52:05 +0800, Congcong Yao wrote:
> This patchset adds MT8189 SMI support.
> 
> The series updates the MediaTek SMI bindings for MT8189 and adds the
> corresponding SMI common and LARB support in the mtk-smi driver.
> 
> Based on commit e30626823a40 ("Add linux-next specific files for 20260828")
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: memory-controllers: mtk-smi: Add support for mt8189
      https://git.kernel.org/krzk/linux-mem-ctrl/c/605e6053de5c639abe4cba71644cd3c5fae46374
[2/2] memory: mtk-smi: Add MT8189 support
      https://git.kernel.org/krzk/linux-mem-ctrl/c/771c036d72eefe36aa6c953ecf44bee4c000a368

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


