Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBA1CE7A95
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 13:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6cnfI5ytzDCvg+dOj6lTpy2XkiFT0LZU5C3nD7lJxK8=; b=sw5Ev/dvEdI01vfBb/UPiTfTYm
	fg3I7U6N/paACNiqn+hY3+96x7kldcK2Ygmgm1Fi/6VHKbBYe3lZIYrVMYu/Wc2R1ZeKB7/OTvRBr
	en/t1ptRhg+Dd+ggk12cRbgBYNTnPkfcwYSfItwUY2pjpxldZ2evcN7alqlOgwtfVrHLmdO59eo5x
	4sRM0KjFAHqAYdNXs7WS7LLGkQcO3YTq0T9ytvocetYhPNti1ng7kcDOFBUYTXsQ5NxceCyvK9CiY
	aFCIc6uhDe27YpdRwYAjwC9/I+T87Jvg4yqGqFF7St1/ZkDvL8SeeDw9rm+O6SsYw/tAz38iQXc/o
	EXqqMQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qklTg-00EJZD-0k;
	Mon, 25 Sep 2023 13:18:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qklTY-00EJT1-0K;
	Mon, 25 Sep 2023 13:18:13 +0000
X-UUID: f5fd977e5ba511ee9b7791016c24628a-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=6cnfI5ytzDCvg+dOj6lTpy2XkiFT0LZU5C3nD7lJxK8=;
	b=kKPDUhqHDfjVpJYyjDBiYY/bZMVvJqSEKdOESTe5uUshKX11md0XKsjOriiCmfJYHs5C1r2u2rMvCdhA+ReP52TFOhF/uJ57xny+/Ij2wnCxwr1XM7K+Yyp7/+PqCy5is0+zBnJSiPvUrSp+fCJ6/FyjTuJgo+vaQqLfp4Ydr9o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:56517085-41aa-4108-a5f0-ad6245e7e73a,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:a8e33fbf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: f5fd977e5ba511ee9b7791016c24628a-20230925
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1643793019; Mon, 25 Sep 2023 06:18:04 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 21:17:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 21:17:27 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Russell King <linux@armlinux.org.uk>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <yj.chiang@mediatek.com>, <robin.murphy@arm.com>, <xuewen.yan@unisoc.com>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] ARM: vfp: Add missing VFP instructions to neon_support_hook
Date: Mon, 25 Sep 2023 21:17:19 +0800
Message-ID: <20230925131720.7672-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_061812_143731_45D4A27D 
X-CRM114-Status: UNSURE (   9.96  )
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

Add the missing "Unconditional Advanced SIMD and floating-point
instructions" in [1] to the VFP undef hook.

This commit addresses the issue reported in [2], where
executing the vudot instruction on a platform with FEAT_DotProd
support resulted in an undefined instruction error.

Link: https://developer.arm.com/documentation/ddi0597/2023-06/?lang=en [1]
Link: https://lore.kernel.org/lkml/20230920083907.30479-1-mark-pk.tsai@mediatek.com/ [2]
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 arch/arm/vfp/vfpmodule.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/vfp/vfpmodule.c b/arch/arm/vfp/vfpmodule.c
index 7e8773a2d99d..b68efe643a12 100644
--- a/arch/arm/vfp/vfpmodule.c
+++ b/arch/arm/vfp/vfpmodule.c
@@ -800,6 +800,24 @@ static struct undef_hook neon_support_hook[] = {{
 	.cpsr_mask	= PSR_T_BIT,
 	.cpsr_val	= PSR_T_BIT,
 	.fn		= vfp_support_entry,
+}, {
+	.instr_mask	= 0xff000800,
+	.instr_val	= 0xfc000800,
+	.cpsr_mask	= 0,
+	.cpsr_val	= 0,
+	.fn		= vfp_support_entry,
+}, {
+	.instr_mask	= 0xff000800,
+	.instr_val	= 0xfd000800,
+	.cpsr_mask	= 0,
+	.cpsr_val	= 0,
+	.fn		= vfp_support_entry,
+}, {
+	.instr_mask	= 0xff000800,
+	.instr_val	= 0xfe000800,
+	.cpsr_mask	= 0,
+	.cpsr_val	= 0,
+	.fn		= vfp_support_entry,
 }};
 
 static struct undef_hook vfp_support_hook = {
-- 
2.18.0


