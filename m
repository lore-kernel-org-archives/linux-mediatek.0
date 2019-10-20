Return-Path: <SRS0=pnE3=YN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35AABCA9EA0
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2019 15:07:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2E952190F
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Oct 2019 15:07:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jD1vh4fy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qHSgKbcY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2E952190F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xD3hXjm1MUvPx+A1wmyNGSXq2BnZFVkFFhnGM3NrLt8=; b=jD1vh4fy5YylaM
	83nG0OCZwmveiTpmbPCJmwiC44bKGuX9snXrB/0aVQHgs4JcbnNKKi8OtiG/+vZ94Cz0iYo91T80U
	ntRkBxgFt01vBQ/KJyDdv4mceKIqRgT93EyBkR24JskFl5h1UoPsKbL61YGOpSujCgL72KVYf7cEQ
	yABTkVbGp7wDx6ZBhldMuTBCP6EUBymQN3w1sDmRyzeE1YoxE1v3hj2yzsRxQWyruDPF64m9vpYS2
	2XpD28azGMGhtnYrwujyPUtEI9IqAoN3QJJ+aJ51/IytyjbqzrsjhS7LK/DXQYzH1SUGXBynUMRg6
	2jHLhLKWUTTHhThI42KQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMCnr-0003iw-Al; Sun, 20 Oct 2019 15:07:31 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMCnn-000399-CU
 for linux-mediatek@lists.infradead.org; Sun, 20 Oct 2019 15:07:29 +0000
Received: by mail-wr1-x443.google.com with SMTP id e11so2302759wrv.4
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Oct 2019 08:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BowsyRCbYQm6XUN+12hCD9eDw6JsQcgoAbMrcPR5L+0=;
 b=qHSgKbcYIsUwGQpczmipayh6Me22RJUYnCPn0NUOp1ECAhFAv/uz0+S0d7hIubBjqP
 XrgG/Qhd5RbqWOTIg8sXou3fMs8B0wV7O3DAJL8dKwWz8QRrQzurKZZX0laNbLSHl0LK
 khiqitVZ7bRom/szIEdsCzlZk+K8NFLLcOY4+czwvN7GaxP6KtzgIMChkkZndBzTAV3Q
 ZJyzBXwNxOrpj06MRheCvKmTYqntfcRdVNpTP2xUeGdYWGJEgBML17uP3WjTpCx9ueW1
 HpXKeJOPANVTZG2jqbHX/zypnU/HCS41nWkdJrpMz346Zieb4AZRMLBwDSiOJw2iYUN7
 qHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BowsyRCbYQm6XUN+12hCD9eDw6JsQcgoAbMrcPR5L+0=;
 b=g52pwVR2j3nGtcDf0KY15L8bQSIplZMhQZkQUl0AQ7PUsubbkl+II022DYFwH72o3H
 gJmMPA4yP+S+dusjiHaLruXBo4Vanmga/1YzjjTEJ6qDhKUUZX5qnceRe4vzlkqn6pEH
 qOLqLrBU6Eybb2B/dRhGXtGapoBiXTdlyZVOaOf+5wYVOg/SMWdfcfASyK3MOqhbMC0f
 zUDTkxm1K0wb65v1Sikt6kPj8FF9YozYgv1XKRMH65eH1uPuc+RNMebPJKzcz17JbPtD
 KgfQyWR16O/lLLW7D3ykyWR4FS/Ch8ia6rJc57mmqPXQOuR4EBT/1cmsXFJky6/1Cylx
 e+Bg==
X-Gm-Message-State: APjAAAWz/QB6/IUEYOqXFr3bw+fL18z1AnG1O6fmZslQKGznR11fRaQy
 9kY8lCoPfN1ApW4DQPjiomiKzA==
X-Google-Smtp-Source: APXvYqz6Y7p6koFFckiqQrTxAUzz3YtZ1GZ6iTTThDt9rGqgjMrYpYqkn3WoQK6zMKRgAz3/YEeoig==
X-Received: by 2002:adf:f402:: with SMTP id g2mr16522778wro.64.1571584044432; 
 Sun, 20 Oct 2019 08:07:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:32c:e530:1f62:944f:4c42:96a0])
 by smtp.gmail.com with ESMTPSA id
 u1sm19057633wru.90.2019.10.20.08.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Oct 2019 08:07:23 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH RESEND] mfd: mt6397: Use PLATFORM_DEVID_NONE macro instead of
 -1
Date: Sun, 20 Oct 2019 17:07:20 +0200
Message-Id: <20191020150720.2752-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191020_080727_492257_77DCEE8F 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: matthias.bgg@gmail.com, Fabien Parent <fparent@baylibre.com>,
 lee.jones@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the correct macro when adding the MFD devices instead of using
directly '-1' value.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 drivers/mfd/mt6397-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 310dae26ddff..9b19dfeeb797 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -171,9 +171,9 @@ static int mt6397_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 
-		ret = devm_mfd_add_devices(&pdev->dev, -1, mt6323_devs,
-					   ARRAY_SIZE(mt6323_devs), NULL,
-					   0, pmic->irq_domain);
+		ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
+					   mt6323_devs, ARRAY_SIZE(mt6323_devs),
+					   NULL, 0, pmic->irq_domain);
 		break;
 
 	case MT6391_CHIP_ID:
@@ -186,9 +186,9 @@ static int mt6397_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 
-		ret = devm_mfd_add_devices(&pdev->dev, -1, mt6397_devs,
-					   ARRAY_SIZE(mt6397_devs), NULL,
-					   0, pmic->irq_domain);
+		ret = devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE,
+					   mt6397_devs, ARRAY_SIZE(mt6397_devs),
+					   NULL, 0, pmic->irq_domain);
 		break;
 
 	default:
-- 
2.23.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
