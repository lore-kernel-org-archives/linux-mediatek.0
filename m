Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAF06C32774
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hx+ayzKx09KZ0Gg9uXQuy1F49PSrnmcH29QIBYWqewE=; b=Eel0gyyoI/PVdx1+S2fBOXitg8
	eiXqc4yUFwfFglnEUsHZzia1VaYPM6D6ZK+c2ZtHTOdEKvK5IgeY/jcV0HpUwTb89HizC+Hyci7wV
	zFe8q1qT1FwFrPPoT6vBXeSJt0IOQQkAna6cRzLqcuv365iLWlBkjXpCX6d5WaNESuPHegvas1RJK
	ygKZ3aoN2nUt0ecuJxvKm9idyilP5k1uM5HH+6J5opaoJRW9lhgWnbkLC9EovLHeA3riP1e+OeaZe
	WCXHz6fz5wnEyhPmBBiemqZVlc3kHMFEUePP6eAFs5HMQXf9jAcqXdDrl3VtfUzrgsAk6DgcD7vSU
	UqZllTAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQQWQ-004drg-6W; Tue, 23 Aug 2022 09:48:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQQWN-004dmL-4d; Tue, 23 Aug 2022 09:48:33 +0000
X-UUID: 2794d39963294b4e95b16f641f956758-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=hx+ayzKx09KZ0Gg9uXQuy1F49PSrnmcH29QIBYWqewE=;
	b=k/WdqnOvVf+HxVhnS3jo31NrT6BKCYBB86PU7lyB/aHKQEo+u6iOzmRUFrm75fz4a45kv3ev771kORtRSg5ONhrebwjE4vXI1+aS7F9fwXxldQUkRn8kkD1OfzIk9ehpcTW06/aCPB4Bp3Den7Wpp+1LXxbFBxf1d8E5SihHang=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:b0a24ea6-9c81-49d6-82f5-2c0f117bdd04,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:3b2259cf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
	nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2794d39963294b4e95b16f641f956758-20220823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunxu.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 260958769; Tue, 23 Aug 2022 02:48:18 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 23 Aug 2022 17:07:40 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 23 Aug 2022 17:07:37 +0800
From: Chunxu Li <chunxu.li@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <nfraprado@collabora.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <matthias.bgg@gmail.com>, <jiaxin.yu@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<project_global_chrome_upstream_group@mediatek.com>, chunxu.li
	<chunxu.li@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt8186: rename sound card name
Date: Tue, 23 Aug 2022 17:07:35 +0800
Message-ID: <20220823090735.12176-1-chunxu.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_024831_470055_5056F8A6 
X-CRM114-Status: GOOD (  10.60  )
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

From: "chunxu.li" <chunxu.li@mediatek.com>

The field 'topology_shortname' in 'snd_soc_card' is defined as char[32],
Current card name will be truncated when SOF is enabled, so rename the
sound card name.

Signed-off-by: chunxu.li <chunxu.li@mediatek.com>
---
 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c | 2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index 84ee5d95a9f0..17a15bec41da 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -962,7 +962,7 @@ mt8186_mt6366_da7219_max98357_controls[] = {
 };
 
 static struct snd_soc_card mt8186_mt6366_da7219_max98357_soc_card = {
-	.name = "mt8186_mt6366_da7219_max98357",
+	.name = "mt8186_da7219_max98357",
 	.owner = THIS_MODULE,
 	.dai_link = mt8186_mt6366_da7219_max98357_dai_links,
 	.num_links = ARRAY_SIZE(mt8186_mt6366_da7219_max98357_dai_links),
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 6c41706a5621..393d179d61de 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -938,7 +938,7 @@ mt8186_mt6366_rt1019_rt5682s_controls[] = {
 };
 
 static struct snd_soc_card mt8186_mt6366_rt1019_rt5682s_soc_card = {
-	.name = "mt8186_mt6366_rt1019_rt5682s",
+	.name = "mt8186_rt1019_rt5682s",
 	.owner = THIS_MODULE,
 	.dai_link = mt8186_mt6366_rt1019_rt5682s_dai_links,
 	.num_links = ARRAY_SIZE(mt8186_mt6366_rt1019_rt5682s_dai_links),
-- 
2.25.1


