Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CDAEE2084
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Feb 2026 10:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvOhV3M/QBbgjrcEx8qeuRUy1VqmTxMQQXRpbVHPN/Y=; b=UX3fcc+usWxTGk65EyPYOSt2wG
	dAXnvHsUc85PfgTvYkLzVkH24as8c8UVUMUvR8gfYI/tK/4aV2G5jjl6q0KTuhE4byqdK4uyp9g1K
	OO4O+sNwhWilzff5IKV+1/X3bo2ckiB4fvO5NKsyNQlss14+3+UWaAE5o37peylcJkTZz8VmmyqCb
	oq8KcWLAPDOFESmAIIpIUugmHxoL5Mmp6jgbwia7As699/ujsV5eRacDEcCnIMBR44XXSf41IHAu7
	5s5JqkPYH1LLFwz3Hdi9JzzWXB+zyjpbpvtwvTnLuRiISdILAgyobncyV7TjkrIhbyfPoAm+2mCvS
	o8/zjZ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIxP-0000000BAWs-3w58;
	Fri, 06 Feb 2026 10:20:59 +0000
Received: from ahti.lucaweiss.eu ([128.199.32.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIxN-0000000BAVa-0Cnp;
	Fri, 06 Feb 2026 10:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1770373253; bh=hW1y+4RnYCDFlCJ8eDAD1QUcPOaENLmR0lDQL12MGuY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=drbMME86Ogl6L0kBG53NS+yYgz/ZBTwwfzzrSrqxh8R2glF0mCy0RvYJBrlcoDP65
	 K8L3RipJxfuvRM4EbZIZ+RiffnwWDU2uHw+oBnCfBi0xprHg9CSoTjtEhYyAZpfiAw
	 8nPv17RebT3pWr4T8G2lfy1Mx51sliNeTPdAQaCM=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Fri, 06 Feb 2026 11:20:49 +0100
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8516: fix syscfg-pctl
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-mt8516-syscfg-syscon-v1-2-96dcb37acdb4@lucaweiss.eu>
References: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
In-Reply-To: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 phone-devel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=717; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=hW1y+4RnYCDFlCJ8eDAD1QUcPOaENLmR0lDQL12MGuY=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBphcCDpTDBsjyGZzws0QiiLO+nk5cJ1JdGUiv+k
 AzmT03sAi6JAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaYXAgwAKCRBy2EO4nU3X
 VptJEAC3YRzi+gckFaL3vgrMJio1ngXDFN0ka3GWygwg52KRviu5Fv0S7Tx5K5QbV3v67pvQ0/7
 Iqosb6q5/bTFYA8t8bfiOyY75dLKtqnGcX03Cd2BfBJ50iFTgbAfbcUnnqWo7h03ubjBg/TVkVc
 W/Y+zZs/U7cpBpc40n07uFbEga0iIYhiYLlM2L/tviT47JeEi2SroXZi26JvuvbkkmeYAAnlUYs
 8iaWiQ/MWHXvmh7/T0NmxmozxqJt+4rSi1LU+shAIlLVvHeucBQ600ssN+YMBuCOsOOQRXEhj2d
 /MxEDHzmRFwsjXCHkerz7zaDVEgV2UAXicalqfp7TdM9ni3SGQ48XcuK8MsydauQ0XqyIlwMaiw
 590VZEZy4UDcLgurZi2HUapLga6Pd5RQ+5793C4Skkar4LA5Gy7fgB+9BbyyBGdUAVfvMCwUr4j
 yjSU6eXDWAC8I3l582kjFDjmCM6zUt+X0F7YNPLRC9BOvQ/YQAthryd5vYdOymsMMVC9Ti1vKUI
 uwS33bz+O9jugI5LBAkArXfiB1/3CDiugx7/eM9dy2FxpIfY0rHP7MXYt2t0VNxGRV4noTOqQf0
 r/PPto1A4J/NCKps5713VuriXeWLTjaWeCBeWHnyp+i9xAb1VfGpVoPEB0laDiU8C9FLgxh2DDU
 bdduudg3GXgZJCA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_022057_242210_28810F63 
X-CRM114-Status: UNSURE (   9.89  )
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

Just 'syscon' is not allowed by the dt-bindings, so add
mediatek,mt8516-syscfg to it.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index b5e753759465..67836407d0cc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -232,7 +232,7 @@ keypad: keypad@10002000 {
 		};
 
 		syscfg_pctl: syscfg-pctl@10005000 {
-			compatible = "syscon";
+			compatible = "mediatek,mt8516-syscfg", "syscon";
 			reg = <0 0x10005000 0 0x1000>;
 		};
 

-- 
2.52.0


