Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8ABC00140
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 15:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VvLbklZKWc/ay7g4jAnrfGbMBJr/TqP/Kfep19Pd8uk=; b=r9UJi3aiOQjprp9QDD2iywOv4W
	WNSqKVZ84JCm2Gn8ghpTlzdEWZUFu5Cbif5HABFA2+Jhx8vASnYwdHBaA755evD7v/Uopp4/Z5W4D
	Ev9XLfIKopgVXr6bUpBign2YJp8yJJt9SHVkP02YNj8rOc5Rj1ManmMR5OFsGUcFoOAFIBb1QbI0/
	aRM88SwIO/q8LLO2JizGfFUws0IgsI9XsIx8ZwwQ5wipwtALfKXcmya+VtKWbFstN5RBaC32AMLhB
	E/2EbjqnbtX2hSCJaPeWzgHM4+OUZgT1dytOyZeTFouTMtgVEk3JnwcUe3G0b/5dLrQ7NIn1qmJFy
	fjrYdszA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGMqd-000kjf-Of; Tue, 26 Jul 2022 15:51:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGMqZ-000kfx-4k; Tue, 26 Jul 2022 15:51:50 +0000
X-UUID: d3e5153d24834bcfba9fa21067457de8-20220726
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:f7fa5dd9-b0a9-4633-b8c2-0040f3dbc07e,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:4ed714ee-db04-4499-9fdf-04ef44b9468c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d3e5153d24834bcfba9fa21067457de8-20220726
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jiaxin.yu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1004457225; Tue, 26 Jul 2022 08:51:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 26 Jul 2022 23:31:32 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 26 Jul 2022 23:31:32 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <angelogioacchino.delregno@collabora.com>,
	<dan.carpenter@oracle.com>
CC: <aaronyu@google.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<alsa-devel@alsa-project.org>, Jiaxin Yu <jiaxin.yu@mediatek.com>
Subject: [PATCH] ASoC: mediatek: mt8186: set the correct string to strncmp()
Date: Tue, 26 Jul 2022 23:31:30 +0800
Message-ID: <20220726153130.27584-1-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_085147_198466_173536B1 
X-CRM114-Status: GOOD (  11.01  )
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

Fix Smatch static checker warning. strncmp() here only needs to compare
the first seven bytes, so in order to make the code more clear, only the
first seven bytes of the string used as the comparison are reserved.

Bug report: https://www.spinics.net/lists/alsa-devel/msg145608.html

sound/soc/mediatek/mt8186/mt8186-dai-adda.c:78 get_adda_priv_by_name()
warn: strncmp() with weird length: 17 vs 7

sound/soc/mediatek/mt8186/mt8186-dai-adda.c
    72 static struct mtk_afe_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
    73                                                        const char *name)
    74 {
    75         struct mt8186_afe_private *afe_priv = afe->platform_priv;
    76         int dai_id;
    77
--> 78         if (strncmp(name, "aud_dac_hires_clk", 7) == 0 ||
    79             strncmp(name, "aud_adc_hires_clk", 7) == 0)

Fixes: b65c466220b3 ("ASoC: mediatek: mt8186: support adda in platform driver")
Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/mt8186/mt8186-dai-adda.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
index db71b032770d..81976f7c444e 100644
--- a/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
+++ b/sound/soc/mediatek/mt8186/mt8186-dai-adda.c
@@ -75,8 +75,7 @@ static struct mtk_afe_adda_priv *get_adda_priv_by_name(struct mtk_base_afe *afe,
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	int dai_id;
 
-	if (strncmp(name, "aud_dac_hires_clk", 7) == 0 ||
-	    strncmp(name, "aud_adc_hires_clk", 7) == 0)
+	if (strncmp(name, "aud_dac", 7) == 0 || strncmp(name, "aud_adc", 7) == 0)
 		dai_id = MT8186_DAI_ADDA;
 	else
 		return NULL;
-- 
2.25.1


