Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E03C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 09:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VLn1nwa0TPSZxy0/Uqf/fSCYjrakDuOkiQdrMrFOV3c=; b=xtt0FFQWAMIHOpgpmGrHPqOVr4
	Es81PqUyB/AFI0uZXc91wPW8QZWYB4O3AwMu3U+0sCHkeGHdGHbVIwa1ydMD9VVSaDXb5QnFnR737
	zn+OcfjwD0BZyzKvskaN5Qm0+fuZOZv35WGgdig2cDTC0p8bZfihjedlIiPqNX4zadayAnT7NjBg5
	8Z4Z0N4Zsy3V7Xwszbqk1zqX/g2+rkyDb5BpJGfJcZqy708E4W4GZbs9lc2VVcQhPEZ1cwaI2N0c8
	alm+BKrCKXi6GfLTsYY+OQYYDYsSV6GBHv0gIquYRvL9jkhVEHe4CqL7d4xWcaO5jWHdcT7Fl//HV
	qUqNZACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ToN-001ol9-15;
	Fri, 26 May 2023 09:32:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2ToE-001oeF-0V;
	Fri, 26 May 2023 09:32:31 +0000
X-UUID: 3acd8fdefba811ed83ed1395ce914268-20230526
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VLn1nwa0TPSZxy0/Uqf/fSCYjrakDuOkiQdrMrFOV3c=;
	b=LeWDVB5Vk6iBYSnb9TttkV6cPrH89kV6/SUP0kywQGz2tGUGhZnc6v9Y23B4AcdttSgewp0hvkDyIoOqNZCSFXsaYgN2WjOA4pvKnA5U2adVpf2oKkC749JOxGrVzjtSIlJyavEYjIk0QG1kRRPUL1dNKX/T/H3SVwg/apFpYnw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:96b24166-29cb-47c6-9b00-2f74950108cb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.25,REQID:96b24166-29cb-47c6-9b00-2f74950108cb,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:d5b0ae3,CLOUDID:820f753c-de1e-4348-bc35-c96f92f1dcbb,B
	ulkID:230526173156K5PZNBY8,BulkQuantity:3,Recheck:0,SF:29|28|17|19|48|38,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 3acd8fdefba811ed83ed1395ce914268-20230526
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2063635347; Fri, 26 May 2023 02:32:27 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 May 2023 17:31:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 May 2023 17:31:52 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <amergnat@baylibre.com>,
	<alsa-devel@alsa-project.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 5/7] ASoC: soc-dapm.c: clean up debugfs for freed widget
Date: Fri, 26 May 2023 17:31:48 +0800
Message-ID: <20230526093150.22923-6-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230526093150.22923-1-trevor.wu@mediatek.com>
References: <20230526093150.22923-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_023230_201960_E4CD89AA 
X-CRM114-Status: GOOD (  13.40  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When a widget is added to dapm via snd_soc_dapm_new_widgets,
dapm_debugfs_add_widget is also called to create a corresponding debugfs
file. However, when a widget is freed by snd_soc_dapm_free_widget, the
corresponding debugfs is not cleared. As a result, the freed widget is
still seen in the dapm directory.

This patch adds dapm_debugfs_free_widget to free the debugfs of a
specified widget, and it's called at snd_soc_dapm_free_widget to clean
up the debugfs for freed widget.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 sound/soc/soc-dapm.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f2f04ce693a1..c65cc374bb3f 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2216,6 +2216,16 @@ static void dapm_debugfs_add_widget(struct snd_soc_dapm_widget *w)
 			    &dapm_widget_power_fops);
 }
 
+static void dapm_debugfs_free_widget(struct snd_soc_dapm_widget *w)
+{
+	struct snd_soc_dapm_context *dapm = w->dapm;
+
+	if (!dapm->debugfs_dapm || !w->name)
+		return;
+
+	debugfs_lookup_and_remove(w->name, dapm->debugfs_dapm);
+}
+
 static void dapm_debugfs_cleanup(struct snd_soc_dapm_context *dapm)
 {
 	debugfs_remove_recursive(dapm->debugfs_dapm);
@@ -2232,6 +2242,10 @@ static inline void dapm_debugfs_add_widget(struct snd_soc_dapm_widget *w)
 {
 }
 
+static inline void dapm_debugfs_free_widget(struct snd_soc_dapm_widget *w)
+{
+}
+
 static inline void dapm_debugfs_cleanup(struct snd_soc_dapm_context *dapm)
 {
 }
@@ -2495,6 +2509,8 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
 			dapm_free_path(p);
 	}
 
+	dapm_debugfs_free_widget(w);
+
 	kfree(w->kcontrols);
 	kfree_const(w->name);
 	kfree_const(w->sname);
-- 
2.18.0


