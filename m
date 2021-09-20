Return-Path: <SRS0=XaoX=OK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20477C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 10:02:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E04B160F21
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 10:02:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E04B160F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EAzkq58g/F1l10/nJBTsuqGNte+GK0fD8mEKYejUb0E=; b=ORKayRjlAuZPGX
	f9/BeGOMpcKVXbneaQZiOtbHa/0HhJEW025jL2HgMJUvQlFi3zuociAmXj9+lLJk7EztaQNTqARV0
	OikCUlOWcxhe6yDBDFMSAyJLJbdQL2qJ6TU88n/DyJMQDEtL5ubP0WQ/24/xjJkt3iQl309kHGYJI
	YqMSb/my5DFWRmvl4lUxoBuHzE2xMS+QKRMGN9aE93IP5eUFLTjsNeUgK7PJPK7OibqQEfolY9xQe
	2/SSLsFCsHkfavxACivETKJ/mq/WRt7zmZh1KP589gScnArW64ojrW2S55nO65/MVzXTcpXgwemDF
	1dzYCV6v6gZeMcu9n0/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSG7z-001CwY-Jv; Mon, 20 Sep 2021 10:02:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSG7n-001CvQ-74; Mon, 20 Sep 2021 10:02:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 65C8C60240;
 Mon, 20 Sep 2021 10:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632132130;
 bh=z0yF78RdBg7hKlSTk5BKsjKH8v+YlV3IKCN8scl8+PA=;
 h=From:To:Cc:Subject:Date:From;
 b=It7WL4JobI3VYNZiMpQb3/orFfG9CEejphtd8OJuPHG2srcIB+ZJSwoIw/xnznw09
 Bm0bk1XPN8soXvom2a8nhGwUtGCFQRiXwyxAjh5j5znRvGzInCXjI2E4b48LU7h0pt
 m/V3Ex929pBT4rqU2LjvrccEi+vu8H3vCKf/7hMD2r76Q5fFUZFOa+BZxmjyz78S/3
 XpCan3VqcvbftRlNYSm+Uu1eN7YKqY55ba6y+802zo2BoQrKw/dqpoH2tUBFuvabv7
 umiTId0YNGfsHxcxYA2fQNL6BNtJvmpfvzJSW3GAHP60H0k+uZWKRRWaV34kF1FtWB
 344zktGw3md5Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Trevor Wu <trevor.wu@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Tzung-Bi Shih <tzungbi@google.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH] ASoC: mediatek: mt8195: force COMMON_CLK dependency
Date: Mon, 20 Sep 2021 12:01:58 +0200
Message-Id: <20210920100206.1418649-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_030211_319970_19EE8952 
X-CRM114-Status: GOOD (  11.63  )
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

From: Arnd Bergmann <arnd@arndb.de>

Without CONFIG_COMMON_CLK, this driver fails to link:

ERROR: modpost: "clk_unregister_gate" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!
ERROR: modpost: "clk_register_gate" [sound/soc/mediatek/mt8195/snd-soc-mt8195-afe.ko] undefined!

Add the proper Kconfig dependency for compile testing.

Fixes: 6746cc858259 ("ASoC: mediatek: mt8195: add platform driver")
Fixes: 940ffa194547 ("ASoC: mediatek: SND_SOC_MT8195 should depend on ARCH_MEDIATEK")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/soc/mediatek/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 5a2f4667d50b..268c1f74aa3e 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -187,7 +187,7 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
 
 config SND_SOC_MT8195
 	tristate "ASoC support for Mediatek MT8195 chip"
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on ARCH_MEDIATEK || (COMPILE_TEST && COMMON_CLK)
 	select SND_SOC_MEDIATEK
 	help
 	  This adds ASoC platform driver support for Mediatek MT8195 chip
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
