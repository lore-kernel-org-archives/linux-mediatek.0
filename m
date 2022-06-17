Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72859C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 23:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhRg7v7iVwbYcPixKt4d734zL1BGaOlTNX8WioMZxOg=; b=rfqRBql1pz2msnK8FBx/3zHNaQ
	0P6WGxMEfifioCOxMuQmiIGPHpI1zom/fSbNk8qzQR6m7kHle3KsJlEOjB1+mf9jeXiZ7EIwLL7qt
	j9gInEnHa4ayve9qWKeF+0fDz7NSf+gFR7Va8uKcOIm3ddObbGxIzrAakwt5DNxFama1BuwQvPKuS
	Cq6Yj6ZVw6f2AkmdVoqLONKSpR3kE0H6B+eLrWgopy6KFH8FQCL8E67ednXwzwtGujWrIhH3tqGG6
	ISzZe7aIU65rRnyywbNFYvvS0fzF9WiORTRItceZjL2qjWULpcwFIuxF2+DgphS3GnzcpIPiD3FN7
	d0AHlWyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2LS3-009eFh-2r; Fri, 17 Jun 2022 23:32:31 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2LRZ-009e6c-6v; Fri, 17 Jun 2022 23:32:02 +0000
Received: from notapiano.myfiosgateway.com (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9E2CD66017DD;
	Sat, 18 Jun 2022 00:31:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655508720;
	bh=nIpAmQ9qPs2TwbqhrUmn9gsTTFLPJRRk9xBahMemHjw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oozUUfD3UffUQZwHuB2+M1iZ+3Ch+qEgieLytLLvI9yMSJJpEBBZCT1b3tzK7mC8A
	 QKQ9WRQbhIPXXcfo+mHW0g1FryTBU6JulOWp3dKVlEx5cMaveNlywPh+oqWXH8NkJ+
	 MXFHNSVoOkt7iDczhlz5GlUbovLN9rf8IDWuszQChIdM77kM/G8tfivQsl8Je/uOZA
	 XQYUM9a2y60siCyWOMA7QNIzS+CXADx9lTeRjMWgwFoC6a40BFzJuE/XnSIJDwiasN
	 VCUb8QpvMO5gptarMIkgFD0cnaVsQ+vfmnqpWECza9c6hUlQNKkrZ+u5tUY0HOPcD6
	 9DFfd17exuMxw==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	James Liao <jamesjj.liao@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] arm64: dts: mt8192: Fix idle-states entry-method
Date: Fri, 17 Jun 2022 19:31:50 -0400
Message-Id: <20220617233150.2466344-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220617233150.2466344-1-nfraprado@collabora.com>
References: <20220617233150.2466344-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_163201_420207_E180DD75 
X-CRM114-Status: GOOD (  12.28  )
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

The entry-method property of the idle-states node should be "psci" as
described in the idle-states binding, since this is already the value of
enable-method in the CPU nodes. Fix it to get rid of a dtbs_check
warning.

Fixes: 9260918d3a4f ("arm64: dts: mt8192: Add cpu-idle-states")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index c739e910883a..d5cae38c842a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -172,7 +172,7 @@ l3_0: l3-cache {
 		};
 
 		idle-states {
-			entry-method = "arm,psci";
+			entry-method = "psci";
 			cpu_sleep_l: cpu-sleep-l {
 				compatible = "arm,idle-state";
 				arm,psci-suspend-param = <0x00010001>;
-- 
2.36.1


