Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABAAC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 00:49:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A639164FBA
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 00:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A639164FBA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0n9AxtMLmWEQb5uf3KPxfaoWIiUWWnIrZPF9Ibj3VKA=; b=hcervzHYQS9k+iVRn0XFdgbNS
	Dmy7xo8Z6ZXeDa1WqxVldG3SzYr6Mznmd1K/t9OxypYt3NeS2oeOnyv/Ds5bcUgXRHim1JHfnLAwv
	clcVXjVoBYJ++XX8nXgUHpoh8x6bXiGGmFNDU2+ocvgRie67s2jM6xGjUIeuOZ17nOY2pN9yOcBRV
	Tpkkt3ySFr1rzVnJ3T6vm24xIJ3ic10di8bEWhpPyweCUACJr5lQji8hK/Dns9rFs2sLV4W/GxSJv
	+ZtHPkWoADQt9ngEX11qreUjlGr5OK/83Ow4LZdHflweRX9fLIVox9EsmM6ELVNJ+K35rCONYbYQP
	lxpB0FFUg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK9WO-0087FB-3i; Thu, 11 Mar 2021 00:49:48 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK9Vx-00878H-Vv; Thu, 11 Mar 2021 00:49:24 +0000
IronPort-SDR: hvS+OGeJOUzfxpfFIhzxXzB+QH7mMywNlw3ODHnOwAk0MUE9zkG8blNVOP5KR+2eENgimwfG5I
 TPtP8+A6JP1Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="167865535"
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="167865535"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:20 -0800
IronPort-SDR: xjT+db+56M2a0C/cPl5xYfXekIHi8yIzUHQwULkIFBPhKHTd24Xgjn/qDofhFvrXFpATuknXLX
 0aArc4iM1VTQ==
X-IronPort-AV: E=Sophos;i="5.81,238,1610438400"; d="scan'208";a="370386798"
Received: from theer-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.101.109])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2021 16:49:18 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de, broonie@kernel.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 2/4] ASoC: mediatek: mt2701: align function prototype
Date: Wed, 10 Mar 2021 18:49:02 -0600
Message-Id: <20210311004904.121205-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
References: <20210311004904.121205-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_004922_513745_1BB73D2C 
X-CRM114-Status: UNSURE (   9.77  )
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

cppcheck warnings:

sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c:102:30:
style:inconclusive: Function 'mt2701_afe_enable_i2s' argument 2 names
different: declaration 'path' definition
'i2s_path'. [funcArgNamesDifferent]
     struct mt2701_i2s_path *i2s_path,
                             ^
sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h:21:30: note:
Function 'mt2701_afe_enable_i2s' argument 2 names different:
declaration 'path' definition 'i2s_path'.
     struct mt2701_i2s_path *path,
                             ^
sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c:102:30: note:
Function 'mt2701_afe_enable_i2s' argument 2 names different:
declaration 'path' definition 'i2s_path'.

     struct mt2701_i2s_path *i2s_path,
                             ^
sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c:128:32:
style:inconclusive: Function 'mt2701_afe_disable_i2s' argument 2 names
different: declaration 'path' definition
'i2s_path'. [funcArgNamesDifferent]
       struct mt2701_i2s_path *i2s_path,
                               ^
sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h:24:32: note:
Function 'mt2701_afe_disable_i2s' argument 2 names different:
declaration 'path' definition 'i2s_path'.
       struct mt2701_i2s_path *path,
                               ^
sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c:128:32: note:
Function 'mt2701_afe_disable_i2s' argument 2 names different:
declaration 'path' definition 'i2s_path'.
       struct mt2701_i2s_path *i2s_path,
                               ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h
index 580fead2ab05..0bd82fbda176 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.h
@@ -18,10 +18,10 @@ int mt2701_afe_enable_clock(struct mtk_base_afe *afe);
 int mt2701_afe_disable_clock(struct mtk_base_afe *afe);
 
 int mt2701_afe_enable_i2s(struct mtk_base_afe *afe,
-			  struct mt2701_i2s_path *path,
+			  struct mt2701_i2s_path *i2s_path,
 			  int dir);
 void mt2701_afe_disable_i2s(struct mtk_base_afe *afe,
-			    struct mt2701_i2s_path *path,
+			    struct mt2701_i2s_path *i2s_path,
 			    int dir);
 int mt2701_afe_enable_mclk(struct mtk_base_afe *afe, int id);
 void mt2701_afe_disable_mclk(struct mtk_base_afe *afe, int id);
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
