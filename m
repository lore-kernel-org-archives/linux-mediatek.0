Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CADACE79AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 08:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A9ALiqMP0XKS7MqHyaj8E5hr3z/qH7isSEOBbejDVbQ=; b=AZgBndsQxaUxctexaqVoaVR1if
	WMuJIhU9UuZyiY5FfbXtqUAH9qHuY5ao06f0cNz3qLrggHarFmGB8wGXwfQkLoD6tJ2GwHLz5Owsn
	gz6kvdk4Q+LUBvs8CKPy4l+ScR+Wc7T1DIY+y07n43Huiv1I8YWGxT+C89TLPEkrApvyyU9jQIyaV
	7Mc9l0zXc4FuzJEDTHN6BKSC8ey6nx/7NYl4PD7YHGVR0oACb8Ph+D6UwgPhHH14RbsUS4l6pR40x
	31Xvrsoyzil7VkVvoy6vzcv2t3lROTbk6OYIylC/xXiRLE9Qll6zqXMRhRtdcCjfdOIx7dlHCjL0J
	yMhHopvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qit1d-002MFZ-1I;
	Wed, 20 Sep 2023 08:57:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qit1a-002MEN-2f;
	Wed, 20 Sep 2023 08:57:36 +0000
X-UUID: bba81e34579311ee86758d4a7c00f3a0-20230920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=A9ALiqMP0XKS7MqHyaj8E5hr3z/qH7isSEOBbejDVbQ=;
	b=Xc8CTE9BkId4pU7fpOoHGdhWKQ040R5osSHdCM++YEqMqNea7TG+SS9+LYsdLEyEPxQ8/wWT5lE2J6u56dXjZhj9D4U9uSBs+0sHG0z1PfSOkbo9MXJv2mx4LrsYzc/kySFZvYbM4eFfv2xvXI8jAaIjNVdjpZ3bx0orSR+kT3Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:24cdb03d-5eeb-4be7-86f4-3aadf23b7c2e,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:5f78ec9,CLOUDID:9c123fc3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bba81e34579311ee86758d4a7c00f3a0-20230920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 648122221; Wed, 20 Sep 2023 01:57:31 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Sep 2023 16:46:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Sep 2023 16:46:53 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chen-Yu Tsai" <wenst@chromium.org>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
Subject: [PATCH] remoteproc: mediatek: Fix compatibility of probing SCP cores
Date: Wed, 20 Sep 2023 16:46:11 +0800
Message-ID: <20230920084611.30890-1-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.155100-8.000000
X-TMASE-MatchedRID: lpk7+cih7u/Cpdw+7xrhskhEDfw/93Bugqd6JzaZubNnL2dIbsYl/0Ue
	RhGY4VMdpfeDl6R2Qb6+fZHd7VPSkPIejw19Z0aT9iItFUn3XkOFr3qfbdwhiNnH6NX3JoGqljC
	EZrozxnJOFu8ssjxG82O1fqYTlb8QroQgRZf2+t4tMfCdg6KRDZYcYQ11P5U/myiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1HI2pSDhttZ8gEz00G7LODcdCg5JW0OFvBKw91MZ9UveyLpLdioc4DQ==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.155100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 664E116E23EE59936449445FD53CC766206D23BF2896EF10212A00298EFDE24C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_015734_872119_B0CC41AF 
X-CRM114-Status: GOOD (  17.17  )
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

The SCP dt-binding introduces a new SCP node format to describe
the multi-core SCP HW. However, the old format for single-core
SCP is co-existed with the new format. It suggests that
there are two different approaches, using either the old style or
the new format, to describe the single-core SCP HW in devicetree.

the driver checks the immediate child node name in the SCP node to
determin the format that is being utilized. The node name is expected
 "scp" for new format and "cros-ec-rpmsg" for the old format. However,
the expected node name for old format didn't defined in earlier
SCP dt-binding and the old node name is "cros_ec" in old devicetree.
So, this checking breaks the compatibility with old SCP devicetree.

In order to distinguish between the various forms of SCP devicetree and
maintain compatibility with the previous SCP devicetree, this fix
verifies the existence of the compatible name "mediatek,scp-core"
introduced in the new format.

Reported-by: Laura Nao <laura.nao@collabora.com>
Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_scp.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index ea227b566c54..76472e50c8f5 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1144,29 +1144,29 @@ static int scp_add_multi_core(struct platform_device *pdev,
 	return ret;
 }
 
-static int scp_is_single_core(struct platform_device *pdev)
+static bool scp_find_core_node(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(dev);
 	struct device_node *child;
+	int found = 0;
 
-	child = of_get_next_available_child(np, NULL);
-	if (!child)
-		return dev_err_probe(dev, -ENODEV, "No child node\n");
+	for_each_child_of_node(np, child) {
+		if (of_device_is_compatible(child, "mediatek,scp-core")) {
+			found = 1;
+			of_node_put(child);
+			break;
+		}
+	}
 
-	of_node_put(child);
-	return of_node_name_eq(child, "cros-ec-rpmsg");
+	return found;
 }
 
 static int scp_cluster_init(struct platform_device *pdev, struct mtk_scp_of_cluster *scp_cluster)
 {
 	int ret;
 
-	ret = scp_is_single_core(pdev);
-	if (ret < 0)
-		return ret;
-
-	if (ret)
+	if (!scp_find_core_node(pdev))
 		ret = scp_add_single_core(pdev, scp_cluster);
 	else
 		ret = scp_add_multi_core(pdev, scp_cluster);
-- 
2.18.0


