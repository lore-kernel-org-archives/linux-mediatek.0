Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9474C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OS1Vr4Po6VtNOcBE/CG7s2VLA71TQqzK4JuGlQ9FNoU=; b=gdKjCPBGyEly3wTJ+aCnp+EnWy
	FM4AUgsDBlSqi2nraDbYpC5/FHKjjc5UuAwrzQj4eWr7P+6r3RZWvzvzRhAdgCK1mgBScjBBSYiYw
	eEtJ6/fIh4NR+X7LKDPZmgzWnnzsfqw3WGBYI0jeLWIC2kjMB1Y6YrTzyQqDy5uI4hE7r8Ho4D9Dc
	NToxJfmdJbig9h4TSHAolIp18P7aiksz2hvRcXFWcRFxJ2/8mZtq0Tg95NQI5PCoCxuZ+kybT58tm
	i2JCLfgeEjKNjIdEV11QNxHqW/2fNI6jkAWrijw4KjmJIdC4IvPVLB0oTc3Y0xUVZflQbDs7mmoA2
	OStHt7+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pohRW-001QTl-0R;
	Tue, 18 Apr 2023 09:16:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pohRT-001QSn-06;
	Tue, 18 Apr 2023 09:16:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 81F2C62418;
	Tue, 18 Apr 2023 09:16:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59289C433D2;
	Tue, 18 Apr 2023 09:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681809360;
	bh=i8nVDFAokOgYqujZXdzkVQr8aJvHUufQtj/uWLHRiLQ=;
	h=From:To:Cc:Subject:Date:From;
	b=T/hrPpv3I+K/TuV8sg7CAaDvM+g0MlH/1F4N39W5MjPOLifXQdoP9DIPgZTXfe0o3
	 fduBrg0+trdeWQiQzxjk3y+OFm3PLHFzDJXY4xldPcxsYCdmkOVI1C7Sqd47dgY3F9
	 4G6ZGDdAcUIEewnWGRYlyk/PZC5nopW/izCFwAsuSheiAHwjBvnSR6D7WR2RK+3OWS
	 r83r6QFzfm/pidwR7+JspzU1Zsp/7SUKVjLwtsbU9qqwXLhT8LhIH/Pi+a7DqLlo5U
	 NrJRwVdNDMwfegNk18HSWHDEASy1fmUlreNmQjCDbAFeQ8kPNkxWVDLmv8JKRaxx0S
	 ldUqYvFlD8Exg==
From: Arnd Bergmann <arnd@kernel.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Moudy Ho <moudy.ho@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sun Ke <sunke32@huawei.com>,
	Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: platform: mtk-mdp3: work around unused-variable warning
Date: Tue, 18 Apr 2023 11:15:48 +0200
Message-Id: <20230418091555.2605961-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_021603_107377_B3429B47 
X-CRM114-Status: GOOD (  14.73  )
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

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_OF is disabled, the 'data' variable is not used at all
because of_match_node() turns into a dummy macro:

drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c: In function 'mdp_comp_sub_create':
drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c:1038:36: error: unused variable 'data' [-Werror=unused-variable]
 1038 |  const struct mtk_mdp_driver_data *data = mdp->mdp_data;
      |                                    ^~~~

Remove the variable again by moving the pointer dereference into the
of_match_node call.

Fixes: b385b991ef2f ("media: platform: mtk-mdp3: chip config split about subcomponents")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
index 75c92e282fa2..19a4a085f73a 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
@@ -1035,7 +1035,6 @@ static int mdp_comp_sub_create(struct mdp_dev *mdp)
 {
 	struct device *dev = &mdp->pdev->dev;
 	struct device_node *node, *parent;
-	const struct mtk_mdp_driver_data *data = mdp->mdp_data;
 
 	parent = dev->of_node->parent;
 
@@ -1045,7 +1044,7 @@ static int mdp_comp_sub_create(struct mdp_dev *mdp)
 		int id, alias_id;
 		struct mdp_comp *comp;
 
-		of_id = of_match_node(data->mdp_sub_comp_dt_ids, node);
+		of_id = of_match_node(mdp->mdp_data->mdp_sub_comp_dt_ids, node);
 		if (!of_id)
 			continue;
 		if (!of_device_is_available(node)) {
-- 
2.39.2


