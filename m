Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7A1C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 01:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gDpsQVvyghTzNaVPnniyiXzmA0liI+LY+Mrx8Qmyews=; b=4sgs8Esl3lsqIw
	P1skZfxftevMH7LrTXqT3HgbAcyzv2fNGl46ozD0lC2TKyquJBVfWJ3d7tEbH1Q8r6XMrh74Gzbsf
	MJKK9634rwqlgDMoBMDwIS3InFaRCqH/qBR2kr6ENV+5EbYvbjr4t76nuEtkC9+lkyZcGq3eTQ0CP
	XK3F6RS9o3npyB2/iIq4Uc7t3BlDRdDl5ejxp/kwwqwc1vbNeOWw4yVre2SupuHz4gN5qz+eOGx3m
	9JBo96zdvpR5M6odyhbqKoEmD14ScgAnXgl3uu6ndU6TMenmwWrMElPj6qle0CvrfjXQwXvURQkN0
	OpHe0zEoQB/+VbmeRTJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngd8n-0016Fz-Gb; Tue, 19 Apr 2022 01:58:53 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngd8c-0016Cp-8l; Tue, 19 Apr 2022 01:58:43 +0000
Received: by mail-qv1-xf32.google.com with SMTP id y19so12164167qvk.5;
 Mon, 18 Apr 2022 18:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNU/TphCFnbVlBp1Z5GLi2lvQvgI9Sbk164GKyVPu8E=;
 b=hDaaH9Aj1f5M/81SYEwYOiK6gb2rb/RJ5UI25cuoR+XXx9AxrAW6gRCLn4XoPuw2vp
 MKeweM5OEOgh5mme7ASmV2f9nuogyfaCcbfGINPok9hAwddtEsxQQl8pahynBep7WiO0
 djDB87thbWxH7rUbQ9cvSzOXNMpMUllB1TOpzHJm/XWx6Bth+SMLyclxItqQ8C7bcFl2
 4mscroyzSj/MTHwfdxiRnRCdkWq6amSwmscjayA+ZnpL0oCNHGTyGpwwyrDlZK/C24uN
 YZEWbZgDMM0aWPYeFpujosa/VVMo++DDWogwSmgauK5dusjsyt5dTyS0aP84gbQJpWCX
 T4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNU/TphCFnbVlBp1Z5GLi2lvQvgI9Sbk164GKyVPu8E=;
 b=NMvlm4I1OXoEcQwZaktTFt4rHtGolgBD2bDCKS4r0Xrrkvhd2z8rHUusrXYfyT9/a7
 ChbZP6BmaGfKpnrHsLmYj9kAoHn+23XtthEO0zvhKjEgllka0DGjPv7R+qvUujMZMAYf
 TE2WvyWQ+UzdyKC87PtR+LCmHRQS3o3Vt2M0XbzSnJY5M9LcB5+mhXeSTS8cqBBByApT
 jPGdyXr1gDH8oFtzEbaIkkYfD/opBrz3fhOgUIoMpfigcT+c2P12huot/qIUC+ysjZye
 A3xhuLhFW1NoRTHpkf1DU4LelVX9nb0t7tUL9m1PjYo5IWa9DWK3DraRL5PMNonlCrIo
 HANQ==
X-Gm-Message-State: AOAM532fm0yl+oHW+EoonIxvmxBSr0fPTmCZ9QSnRcl8KAIsi3T/xMfT
 PWD3UOUv/QFI8DsLfEfYMIg=
X-Google-Smtp-Source: ABdhPJwM2wWDgSXWxNeAPoGVjU8YN2SYfC/GsxDdiLjs1L6aTlJIWp5um2jAKuULyWgE6dXx0SQd2A==
X-Received: by 2002:a0c:a98a:0:b0:443:e880:501a with SMTP id
 a10-20020a0ca98a000000b00443e880501amr10190878qvb.73.1650333520662; 
 Mon, 18 Apr 2022 18:58:40 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 g9-20020ac85d49000000b002f1fbe305e7sm3281002qtx.80.2022.04.18.18.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 18:58:40 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com
Cc: Mark-MC.Lee@mediatek.com, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] net: ethernet: mtk_eth_soc: fix error check return value of
 debugfs_create_dir()
Date: Tue, 19 Apr 2022 01:58:32 +0000
Message-Id: <20220419015832.2562366-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_185842_350457_96059405 
X-CRM114-Status: GOOD (  11.09  )
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

From: Lv Ruyi <lv.ruyi@zte.com.cn>

If an error occurs, debugfs_create_file() will return ERR_PTR(-ERROR),
so use IS_ERR() to check it.

Fixes: 804775dfc288 ("net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)")
Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/net/ethernet/mediatek/mtk_wed_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c b/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
index a81d3fd1a439..0c284c18a8d7 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_debugfs.c
@@ -165,7 +165,7 @@ void mtk_wed_hw_add_debugfs(struct mtk_wed_hw *hw)
 
 	snprintf(hw->dirname, sizeof(hw->dirname), "wed%d", hw->index);
 	dir = debugfs_create_dir(hw->dirname, NULL);
-	if (!dir)
+	if (IS_ERR(dir))
 		return;
 
 	hw->debugfs_dir = dir;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
