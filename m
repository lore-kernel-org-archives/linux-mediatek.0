Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39B12CE8D7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 12:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MK2jFQBU0kg79FIuLiJzhkCU5io24Q0Vf8sb8F3GnMc=; b=VPyxk3bNKzE0wkihcobvdsfXC6
	kwJC/dwlLUOSaORkNgnda5dUUutoN8oNaMgVxPIRn8NKZPCBvp/RxibIDOpeOU6ZXvyvx7O4w+Buq
	EVTJ+Z4ihqoFmU3Qho4KMRmVYrRmmFoy0lheTxh6hXX2zvBuxOradGJfLQC1QrDoLVxT1HboFPF3x
	27paY+QNK04Lqwmh5ILFnuAsY5U/+xb5jomnT7q5nnkB6rivPuuEAsDZqBlY7vokFx2tUkHekgtq9
	ci2wQteKh0wf+8lm3nm6T5f/MqPGokYIl2AcuLakWThLxX3w4qMZggDlDjXTljOBwXE4uudjz7OGD
	udVhZl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srFsY-0000000ACj4-2rYL;
	Thu, 19 Sep 2024 12:03:22 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srFrR-0000000ACeT-1hyu;
	Thu, 19 Sep 2024 12:02:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726747330;
	bh=r531HWlJ6rYxVUwGU7B5dyRowoYmcdAstECRw39fhQ4=;
	h=From:To:Cc:Subject:Date:From;
	b=TNgS/I5MfsMkxjmqkDIb+LkWwGmu7LVrjplsagA1+NXFPBr3gaT163B1p5VlI+emZ
	 1gZWHY7JqlNJlAwvKVzRpeSCbOfkymKdlfcx/8BqTlQJFkEEhJXgnxRnJo8yGpZOkW
	 dk3kyPLAuC7R1uZT4K2l3cjPcyvlyVo385d+UMejyZQ5/hOrN1tUvAWAp19LMRW7h6
	 eGdN0GntBilV7CB+IRklQJg3P8J60KHtO6FBkjmrOdeIxM3jbPlLebdC53BxcNUnE1
	 1KOlv6OJ+EKX6xR6zWOBYrY4WvE+2T8HUFL6PU/aum1YuTOyA3wMMSkRphSzBwEor8
	 Na2gdaYvn69Dw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 61C4E17E12D3;
	Thu, 19 Sep 2024 14:02:10 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	gregkh@linuxfoundation.org,
	u.kleine-koenig@pengutronix.de,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] firmware: mtk-adsp-ipc: Switch to using dev_err_probe()
Date: Thu, 19 Sep 2024 14:02:08 +0200
Message-ID: <20240919120208.152987-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_050213_625166_90E55A4B 
X-CRM114-Status: GOOD (  11.08  )
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

There is an error path that checks whether the return value is
-EPROBE_DEFER to decide whether to print the error message: that
is exactly open-coding dev_err_probe(), so, switch to that.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/firmware/mtk-adsp-ipc.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/mtk-adsp-ipc.c b/drivers/firmware/mtk-adsp-ipc.c
index a762302978de..fdb083f42ebf 100644
--- a/drivers/firmware/mtk-adsp-ipc.c
+++ b/drivers/firmware/mtk-adsp-ipc.c
@@ -95,10 +95,9 @@ static int mtk_adsp_ipc_probe(struct platform_device *pdev)
 		adsp_chan->idx = i;
 		adsp_chan->ch = mbox_request_channel_byname(cl, adsp_mbox_ch_names[i]);
 		if (IS_ERR(adsp_chan->ch)) {
-			ret = PTR_ERR(adsp_chan->ch);
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "Failed to request mbox chan %s ret %d\n",
-					adsp_mbox_ch_names[i], ret);
+			ret = dev_err_probe(dev, PTR_ERR(adsp_chan->ch),
+					    "Failed to request mbox channel %s\n",
+					    adsp_mbox_ch_names[i]);
 
 			for (j = 0; j < i; j++) {
 				adsp_chan = &adsp_ipc->chans[j];
-- 
2.46.0


