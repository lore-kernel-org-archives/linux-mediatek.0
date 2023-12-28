Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0606C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 11:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=093or57AIqaXh1vKlIBxqkVoSx9Rw949ok5pyNS82k4=; b=aQomPORdy3n+dnq62SrYKfC7+j
	lmhNCl+vx4RfEchICu4cJ6YBnGxdkfUTz3/C8gqXfrTX/JXcBAzth6jye+oCyj9iLsKRT/S2OJUy5
	UdHmOSF8HHgfOfY8aPu8Fj6N5OLDh+aZELRcsp40wLjs+6QRFqeWWpqAXFwlvXyatJwmOUl+JW3bA
	dZ5cv2k38flafYVzaev5zc62X+SO4D3fkL0aucuxCsZHFxboN5gGE7U2pkeoASZLSQxlqB3chbXBg
	WUfIYgcnGpaeKzdVS8nBybqkZ2AeH+C238ctGTukiG9s2jjnuxJJICQ3I7zvTG8odvKhLcFTH7F1B
	UAFF+IyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIodW-00GfwP-1w;
	Thu, 28 Dec 2023 11:33:14 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIodI-00Gfod-0n;
	Thu, 28 Dec 2023 11:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703763178;
	bh=UKLiDUqrGf0WLlbwWi1S7+Qnzm0QHjQnG9ZdogBAtm4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fQAx2LamhPw+Uj31n8b3jsi8mSzHVykF73+dbzIGT41sOhvzcoUIfKABJkiYj25GA
	 5KMHfMYMCDnlNLuVXTfm67uKTEAWuHxkjbxKxkqM/b6G+rUIkvZrFFiZfLSRESxe59
	 E17EImF0OiqlKUm9sy+LiXozFRV4qGabOFTbIuUzSLbmpHVB9W6KnsXdWv93sbfAVN
	 /iHvLOXL2S0PpQOW8/v2BmvUqfUcaiY8GSWV087X6OU+SjzMw+g4SpLkCmmnHgwyot
	 qfJi2jWHOb1LZN4dfQqlzwVdummMaV4+5cIMuUceGARfJUMkvIUoLI0e6EzxXqcP6x
	 6n/jVWLsSU47w==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E532437813CB;
	Thu, 28 Dec 2023 11:32:57 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org
Cc: eugen.hristev@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 3/6] arm64: dts: mediatek: mt8192: fix vencoder clock name
Date: Thu, 28 Dec 2023 13:32:42 +0200
Message-Id: <20231228113245.174706-4-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231228113245.174706-1-eugen.hristev@collabora.com>
References: <20231228113245.174706-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_033300_507026_F34A2710 
X-CRM114-Status: UNSURE (   9.48  )
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

Clock name should be `venc_sel` as per binding.
Fix the warning message :
arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: vcodec@17020000: clock-names:0: 'venc_sel' was expected
        from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#

Fixes: aa8f3711fc87 ("arm64: dts: mt8192: Add H264 venc device node")
Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
Changes in v3:
none
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


