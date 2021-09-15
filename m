Return-Path: <SRS0=Ndyv=OF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016B8C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 10:51:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C21976127A
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Sep 2021 10:51:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C21976127A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eAC4U/nKtdd6uxYs2f9s3W+X/avMBDKw2RvTnIQyd1U=; b=hl1PeI58IkOLUi
	OYoH9kkmktpxCEJZO09KCpXEerku5HtX1OPYT0ArIXwTGgqIn8w0K+t8OcrLC/6Utlmac6mCaL9Gl
	3kfEZiYj+yqgcSWRtx3fKKlmdIVSMxYou88CG68uco5P3vNNcR7XJz82nZHtUh0+tBokKMWgMgmUj
	LsATnXBJBU6Gx1If1ZXaHKzMrthMu3JXyBzbOCGUpT1A/GV+voXvofmCvb1DRfhr/iPd1kpAPZS0T
	A4ZiKS+ljubBNkmFsU5bql8BWNYsfDgVeqxTKXevOChE6qHrublAhhyq98G4MHUB/SIhwGCsfT9xU
	yaVgr2w5NcYWmOhj6z8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQSV8-008qW3-92; Wed, 15 Sep 2021 10:50:50 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQSUu-008qS8-GW; Wed, 15 Sep 2021 10:50:37 +0000
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 6468A3F10B; 
 Wed, 15 Sep 2021 10:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1631703027;
 bh=xn+5nToJ2orf+Up6k7sn+oX06VsYAXKMy44e0Mtdtig=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=nqkapOaphl4IBekkRVekUgd37nzYvqKGinzjKir5PmQxIcAmKmOtaLHBg6jHzKAAt
 n8i8+chi6FUvQXNlm40v+uCxQww727wSAFEEmzlLV7vw21OEgTvGU8cNw+eHfTINOc
 yBfSQIaNtaIIPWyLiMXQvLNK2dU7h9u1J9/xrMoL3gIkmhI5yKbLe5nR9R71c9JSzI
 bCggbYOi5eBMBwrtv5mmIVacvScO6Omkg0xllNLklR4HfvH+snXTU8veF9LaotvP/7
 4duE7N1fALbqsEgNT+thVhYnL5iF957CHuieXykK9PzgXxnyDGJZUvLQOF7MJaLICm
 sqca0K7RMdZPg==
From: Colin King <colin.king@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8195: make array adda_dai_list static const
Date: Wed, 15 Sep 2021 11:50:27 +0100
Message-Id: <20210915105027.10805-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210915_035036_728904_4E452594 
X-CRM114-Status: GOOD (  13.53  )
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

From: Colin Ian King <colin.king@canonical.com>

Don't populate the array adda_dai_list on the stack but instead it
static const. Also makes the object code smaller by 33 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  28271	  11640	      0	  39911	   9be7	mt8195/mt8195-dai-adda.o

After:
   text	   data	    bss	    dec	    hex	filename
  28142	  11736	      0	  39878	   9bc6	mt8195/mt8195-dai-adda.o

(gcc version 11.2.0)

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
index 878dec0b69ed..f04bd1781356 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-adda.c
@@ -788,9 +788,11 @@ static int init_adda_priv_data(struct mtk_base_afe *afe)
 {
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	struct mtk_dai_adda_priv *adda_priv;
-	int adda_dai_list[] = { MT8195_AFE_IO_DL_SRC,
-				MT8195_AFE_IO_UL_SRC1,
-				MT8195_AFE_IO_UL_SRC2};
+	static const int adda_dai_list[] = {
+		MT8195_AFE_IO_DL_SRC,
+		MT8195_AFE_IO_UL_SRC1,
+		MT8195_AFE_IO_UL_SRC2
+	};
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(adda_dai_list); i++) {
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
