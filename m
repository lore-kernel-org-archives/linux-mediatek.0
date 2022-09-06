Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5124AC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Sep 2022 09:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqVCEFxgZT3Yk8JbHPpz4KOOZa7ZmxAOLFYT1AqjaAA=; b=plY/mhKH3xpdBtF3adeNhOpqz7
	zJbq1Db0aXYJhbNyqXgLQWHWUOjTb6/EHX8YDbXsRRCrxy5sUwYAMcrEesS2XVWxwqREeS3xsQAi1
	UxF62Q7AwqzGwfR+W5NXWGPrmCIHri+fjhGmaIn9r1Phx4/tAgODvg/YHtR7Uf1Z6iX9HJdW+esWo
	6Dl+JPPaBYuYAosX32N6beCC2DynSerZkpYuPQUvm175EPsVND+2FANhpzwlGn3TDgSXIAuzIo7eO
	1jqDSGBfFDdmXYXOW/vU77R4nWduHXxMWvYdPhqcZjPzNNj0TmH31QNqTgR89cv2WTk8n16enlHF0
	bxLnP3zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUtd-00Bops-UK; Tue, 06 Sep 2022 09:29:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVUrv-00BnuV-Bp; Tue, 06 Sep 2022 09:27:45 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 821FE660038D;
	Tue,  6 Sep 2022 10:27:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662456460;
	bh=yV6nCsjeOdwaKJwa/v3ztHbWo4/fPObpHuPkgeFvzgA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kCCCdAdPwuWWeMFa2+5PwAQeF3I4MKfZVzXHZNN8nHmFiSVVBsmDlgUxsLjsyP9xR
	 IG7ng+Ts5OLLA0ENa5tu0bVSpEDNDDO+9dYz6DJGGuQvT3ETw3fg5Ex9W+VROmO1wC
	 Jvgq8XmCrR4QLTvQLvGbaGoG4f3hZiBpJB0fAJoM/sNqiN+0ygNgmwexBb0oy+SUWj
	 7idoqXQjmJ1znaMpkR+dak5n9t2yN2r1o/7PTgUmR1UwvD4yzSSGWEgoEPjIqLPgiB
	 gVKCwTylk+bgKHgvg0MabafFdICAlHcMgT9VXmoGU7SHBVrcyoymzJBiVG1ksEeaRv
	 ij7DtFUjRljcA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	matthias.bgg@gmail.com,
	wenst@chromium.org,
	pierre-louis.bossart@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	trevor.wu@mediatek.com,
	tzungbi@google.com,
	angelogioacchino.delregno@collabora.com,
	yc.hung@mediatek.com,
	Allen-KH.Cheng@mediatek.com,
	geert@linux-m68k.org,
	chunxu.li@mediatek.com,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	kernel@collabora.com
Subject: [PATCH 3/5] ASoC: SOF: mediatek: mt8195: Add mailbox generic callbacks for IPC
Date: Tue,  6 Sep 2022 11:27:25 +0200
Message-Id: <20220906092727.37324-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
References: <20220906092727.37324-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_022743_594719_54231E17 
X-CRM114-Status: GOOD (  10.64  )
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

Add the .mailbox_{read,write} generic callbacks for SOF IPC and, while
at it, also change the ipc_msg_data callback to use the SOF API
sof_ipc_msg_data() instead of the custom function mt8195_ipc_msg_data().

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index ff575de7e46a..68747ee21c6f 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -496,14 +496,6 @@ static int mt8195_get_bar_index(struct snd_sof_dev *sdev, u32 type)
 	return type;
 }
 
-static int mt8195_ipc_msg_data(struct snd_sof_dev *sdev,
-			       struct snd_pcm_substream *substream,
-			       void *p, size_t sz)
-{
-	sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
-	return 0;
-}
-
 static void mt8195_adsp_dump(struct snd_sof_dev *sdev, u32 flags)
 {
 	u32 dbg_pc, dbg_data, dbg_bus0, dbg_bus1, dbg_inst;
@@ -574,6 +566,10 @@ static struct snd_sof_dsp_ops sof_mt8195_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Mailbox IO */
+	.mailbox_read	= sof_mailbox_read,
+	.mailbox_write	= sof_mailbox_write,
+
 	/* Register IO */
 	.write		= sof_io_write,
 	.read		= sof_io_read,
@@ -584,7 +580,7 @@ static struct snd_sof_dsp_ops sof_mt8195_ops = {
 	.send_msg		= mt8195_send_msg,
 	.get_mailbox_offset	= mt8195_get_mailbox_offset,
 	.get_window_offset	= mt8195_get_window_offset,
-	.ipc_msg_data		= mt8195_ipc_msg_data,
+	.ipc_msg_data		= sof_ipc_msg_data,
 	.set_stream_data_offset = sof_set_stream_data_offset,
 
 	/* misc */
-- 
2.37.2


