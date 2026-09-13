Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 109B4C88E5A
	for <linux-mediatek@archiver.kernel.org>; Sun, 13 Sep 2026 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yk6Bx5863L5VZWI386ImEYX8oEoGZMlDrpaQMRb0xOA=; b=EfEMHbBZvPkXeioPPLN9jyQbEA
	bMjB2HQn2h7J0HTXXTn+Z8K9c1ycwwt/VvXEzVBnNsgVHGCjjAYSsijVx3legmZgxgNJXUINfo1O5
	ShOtgjLwl8ENwhXzt8WcabPrOKpR4HKMNkFhTYGt4OxgAQybZKN+k37xH+Hy2FvMXFyhHRX9cWFsX
	arkpEedlcm06EurSQ4yPVeEQOzXNON32Kb+lSFpJpf8adjzZuPTVJBfwKoLDlJ4ksIKy5qKt5Z+QQ
	gCbHJABsZHZ0QUyT1tUI2rgKs7ML+oG/UZg6wQJgju3tbgthsS5On6rXV0IVwWXMxE63ISVYzCJMM
	LI3jQszg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5htV-00000001bjj-3Cew;
	Sun, 13 Sep 2026 10:57:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5htR-00000001bi1-2Vsy;
	Sun, 13 Sep 2026 10:57:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AA41444F1;
	Sun, 13 Sep 2026 10:57:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADD5C1F000FF;
	Sun, 13 Sep 2026 10:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789297025;
	bh=yk6Bx5863L5VZWI386ImEYX8oEoGZMlDrpaQMRb0xOA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PbfIeS+v8bhDF9i2Dlp10MWv+rMH5mQeNziX38SXYA7VePYBUV4drNB4nHfcXnM0C
	 7BkUHvBda7JmWsuCSiPFCT30HirKNDUWxSbaPmI7oiD6BSf/CymObfYcaEKSUPVtbX
	 q5fdw/TI5018U6ugPBMnxUWlJovYIq+0pSgFtMpzAc7EPTH6EdPpmJQwocSuc//ZEX
	 efbL5jsmVMRqgwY/49UwmhLKW++3J6PtCbMCg0r7RNF0wjCEjfhMzFOImrln05DTrt
	 TqrzG4irL3AfvYNuK7Rv3EXXyjwW9dm5KCkrfPcJDc/XzuqCX6EozC7R7SPFyVSmcB
	 CiIQyTwDKxFGw==
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
References: <20260701-mt8189-dt-bindings-tphy-v1-1-5848a2be8303@collabora.com>
Subject: Re: [PATCH] dt-bindings: phy: mediatek,tphy: Add support for
 MT8189 SoC
Message-Id: <178929702027.215437.1601170548620063289.b4-ty@kernel.org>
Date: Sun, 13 Sep 2026 16:27:00 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Wed, 01 Jul 2026 17:36:49 +0200, Louis-Alexis Eyraud wrote:
> Add a compatible string for the MediaTek MT8189 SoC, that integrates a
> MediaTek generic T-PHY version 3.
> 
> 

Applied, thanks!

[1/1] dt-bindings: phy: mediatek,tphy: Add support for MT8189 SoC
      commit: 29dd1189fa167c5374027502ddeafa8300dfa871

Best regards,
-- 
~Vinod



