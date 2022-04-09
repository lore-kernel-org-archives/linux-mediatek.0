Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D3DC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Apr 2022 06:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LqJ2VfTvfiIVY/Jg5P+HDU5ZgPo2bz5TUREtwdccvs8=; b=qwWNwUUoqhvBZx
	F/T1iwhVBi3hx429Y+34HlPTUdZkJhDyVZbXFeZcIzxBRiF8C+TZPHz1cm7rQwCuGGvgkqf2jIyec
	8JDK0ppMoqgeDvX2ikZTAC2JiOzUgYdr72IbQJogOh6DT8xnGTdZFkt5JqsYKcFGcCRvGGgTVLF/2
	M19uo1wAzmzbezwKNDfvqp3NtzYCfyeGIW2BVY5rTmiqM7ZjxRZgnSRgdwODjUqhNE76P70UGYksF
	r8lwdUF9TGzbkSA7qkE0K05dug3IvHNGsHatfHeKKaxOxmtdVFa574lNxqrBgLIhUf+qRzvNZg1pV
	SZx9cGAL7Mq6FHD5FyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd4Zs-002RhW-MY; Sat, 09 Apr 2022 06:28:08 +0000
Received: from smtp08.smtpout.orange.fr ([80.12.242.130]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd4Zo-002RfK-SJ
 for linux-mediatek@lists.infradead.org; Sat, 09 Apr 2022 06:28:07 +0000
Received: from pop-os.home ([86.243.180.246]) by smtp.orange.fr with ESMTPA
 id d4Zgn0yPQNEW1d4ZgnPvBC; Sat, 09 Apr 2022 08:27:57 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 09 Apr 2022 08:27:57 +0200
X-ME-IP: 86.243.180.246
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: angelogioacchino.delregno@collabora.com,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-remoteproc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2] remoteproc: mtk_scp: Fix a potential double free
Date: Sat,  9 Apr 2022 08:27:54 +0200
Message-Id: <1d15023b4afb94591435c48482fe1276411b9a07.1648981531.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_232805_097358_A322445F 
X-CRM114-Status: UNSURE (   9.86  )
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

'scp->rproc' is allocated using devm_rproc_alloc(), so there is no need
to free it explicitly in the remove function.

Fixes: c1407ac1099a ("remoteproc: mtk_scp: Use devm variant of rproc_alloc()")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
v1 -> v2:
	- add missing Signed-off-by
---
 drivers/remoteproc/mtk_scp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 38609153bf64..4a0e6c4bc6f4 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -877,7 +877,6 @@ static int scp_remove(struct platform_device *pdev)
 	for (i = 0; i < SCP_IPI_MAX; i++)
 		mutex_destroy(&scp->ipi_desc[i].lock);
 	mutex_destroy(&scp->send_lock);
-	rproc_free(scp->rproc);
 
 	return 0;
 }
-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
