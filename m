Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BACDC83F14
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Aug 2023 20:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZslckIXUfvTb7HhtbLv2KJdAL1dbgthghKBZDBglA04=; b=hfqvQdcZAkYrVbYnumLf6WAS/z
	mRWN68AKOfzoWqPRESR05xdoKiYV8dOGBeJTbEiSg+gO6wLNk4Aj4Z+F9OCCnVD95BMGYfAvqWUL0
	NqqWhZuRsBlA6fH/ec9dIjkP0V1nFqW7famON7Gl75Kg8MNTOOutnem4bMtpaUzjPJTBVsc95Svh8
	veoH2Er7iQu3Jz0l18tMW0X963/lX2hYaxn4NSeIOLMH6Sf6kmS4O+GG+/HKSA4qP3j9TCgOOvm3d
	aKFVoRc+hW7xM2LYndguTNjqbLtjayxHDHFjx0bhkzJDk0RiPNorNxmbeTvNwF82QOz2vW9BXZt3c
	/1yzgcyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRQW-00E6Tx-2l;
	Wed, 30 Aug 2023 20:04:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbRQT-00E6TA-0Q;
	Wed, 30 Aug 2023 20:04:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 93FEE616B6;
	Wed, 30 Aug 2023 20:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3329FC433C8;
	Wed, 30 Aug 2023 20:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693425868;
	bh=YCL9PhU/MC4FiTPUCeTzmOP3k5ymDEVl1+7e5QGt7Bw=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=arBX2E7XFgPuX2+l+ekmxSPU+Q+oSVmjPbC9Z355gCHSwzystQ03PHDnfKajiBdeF
	 aPHe8UFgO873o5qwo1XfCxqVFzjudpkrJRLyFQHHetdQzcI8VbViGOHQNbamOYeUSO
	 cLvurQ61ne4umkWB9qzBK8ScEd7wC/bFLWnWYKMpTDQOrUIW/CViPf1Ewg+MljoROF
	 S5JzYQkJVk/Fl6SCMls64oR7UE4b3pLoUQpqf4zzY6UzNiaTpTPoGUp6xhx+oEMrRd
	 JCFPigi19hu9len0+znv2XpcW9++lgK/iu0Y1SJndLQPcN1iPnhimLs1FpBVjxkt/X
	 H9WD+6DVzeL7A==
Received: (nullmailer pid 715676 invoked by uid 1000);
	Wed, 30 Aug 2023 20:04:21 -0000
From: Rob Herring <robh@kernel.org>
To: soc@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: Fix "mediatek,merge-mute" and "mediatek,merge-fifo-en" types
Date: Wed, 30 Aug 2023 14:56:34 -0500
Message-Id: <20230830195650.704737-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_130429_259121_62B55D99 
X-CRM114-Status: GOOD (  11.64  )
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

"mediatek,merge-mute" and "mediatek,merge-fifo-en" properties are defined
and used as boolean properties which in DT have no value.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 4dbbf8fdab75..a9e52b50c8c4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2957,7 +2957,7 @@ merge1: vpp-merge@1c10c000 {
 			clock-names = "merge","merge_async";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xc000 0x1000>;
-			mediatek,merge-mute = <1>;
+			mediatek,merge-mute;
 			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE0_DL_ASYNC>;
 		};
 
@@ -2970,7 +2970,7 @@ merge2: vpp-merge@1c10d000 {
 			clock-names = "merge","merge_async";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xd000 0x1000>;
-			mediatek,merge-mute = <1>;
+			mediatek,merge-mute;
 			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE1_DL_ASYNC>;
 		};
 
@@ -2983,7 +2983,7 @@ merge3: vpp-merge@1c10e000 {
 			clock-names = "merge","merge_async";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xe000 0x1000>;
-			mediatek,merge-mute = <1>;
+			mediatek,merge-mute;
 			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE2_DL_ASYNC>;
 		};
 
@@ -2996,7 +2996,7 @@ merge4: vpp-merge@1c10f000 {
 			clock-names = "merge","merge_async";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c10XXXX 0xf000 0x1000>;
-			mediatek,merge-mute = <1>;
+			mediatek,merge-mute;
 			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE3_DL_ASYNC>;
 		};
 
@@ -3009,7 +3009,7 @@ merge5: vpp-merge@1c110000 {
 			clock-names = "merge","merge_async";
 			power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c11XXXX 0x0000 0x1000>;
-			mediatek,merge-fifo-en = <1>;
+			mediatek,merge-fifo-en;
 			resets = <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
 		};
 
-- 
2.40.1


