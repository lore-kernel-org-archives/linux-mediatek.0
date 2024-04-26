Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D35C19F4E
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 09:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xgIspX/XOWkS6naQW9aOiLZYq8xkVkVkct+K7hYT15Y=; b=qWAFIbr9jLOPXOGA9mfIQqqzhz
	6C6nVoI/3flAXyRKBU1vBwnqgzY69M7yWHgmTvjxx9lQhfc7g32pmXpdwyDgR1MZEhrxf4M5nRYrC
	3Lz2OpRbe73k4cmN6KEDYz/eRfq/oGNh9qN7BDykwi1owdN/NlnFURccB8PCSeSLntuXHjNqqcfpW
	TgNrLdOxcTZrEOUx6eEdQr9viiBSuqTBRqtyf5b1P5gBRBNZ3ZCzuoeSoZTfHo9FbGV+uHrvmwJPt
	1HPjjYDdXHKMXicrWMdIC5isgo7OFcYDoBv+QajSSUGK8wIcBtEJoRAXPbFYAlAXY6aAl+k1hhoQl
	gg1P5RLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HWf-0000000BosC-2RXJ;
	Fri, 26 Apr 2024 09:05:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0HWK-0000000BogA-0dZo;
	Fri, 26 Apr 2024 09:05:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 97E9D61FF6;
	Fri, 26 Apr 2024 09:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F82AC2BD11;
	Fri, 26 Apr 2024 09:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714122327;
	bh=VnIAfmPx25oKsEp0zbK0tnxbnzdBHAOYcdVhtoHT55M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lYpGcZwbD++CwmC8RWqhElXVo952m5WjDHqKUqH3kLu2tpnsh/j90pgBBj3pd02pY
	 eCyM7knZlW4cjURhR5UmE2fDAgQ1K8T09MqwUdk1+fR6lqehvBJK7OqE+h/c2lf2bS
	 ISofovYCA2bDcFv0CPVCfNwgUWFSY/W53iH82l9eMxEeaw7QqAlyS9Y0Ri3WXYY8yN
	 EBoWE0XMHycjXYaHVYyPv5Yi72aoojICxP1pRBRqRas5ld7+D5XCwwQgqhCPmxUFh1
	 3KSQEOLxlofSYbE38KDnEqvqu1Vvq+wX7anoJ5El0iReGSqy7FI6Z22H6+j1H/n4NA
	 LTatyohdFI3uw==
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 26 Apr 2024 11:03:51 +0200
Subject: [PATCH v2 04/14] ASoC: SOF: Constify stored pointer to
 snd_sof_dsp_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240426-n-const-ops-var-v2-4-e553fe67ae82@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=937; i=krzk@kernel.org;
 h=from:subject:message-id; bh=VnIAfmPx25oKsEp0zbK0tnxbnzdBHAOYcdVhtoHT55M=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmK24i5ldgk6ROfX3AbXjO+oI6liBQKOT8EK72p
 kq6RFuYidqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZituIgAKCRDBN2bmhouD
 14UsD/0XY1oHKwddmpwGMp3fZbl8ZR4Yf1LvsKEzZAEwVg8Dnef8Ow3zrhLy2YP3NjWoFTKLfEF
 1eppLLdVNgIJphOhDh2zBCrF869W2O9Zd9OZQ3IIxZP91wgv6XKwNsaDCtYNavh9+/dLrDasQPP
 vIvah0BERFKIqXDqIo5g7pPNc4tszzsMA5TJhOKj7+yb5pCj2Jxcl0U+RuZJ8DTwKg5stb2WJOY
 zxTXX6Mj/NQagvsACTBILxPBPQNI2QUHvsk1fY7NCB0aMbpCiySZ6M1q/wkF8StCruiU1h3SbwQ
 DX5AGhQAsK7SIjzkXpkYOw6xqhM3RdC10DYUYk9Fg1+5xXrzVdechRI8GGpYcQ6zemKw6dmSqDX
 kmY9p5Zp7u+kj4lQGy9ZhDAlKeAQ2QDRcopZZzGVkFCix3fxteHQh1DCaklr/D8Npbtxv3nxbJh
 VhsNL0haC44Mdk4BAUwLioHcHEs5JOlC8A0meDqjsrYNrwep/N4Xmkxns91MRcVYxtFQzf0N7Nq
 vITemvqkZ9sJhS3nssaIVR+3j38/AurpPzl4fY5bKN+QN0yAvHDfOfkR2Q7ofNCFgEX9o6ULIIN
 lieNArQ4cwd2etxJFmftDi3/2rkkYSmUVGXcypwxEQpV8Mi6dtAFtCZ8clIRvZsyzPzJBqNX+E7
 iA/exbAmcYlKYxg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_020528_335688_06EFA093 
X-CRM114-Status: GOOD (  12.77  )
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

Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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
2.43.0


