Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D558CD128A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 12:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0v9XwCBNXYfIeEFEFu27uSJPT4eU17MSOiwiMSP2u2w=; b=DsqPQB8TuwuX4WOtjhEIJQRnZM
	zGsU3s/Q50k8BtQkQ1swrgi0wykhqzDzqThYTNGraFUaCpGvpMrzGaPjzJ0vfdF2VgBeePZlhlLu8
	lEngnKP4NzX6mLz0b0LF5SEvtDKHraDHcrtIGxlGsvPWiX/443DYIrs+omgTIlv+xH0Pe5pPtwhR/
	6XYP4j3zOU8vSkX31YtYoh0fDRKXw9P3XEWfgzlY2p1WP3STUqbXyxiD5+YNyCLhPaVrvfXJ9M0VY
	dBHoA54oLLyUzLddQB8Iasej4pVlaqtyHvde2twg5HY1GWTlOwotnskyTgVH2Wv6m1sX/SSV+GRp+
	eR9q11hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rutsf-0000000C1b1-1SuO;
	Thu, 11 Apr 2024 12:50:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rutsb-0000000C1Z4-1TDf;
	Thu, 11 Apr 2024 12:50:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 47F6D61DAC;
	Thu, 11 Apr 2024 12:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0254BC433C7;
	Thu, 11 Apr 2024 12:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712839811;
	bh=ghhbkHFttaYEjJHVjRr/ilnDerHWeK7MUzrODyMNXmw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OWJVvaqorSRZngp3/okydGojUSKq7iNPdBU/NUvWv8FKs4nmabOoTJJ65LHS4wIFJ
	 Qx3Mz8bTlYROaapLliXHHCAEptuzPViL4pjfkhrWb/+EQHUYuulW3a8Mu1+T2yTGlq
	 0D40Ib9M8YZDnveIp06UTsnK1iwxTSB5mkUfKCQBBPkB472mWq93mzfrAut858RKLM
	 Wk5z3aAPSw0FvMeR+VilnJeLz9vgeQ/aK8SAeITlEYazeQZpnKtM06iJ0PW+7Ql3Iy
	 l3xN23NUXSHJ4uTy5K4U+1VS8MfIgFmKKvaC8MMVwtB3DUm0osm8pKQhc8Bsi706Qh
	 e39b0255P8VbA==
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Lee Jones <lee@kernel.org>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20240402202413.757283-1-robh@kernel.org>
References: <20240402202413.757283-1-robh@kernel.org>
Subject: Re: (subset) [PATCH] dt-bindings: mfd: syscon: Add missing simple
 syscon compatibles
Message-Id: <171283980874.2354899.3662943965972729204.b4-ty@kernel.org>
Date: Thu, 11 Apr 2024 13:50:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_055013_479647_DBE9F0C2 
X-CRM114-Status: UNSURE (   6.92  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 02 Apr 2024 15:24:11 -0500, Rob Herring wrote:
> Add various "simple" syscon compatibles which were undocumented or
> still documented with old text bindings.
> 
> apm,xgene-csw, apm,xgene-efuse, apm,xgene-mcb, apm,xgene-rb,
> fsl,ls1088a-reset, marvell,armada-3700-cpu-misc,
> mediatek,mt2712-pctl-a-syscfg, mediatek,mt6397-pctl-pmic-syscfg, and
> mediatek,mt8173-pctl-a-syscfg were all undocumented, but are in use
> already. Remove the old text binding docs for the others.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: syscon: Add missing simple syscon compatibles
      commit: 9f43ae67db2a3d85cf2b5eebc3b54c8891200b5c

--
Lee Jones [李琼斯]


