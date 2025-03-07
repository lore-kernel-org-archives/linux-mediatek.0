Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D78C19F32
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Mar 2025 04:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GsxSiAUY8gIW0rKNWS5fXVl7nSgevJ6sl+dGukX1DfY=; b=wF8eW/W12Y/T2ItkzQXgunmXCJ
	viSQKR8nISIJNNn5khnXDRiegoLmSSNgl5zxwEBSY/1qvAfp2nyKiaRJ+ULI/txpR4I9/4h0ikBzG
	b0I79QVGrJsrDIKh7MAC8eq6c3LVNBML6krmRsjPEB1DwnOs15o9UpPEivIVYbaEc753NIfSCpQKK
	p49iwECe2+r28Cx0MGhqpbVJqD3UkOrOW8iD6pqtQ4QN3D7+CY7bcb8Lf2TckXaYoOM+TmROG7lpc
	Juw2eo7bzICskatteCqc3Dd7Uo4SO8lXFZX6rKcZZuIMPQCcb/Gm4MnBvulOwHVptScZZx/6qUUSS
	3OCaqQZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqPS9-0000000D8LU-3k98;
	Fri, 07 Mar 2025 04:36:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqOeA-0000000D25p-0pee;
	Fri, 07 Mar 2025 03:45:15 +0000
X-UUID: 90ceab7afb0611ef83f2a1c9db70dae0-20250306
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GsxSiAUY8gIW0rKNWS5fXVl7nSgevJ6sl+dGukX1DfY=;
	b=bTKNBLe/269VlaANpfIMwdauWRiTKhxYWwsc3hlJLbP5LYRRfLGH7DWR3OmCRt3stkTL+q9+r+NHY5tek7CkGJJ7EBsJ25yE0sHhCaDt1/bRYBuxo079QOfsehbamUNAB/wYBBqw2nUfZBDY+iyJKw9BXy+Z9ITbdMTROwL+Sh4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:17ced812-0a97-4c63-9dd6-025e9a6d24d0,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:0ef645f,CLOUDID:478e21ce-23b9-4c94-add0-e827a7999e28,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 90ceab7afb0611ef83f2a1c9db70dae0-20250306
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <guangjie.song@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2144750870; Thu, 06 Mar 2025 20:45:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 11:45:06 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 11:45:05 +0800
From: Guangjie Song <guangjie.song@mediatek.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ulf Hansson
	<ulf.hansson@linaro.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-pm@vger.kernel.org>, Guangjie Song <guangjie.song@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH 11/13] pmdomain: mediatek: Add post init callback
Date: Fri, 7 Mar 2025 11:44:35 +0800
Message-ID: <20250307034454.12243-12-guangjie.song@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307034454.12243-1-guangjie.song@mediatek.com>
References: <20250307034454.12243-1-guangjie.song@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_194514_241118_85CF3C79 
X-CRM114-Status: GOOD (  11.61  )
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

Add post init callback.

Signed-off-by: Guangjie Song <guangjie.song@mediatek.com>
---
 drivers/pmdomain/mediatek/mtk-scpsys.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pmdomain/mediatek/mtk-scpsys.c b/drivers/pmdomain/mediatek/mtk-scpsys.c
index c10756fa1685..7bfe36c1a1ae 100644
--- a/drivers/pmdomain/mediatek/mtk-scpsys.c
+++ b/drivers/pmdomain/mediatek/mtk-scpsys.c
@@ -250,6 +250,9 @@ struct scp_subdomain {
 	int subdomain;
 };
 
+typedef int (*scp_soc_post_probe_fn)(struct platform_device *pdev,
+		struct scp *scp);
+
 struct scp_soc_data {
 	const struct scp_domain_data *domains;
 	int num_domains;
@@ -259,6 +262,7 @@ struct scp_soc_data {
 	bool bus_prot_reg_update;
 	const char **bp_list;
 	int num_bp;
+	scp_soc_post_probe_fn post_probe;
 };
 
 static int scpsys_domain_is_on(struct scp_domain *scpd)
@@ -1691,6 +1695,12 @@ static int scpsys_probe(struct platform_device *pdev)
 				ret);
 	}
 
+	if (soc->post_probe) {
+		ret = soc->post_probe(pdev, scp);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.45.2


