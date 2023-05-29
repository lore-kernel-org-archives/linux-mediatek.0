Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5FEC7EE31
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 16:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=feSVJ4ZJC7g6BnidW2efeFPZ8WR9Bevc0v3Vz7xYSoU=; b=HfTpsCCZwZ0bNhictrBxv5zdtu
	uFXg7yWXltDM9EKyRf7oIm6NAzwXEPKL8bVchdd0Pgk0Hl9CNB5Unfz5Uhuf6nRtA+HEoc6vLnllX
	WI8zPsy849JjhJKPaloVOR0VyXj5CSflMF2Oo+9Vp5uMfRIOoavIHBfNQLi4qZcLqE7G/PGmfaXHn
	x0GTCe97CPnvDABqNcmU8DLvgbqSn/29sQ+Bun05ZU275icjoQI+RS1++AFuRIdW6SMERoGPk7CbH
	r/VyikHGsrTu4N7oDAY/Xg6KTi6cyXn4AuoCivTSTJP+uSvBcNzpVHWcMx+7VuIV3i2JR2nZGn42n
	xqM1d/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fdO-00B5uI-0V;
	Mon, 29 May 2023 16:22:14 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fdK-00B5sq-1t;
	Mon, 29 May 2023 16:22:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1685377283; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OsCqtYftfT3DdQvCNXWDRXWffnX4NxdxU6ZTnICojqLMCbD0RvFIwvSbohu40bqa8doWcLN5ejhYQk2Op/S8n9siL4VsQznGE7oLWmU8q6/1l/FFAOlPJyKBle9co0xJfz4uYHJbrtkCynbCpqrVTf92k1vt2nOUkfrq308UV6U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1685377283; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=feSVJ4ZJC7g6BnidW2efeFPZ8WR9Bevc0v3Vz7xYSoU=; 
	b=XB2IkOwZYsctD0/n3S9F6IgIfgLG3xJxPtzCLBrdqgltFin7yLZRfCjyZbueIgRSAP+ymU+zCTlUAlDfYHFZe4N1OazNk7+dNH/uilc31ioZMKZvASQByWuWMPpDnaDuW8KR66KwUqXGkZXKcXSqCXGYve+m6OVLEuuB23iPZnM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1685377283;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Reply-To;
	bh=feSVJ4ZJC7g6BnidW2efeFPZ8WR9Bevc0v3Vz7xYSoU=;
	b=bLafyXxotwqr9pgTL6UYFeR4qpjB+4ATUbs7x2cx6ctdP5Q4YrMyTScYUkNdq5VM
	iUW+9ofO/k34ICTcVWLzGni9D0BywAYZLCSY5abGkxZmZN+lP5SZf+WdaJyZkN7TqJo
	aoIBLknQ71CEZ8EbvNItEX3HJOzUUGJ8IYWa5vhDw7hyc0o5faqDLEBE8cj19yZ/PR+
	ggh2B8/cX+M8wornfeFkwvz1lIBGCSiTnjm4fqyYn7PQmUrl0b9M4l9dSx3cz5wttKI
	kXkTR6wS75ie9iJWJcXd8hd2cDtik/2OKvGi3e89IzXZt2QctzTh29a4NO2FT8YGH1N
	bvp5LvxXEA==
Received: from edelgard.fodlan.icenowy.me (120.85.97.71 [120.85.97.71]) by mx.zohomail.com
	with SMTPS id 1685377282347443.2734596633554; Mon, 29 May 2023 09:21:22 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kang Chen <void0red@hust.edu.cn>,
	Dongliang Mu <dzm91@hust.edu.cn>
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 1/2] Revert "thermal/drivers/mediatek: Use devm_of_iomap to avoid resource leak in mtk_thermal_probe"
Date: Tue, 30 May 2023 00:20:55 +0800
Message-Id: <20230529162056.3786301-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230529162056.3786301-1-uwu@icenowy.me>
References: <20230529162056.3786301-1-uwu@icenowy.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_092210_668240_18FC781D 
X-CRM114-Status: GOOD (  11.76  )
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

This reverts commit f05c7b7d9ea9477fcc388476c6f4ade8c66d2d26.

As the documentation of devm_of_iomap says, it's not a drop-in
replacement for of_iomap because it will detect existed mapping and
prevent shared access to the memory region, Because these two calls
are mapping memory specified in other device nodes, they are meant to be
shared, and devm_of_iomap is not suitable.

Reverts the code back to use of_iomap, to fix a regression of display
failure on my mt8173-elm board.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/thermal/mediatek/auxadc_thermal.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/mediatek/auxadc_thermal.c
index 0b5528804bbd..f59d36de20a0 100644
--- a/drivers/thermal/mediatek/auxadc_thermal.c
+++ b/drivers/thermal/mediatek/auxadc_thermal.c
@@ -1222,12 +1222,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	auxadc_base = devm_of_iomap(&pdev->dev, auxadc, 0, NULL);
-	if (IS_ERR(auxadc_base)) {
-		of_node_put(auxadc);
-		return PTR_ERR(auxadc_base);
-	}
-
+	auxadc_base = of_iomap(auxadc, 0);
 	auxadc_phys_base = of_get_phys_base(auxadc);
 
 	of_node_put(auxadc);
@@ -1243,12 +1238,7 @@ static int mtk_thermal_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	apmixed_base = devm_of_iomap(&pdev->dev, apmixedsys, 0, NULL);
-	if (IS_ERR(apmixed_base)) {
-		of_node_put(apmixedsys);
-		return PTR_ERR(apmixed_base);
-	}
-
+	apmixed_base = of_iomap(apmixedsys, 0);
 	apmixed_phys_base = of_get_phys_base(apmixedsys);
 
 	of_node_put(apmixedsys);
-- 
2.39.1


