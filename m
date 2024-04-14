Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F782C4345F
	for <linux-mediatek@archiver.kernel.org>; Sun, 14 Apr 2024 18:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q4gMnb7npsTmK07ih6lOHpmSt2KDN+hCy7eULnCz+SM=; b=k7C520BGOJRZQb9TtMN8Haaxih
	mDBxbSkhNPvFN+UTzVInWrPXifzv7Z9MvXCnUb3eagEx/wO0mB0p/i5o1CZib1bgxyxnvqh/HgrQ5
	5RjMu7ZQmONE4Yrp+W4SlFwdux0asr77sGtaP1EO6bP8fBzO9RenwjHMn40XeXri80+RN4obfth+N
	HZDy20CYoAILM7IvuIbA5RwAezfPWIt5xJi1EnqT6EisZRUW4d1cdPQjsZoXvBZEI2pCLGF+Mr6cz
	aUgmlixuba4HQWNXFY4x0F7+Q9u9L9uubwFmvpjgxj2eKTxCcSZPVQn8FuKm9ZV7i+JXxL28gz02I
	NdiJx9HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4uL-000000068HT-2YDo;
	Sun, 14 Apr 2024 18:48:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rw4tp-000000067xt-1DVe;
	Sun, 14 Apr 2024 18:48:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BCB5560B91;
	Sun, 14 Apr 2024 18:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D636C3277B;
	Sun, 14 Apr 2024 18:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713120500;
	bh=n7wgW58QvGruDrxcgPHZ72/9XELas9m3qnwPa8llWsk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oPd6yaiKERZRfVPjEQ6paFa3Eued9/3Zifbwe7+YeE4e533+9/koXTx2XhCt6kRit
	 EQgi+4+k7govpa6V9WlHHpvihWLlkvbrFif2qTCCV5ABSe9Qf+mIy1LQd7vR0s7G/O
	 DWpNAjy6OMi7KvQgNR7Jx+cVOQelggwEvINbHWWlwEqh65rwhCHM+eF6CRn4RHqHBN
	 qlMXJyQdEjJhVmNOooyGx4bgNEWpTD4o4gT99mG2Ct3oPuPpcHCHPDqGT6Am0+hEV+
	 GcARU4SBUVRixOBB+8/l918GpHJe8hbVkU4v4L8V1TwfQDkmQQUzi6CoDaHaP7D681
	 apGvQQcm4JetQ==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Sun, 14 Apr 2024 20:47:29 +0200
Subject: [PATCH 04/14] ASoC: SOF: Constify stored pointer to
 snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240414-n-const-ops-var-v1-4-8f53ee5d981c@kernel.org>
References: <20240414-n-const-ops-var-v1-0-8f53ee5d981c@kernel.org>
In-Reply-To: <20240414-n-const-ops-var-v1-0-8f53ee5d981c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=865; i=krzk@kernel.org;
 h=from:subject:message-id; bh=n7wgW58QvGruDrxcgPHZ72/9XELas9m3qnwPa8llWsk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmHCTHoHVG8jIRMuSyEz6gw6s3WlC+CMzYEr3rQ
 MYLccCWoXGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZhwkxwAKCRDBN2bmhouD
 10RkD/9D3WRc5sgDCLrfb2gtoEJht5UdUfaYqmyCGnC4zF64/kGjFd3mRP0+XjHAYrAPJU2U0ev
 +aMgqK7guv6mDoeOaa1DIa9L+PQMlTnOwx/s5ZtUTvx/nSFrNhx4Yppt30QM3m0xsPtaKnc92HS
 mnvNs/dTZ4EcY9wd+VMwlxUEOOI9IJIGC5qZlh6f3eJuMx7q6Q68yiFUh/mCf2vQ4Q8cE7WK06S
 sxKQgICNKHgU5BO5szTlIoxYC9n7uu4Xlpdlf0VDPFPjsDLV+gK/bkpTkHirHXP6qRew9nqfg4t
 ilQ6oHvKLZ2rU/eyZD5bpFL06PLMMkFSNlAZVo4sSlXVpMG7/j/sQJUm4fWjTDIzIZi9Gzqp9Tl
 o4g6viiNkC49EkHiYKdtjsC3Ib3pczn2pmoTm6q6Vz8N2TCGcFS2CabtiKFKIdzkhRMMFi62u33
 2JdLLGvqf0q205Ytt/yYUVQzkezPBRMeqESRUD5PqelX+RkYSaHz0ktt0Awm0Ox2QR4aV7dCohj
 JBTrq2cR56i3Z/RD43Yz1kqtX1sMVaiC00QKUBDnMp7DfMe6bBcfvKXpwHRNjnvSVD06XfLUkO0
 h5lIdUzl6YlPnPYCvpHKxiUWwDBc/i6Dy+gUZfz06k669fkV21AYu3fspJ4Kt64ccqjp0spzr+7
 ngqZjikSKjwv0iA==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240414_114821_489872_7445E287 
X-CRM114-Status: GOOD (  12.13  )
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

The core code does not modify the 'struct snd_sof_dsp_ops', stored in
'struct sof_dev_desc'.  Make the pointer to 'struct snd_sof_dsp_ops'
const to annotate this, make code a bit safer and allow individual
drivers to also define this structure as const.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 include/sound/sof.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 05213bb515a3..780c1a755917 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -166,7 +166,7 @@ struct sof_dev_desc {
 	/* default firmware name */
 	const char *default_fw_filename[SOF_IPC_TYPE_COUNT];
 
-	struct snd_sof_dsp_ops *ops;
+	const struct snd_sof_dsp_ops *ops;
 	int (*ops_init)(struct snd_sof_dev *sdev);
 	void (*ops_free)(struct snd_sof_dev *sdev);
 };

-- 
2.34.1


