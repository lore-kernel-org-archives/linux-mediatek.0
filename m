Return-Path: <SRS0=/0MH=ER=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BFAFC388F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 02:45:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DACEF20759
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Nov 2020 02:45:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JXsQKvRv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ph9dz+a2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DACEF20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZBnT8o0Fv9knKwgngilh+g63TUSpMJZyS3zJbtev1MA=; b=JXsQKvRvlvq2UkvsLjrvrurZfN
	c+HmtjAIiJeSvIL11mEwVSYVoaACUDdLZaV6RaG/NpTr+mJoMPJRD537rEy3Fx5Axh2jJ7MUTi2Ro
	g1fJt5VP74hxk9avPfuESQu93Pz13D6DcrQkhcMSdHYxV1xz+D6L4uXLt84jt7XWk5GZ8uhFlpA4c
	wwup23N8EnEfHpAJCijBFf4s/tr6UzR9vihrXlqkTPuCYfQmesKgheZ1yu3CWXRbTJglZQAz++gdc
	dGuB2Lzc8AsW0xZjv0YL4nZIY5Vl7kZK6f+xSzdNgM79SJ54wPCYWS+zDMMuYqU4TWV9tbUpM3ufD
	M3IA2WfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcg8i-0005Jg-7U; Wed, 11 Nov 2020 02:45:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcg8d-0005Iq-3o; Wed, 11 Nov 2020 02:45:36 +0000
X-UUID: 4c49fc9df0bf44aab377da94561d882e-20201110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=IcCu3+Zc2n3kYPQu033Mn4Z4XaeAhwPBlnreV28pxOQ=; 
 b=Ph9dz+a2wcPaenoN1rUt8b/zc8I9AdPs08WA7iVq95BA+XmUSDv//oiiATFYxRT7nSJ52qVYo9OD1w5uYw5L8bHUKRmox2OdeE1V+vpGV//XkBHhqHee3/4sH25FN+JjuLS0Kn3NeLk/9lEnJmRNcUk742/Ly6jv05FBWFuWzpw=;
X-UUID: 4c49fc9df0bf44aab377da94561d882e-20201110
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 174709135; Tue, 10 Nov 2020 18:45:26 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 18:45:25 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Nov 2020 10:45:23 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Nov 2020 10:45:23 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <matthias.bgg@gmail.com>,
 <tzungbi@google.com>, <alsa-devel@alsa-project.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] ASoC: mediatek: mt8192: skip first time data at the
 beginning of DMIC recording
Date: Wed, 11 Nov 2020 10:45:22 +0800
Message-ID: <1605062722-8711-1-git-send-email-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_214535_480112_ED58FB5A 
X-CRM114-Status: GOOD (  13.61  )
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

We can choose to drop away any length of data from the beginning according
to project needs. Some projects don't want to throw away any data, because
they want to use recorded data to do echo cancellation, so they have to
make sure that they are aligned with the reference data as much as
possible. Or there are other algorithms in the upper layer to eliminate
this noise. Or some projects want to eliminate this noise form the kernel
layer. However, the minimum recommended value is 50ms to skip pop noise.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 This seems like something that would apply equally to all DMICs so should
 be done at a more general level, so we implement it in the DMIC driver.

 sound/soc/mediatek/Kconfig                              | 1 +
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index dc628fb6c1025..31f1431bf5792 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -175,6 +175,7 @@ config SND_SOC_MT8192_MT6359_RT1015_RT5682
 	select SND_SOC_MT6359
 	select SND_SOC_RT1015
 	select SND_SOC_RT5682_I2C
+	select SND_SOC_DMIC
 	help
 	  This adds ASoC driver for Mediatek MT8192 boards
 	  with the MT6359 RT1015 RT5682 audio codec.
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index 41d8a8567bb38..b7f42a530d069 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -540,7 +540,9 @@ SND_SOC_DAILINK_DEFS(playback_hdmi,
 SND_SOC_DAILINK_DEFS(primary_codec,
 		     DAILINK_COMP_ARRAY(COMP_CPU("ADDA")),
 		     DAILINK_COMP_ARRAY(COMP_CODEC("mt6359-sound",
-						   "mt6359-snd-codec-aif1")),
+						   "mt6359-snd-codec-aif1"),
+					COMP_CODEC("dmic-codec",
+						   "dmic-hifi")),
 		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
 
 SND_SOC_DAILINK_DEFS(primary_codec_ch34,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
