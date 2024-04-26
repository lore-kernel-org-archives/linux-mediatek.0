Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BE44C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 09:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFW8ygxuGO5aXnLUfBJDB6pTp6oB21vYlf4axVLDv3Y=; b=QhGiq5mGA6eaEWFz99n2QmQ8q6
	gQdGH74+PIa6JjnC2d9TIAsimsid7TaSFOMMVOCEAv6ojMVXOfC6N/gaLbQzlMHiXSgslVoIiB0gs
	5USWTEdRSIfSJ3Lc7qDhHCKjrKFIYjrMyy9atB77Lhaq+CDHr6qKiKavE3m/YY1MKVIfvRZ5vGzbs
	QaJqHjIjjfcIkwRsCeZORYZD+NEw2NKSvOkttyApV2B1n4W2/4mUPpjb7ApQVEZw/f8VV+CWScwJo
	dA1ZURAtOFDWqn0dgy0vJCTFOSVZeRzLM054nys6r+Erk03whIZ4RDLRguBVD0oqs5FL9RdF3l6bF
	/aN1yXkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HXj-0000000BpVa-2uYQ;
	Fri, 26 Apr 2024 09:06:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HX6-0000000Bp8z-1SSa;
	Fri, 26 Apr 2024 09:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=gFW8ygxuGO5aXnLUfBJDB6pTp6oB21vYlf4axVLDv3Y=; b=flOvYmdm8w5HDgsUpJDuV2qNjV
	ZQIIJRGyp8xMbAfj54Oy8pRRCOz0VR6lwFrtTdo9hNHjtDkaB1HGprAk+rbI1/2Px1vyxAlzUePB9
	WIuTC0LDp4DHTBkWQWoKMklt51ES8C7v9m7ROdigEi8MOCHBEZhHhPl/NjNekw4AhjyySiA1KAzU2
	s/ceYkjiXfa6FysuEl6Hu4X0PIJIqAAKZuSgnAGpydZdWQrT0gPK8/ByMmVLh1arGNa83qi2QuvnG
	SetxWzu510SvuRLuy8q3nZ7U3hr6WyJnE/OJMDxWaNzxq1busme/bOulA43CEPA2/cy2ceNdhQEf8
	U3hfjKIA==;
Received: from sin.source.kernel.org ([145.40.73.55])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HX0-0000000FGNK-2pzT;
	Fri, 26 Apr 2024 09:06:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 55626CE1BE5;
	Fri, 26 Apr 2024 09:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD20C113CE;
	Fri, 26 Apr 2024 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714122362;
	bh=XhUx011C+wZqMOdhwTy6Qg8ip1G5xaYrcjjSY155w/o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aMujMDwBsr5AJ6ROnowe+A7L8z1T5tXxxq73BO5xHU+9XjtC1AIMVuvizzgq/l0+3
	 soDbU4bOCwi6HQB/rbtDf/PC9CBr37R3k5SSiZj29vDhxKMwZHWFgDk4epCqHH2Oqv
	 u2dAspQQRvdPI4Eq8hFMbHBbme9GYJzRRhITxjEToz1GNzeeL25wUQXJFC91dFeH+g
	 zp+wB3r4NIqIcCE94xKtyay8mCQ0yeukQGMVCGw4Q1cGHss9Dp3HsSKxFLAd6rfuki
	 /fDHqa32jmC8W5P/533Y1F0SBjLJJ9P/4UVZQusNbiM8rMzBb39f8OFLFp5Fu2U8T+
	 IWLXO5wOvBW1Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 26 Apr 2024 11:03:56 +0200
Subject: [PATCH v2 09/14] ASoC: SOF: imx8m: Constify snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-n-const-ops-var-v2-9-e553fe67ae82@kernel.org>
References: <20240426-n-const-ops-var-v2-0-e553fe67ae82@kernel.org>
In-Reply-To: <20240426-n-const-ops-var-v2-0-e553fe67ae82@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
 Bard Liao <yung-chuan.liao@linux.intel.com>, 
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=829; i=krzk@kernel.org;
 h=from:subject:message-id; bh=XhUx011C+wZqMOdhwTy6Qg8ip1G5xaYrcjjSY155w/o=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmK24neTCw5n/IlL06iKPMsn5vHH38MnGB5Cn74
 zEmJH5zcXOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZituJwAKCRDBN2bmhouD
 15c5D/wKo7t1SBtqeeNDs4U0tuyIRMY0bKI5Luen2McymDX4vxNWoCowKQGuOBSxxe7M4fCxjU7
 rhdpj5W0LIHQwODHS9k056NOqXUId8lwYR20jN0s0AG4ATKra/0GSb4FXhyKtJxj4b1mt6Npoku
 +Lj3/4ETd804pyZRNHNIOFCWLduVaKsm+sJaoHI0lVS9MUolpQiQu8GJntiElFa66zHPGz0V1Y0
 wCzmXKa0/MrL9u8BzTTrhKZDDPkJ/Ph2D7LbRmP5IUErodE+dEV5j9ADsK/5KpWvoo58vIWmvwp
 qd+Nm2CwdLHTjEgwrmLVeGq+IUylQYvk4J4Xi2X11Dm/GnVaipBEm5GO8JHC2OnnFpzs60MTJoV
 LbLwHBHQpC6Z/FYyp2+v/20U+82im7uTMg2DT4sAzSfZ34TbkYZ07bXvi1GyyyNMWM2IFr1QP9/
 HYro7W8/4XI++iSG3TeUAUBDbUgWC+rRN4uftsXh5lqcZ/ECaflHiiV6jLZ9nNuipcg8yT/Cil2
 UQ+ObK45aafKJNWz5LqnlVbirIKdBvFYR5TGaI7u7so0IoVZEVSERfZiPxR4eGb3M54vCLcys8g
 Tb5OoaJhi0TrC3ZlZfg4SZ022AEioqjq0M5w8pkBVVcDA94E5peVa5qLQN0mrgxFdZYVlHBFcOX
 m/6Ze4nzrQlKo2w==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_100611_848064_47B9FFB0 
X-CRM114-Status: GOOD (  11.75  )
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

'struct snd_sof_dsp_ops' is not modified by core code, so it can be made
const for increased code safety.

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 sound/soc/sof/imx/imx8m.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 3e0b88002b4f..4ed415f04345 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -411,7 +411,7 @@ static int imx8m_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state
 }
 
 /* i.MX8 ops */
-static struct snd_sof_dsp_ops sof_imx8m_ops = {
+static const struct snd_sof_dsp_ops sof_imx8m_ops = {
 	/* probe and remove */
 	.probe		= imx8m_probe,
 	.remove		= imx8m_remove,

-- 
2.43.0


