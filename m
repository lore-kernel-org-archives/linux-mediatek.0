Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D064606B59C
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 11:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m83T15c8;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=k57GMODD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+JS/u9nVbprwfAlBTGmlnxIj2t3cznYIMek4M/WJ2t4=; b=m83T15c86WBtZfrteQnjiPizB8
	W828fY3hOQtwp4JvPYuYnrJgDkspxt5hb3YG7A/UsyU+NX1z/yEegzut9USdkzT+GNWLTmu1YZ/hI
	ngp2aCinW6Y+trm2AbQadjDp3/sL9F97mlgZu6c2VvX40HtPhf64/CQxLuxQz/xnsT0t24gKsbqBu
	GcFjnqcUOEa/h8+GY7EKHuW3s/PAkmB11EmJcsUpBj9lEXuZVUwxKcQ0J0NGgwg1PintZ4kwFig4o
	O7gecaBpNBONkd1dFC98v5fjn0ilOQ1QDhWsaeSR4dp6K46Lpb2F4U5FCizRzFCCHJKhBNl3VM7pP
	FgnPG2jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT1G-00000009jMS-0Uuk;
	Thu, 12 Nov 2026 11:31:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRT17-00000009jEG-01Za;
	Thu, 12 Nov 2026 11:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794483053;
	bh=evv+CrxPRGP4psPKxNQ1cTVcYtBSFk2IB3FxbDUgnAg=;
	h=From:Date:Subject:To:Cc:From;
	b=k57GMODDZ67douUoHRA4mSwQ7ooA/P+lSRygRsHsj4698JkIRpuvYXOu5z09nD/jm
	 gaq5uLeEJ20N0XfSCj7YsF93Uk1Y04Si4fDWjq6mq4FEu9IT4JK0TepuzwJEHA91Wa
	 nyZl/xe/HGvqmRXixvbH7cjMRAufs4C2V6Bj2QJHA3ioNy/h2y3vCqSpa/nRSrwBkh
	 UZdKqfBJSZZ/E6da4q9028xEx7yjmR0c3mJnyrBmpNLw7x9PWzVo4emEt/Gg6sgbFI
	 2CRfckSY4G0ZzD4CWtTzH1ZWXbp4q5E9msPuMfDhzCMjfmj5hdmrhEYlcZyQdbldqa
	 /opkoAcwCS3UQ==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D555217E057E;
	Thu, 12 Nov 2026 12:30:52 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 12 Nov 2026 12:30:46 +0100
Subject: [PATCH] ASoC: mediatek: mt8195: Fix ETDM3_OUT DAI startup error
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-mt8195-dai-etdm-fix-startup-v1-1-2a9fb98b9f6e@collabora.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CMBBFr0Jm7SRMTRG4imFR6aCzaMF2MCSEu
 9uIy/d/8t4OmZNwhr7aIfFHssyxAF0qGF8uPhnFFwZTm4aIDAZtqbPonSCrDzjJhlld0nVB01p
 uuvpmpytDMSyJy/2z34eTE7/XEtFzhIfLjOMcgmhfRd4U/yGC4Ti+r7MZqZ4AAAA=
X-Change-ID: 20261112-mt8195-dai-etdm-fix-startup-285e69075f3e
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 bui duc phuc <phucduc.bui@gmail.com>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794483052; l=4156;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=evv+CrxPRGP4psPKxNQ1cTVcYtBSFk2IB3FxbDUgnAg=;
 b=MyLx+bJ/4LwXeHbcsHvX9ezbWch2KPZd+M9+oYLuJhTTdrz8wBOfiCRMyS8kWIfnjmj56QqBN
 I7e1TuPefqlClhaJ9bwjZFZtxOKYNtDAlqmCZ6bSU9qTBujzbk3Ih82
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_033057_255221_1596CAE4 
X-CRM114-Status: GOOD (  18.93  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_dai_hdmitx_dptx_startup(), used by both ETDM3_OUT and DPTX DAI as
startup callbacks, calls mtk_dai_etdm_enable_mclk() to enable the MCLK
clock linked to the giveb DAI.
For ETDM3_OUT DAI case, mtk_dai_etdm_enable_mclk() always returns
EINVAL error because no clock divider is mapped for this DAI in
mtk_dai_etdm_get_clkdiv_id_by_dai_id(), contrary to DPTX DAI that has
one mapped, and this lookup failure is processed as an error.

Since commit 1d6f1785d903 ("ASoC: mediatek: mt8195: Fix HDMI TX startup
error handling"), mtk_dai_hdmitx_dptx_startup() now propagates the
error returned by mtk_dai_etdm_enable_mclk() and it leads the ETDM3_OUT
DAI startup to fail systematically. The error was previously present
but since it was silently ignored, the startup sequence could continue
anyway.

Same thing also occurs in mtk_dai_hdmitx_dptx_shutdown(), when calling
mtk_dai_etdm_disable_mclk(), that also returns EINVAL for this DAI and
for the same reason. But its return code is not checked in
mtk_dai_hdmitx_dptx_shutdown, so the error has no effect.

Since there is no need to enable or disable the MCLK for ETDM3_OUT DAI,
and no benefit to handle a systematic error, that could be avoided in
the first place, add dedicated startup and shutdown callbacks to only
perform the needed actions for this DAI.

Fixes: 1d6f1785d903 ("ASoC: mediatek: mt8195: Fix HDMI TX startup error handling")
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
The patch has been tested on Mediatek Genio 1200-EVK board, that
integrates a MT8395 SoC (variant of MT8195) with a kernel based on
linux-next tree (tag: next-20261111) plus patch [1].

Note that the issue root cause was also detected by Sashiko during its
"ASoC: mediatek: mt8195: Fix HDMI TX startup error handling" patch
review ([2]).

[1]: https://lore.kernel.org/linux-sound/20261109102536.357134-1-ghidoliemanuele@gmail.com/
[2]: https://sashiko.dev/#/patchset/20261014112752.683032-1-phucduc.bui%40gmail.com?part=14
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 30 +++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index 5fe40299ec80..1806ddc46708 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2355,6 +2355,32 @@ static void mtk_dai_hdmitx_dptx_shutdown(struct snd_pcm_substream *substream,
 		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
 }
 
+static int mtk_dai_etdm3_startup(struct snd_pcm_substream *substream,
+				       struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
+
+	if (cg_id < 0)
+		return -EINVAL;
+
+	return mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
+}
+
+static void mtk_dai_etdm3_shutdown(struct snd_pcm_substream *substream,
+					 struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8195_afe_private *afe_priv = afe->platform_priv;
+	int cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
+
+	if (cg_id < 0)
+		return;
+
+	mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
+}
+
 static unsigned int mtk_dai_get_dptx_ch_en(unsigned int channel)
 {
 	switch (channel) {
@@ -2541,8 +2567,8 @@ static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
 
 static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops2 = {
 	.probe		= mtk_dai_etdm_probe,
-	.startup	= mtk_dai_hdmitx_dptx_startup,
-	.shutdown	= mtk_dai_hdmitx_dptx_shutdown,
+	.startup	= mtk_dai_etdm3_startup,
+	.shutdown	= mtk_dai_etdm3_shutdown,
 	.hw_params	= mtk_dai_hdmitx_dptx_hw_params,
 	.trigger	= mtk_dai_hdmitx_dptx_trigger,
 	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,

---
base-commit: 6aa7dbf8ad5ebd3babf53a4d6209018f86939f17
change-id: 20261112-mt8195-dai-etdm-fix-startup-285e69075f3e

Best regards,
-- 
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>


