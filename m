Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4441C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 18:24:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E9AF64F5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 18:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E9AF64F5B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F+giWE4cF4Qh/6Cu6udSvHELwTqaS02qDNe2FWPnB60=; b=WtlMr0TVyTv4TCxhWQK9oIJk8
	jaSCJaia6gC+g/++8t0qAEB4kIqIIeu0V1HykZFTce/rIKpMv7sCwDwX07KapQGJOnQnyIe6gOurr
	2m5RVmxK2WArnSjSFMOuxyzDb85WdX/RrdCgbHIuixwwv2isyvEB9thDEIj0Gd08eJNYXxU1kgbSh
	/hIt9Nd8wJKJ7BPbN1PXATihx17HeZ2enpWQfRVfO3QsAtlClhUPVf5YlcbkWlniv1LmAeDeI1FXu
	kffy8oguzm5duVC/V4ax7b+2uBNBRYkIa9FxqvgGFFWcBHu3lz6EYV+H12E+TF6GvkqU1+WzG4kmA
	rMYRzNEhQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKmRz-00CBPr-QG; Fri, 12 Mar 2021 18:23:51 +0000
Received: from mga18.intel.com ([134.134.136.126])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKmRn-00CBNB-Dv; Fri, 12 Mar 2021 18:23:42 +0000
IronPort-SDR: 4Ryu2diBUej1UJY51eYYgxAJOWubnBh4ZzP9XNLIgbnZGGHrvMM0oi3gZyjWmEZOdvix3Mll08
 ZKmKwkXfKzkw==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="176462421"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="176462421"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:32 -0800
IronPort-SDR: vMplSHCv5mEPnukrrcRjc6KXfk6xTNUJu0wfzFooCUTKsGxGuahYFdqJAT5LRASrP2xONMgZmx
 2otk2ZRhRGCg==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377791990"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:30 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de, broonie@kernel.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 13/23] ASoC: mt6358: remove useless initializations
Date: Fri, 12 Mar 2021 12:22:36 -0600
Message-Id: <20210312182246.5153-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_182339_889859_D330FF14 
X-CRM114-Status: GOOD (  11.57  )
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

cppcheck warnings:

sound/soc/codecs/mt6358.c:334:19: style: Variable 'stage' is assigned
a value that is never used. [unreadVariable]
 int i = 0, stage = 0;
                  ^
sound/soc/codecs/mt6358.c:350:19: style: Variable 'stage' is assigned
a value that is never used. [unreadVariable]
 int i = 0, stage = 0;
                  ^
185/930 files checked 25% done
Checking sound/soc/codecs/mt6359.c ...
sound/soc/codecs/mt6359.c:274:8: style: Variable 'i' is assigned a
value that is never used. [unreadVariable]
 int i = 0, stage = 0;
       ^
sound/soc/codecs/mt6359.c:274:19: style: Variable 'stage' is assigned
a value that is never used. [unreadVariable]
 int i = 0, stage = 0;
                  ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/mt6358.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 1f39d5998cf6..9b263a9a669d 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -331,7 +331,7 @@ static void hp_zcd_disable(struct mt6358_priv *priv)
 
 static void hp_main_output_ramp(struct mt6358_priv *priv, bool up)
 {
-	int i = 0, stage = 0;
+	int i, stage;
 	int target = 7;
 
 	/* Enable/Reduce HPL/R main output stage step by step */
@@ -347,7 +347,7 @@ static void hp_main_output_ramp(struct mt6358_priv *priv, bool up)
 
 static void hp_aux_feedback_loop_gain_ramp(struct mt6358_priv *priv, bool up)
 {
-	int i = 0, stage = 0;
+	int i, stage;
 
 	/* Reduce HP aux feedback loop gain step by step */
 	for (i = 0; i <= 0xf; i++) {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
