Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A13CD37B9
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 09:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GzkP1cbo3uhDiI8RTWfPuOLr+m/6pu1/TS22Ej5vuK4=; b=WnXRkSJdnmCVp83053Tvc5af8H
	U9YEqJ2ZB5U2JaNFiveJUV2x9YZFeAIhJRWzCCMAUYA/Sfois8DO6ias/eEiPCrXTKtvLuBboJOwg
	K58NensvLb/NfeNuOpnctd2eaXDFMhO/NloDeTkDHe82F4Yrn4xZlYov0cC0HhBiUTrcEinoSrO6X
	PEXJ4O3Pg3PgvefnBse/HNNI8Ub7qjM6Ec1J7w8CffWEh0JOjb5naiAx2bqxST7/eOGJTF+BAnXeE
	YRfaiO77hpoNHOwxM0JSauf3/BxwL4I8Ne2MDqG0qtr8eg/7JMDztt0QvPIovlgft+g1XE9e/QQq/
	zt/IKUqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN4G-0000000Cx2e-1Xl4;
	Mon, 11 May 2026 09:36:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMN45-0000000Cww8-0Oe5;
	Mon, 11 May 2026 09:36:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778492198;
	bh=nJVhaxXXmDzSLSMXB0xDuXEWi+DbP7+9iPgK6noFTxE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BMQtbLmtYmzRVJQj0ueFEwb9UqXJwYhbuP8LgxRTDoc3mLRVdxPPzO5mPXcDPCgb4
	 juEZHmA5wZnRq1K+EWjF5DYmIRYq/WeCO91Rx1dyIeh2X3AGC89xWx06f8oPk7R6eF
	 YJXpCcfGKaMV++I8VjUu8M0HL18amlSXpHx1cftNojRa/ehk3SdB0nlLzaWTaTyH6n
	 BgR5d/1AF2Kpv1BSQklkArpOOR6RS+ZswH7mkrDUOtCHBLuB0VLbdtCS802JQHoZuo
	 A7BRO7PWms7rc/cMugvhtHfbn3D9OsnBKcX5LtMJ0+KrPWg7jOwsTxoVWpMKKPSW2x
	 DcLC+2GZiAS0g==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 18B2E17E139E;
	Mon, 11 May 2026 11:36:38 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Gene Chen <gene_chen@richtek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
References: <20260414-mtk-g1200-pmic-cleanup-v1-0-2a7193ed4e93@collabora.com>
Subject: Re: (subset) [PATCH 0/3] Mediatek Genio 1200-EVK: MT6315/MT6360
 PMIC regulator supply cleanup
Message-Id: <177849219804.115964.16914242540907037927.b4-ty@collabora.com>
Date: Mon, 11 May 2026 11:36:38 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_023641_310165_FD2800BE 
X-CRM114-Status: GOOD (  10.66  )
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

On Tue, 14 Apr 2026 13:44:09 +0200, Louis-Alexis Eyraud wrote:
> This series goal is to cleanup the power supplies of MT6315 and MT6360
> PMIC regulators, that are either missing or incorrect in the Mediatek
> Genio 1200-EVK board devicetree.
> 
> Patch 1 completes the MT6360 dt-bindings by adding the missing power
> supply descriptions for its buck regulators, that already handled by
> the mt6360 regulator driver.
> Patch 2 adds for the board the MT6315 regulator supply properties, that
> were added in the dt-bindings by [1].
> Patch 3 adds for the board the MT6360 regulator supply properties and
> fixes the existing one.
> 
> [...]

Applied to v7.1-next/dts64, thanks!

[2/3] arm64: dts: mediatek: mt8395-genio-common: add MT6315 PMIC supplies
      commit: 96d997e13892479b5bb852e42ac65bbaef86ba9a
[3/3] arm64: dts: mediatek: mt8395-genio-common: add MT6360 PMIC supplies
      commit: 2585bab2cdf4331068c5bf626f6625c38c8d299e

Cheers,
Angelo



