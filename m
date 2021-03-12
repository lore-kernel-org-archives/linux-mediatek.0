Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCA4C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 18:24:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE93464F52
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 18:24:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE93464F52
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NZDw1S30z0VYHv7Dmwuw5qqnH9US/vA7s6FHU5RE4Zg=; b=MWyoGgPJ4aGV22X39YZkcXxzC
	kqTLCnYt4AilDMxi4DueeV/GZHzdIp1+o+UTfNtj6ok8XdZ+PXTQCg/J4oBtYcIeQzFojoedpxYhY
	XZG4rApQG5xRjIwWyEPhIGFPAlZHVqN3YzHRu8lENu/ax0INM1MBWnYK+QklIk4G8ykTmI3C/y1w4
	a/jmIMiq65nXWkGUgcipFpnFC71BIAmgxvC2OVvcIuPnE+eW+FEKu817KhDrKM1IZSD/sWYYcHj19
	+FONyjydBvFLAt05jh2o8HFBv0hE4Xnwc40n9yOgOgGE8ovqTNe4HWUjtXM/TQcviJ5bnA3IhSp3y
	pDLYS9Phg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKmS8-00CBRV-91; Fri, 12 Mar 2021 18:24:00 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKmRs-00CBNu-83; Fri, 12 Mar 2021 18:23:46 +0000
IronPort-SDR: YuXwUonIsguQdj/GCyQMbxpuXbxr3WWdHCjhTsKXNcfGTUHLDkr/WTYGkiX3aRk5S9t9g+cBfR
 QKFbYUoEBBoA==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="252888931"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="252888931"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:41 -0800
IronPort-SDR: zMCw97GH6dLD/FJCGWKbL2HpR1ng+Fqi3/2gHxr0gMkZi0Uhx1VM8ZHR0vdlLzEbogTEVrSA4q
 ei0xbHGtahGw==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377792038"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:40 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de, broonie@kernel.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@google.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 "Shane.Chien" <shane.chien@mediatek.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 14/23] ASoC: mt6359: remove useless assignment
Date: Fri, 12 Mar 2021 12:22:37 -0600
Message-Id: <20210312182246.5153-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_182344_656057_CD8CFC48 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

cppcheck warning:

sound/soc/codecs/mt6359.c:242:19: style: Variable 'stage' is assigned a value that is never used. [unreadVariable]
 int i = 0, stage = 0;
                  ^
sound/soc/codecs/mt6359.c:260:19: style: Variable 'stage' is assigned a value that is never used. [unreadVariable]
 int i = 0, stage = 0;
                  ^
sound/soc/codecs/mt6359.c:274:8: style: Variable 'i' is assigned a value that is never used. [unreadVariable]
 int i = 0, stage = 0;
       ^
sound/soc/codecs/mt6359.c:274:19: style: Variable 'stage' is assigned a value that is never used. [unreadVariable]
 int i = 0, stage = 0;
                  ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/mt6359.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index 6f4b1da52082..b909b36582b7 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -239,7 +239,7 @@ static void zcd_disable(struct mt6359_priv *priv)
 
 static void hp_main_output_ramp(struct mt6359_priv *priv, bool up)
 {
-	int i = 0, stage = 0;
+	int i, stage;
 	int target = 7;
 
 	/* Enable/Reduce HPL/R main output stage step by step */
@@ -257,7 +257,7 @@ static void hp_main_output_ramp(struct mt6359_priv *priv, bool up)
 
 static void hp_aux_feedback_loop_gain_ramp(struct mt6359_priv *priv, bool up)
 {
-	int i = 0, stage = 0;
+	int i, stage;
 	int target = 0xf;
 
 	/* Enable/Reduce HP aux feedback loop gain step by step */
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
