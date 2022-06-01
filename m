Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92805C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 12:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yyuyUzC1nImQh4xhriPxdIAY0UH7zOWgiFA/YgR0Kqc=; b=1rjqfJvcZjHnSD
	LgW+fTCEfhzlfEuI2CTWPC8efX6ws2+6mdsnldHpFJ+qWmpmmveAS0r091vutCllMlA1qzLi2Rto/
	LBNz3ZtPC9GMClEAu9WUY6uiK0iHfswZp+Za/ujJJoQI3Oxnr/gPs9ntwxOBD9hd9HVxMB+DP34ZP
	5yhgFAo3znC8Nzo70aA0Firl+acu4hBhnB3A5nttK//GoiGA/GTZxAClWkVldUKa8YxYE+1b8Z+3x
	buhKfE07jLfIbVtxSqlNcS5ThCPDBN7eXl6Jd/88Buqj/R8xqhF7ft6iQAttm7reTe0YRXoTHmdae
	y8vgNFS0ZSE914mB6o6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwN7O-00FwSQ-By; Wed, 01 Jun 2022 12:06:30 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwN2c-00Fp5C-4g; Wed, 01 Jun 2022 12:01:35 +0000
Received: by mail-pl1-x632.google.com with SMTP id i1so1587489plg.7;
        Wed, 01 Jun 2022 05:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AQaa8aVqn7LCqui/AQO7xtRUHuVEzK1EOsK/b5n0bwg=;
        b=Rk5+Fgt4g2fGSpTS1ffRyNPsXmfLLAMkv0mZQsApaSVR1HeVNIslWb2DxjvcsrIhs6
         SyTNBc2TR+Q5zXdjQLO8jSUqjrEGZoxU+pHFfRSzMmLGUSZk3INYBiV0So5V7mbROQ8Q
         IEN0dG2ksUsrljwtvp9qjzZhg0Ct2ISM/da+neB0N/R58Yu1OrRbvDxnJ1or6eo2q37M
         4S3JsBFBm61zG2GAYM0GziLa8ikOIdRfUP2mvIcTtvezCUi5zaBkdrnF0rgjt87tFSho
         db+zYwaGWkRh2jzaWLZr6lWFulYXKLSK6mtr73U2/ZvsNrhDg1ZQYdB+uO3RR3rztLEt
         0Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AQaa8aVqn7LCqui/AQO7xtRUHuVEzK1EOsK/b5n0bwg=;
        b=Og6EMwc4XfnGNEubUFIQGpVk/eK2s/ysDHmpkhZvXeVPkAbzWSS8vsVYmBw+nL32KS
         iPd5nuGA+kkBXoLJyQ3NaGfnAMFsVNfRHne+rcSNoLGajZdn9Apio/IGV2UycIdmDmZ7
         /WGTpEIjnhRe2qyzx34R38NGYFRj0ZUsCeH+QwQi1FOHBD1z8TZ3z5kmi6R1tl1nlRg6
         K3466MNvlCNmk0QNKeYT9XbL6DZ1vIN1M/UsfQlQ3RQpmhag4pGVr7wPvcmcO2a1hlwT
         D4sJsibTKE+kK8ua8OG7DsZ6kRIJhoq/ZnYGGjcCZ5mhGMcn+JhLCLmj6Lz0KVr0lcfy
         2ibA==
X-Gm-Message-State: AOAM532oGlbxUPQwlmUIH/mXlDoDTTIYuUTmYm0E9gXDzV9kvR52OGQn
	r3e/8uPO666FjTs85HcnYUA=
X-Google-Smtp-Source: ABdhPJyD30OLkxR/cynKadX0v/sX1N9tODwKDdCOKgarNQnfqsE0vpzAJP2SytMd84Tg3bOydV5S3w==
X-Received: by 2002:a17:90b:3e8b:b0:1e0:582d:fc23 with SMTP id rj11-20020a17090b3e8b00b001e0582dfc23mr34063728pjb.228.1654084891207;
        Wed, 01 Jun 2022 05:01:31 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id u11-20020a62ed0b000000b00518c68872b9sm1290228pfh.216.2022.06.01.05.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 05:01:30 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Yong Wu <yong.wu@mediatek.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Ikjoon Jang <ikjn@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linmq006@gmail.com
Subject: [PATCH v2] memory: mtk-smi: add missing put_device() call in mtk_smi_device_link_common
Date: Wed,  1 Jun 2022 16:01:18 +0400
Message-Id: <20220601120118.60225-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_050134_214167_F9DA95B7 
X-CRM114-Status: GOOD (  15.45  )
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

The reference taken by 'of_find_device_by_node()' must be released when
not needed anymore.
Add the corresponding 'put_device()' in the error handling paths.

Fixes: 4740475 ("memory: mtk-smi: Add device link for smi-sub-common")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- add put_device() in return path -ENODEV.

I don't add put_device in normal path(return 0) because it will set
*com_dev=&smi_com_pdev->dev; and escape to the caller.

v1 link:
https://lore.kernel.org/all/20211230084115.5375-1-linmq006@gmail.com/
---
 drivers/memory/mtk-smi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index 86a3d34f418e..4c5154e0bf00 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -404,13 +404,16 @@ static int mtk_smi_device_link_common(struct device *dev, struct device **com_de
 	of_node_put(smi_com_node);
 	if (smi_com_pdev) {
 		/* smi common is the supplier, Make sure it is ready before */
-		if (!platform_get_drvdata(smi_com_pdev))
+		if (!platform_get_drvdata(smi_com_pdev)) {
+			put_device(&smi_com_pdev->dev);
 			return -EPROBE_DEFER;
+		}
 		smi_com_dev = &smi_com_pdev->dev;
 		link = device_link_add(dev, smi_com_dev,
 				       DL_FLAG_PM_RUNTIME | DL_FLAG_STATELESS);
 		if (!link) {
 			dev_err(dev, "Unable to link smi-common dev\n");
+			put_device(&smi_com_pdev->dev);
 			return -ENODEV;
 		}
 		*com_dev = smi_com_dev;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
