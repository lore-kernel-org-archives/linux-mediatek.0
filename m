Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4361C46CA2
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 10:46:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dV6tSYTNC+uhm1CMTDZ9AT7yKRQ0JyoGRL/4zUU3x+M=; b=p92UB6CxBeC8hsRINfoNZrkKad
	78NhYNVuoD3E86ouKsFU87BWwR0qPvtR4okse6A19jHdWiRuo4RdqaLYeewzcmmuMly7732uwUEd4
	omzfeqbgJzLzVyXXNHTGn3YFBNBx3d1fZHuwM+Y/9H/53kl7LRO3FbM4kFaVUc89cC0eQ1w+xojHt
	DrcHf4hqnK+Gd/3i7cDV7RkMoaeb9RYlxWPVG4z5MT52UaTfN4TFxKjdN7OCVLH7KXaPYIBrQvUqv
	NMDRPrxVdbXd48g0Vk67yU9wFSZg6Y+YcUUpIwztOdybDig8zd5FuFAohvlZ5T3llcQO/AoOSkH3i
	Fl/QXkFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5hy-002ohG-2F;
	Fri, 15 Dec 2023 10:46:18 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5hp-002ocE-03;
	Fri, 15 Dec 2023 10:46:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702637167;
	bh=rGGTCz6fC8SqIRMnJnpTvc4YBHRGm94VHUh76jbuvmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=owmenZs/XRyWFRAzR+B8F5jaIondhoqwxKoJn4Iu33rTXYsNJ/cWJ/BVvFCGh2HUQ
	 Bf5hRoK9Ko5WM4Eh/DixCiVAy50kiXpeXiRzYzRj6X0lNe+yIsFMDSly48U+B6ejqQ
	 0Ay+gDRHlJ0tQlMM9SvCPbESKCzHSnYAbX4LSHQlQJz82hFFm32U70eNgzsHmYKNFs
	 sY3AChb6IERBsrGuCCOKuEo7I5eWP2b7EC/1tYjqPp/5NNU62KmaNhH1RVAHcHPo9P
	 cRcc3KIWWM/z0WbPlwyXVekPIzTEagxYzo+wrvxBd7cyF313v9UA3Wwc0QPJ+nh3GG
	 rCjLluIsAoQRQ==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BF2043781FD7;
	Fri, 15 Dec 2023 10:46:06 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH v2 4/7] arm64: dts: mediatek: mt8192: fix vencoder clock name
Date: Fri, 15 Dec 2023 12:45:48 +0200
Message-Id: <20231215104551.233679-4-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215104551.233679-1-eugen.hristev@collabora.com>
References: <20231215104551.233679-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_024609_223041_2BA5E813 
X-CRM114-Status: GOOD (  10.35  )
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

Clock name should be `venc_sel` as per binding.
Fix the warning message :
arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: vcodec@17020000: clock-names:0: 'venc_sel' was expected
        from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#

Fixes: aa8f3711fc87 ("arm64: dts: mt8192: Add H264 venc device node")
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
Changes in v2:
- new patch.
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 69f4cded5dbb..f1fc14e53f8c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -1770,7 +1770,7 @@ vcodec_enc: vcodec@17020000 {
 			mediatek,scp = <&scp>;
 			power-domains = <&spm MT8192_POWER_DOMAIN_VENC>;
 			clocks = <&vencsys CLK_VENC_SET1_VENC>;
-			clock-names = "venc-set1";
+			clock-names = "venc_sel";
 			assigned-clocks = <&topckgen CLK_TOP_VENC_SEL>;
 			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D4>;
 		};
-- 
2.34.1


