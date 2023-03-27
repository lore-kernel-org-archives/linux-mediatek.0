Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E612C7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCQ+MygXunT7oGDuwwdnzm3V02skdS96iMOBpF606CE=; b=HL5FO06phmKRJVBnOLOYArxu/f
	qIyIIepsEBsl2plKaffuRpf+1jWC3gh48SRPyZnPMjAZ5XaOOY+c9YqzP+E/7sKx9rl757Y7wIhAx
	SZx6TZ33VPABxx3jQFGLCQEBEYBdaR53AKSY9s+s5HgwUzZqIk8ZLQDQ/pO7oyI105CZbPMcZ1JUi
	oHjIHhQQs3OyckFZb5Whya/BRJGb5QY4GmzozFIUhBOMeseHUhTvscy1Vh6csh3SDNrv2nKWPq/+x
	iCTExs8JYmPQAGM6z2S5uQSCbaBuGGSVonNQl0zwC5Pr1tuXicx0jWIrRVMhFGEEGrkn2ylGSiNoI
	wKPaYzTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiMr-00AHqx-1L;
	Mon, 27 Mar 2023 08:38:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiLf-00AH7y-17;
	Mon, 27 Mar 2023 08:37:07 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 65F93660312B;
	Mon, 27 Mar 2023 09:37:01 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679906222;
	bh=B7Q7CvpVnU7TsRYDdxFDdSefgx35z35TKL9n9ACkUg0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vpeh3mTAKR3/91/MvTtBXsgMh3DpUAZnX4a9ErZJJZEWJ5RYbglwR/M6/RHj0MAKR
	 J2gi5nWNqGdAZ7DKXhNK+opYgVdl3dgzkN7Vz0NZ7Se1RMuAW2jXISS3XDXq5bS4LS
	 4oqG59B/WrFiXxUEOlpfKfuuq/RzpJdEFUQvEI0cwtnabHnlFDnLa3iMygQKFuWLdw
	 vnwBkmB1LaRnb1G+Ciri9qCfrJCnN7onhRih4dQzR7209Dd1MrZIs8DvnqBI4eDQfQ
	 tQJnZTjm/9KoYJGFZ5X9O9LmsQApAgHjOI7s2tmJWepG2u3JlR+CBKm/PEFRs0gE0E
	 lGUPQhIuuhYQg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: qii.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	houlong.wei@mediatek.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 09/17] arm64: dts: mediatek: mt6795: Add MMSYS node for multimedia clocks
Date: Mon, 27 Mar 2023 10:36:39 +0200
Message-Id: <20230327083647.22017-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
References: <20230327083647.22017-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_013703_521884_E2948A2F 
X-CRM114-Status: UNSURE (   8.62  )
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

Add the MultiMedia System node, providing clocks for the multimedia
hardware blocks and their IOMMU/SMIs.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 0f903e8fe70f..b721971d4e5e 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -634,5 +634,18 @@ mmc3: mmc@11260000 {
 			clock-names = "source", "hclk";
 			status = "disabled";
 		};
+
+		mmsys: syscon@14000000 {
+			compatible = "mediatek,mt6795-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
+			assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
+			assigned-clock-rates = <400000000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
+				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
+		};
 	};
 };
-- 
2.40.0


