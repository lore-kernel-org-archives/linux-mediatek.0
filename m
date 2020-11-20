Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43113C5519F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 03:13:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95F7F221F8
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 03:13:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ss5IAItm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nOAIDYqa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95F7F221F8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5xP0M3vi6bFvOgVdufcO6SiedQMY+Mg2DIoQjsB/OB4=; b=ss5IAItmSk5/OecmKOiRAYboi
	KEISSp0oB1/5jaPSzCMtjmj5fNqC4mFfvv0xdeHCV5pXa9Bqugs0uWVNxqqtQKGRD92O+RIsWifnj
	/nCohMwYOoKSqLa9m8/h2zQCkp2vovN3WfjFTvDohub7NjiYXOEfsblOKVDohSgBDcylTpNnh/+4I
	8IqYqXD1kD6uLA9vMOwuPwodMpXsrYQ/WwEEO/hi64cI1woeMmK4k8BjqSQHuba+aoPeIGs5DVc8v
	Oa4LRvLg8X7ysPapF8emadhI/2Bf1b1qwKgp3PXqgsNiMngRSu4/7iVvw0/tbY4sqryHzW5y3jisQ
	qm/p017zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfwr4-0001C6-Iy; Fri, 20 Nov 2020 03:12:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfwr0-0001BK-5s; Fri, 20 Nov 2020 03:12:55 +0000
X-UUID: 575822cbe7b74023856a2678f2c80137-20201119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VmKEyw32nvky3c16rWdPOFpeaZYuIxA9Yo9izbfe0w8=; 
 b=nOAIDYqaMO9CXt3RU7TAoD734YUD8KSjpsQA1bGUbk5XmAFKCuHwOUhzGTqQKRA5KdtcEYCUtVfyGwyFEQjP+Ssb5eFpaCuhw5Z/XbzY3AeyssUB6XZaL+wZSClT8zA/IiOLNW8yEmOgnUCZDNFvvccVaL19YWKPYNbz4gflXbI=;
X-UUID: 575822cbe7b74023856a2678f2c80137-20201119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 742133256; Thu, 19 Nov 2020 19:12:47 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Nov 2020 19:06:19 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 11:06:15 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Nov 2020 11:06:15 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <tzungbi@google.com>, <alsa-devel@alsa-project.org>, <robh+dt@kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ASoC: mediatek: mt6359: Fix regulator_dev_lookup() fails
 for id "LDO_VAUD18"
Date: Fri, 20 Nov 2020 11:06:12 +0800
Message-ID: <1605841573-1442-2-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1605841573-1442-1-git-send-email-jiaxin.yu@mediatek.com>
References: <1605841573-1442-1-git-send-email-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_221254_482320_449420E0 
X-CRM114-Status: GOOD (  11.79  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: shane.chien@mediatek.com, Trevor.Wu@mediatek.com,
 Jiaxin Yu <jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Mt6359 platform device is instantiated by mfd_add_devices(). In the
case, dev->of_node is NULL so that always fails to get the regulator_dev.

Use regualator-name "vaud18" that in dts node instead of
"LDO_VAUD19-supply". So that we can get regulator_dev through
regulator_lookup_by_name() directly.

Fixes: 64a70744b778 ("ASoC: Fix vaud18 power leakage of mt6359")
Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/codecs/mt6359.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index d37dbd2b50c2..6de0d744fa9e 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -1943,7 +1943,6 @@ static const struct snd_soc_dapm_widget mt6359_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY_S("CLK_BUF", SUPPLY_SEQ_CLK_BUF,
 			      MT6359_DCXO_CW12,
 			      RG_XO_AUDIO_EN_M_SFT, 0, NULL, 0),
-	SND_SOC_DAPM_REGULATOR_SUPPLY("LDO_VAUD18", 0, 0),
 	SND_SOC_DAPM_SUPPLY_S("AUDGLB", SUPPLY_SEQ_AUD_GLB,
 			      MT6359_AUDDEC_ANA_CON13,
 			      RG_AUDGLB_PWRDN_VA32_SFT, 1, NULL, 0),
@@ -1963,6 +1962,8 @@ static const struct snd_soc_dapm_widget mt6359_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY_S("AUDIF_CK", SUPPLY_SEQ_TOP_CK,
 			      MT6359_AUD_TOP_CKPDN_CON0,
 			      RG_AUDIF_CK_PDN_SFT, 1, NULL, 0),
+	SND_SOC_DAPM_REGULATOR_SUPPLY("vaud18", 0, 0),
+
 	/* Digital Clock */
 	SND_SOC_DAPM_SUPPLY_S("AUDIO_TOP_AFE_CTL", SUPPLY_SEQ_AUD_TOP_LAST,
 			      MT6359_AUDIO_TOP_CON0,
@@ -2312,7 +2313,7 @@ static int mt_dcc_clk_connect(struct snd_soc_dapm_widget *source,
 static const struct snd_soc_dapm_route mt6359_dapm_routes[] = {
 	/* Capture */
 	{"AIFTX_Supply", NULL, "CLK_BUF"},
-	{"AIFTX_Supply", NULL, "LDO_VAUD18"},
+	{"AIFTX_Supply", NULL, "vaud18"},
 	{"AIFTX_Supply", NULL, "AUDGLB"},
 	{"AIFTX_Supply", NULL, "CLKSQ Audio"},
 	{"AIFTX_Supply", NULL, "AUD_CK"},
@@ -2440,7 +2441,7 @@ static const struct snd_soc_dapm_route mt6359_dapm_routes[] = {
 
 	/* DL Supply */
 	{"DL Power Supply", NULL, "CLK_BUF"},
-	{"DL Power Supply", NULL, "LDO_VAUD18"},
+	{"DL Power Supply", NULL, "vaud18"},
 	{"DL Power Supply", NULL, "AUDGLB"},
 	{"DL Power Supply", NULL, "CLKSQ Audio"},
 	{"DL Power Supply", NULL, "AUDNCP_CK"},
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
