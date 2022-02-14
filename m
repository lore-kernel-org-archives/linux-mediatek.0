Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83C6C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Feb 2022 14:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vTuQVUYScUV5McEa19GRxkKNoQT6X4Qykpj/jPXMLaU=; b=XfM2peuHRTlITK
	LiD+TgwibZueqiuq73uzup9vSj6Xi6jqHug2LMgzKtgg5WsWyo0UROTIF03hjc00fEThcCzlS57+C
	eV2QortvA3P7JH10HVz7VCNAso7Hww242ZOGTRHDnd3mk5/PXR6CHxp4WIlX7nCUqIh6widbOZ1yg
	rEPKzlfCYYP8wpf/eEowAGlgKF98yBNL1nY9lf1NPbAdcQUZ7i8aiVYy91Em/Pi+522YgGjI/xav4
	pr/Cm22imkI3lqpi18rApXn+iTZ1qx5rY9sRLpuFkQDrJIG8wSnzFgFKowCMLuWogFhADdzH47emZ
	/+ezOoiualc8HILovCww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJbxV-00FYtr-Dd; Mon, 14 Feb 2022 14:04:05 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJbxD-00FYmy-Gv; Mon, 14 Feb 2022 14:03:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AABB41F437CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644847426;
 bh=+h64QsZ/rfjOYapg2dVyfjUfA0g+jFxUuPrgfX0vMwc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kz+56Zkseu07eayLKtzfXRGwHhVVEPtMd7EfOzaTCgNvS/tlR0YB5ZLzumqNbL72C
 KpK2z0JdkUaHFbs6Y6k4Rj8oHK1SEcrYanrMYLzmXWq71AYXHvcVrKtdCGFAksQ2Gg
 GcROODf6knMnMYyFdKtY9b56jbg2tpjb/VRiFAJKH66skWbfiIQcE4IY/IIooDVPTU
 gtr9A3VpWetF7MHF7wXfwmT9DEuG3cO0QcqkRFSRl9nCobdmBKCjIeLgDj+e+CFJ8O
 V4SUKYSbubs7FVq4PigtyYUnIvTw0CWmSsGBZi3M0KAb59PcpXRWqShWGoYyirgoBS
 rfNDOnI0eh9tg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: thierry.reding@gmail.com
Cc: u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 matthias.bgg@gmail.com, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/3] pwm: pwm-mediatek: Allocate clk_pwms with
 devm_kmalloc_array
Date: Mon, 14 Feb 2022 15:03:38 +0100
Message-Id: <20220214140339.112500-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220214140339.112500-1-angelogioacchino.delregno@collabora.com>
References: <20220214140339.112500-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_060348_102495_9A69ABD0 
X-CRM114-Status: GOOD (  10.03  )
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

Switch from devm_kcalloc to devm_kmalloc_array when allocating clk_pwms,
as this structure is being filled right after allocating it, hence
there is no need to zero it out beforehand.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/pwm/pwm-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index c7d5ca09a684..6b39f3d69e41 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -221,7 +221,7 @@ static int pwm_mediatek_probe(struct platform_device *pdev)
 	if (IS_ERR(pc->regs))
 		return PTR_ERR(pc->regs);
 
-	pc->clk_pwms = devm_kcalloc(&pdev->dev, pc->soc->num_pwms,
+	pc->clk_pwms = devm_kmalloc_array(&pdev->dev, pc->soc->num_pwms,
 				    sizeof(*pc->clk_pwms), GFP_KERNEL);
 	if (!pc->clk_pwms)
 		return -ENOMEM;
-- 
2.33.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
