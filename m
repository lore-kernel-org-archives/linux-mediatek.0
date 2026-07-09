Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18304C44501
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jul 2026 17:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zr96JgiP4egzaGIJKICX4lchZUuxQ9WiGvVqK3+0YdM=; b=EA5WQJheX956h+Swg/oMWMGMpJ
	Iet+eHdQ/owmLx856L4/tbjRh9FpSRiUg049SQNAB7OTiwHTsABhCUEMDogNVn2Af29cmyTLlG7Y5
	+9/8D8BWUK3T5oxWFE48H9DjEf3Uj+pLJKxTdjydNrl17GxJmL2cZa4p9dJM6VFNdJwRXHPkAv/y/
	mP8LElxeTQZ/5xbFwySe3HnX4AZqqTVgZh/h7z0eeJLkT7FBAixtqIkwAS4MAp9KXlhoI+JOe+4s8
	5Bfdnb5tDE4iw09Oy3ix96kdybVVGPk9lbpysxC/DKwXO380TA5laQLC46YZSBPDHsx6b8K252Lpi
	TL2fyWDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6d-000000034ug-3WEP;
	Thu, 09 Jul 2026 17:00:11 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whs6b-000000034rW-0k5o
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Jul 2026 17:00:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-470174001a0so102851f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jul 2026 10:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783616407; x=1784221207; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Zr96JgiP4egzaGIJKICX4lchZUuxQ9WiGvVqK3+0YdM=;
        b=hg/UwgmzJVSXa9vTSWEODmqUxs+of83EXqRRkwY6/+IRRp7ZqNi3SDea4CWT+q8+/8
         XWIDYZbVqgROCfJ3u0+AT4hEgQ6cYFd6mPOb1qmrYGEcU4tpNibxnVmBdE2VYpP6phwW
         anhWFDqDSvuqOvIlkHsA7CFTcbPgrjjkj7gCgK61f8tgcd3YUc19syiplOUMuOWidbPn
         z7V7nu6NbbFZA7HMyvZjJx1dK1kYK1RE/ifzhvhwaO6OLMv10XImJJxFujICKZyrMI88
         nYrWdYFqLyERDR07GjukZQKqcFiPHTo/dD/A986EJnusDlDo7m/Cm0BB7y7bFfTnPsoF
         UZEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783616407; x=1784221207;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zr96JgiP4egzaGIJKICX4lchZUuxQ9WiGvVqK3+0YdM=;
        b=qnSCwT+g7v/k+gQmT0U0WsWcFLTQsj6Sk1kpuRCu+jqoQsT6JPk5jlzyRhxAySuJVs
         4fNzqG44rSgEavjLWDm8xHj+UE0zHproPpU8ooyS+Z8KqVm4VZN4Emm4vPUN8wUZauBE
         i5s7o7NyDf6YfSMJfkb6ucYkYD75OtQi1NeXwksrAGqemhlXcgAzDNs0i+8gMQUQOhos
         B3er6L9G5kPbeMXWWSmWCrjynm/y26T23zmV3vnTxF17Gg5TA8UgsBQfIVPX+bNEOhcz
         uHkPLtjlkq7eEaY4qi3Q1XlOC4BIk5QLhPEt/Ys357MwS1fw/AFAcpy/LVRp5GOPf4LL
         65dQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr57ghNXy6hcF+3LznLn0YBtgabEzg5AIQDMIWIf3RAD3sWBKjZ4/mn1+ZH3NUmVaw6kVFFiu6gQAAGSAlDZw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyo0iqH5+Pbbt26w2+fN+iFCjHjAjhVPD4Isr0wf3u7i1ljEtvK
	mO2tlv+625vz5kUf/vgeJBrQgH3IpWgw4azu9cIfZliTcsrS1HKXfSJSqsaF7R7QG7cCNYl5sTx
	Z0N5Y
X-Gm-Gg: AfdE7ck6zpcCejzQQXpOuLYerIOsHP0DunRPUaqetKDCzONhQZoVoC7wYmScVBdn4km
	m/UeIEjRAc9IIpWfHOeox3F+d/iGa6s9n9Vp12YbVrjtMTu3PTzI9jtwh9e71pIW4xlF0JfXhRm
	l8v6Tkr0KYNRCLUn/YyWLHFIURSvSUsMKNpRX2YGPRxI03DQe98CKb3yL0NfMYbb1fv+irXDVJ/
	bFczgNkba2i6ZN+NFAv7SJ1hv+DoCFP74XtylPaoOtBW08QQ+nKbsR+p5kkClOYdJOiJZ6FFZCx
	n6hTa2Wql5iWIYkRo4dHhq163MHmNvAw8lesMJeWK54XaoKdRBnTt82sHWVZAhGufjIb66mws4t
	14TULjNSiLvuUkyFqsT7dL2POf/T2A/L8fYG7NB89KpaNG3N4r3nYh3t1719fht5xqTeLGO+ddD
	uTaM2+5/w9/MG5+r+dr4Ji16r/MdVUw8dMM6ExomXpiAfy7tSEeGebOv8FfC2VtBIeHVnjWtdf+
	m3k
X-Received: by 2002:a05:6000:2f81:b0:475:f0f0:9ed0 with SMTP id ffacd0b85a97d-47df081bb63mr8593347f8f.59.1783616407119;
        Thu, 09 Jul 2026 10:00:07 -0700 (PDT)
Received: from localhost (p200300f65f47db043de98c19b374aa68.dip0.t-ipconnect.de. [2003:f6:5f47:db04:3de9:8c19:b374:aa68])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47a9de1d8f1sm53469385f8f.3.2026.07.09.10.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:00:06 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 05/23] mfd: mt6360: Drop irrelevant __maybe_unused
Date: Thu,  9 Jul 2026 18:58:24 +0200
Message-ID: <bd2ff9c736d422e2e93c5d2f07d570d3488799d7.1783615311.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=992; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=RMStdZg/15uHp9XX3CRWrZzbzmqyNCoBwi5HiHoruCA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqT9M8JlySz7FGFfwSGIY044anhaWqL/9WnrZx1 qOveDYaMkCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCak/TPAAKCRCPgPtYfRL+ TvQNB/4q2FKUoVolCJF7p3hPnCwnzgNfIwJLyGp0BQt+1XtRgmPT0eZuO0XuJCzHM5w7dR1dPX3 pOfWT/lqjZAn6Hs5OLuUtrim+2RiflnV4MHzbDQTLmB0tXfkdZ7ore0haDWYdzXTCLjaAPMbeu+ 1fb7iyZAoO2QLpTfVRYchd7ahUItAR2/xAlCAli4YDyNUYLz7/6pS5X4EDokt0vyL179m/AWEUx AL6j/fLuLhLpUQfdCeYZHlBpjbDrVLmLcfgySNY8MmYu7x09aXaYX1zOrq2LeED6FPx+Ll+rt9O rCEetzIJbkffTs7pDO1oHSkMt8xcVTQoMb5Krc/cEiNM6ETd
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_100009_235103_8A51FD8A 
X-CRM114-Status: GOOD (  12.27  )
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

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So mt6360_of_id[] is always used and the
__maybe_unused marker serves no purpose and can be dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/mfd/mt6360-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index b9b1036c8ff4..254b00c905b7 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -606,7 +606,7 @@ static int __maybe_unused mt6360_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(mt6360_pm_ops, mt6360_suspend, mt6360_resume);
 
-static const struct of_device_id __maybe_unused mt6360_of_id[] = {
+static const struct of_device_id mt6360_of_id[] = {
 	{ .compatible = "mediatek,mt6360", },
 	{},
 };
-- 
2.55.0.11.g153666a7d9bb


