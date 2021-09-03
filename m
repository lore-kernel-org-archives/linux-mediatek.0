Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E928CC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 11:50:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA44360FDC
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 11:50:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AA44360FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2aA8hZ3Dvlv/3+tzgV55pnJh4lIig8xfyyBeR8lAxNA=; b=HI8D79mykOdIOq
	9aMxPBW0q3CHF9RfJr5N+rTQLc/4gdnEkhGb3rm+ziaeb03R7ipTvNZp1G91/EDzyCSWsQJlvGZEl
	Ovbom7jzMh/gTArDuArzbkQBLgZ50D7OtlKUYVu7hSu2TOajfSPXNuWkjMNIahp3HeGYoGRNz9m2E
	biI8sJJKOwv1MYLO1Z2TjEmGbeQH+ooM3i6dMPttrypSdoeNYaqKy2FpvOt2e+CwTn7Mnb2bxu0WU
	GQNIAxY67n7pB09tdxNqmfYR7Y8LWpjFzQspEbrQ/2uk7NRYLC0HTLIQhkJP2RMbX/AjjYz7o8SRz
	vDGllRhkBbOL+dGJ1Z4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM7hg-00Bq44-Kf; Fri, 03 Sep 2021 11:49:52 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM7hR-00BpyU-MC; Fri, 03 Sep 2021 11:49:39 +0000
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 9DD213F09E; 
 Fri,  3 Sep 2021 11:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1630669768;
 bh=cY308Ok8pbsAlAgAmdVbKjTzNIY9q0Cqnz5SkkmxGdk=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=j+2I4zP+/n4UObG3A2xBnhb7ei1OJ24PTYqJUHMCJv22TbfMRULUIjhZVU8hPuUg1
 158qWcex1GrdacaaHpcPkRIsjo7u/YC4QrKcE2O4FJ5WFEyhIVVf9yITKhJIaCDxty
 xdE2MHyxeodC1uBA9Xo6hEOMZCRo4L7Nh88oYmXi512jWw1ukgjy2sFdOYkciqeNUH
 vP/A/qANY5AT2WitK1R/pinLDOAzw0xtFso7hn6CfBc7al1F3mJPdAujnKKBO1pEST
 6dWsOTWN9/VzR1+ynXuSxRxqSpFp7cU5SVkrVh5tdVTsO1NrBso5NX2/Xk7DxlLaAl
 QfHdOAxyfKAZQ==
From: Colin King <colin.king@canonical.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: mediatek: mt8195: Fix unused initialization of pointer
 etdm_data
Date: Fri,  3 Sep 2021 12:49:28 +0100
Message-Id: <20210903114928.11743-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_044937_912132_A4265B78 
X-CRM114-Status: GOOD (  13.34  )
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

The pointer etdm_data is being inintialized with a value that is never
read, it is later being re-assigned a new value. Remove the redundant
initialization.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 7378e42f2766..ac591d453e1e 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2094,7 +2094,7 @@ static int mtk_dai_etdm_set_sysclk(struct snd_soc_dai *dai,
 {
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
-	struct mtk_dai_etdm_priv *etdm_data = afe_priv->dai_priv[dai->id];
+	struct mtk_dai_etdm_priv *etdm_data;
 	int dai_id;
 
 	dev_dbg(dai->dev, "%s id %d freq %u, dir %d\n",
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
