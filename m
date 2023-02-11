Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FCBC61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Feb 2023 11:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0cX/KtHqdJqb6Rrw059A36ailM7NF0OlYLzCM1/MQlg=; b=w3WcQCoT9tAbgP/eIojLfX/c9Q
	A8lQ596bfPMaX5Vi2fuCF/wS/jw00JEXqs3BFG/VJt4HgJSiuIg4G4/m5kcCLHpP0hdc2R18tFH1K
	+j7pkXPELa0op9Zk5zNdsQFuK2OGWpJB9oEJnzvjB7XJrHvBeltLU5uXVFW2mNl6dikarOujCHlQG
	22XMeNqZ/oVS8+3seP5tMFgxbri8kzjDnzoZmYbe+YFarSaVCTM0fpWQO1U5Z/bLS37MGT6QoctTk
	ILW3brvi92DQtspfne6Y8ghQXwyOF8ABaN9xAce/xn9IEBlzJGNGuxNzV97GTfj1jOuKOnYwpTSjG
	Tqpv4sQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQnlx-009GXF-8K; Sat, 11 Feb 2023 11:10:25 +0000
Received: from msg-2.mailo.com ([213.182.54.12])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQnli-009GRB-C0; Sat, 11 Feb 2023 11:10:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1676113794; bh=5yApPz7ebuShtxrTuVWINA4sOPX+XYKVeOohcbcuehk=;
	h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=ZGzOiTTqV4La4J5DQSAtgRFeWjt0e52Q3jNl0ztbPToIl0sHOpl3Wsnl3j+aaON95
	 KYLzJDwwygq9Fpfx4R95gdsCSVG4o9U8E2fH6SBZHqTX/pH9j3Y5JZPhjCM/gmN4et
	 3vMXwCuhXC+56uPZnftbWtaPwQCCIX9Ix91w8ecA=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via ip-206.mailobj.net [213.182.55.206]
	Sat, 11 Feb 2023 12:09:54 +0100 (CET)
X-EA-Auth: +b2O3JVJUDbTIbrBSTNVB6zRG+uUfXCvDhDTmkEoMe3IMbabFQNeu7b99bIpT+wXnTRI+9dz+M00r4LxxZQH+pA4Vr7R4788
Date: Sat, 11 Feb 2023 16:39:50 +0530
From: Deepak R Varma <drv@mailo.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Saurabh Singh Sengar <ssengar@microsoft.com>,
	Praveen Kumar <kumarpraveen@linux.microsoft.com>,
	Deepak R Varma <drv@mailo.com>
Subject: [PATCH] media: platform: mtk-mdp3: release node reference before
 returning
Message-ID: <Y+d3fqRG1OoYKpLB@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_031010_553714_32800ADB 
X-CRM114-Status: GOOD (  12.48  )
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

The iterator for_each_child_of_node() increments the refcount of the
child node it is processing. Release such a reference when the loop
needs to break due to an error during its execution.
Issue identified using for_each_child.cocci Coccinelle semantic patch.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Please note: The proposed change is compile tested only. I do not have the
necessary hardware to perform additional testing. Please suggest if there is an
alternate means available to further test this change.


 .../media/platform/mediatek/mdp3/mtk-mdp3-comp.c  | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index 7bc05f42a23c..2c50a73bbf23 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -898,6 +898,7 @@ static int mdp_comp_sub_create(struct mdp_dev *mdp)
 {
 	struct device *dev = &mdp->pdev->dev;
 	struct device_node *node, *parent;
+	int ret = 0;
 
 	parent = dev->of_node->parent;
 
@@ -923,16 +924,22 @@ static int mdp_comp_sub_create(struct mdp_dev *mdp)
 			dev_err(dev,
 				"Fail to get sub comp. id: type %d alias %d\n",
 				type, alias_id);
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_free_node;
 		}
 		mdp_comp_alias_id[type]++;
 
 		comp = mdp_comp_create(mdp, node, id);
-		if (IS_ERR(comp))
-			return PTR_ERR(comp);
+		if (IS_ERR(comp)) {
+			ret = PTR_ERR(comp);
+			goto err_free_node;
+		}
 	}
+	return ret;
 
-	return 0;
+err_free_node:
+	of_node_put(node);
+	return ret;
 }
 
 void mdp_comp_destroy(struct mdp_dev *mdp)
-- 
2.34.1




