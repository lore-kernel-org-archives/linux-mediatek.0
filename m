Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD445C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 03:47:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A87A361211
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 03:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A87A361211
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0AewWQWS/oB3q7SFf+XvmRFE562xe5gxf/pDMTp/9U4=; b=4lOsjRdnM7EEqK
	xBBU9DEmJwqhJhypN1DJi1JHANPfDYlbF39OG5cCfYhbH2IrGQbl4g22o4mx9scZJIU3rCLvFo0HA
	PIkYQ9yw/e+OOLlM5RecfjC4MZYw0l7WUWqmHBcwtoMyqNmque5ItXQfQRopboyqy2Tk1VFXBiFNU
	9ii34fpH8SlXd8XHQPi+OrJ9ci2kLOCXt3yJXhKFe4D9686oKrX4gnCayQgD49Sd2v2tCUaXBf1Fm
	sNp+TErLG3d4rBE1rfa9ZQwn5nmrVs+iiexf1pKcjVnZ8/wisY1rs0QjYcbNV6fPgJ/yT2+Q07X5U
	rhRIQIA1cqEXah4uwwhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQLt8-007zhX-ST; Wed, 15 Sep 2021 03:47:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQLt4-007zgU-CU; Wed, 15 Sep 2021 03:47:09 +0000
X-UUID: 18bf4b51b8604462909c94fb572b0d3a-20210914
X-UUID: 18bf4b51b8604462909c94fb572b0d3a-20210914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <trevor.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 174316115; Tue, 14 Sep 2021 20:47:04 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 20:47:02 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 15 Sep 2021 11:47:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 15 Sep 2021 11:47:00 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <shane.chien@mediatek.com>,
 <chipeng.chang@mediatek.com>, <jiaxin.yu@mediatek.com>, <tzungbi@google.com>
Subject: [PATCH] ASoC: mediatek: mt6359: Fix unexpected error in bind/unbind
 flow
Date: Wed, 15 Sep 2021 11:46:59 +0800
Message-ID: <20210915034659.25044-1-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_204706_475071_69C2BF93 
X-CRM114-Status: GOOD (  11.05  )
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

mt6359-sound is a MFD driver. Because its regmap is retrieved from its
parent, it shouldn't be freed in mt6359-sound driver.

snd_soc_component_exit_regmap() will do regmap_exit(), this results in
unexpected results if sound card unregister flow is invoked when users
try to bind/unbind audio codec.

Remove the usage of snd_soc_component_exit_regmap(). Instead, set
component->regmap = NULL in the component remove function.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/codecs/mt6359.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index 2d6a4a29b850..f8532aa7e4aa 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -2697,7 +2697,7 @@ static int mt6359_codec_probe(struct snd_soc_component *cmpnt)
 
 static void mt6359_codec_remove(struct snd_soc_component *cmpnt)
 {
-	snd_soc_component_exit_regmap(cmpnt);
+	cmpnt->regmap = NULL;
 }
 
 static const DECLARE_TLV_DB_SCALE(hp_playback_tlv, -2200, 100, 0);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
