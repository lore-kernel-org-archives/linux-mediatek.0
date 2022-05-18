Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A737FC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 09:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T6du83mUacbeC6GFnxNk7lHtak4cmN9z2HRdA6BMMw8=; b=KMMM95MILDL00E
	7U9IAmNVicFXGFor9sPq3772C6+MLez9ivcK61HuTEQ30q/e408+hpZJfE7qQVOeYQfwF86ymqHAT
	yiLGAZEQrYd9jsMDHYlkx3GHpaK45Auy2K26pCp5j2nJRWAEJGMXz/QXOkm1sLL8RdGWYUYqQVQlN
	nSxsoEODPMaQpge9uOTPadz59i+qiCsYSAntXiWFZKRTZH4RR/Oc2ovMxIa3co0cFXNCIkC6EzVLN
	8W5X7C5Apxw4B6NPMLlqr6LFCxNDWN6NroKiLwygHmmNlPBVtSust84UPM36t+K/JDBaL1xui65Nv
	lSjSgPyJ9Jvgd+vW3ILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrG9s-0016QZ-1t; Wed, 18 May 2022 09:39:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrG6i-0014WN-8w; Wed, 18 May 2022 09:36:42 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 15D181F4245A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652866598;
 bh=w9vxsEMxP8ZOb1eaXm6eHhoM0t+W1qSfwTk8Rrym1/g=;
 h=From:To:Cc:Subject:Date:From;
 b=c12qUofxh1jcKvqyHR90xzkya+PqzExM/e5MgMle18x752R4y1/rC4ESRDslCQlwZ
 SwhCSmFXQ4/IqXkTyfoAxCps9XzbvmOSWc2TxvDjntf34scgiliCXPNDbjak+o9CEb
 6wSqHXthviknwmxGuCpKNpgzgxNgc7IlwYn5QU0otRY+Xrbfibs/OjVfBcT5kQ1AKv
 TyQRNpbIY1F2RntBe8d+94OCR+rlyZ5lOUrt+S7xL7VhAP1NnFz6sG3remSt0MW4Q1
 S/8Af3A6QYjs5wDyM7ZH0kQSn2G8wuUrprno3WAXk3vFM1XOoZa7xPyjdutKg99k7n
 2GTp+7ttCH+vw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, wenst@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 krzysztof.kozlowski@linaro.org
Subject: [PATCH v2 0/2] dt-bindings: arm: MediaTek: Fix clock bindings
Date: Wed, 18 May 2022 11:36:29 +0200
Message-Id: <20220518093631.25491-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_023640_473322_12F1C1FE 
X-CRM114-Status: UNSURE (   8.84  )
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

As per Rob Herring's review [1] on my mt6795 clocks bindings patches, for
which I've used the already upstreamed ones as a base, it was found that
these bindings have some issues.
This series is addressing the issues that were found by Rob on my series,
which are present on all of the already merged bindings.

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20220513165050.500831-5-angelogioacchino.delregno@collabora.com/#24859953

Changes in v2:
 - Squashed patches as suggested

AngeloGioacchino Del Regno (2):
  dt-bindings: arm: mtk-clock: Remove unnecessary 'items' and fix
    formatting
  dt-bindings: arm: mtk-clock: Set #clock-cells as required property

 .../arm/mediatek/mediatek,mt8186-clock.yaml   | 29 ++++-----
 .../mediatek/mediatek,mt8186-sys-clock.yaml   |  1 +
 .../arm/mediatek/mediatek,mt8192-clock.yaml   | 46 +++++++--------
 .../mediatek/mediatek,mt8192-sys-clock.yaml   |  1 +
 .../arm/mediatek/mediatek,mt8195-clock.yaml   | 59 ++++++++++---------
 .../mediatek/mediatek,mt8195-sys-clock.yaml   |  1 +
 6 files changed, 71 insertions(+), 66 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
