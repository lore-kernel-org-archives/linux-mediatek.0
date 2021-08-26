Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252FAC4320E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 11:26:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D10E76112E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 11:26:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D10E76112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wc7/8NJllhJuHRzMFBZIZmF6YsV9WUY3eJLvDOqx82A=; b=XpoDwDi0TM7T2A
	A2fOQP0kj73UMJ+t33CMinBFb2yog1UyhJdsbLxCK/OGgrXQ2YmrkIX7u9XxiqZ92bCrx3AOVavMJ
	WtHGg4m9gyh3mVV5a0gmtF/88DIg8Ip36VlCEy183f22GYCZbTQim6427iFAsDDwXLHnr8oUPRIJZ
	eKXG4HDJsMr+LoIgyEUHQj7UrkWUy5b6A9fJEvlXXSGgQdUMMEiNqVEwlwd+B7rCmSzbtRHdNXYwR
	uQWpfuq6NfIB2PWCjTbBaypi2qVsFSoj9v7SGY2hmOdlYb/dsqr4jWAnir3b4fR9USZUsut8bcCk1
	P70Wc/pgLFiBV2FB+K7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJDWv-009u6E-Ii; Thu, 26 Aug 2021 11:26:45 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJDWX-009u1a-QG; Thu, 26 Aug 2021 11:26:26 +0000
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id D9AA03F044; 
 Thu, 26 Aug 2021 11:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1629977171;
 bh=BOfv1mWZucvdeO+2RiG1GUgsxmx8e5VDjoBIMqK5l0s=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=Y3YjSEgvmcKuAagE7kzuOI8dH/Zix7iP2PU0sh6qgONNmsEdBJY0lJmJo8iNaY527
 nJJ4FHc0piCHPZBSJLbOkBLg4/AkeOwHhvH/wULTDCxudSlTPZGx2OyeZKjp3pmSP9
 bwjmTfXDCZZfz0+rxshp0Ek9M6P9LiDJXq9TtFjb4BKvvMrmi51PDGtzVYTMwpgkww
 q5FMPrpFVndd79wZl9bX/Yq+oJNNV5YfxAl+7A7yoBzFqc+pjcmKKyKb/OP1CILvDT
 wSow8pCjCiDmZRNBOdweVr63wcw+JPri8f25906su2+9l71kBVNbQJJskxWBWxSd1F
 2XNXn4B36Qd9g==
From: Colin King <colin.king@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: mediatek: mt8195: Fix spelling mistake "bitwiedh"
 -> "bitwidth"
Date: Thu, 26 Aug 2021 12:26:11 +0100
Message-Id: <20210826112611.10356-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_042622_204914_B050FB21 
X-CRM114-Status: GOOD (  11.08  )
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

There is a spelling mistake in a dev_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index bd9876cf02c8..7378e42f2766 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -1909,7 +1909,7 @@ static int mtk_dai_etdm_configure(struct mtk_base_afe *afe,
 		__func__, etdm_data->format, etdm_data->data_mode,
 		etdm_data->lrck_inv, etdm_data->lrck_width, etdm_data->bck_inv,
 		etdm_data->clock_mode, etdm_data->slave_mode);
-	dev_dbg(afe->dev, "%s rate %u channels %u bitwiedh %u, id %d\n",
+	dev_dbg(afe->dev, "%s rate %u channels %u bitwidth %u, id %d\n",
 		__func__, rate, channels, bit_width, dai_id);
 
 	etdm_channels = (etdm_data->data_mode == MTK_DAI_ETDM_DATA_ONE_PIN) ?
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
