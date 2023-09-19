Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751C0CD54AC
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 09:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M+Pqjjyz5ZTGZJ4hfXwCOtDQXFkzRBUJzshKf45oTz0=; b=SMZuSbdbwmMw/yhxy9K3bbZKYN
	K/p9wDXlblwA6QUvXEpNpw2boUL0Z9gPcFF0Sqj7XdbMgJoIwPo2m0+H/cSI6ksjeJN7bLWuSYgrF
	rzq1X9KLvfVr6q3OM7D9nabbA6i8IE7/QK9yyn8keU4fisYgCjbfESTOnupugLL6pnpTo8572RmMh
	sIAytk4Do7U/VNCxIuE9sNC9B6xOdohGmQi9U0KDI+oQ8jrUPHz94fFMZt3Cimvy52slXUwLvyMJN
	Kp9tTTcwElYIcMo8DBk9bz5AQBmu5gLKsYiwOloubljLsKR9oyxCtp9ig4pGfoPb8N6IK1mErNOrd
	tUXjWgjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWxS-00HRh3-1k;
	Tue, 19 Sep 2023 09:23:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiWxO-00HRg9-2z;
	Tue, 19 Sep 2023 09:23:48 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 81B0F6607033;
	Tue, 19 Sep 2023 10:23:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695115424;
	bh=zr0JHbMPGnoB7W9Ga+/W4aCptT35gdUdHKTnbXaS1ao=;
	h=From:To:Cc:Subject:Date:From;
	b=gNu8uZ5h9bSSKMbkyuwIc++hFOXW8AthBtEaGp3olqat7QhHQQV1yuUtznTL1opyi
	 6q0B7NFlvHsusyAPXPORN3XaXbLKZmXO1j/E7uzxgJ2V0GE8Nz1yvy9gnMnbc3NvFG
	 Vtb2kKQLtGwLlFiBELpiW94r74dHWzR3WxMfZy6Qc99xsrT8lshAUErJPPF56y+stf
	 qTMarH6dNKpDv/yrvG0m9i/VvI0N7+bDPI3c0FtZFOr0wACFERn/tqjFW+ftkSoO4R
	 ZSAMMZ/Si1RGBHYK9sSf+/u0r5MxmIW2kfsqDOuXESccspqQ3uyAUdkMI7KaYbODCz
	 0fEralOeKOMnQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: mathieu.poirier@linaro.org
Cc: andersson@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	tinghan.shen@mediatek.com,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH] remoteproc: mediatek: Refactor single core check and fix retrocompatibility
Date: Tue, 19 Sep 2023 11:23:36 +0200
Message-ID: <20230919092336.51007-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_022347_142638_6BD886DD 
X-CRM114-Status: GOOD (  13.05  )
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

In older devicetrees we had the ChromeOS EC in a node called "cros-ec"
instead of the newer "cros-ec-rpmsg", but this driver is now checking
only for the latter, breaking compatibility with those.

Besides, we can check if the SCP is single or dual core by simply
walking through the children of the main SCP node and checking if
if there's more than one "mediatek,scp-core" compatible node.

Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_scp.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index ea227b566c54..a35409eda0cf 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1144,29 +1144,25 @@ static int scp_add_multi_core(struct platform_device *pdev,
 	return ret;
 }
 
-static int scp_is_single_core(struct platform_device *pdev)
+static bool scp_is_single_core(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(dev);
 	struct device_node *child;
+	int num_cores = 0;
 
-	child = of_get_next_available_child(np, NULL);
-	if (!child)
-		return dev_err_probe(dev, -ENODEV, "No child node\n");
+	for_each_child_of_node(np, child)
+		if (of_device_is_compatible(child, "mediatek,scp-core"))
+			num_cores++;
 
-	of_node_put(child);
-	return of_node_name_eq(child, "cros-ec-rpmsg");
+	return num_cores < 2;
 }
 
 static int scp_cluster_init(struct platform_device *pdev, struct mtk_scp_of_cluster *scp_cluster)
 {
 	int ret;
 
-	ret = scp_is_single_core(pdev);
-	if (ret < 0)
-		return ret;
-
-	if (ret)
+	if (scp_is_single_core(pdev))
 		ret = scp_add_single_core(pdev, scp_cluster);
 	else
 		ret = scp_add_multi_core(pdev, scp_cluster);
-- 
2.42.0


