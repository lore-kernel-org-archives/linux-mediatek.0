Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A929CAC592
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Sep 2025 03:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0SOWbLw84OBsxZriedsqK5hxUT6sNCYYaMQDUt04bA=; b=SZyY2seoUZFqmn+Pvt4UsXd9G5
	yDijj0TJ3ishbpDwjvDUcXBYZ6EMU9wGYCIhdEVNwgQLRB74WT73+s5jyo7wIYJpuHQxnjKvUQDCh
	FRUeLLAaAC9xwWe7T3D4yfX5cMUEg6PFPXadn0zTskoNCkNboPmx3iDjtRjAvFCWFov8DL4VQ4o1r
	2VKV0K85/HLwy7n5BdUfaWu6kx1BWj4cwrLu5Y3zHHAb/bDJzhXFmOhtqtYVy/m0Demk6LSYMJm4d
	HtKRPLfWuTnyNyEqbqaKVBpWSUlVMUvt7/bTUXBQVCHfuuWYbCfcsMdMSHK5+nNLiTt9HCE08UpED
	D64stQMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XhK-00000008k7d-2OmW;
	Mon, 22 Sep 2025 03:58:42 +0000
Received: from p-west1-cluster5-host12-snip4-10.eps.apple.com ([57.103.66.231] helo=outbound.pv.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0XhF-00000008k5Z-3akh
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Sep 2025 03:58:39 +0000
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-0 (Postfix) with UTF8SMTPS id 97E47180072C;
	Mon, 22 Sep 2025 03:58:34 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bryanhinton.com; s=sig1; bh=k0SOWbLw84OBsxZriedsqK5hxUT6sNCYYaMQDUt04bA=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=xdqJdTDl4PTuY5yyelJOWXBYGsD6SFvelOfbzxdGVIVo+Smqm6z3waDMZX0Nu0tYJRuYvrduxBVriNXPO/UgsUDVp+ho2iVlX2NE5pYbE5/P7FanWNSegw2DM3xpom41XdmdmUTf0Xv6VJqLkoV7Vbv9q2qtWKQA8OTJVytkfgXmLp8kgssPvejQdetb5c408zUN8m3iGuwY79Vav40z7DeGRGVDFfC3QXMQuGiMhps2Xd+IYgoIoKBYSYksH+oJYc27s6CwhYkdt+bJIYrRDeI6qBmVw2k+xG329n06/pMu0K/e9g2wJ920rEVRJVorE2tSRhAF6D91HYM/xh2pJw==
mail-alias-created-date: 1643268037438
Received: from localhost (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-0 (Postfix) with UTF8SMTPSA id BC4341800173;
	Mon, 22 Sep 2025 03:58:33 +0000 (UTC)
From: Bryan Hinton <bryan@bryanhinton.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	daniel@makrotopia.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bryan@bryanhinton.com
Subject: [PATCH v3 1/2] arm64: dts: mediatek: mt7981b: add labels for UART0/1/2 nodes
Date: Sun, 21 Sep 2025 22:58:09 -0500
Message-ID: <20250922035828.2941327-2-bryan@bryanhinton.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250922035828.2941327-1-bryan@bryanhinton.com>
References: <20250922035828.2941327-1-bryan@bryanhinton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 16us1-7uQ-icvud8FCfkJX5TH-XTXojo
X-Proofpoint-GUID: 16us1-7uQ-icvud8FCfkJX5TH-XTXojo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDAzNiBTYWx0ZWRfX/kB/Z/VgWHMZ
 bGPcgeuOEXLri78acByacKphJi5QY6QxpNIgU0eqfvlOGcgoei2AgwIutO0uiRtqofCZ4wCXQ+U
 ZvpFTnAhwcrkDG6+YqXt/xmrKiQz4Idk4kI0IZ2lqhjN1OLwX0BTREFrlWdBawqYKA4TIWHgJjB
 cI3U5C13VdJwGjGqmGpgU+E1KseVnIp5ErxTVxMLCshryLsJZOblunz1OhIZbJU+u/KPDN7XhQw
 9wZDwkUplriiC/5i1fnzg0AOma/oajT7YpoBPFZgwRVMCt3B2q2LycXfeM7Ksr4FxyL/zH0Gs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_10,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999 clxscore=1030 spamscore=0 bulkscore=0 mlxscore=0
 suspectscore=0 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2509220036
X-JNJ: AAAAAAABXmXmdxg3OHjerRfjKPm6KYJ4ABxHzCP9HsIfYf0MFwJKu55EvjTkLDQ8cPXRNPB2fa0JxZY7Vh05caRl49e2FEADvBgp5VfiwRvdRNRPyprdzVYaKxeu0OwqFNcoSa3ZpuT5ibYmCykjgj1L43k/iFy3cLg0ZpKX0IZqujwkkj0E0uqjMtXDZIbQ+5Lp2vFJui6sTDjjBtRgoEhqoUHEh/YKOhsO1k2CbXgrcRs4wvFyMqWrF2gv489aMIMkv6AW1tLwdwuN06xl1CQPsQ2zN9nGPul03wV6WMALvrJFITbxbbneclTaWWNE5sgt0xxUt69JcEAExD8ffXiRNN1NuPMfJ5PrIUafFJ6P8TYzq9DTScvBeGek+r4AUoSHmFX1c1YNEiNVuF/owS+JJPm5ORCY3kA7uyw4Hp1XTyCVmCY/FwqH0M3Rp2BclFd6MFiz8YTvCXj1uYwwvF3qF/vLoQdn8ZB2skIcGsR5pSRcpBGVNIUnUUgB1FccZ+1ZpR7uXOONFso4pHjM1LN0osK9QLq2U1rlGEOFh5uwLc2dqJDpHZ5LHKUqXq6UswtbO6F7mK8wAnvk7+P5tq7ijwlsGO1FwQQOoXE9Wic+0/FbBQl6irSZQNiQpmVrmwgrP2dU/jBeaACZTXUFXJOsnNgKGbBdJobcwoZb6HsLGPt2QcV2ohgMHVQW6orkS2bMfPxTiFmAJL3B71NByxDMDs4VRoXUJF0Yb3DfKHqYmpSp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_205837_903502_C196F719 
X-CRM114-Status: UNSURE (   9.75  )
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

Add stable labels (uart0, uart1, uart2) to the MT7981B SoC UART nodes so
board DTS files can reference them directly. This change is purely
cosmetic and introduces no functional differences.

Verification: Built dtbs and boot-tested mainline Image+DTB via U-Boot on
MT7981B hardware; decompiled DT shows the uart0 label present and the
serial0 alias (or absolute path) resolves to serial@11002000.

Signed-off-by: Bryan Hinton <bryan@bryanhinton.com>
---
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
index 5cbea9cd411f..4ee7fb83000d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
@@ -94,7 +94,7 @@ pwm@10048000 {
 			#pwm-cells = <2>;
 		};
 
-		serial@11002000 {
+		uart0: serial@11002000 {
 			compatible = "mediatek,mt7981-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11002000 0 0x100>;
 			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
@@ -105,7 +105,7 @@ serial@11002000 {
 			status = "disabled";
 		};
 
-		serial@11003000 {
+		uart1: serial@11003000 {
 			compatible = "mediatek,mt7981-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11003000 0 0x100>;
 			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
@@ -116,7 +116,7 @@ serial@11003000 {
 			status = "disabled";
 		};
 
-		serial@11004000 {
+		uart2: serial@11004000 {
 			compatible = "mediatek,mt7981-uart", "mediatek,mt6577-uart";
 			reg = <0 0x11004000 0 0x100>;
 			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.51.0


