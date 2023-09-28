Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3E74CE7AF9
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Sep 2023 03:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ETV3uvY2t5pyG7tSx2oNrbQ48yrl0EaNtIVGqfBrfsU=; b=R+IGKDHyTTfWQ5/2upTdvo6sRu
	/09CtXU9PUkES/wqvaio9ssld49rUleSdVXR+8DQLmnN44FKd0QWVuXwVodmyQTklU368Or10qKAa
	IXnXPMIJ8Cew+LDJYjU2TC/X/N4pKOsH2qzP2s7QCWQF6saCSr7q89Cz6uyXIz3eXJrtq5WE55GWt
	LEBbdrgf+HE8Odr+vsLO7zE6XLlUkKpI6b9YsaGlDGaTpovTKwZ5wK0rSJH08YQwKT0I07W8SyFSH
	5cjk0J7SyO5R0QQcJ0TSAIIhWivUAqZMHldJpYHzn4Fhm4Hek3NeHDM2cGqI0EX86kl/GAOUsoGe2
	PrA8rWDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlhxq-002Cad-1x;
	Thu, 28 Sep 2023 03:45:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlhxn-002Ca9-2u;
	Thu, 28 Sep 2023 03:45:21 +0000
X-UUID: 6ec6ccfe5db111ee86758d4a7c00f3a0-20230927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=ETV3uvY2t5pyG7tSx2oNrbQ48yrl0EaNtIVGqfBrfsU=;
	b=MH2NSEAm4ixrXMrBOxOG8N3+xG5/a+oHhEVKQVOHpWrmtE/5T953phRc/Z6ZbSkmV1iPUtXK0f4jcvJG8/k7zd3jk4zi6Ryp3kpvmtppvXcGQyy5S5JC+BOQqluqczyLo8/J4kmuuI32/PETCXwJW7yWvcc1edkicgeu++LqWi0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:a14f4cad-c221-4056-8270-fe92a188c2f6,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:3b9b8dc3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6ec6ccfe5db111ee86758d4a7c00f3a0-20230927
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1447750356; Wed, 27 Sep 2023 20:45:14 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 28 Sep 2023 11:44:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 28 Sep 2023 11:44:39 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Bjorn Andersson
	<quic_bjorande@quicinc.com>, Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio
	<konrad.dybcio@linaro.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>
CC: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] arm64: defconfig: Enable DWMAC_MEDIATEK ethernet driver
Date: Thu, 28 Sep 2023 11:44:26 +0800
Message-ID: <20230928034426.7986-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--0.515800-8.000000
X-TMASE-MatchedRID: dO/0Gy3rD8+AaBshbPhdTKDH6drx3JPVUXlp1FHYSPVAtKM3hDDAfOgV
	4TkxLE0x4vM1YF6AJbZhyT3WNjppUtAtbEEX0MxBxEHRux+uk8ifEzJ5hPndGcTghlcjDXgaCCx
	3Gz4FSGemAlgtRNFEVK0UCCzrhBFBWTPqSw1gK9njjifHWVOUs7QIU7HipiFstJlrp3uGY5XGrs
	I39HQMTRz+PhojlLUuev0YPTN868QBqq+/+aGCsQhzL04Or2eZVlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.515800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 7C1EEF146B8EF846653D289A72CD884228CD8586E3393B18D6E0AB1D78BC9AEB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_204519_948020_A04F3756 
X-CRM114-Status: UNSURE (   8.93  )
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

Enable DWMAC_MEDIATEK ethernet driver to be built as a module.
This controller is available for MT8195, MT8188, MT8395, and MT8390 SOCs.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a25d783dfb95..76105021b854 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -361,6 +361,7 @@ CONFIG_SMSC911X=y
 CONFIG_SNI_AVE=y
 CONFIG_SNI_NETSEC=y
 CONFIG_STMMAC_ETH=m
+CONFIG_DWMAC_MEDIATEK=m
 CONFIG_DWMAC_TEGRA=m
 CONFIG_TI_K3_AM65_CPSW_NUSS=y
 CONFIG_QCOM_IPA=m
-- 
2.18.0


