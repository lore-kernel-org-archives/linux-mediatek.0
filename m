Return-Path: <SRS0=J3PH=OA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BC6C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 09:30:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D57C0610C9
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Sep 2021 09:30:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D57C0610C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d+5FwiyxzMbEvndTNsxBUpQnaEc09RRbPIhGYcgSbQs=; b=WaihqUPS99jav5
	tdkguNGWWhuMcHBS3NsDRNR5VwMbXY8iQ2i7hJWbW6J7bC0sTketW7KFdgGlASzyWwI6atze0Ues8
	0yhDLBIXZG4w8oQIbzAPCEjW9avKNAiM5YZLxkW5BzsD1KI4AMPQhRqutTIKywAM4na6pfC0DJuPq
	H4YRqkqIjohXpxYlWT8rUA24OpHLPft1sCLzY0D0L2KkCIhnWo01QubhOfO3ozidh2fFbb79tSkLS
	am37w+BvSzoWDUiFfJ674fmsYXGSYjX2ZBvFxiRKR/dH0UlwqJ/KfXPKfpugtJsRz67NfVAm0UsuU
	sScwShCPjlC3kzr4eH9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOcrP-00CLvq-1o; Fri, 10 Sep 2021 09:30:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOcrA-00CLuN-Db; Fri, 10 Sep 2021 09:30:01 +0000
X-UUID: e36810c769b94c20aac8f8b841d19bee-20210910
X-UUID: e36810c769b94c20aac8f8b841d19bee-20210910
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1230918000; Fri, 10 Sep 2021 02:29:54 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Sep 2021 02:26:16 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Sep 2021 17:26:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Sep 2021 17:26:14 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dan.carpenter@oracle.com>
Subject: [PATCH v2] ASoC: mediatek: common: handle NULL case in suspend/resume
 function
Date: Fri, 10 Sep 2021 17:26:13 +0800
Message-ID: <20210910092613.30188-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_023000_497755_C482F0D7 
X-CRM114-Status: GOOD (  11.82  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When memory allocation for afe->reg_back_up fails, reg_back_up can't
be used.
Keep the suspend/resume flow but skip register backup when
afe->reg_back_up is NULL, in case illegal memory access happens.

Fixes: 283b612429a2 ("ASoC: mediatek: implement mediatek common structure")
Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Change since v1:
  add Reported-by tag
---
 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
index baaa5881b1d4..e95c7c018e7d 100644
--- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
+++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
@@ -334,9 +334,11 @@ int mtk_afe_suspend(struct snd_soc_component *component)
 			devm_kcalloc(dev, afe->reg_back_up_list_num,
 				     sizeof(unsigned int), GFP_KERNEL);
 
-	for (i = 0; i < afe->reg_back_up_list_num; i++)
-		regmap_read(regmap, afe->reg_back_up_list[i],
-			    &afe->reg_back_up[i]);
+	if (afe->reg_back_up) {
+		for (i = 0; i < afe->reg_back_up_list_num; i++)
+			regmap_read(regmap, afe->reg_back_up_list[i],
+				    &afe->reg_back_up[i]);
+	}
 
 	afe->suspended = true;
 	afe->runtime_suspend(dev);
@@ -356,12 +358,13 @@ int mtk_afe_resume(struct snd_soc_component *component)
 
 	afe->runtime_resume(dev);
 
-	if (!afe->reg_back_up)
+	if (!afe->reg_back_up) {
 		dev_dbg(dev, "%s no reg_backup\n", __func__);
-
-	for (i = 0; i < afe->reg_back_up_list_num; i++)
-		mtk_regmap_write(regmap, afe->reg_back_up_list[i],
-				 afe->reg_back_up[i]);
+	} else {
+		for (i = 0; i < afe->reg_back_up_list_num; i++)
+			mtk_regmap_write(regmap, afe->reg_back_up_list[i],
+					 afe->reg_back_up[i]);
+	}
 
 	afe->suspended = false;
 	return 0;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
