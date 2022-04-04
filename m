Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE62C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Apr 2022 04:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gz4jrJ4rOa7LZYPwiJ4v1NyKM0ejQ2WLUeEEqe0odCw=; b=frApKGUUKd9drd
	b76RXpMPeqEl7aNdwUCDfRJIx4ygh1vFgtsGLQYX8tFe1+staWk6hh19bVlUu9HNhzRrie0GNIJEk
	dz2YriSSCMg37DkXPX0ldVBCDif8DOnu81BrIyWPdgbPObBU7UGy7Fqe2vxoTrnMJwBIxAB409Em/
	QX/i0jV7tfutN8Qcxk33XnFt5GXKzGnnIQ/vdH08O+aRQMgLDyuHE+LVta13HhKmPGh0PP6ViHFzv
	KPj8jvvcGEPwtUsc782DW0HM2Qu+ItinWJHiYzD/XiOiJSjuaVDFWkEeZ9+qVZK2nAXdaNd3qVG8+
	3GGHPjOwXCD4FpM1GZ2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbDx1-00CxeB-Go; Mon, 04 Apr 2022 04:04:23 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbDvD-00Cwov-N4; Mon, 04 Apr 2022 04:02:33 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 i10-20020a17090a2aca00b001ca56c9ab16so3299289pjg.1; 
 Sun, 03 Apr 2022 21:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XeVwTDzrXqVMm+FV+pdpyBqyneG4xSl1PcMNGR1pJ1k=;
 b=n64jXqJuSD54zDdl9SzEdlpegLkU9Z+KblQccul6AKk3Oog51rbQLqMGP7QbR9bCQ8
 QgGASSOqzcDVo/RiF8bySSUeOAlA9faUZ4CDUy7zAdLfcz6lLhK6vdSqbtRvdfzdgHVa
 ZPjDbOQijGIlDvUWy22jiwSO6wq3lbwSrpZ70g8QBXtCPOKuqVPNKajiYbAPcV6S+/bZ
 hBjZ6Vi8HAlmMrA1F5x9rp4zIdgj+msvEHcD7QG3T9IdA/z6GJluFetiicE19ed0OB1f
 KxqY8xtUY4J3XviyPLweRS3k6N39z6OK2EjoNX0UOJ7sFRNlttm3xAkWRAUpmkNQdIhk
 ly9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XeVwTDzrXqVMm+FV+pdpyBqyneG4xSl1PcMNGR1pJ1k=;
 b=Y4l00SKN6d7AoWp2neX2kgcxMyPMR9l2G1CBdnfe9xBh3MH6sYdu3YgFHIDxfrg4WN
 9I+ozI0WVwMKp+bOiSBv9txqIyPYrTqYid6B1tJNnVj+aWZjnlLN/z9O/7SaJGb5bMMR
 7gHrlALEvJgMmiRxBmzAtDjCn6p4550P86nwIi7SEYZisCM4mByDyKv89V/XvBL14qlo
 3GsqI5w7iDrMEkW9uNAT2M6GBgn+TYfTF6sLC89eTGKvQPlESZTk/3/odjOXx1ohxML6
 No5ug3ojpgTjcT7+DIl4QP+aFjWN8i1Ug7/iPjEdXawVD0SNSXEPsP7bpI0flcJ5f/Yy
 p5GQ==
X-Gm-Message-State: AOAM533nSCUCyJcUfSPzHj7mdzagvNaf1nUMqcOdVe6mEeczY06YrrXp
 tBqpZt1HY7kzGmgXSZxjUH7mQJ5Y3N4k3yL5vYBPoQ==
X-Google-Smtp-Source: ABdhPJwCr37hf6Rzgni7u/IRXGRnIMjMDRLrRUdoxnhWo812bMhhZ1X8EnHtZAnnazIyb7rxdDXPQA==
X-Received: by 2002:a17:90b:87:b0:1ca:a84b:37e with SMTP id
 bb7-20020a17090b008700b001caa84b037emr1140510pjb.168.1649044950447; 
 Sun, 03 Apr 2022 21:02:30 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 j70-20020a638b49000000b003985b5ddaa1sm8756191pge.49.2022.04.03.21.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 21:02:30 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Chuanhong Guo <gch981213@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, Pratyush Yadav <p.yadav@ti.com>,
 Yu Kuai <yukuai3@huawei.com>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list),
 linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM)
Subject: [PATCH v2 3/5] mtd: nand: mtk-ecc: also parse nand-ecc-engine if
 available
Date: Mon,  4 Apr 2022 12:01:51 +0800
Message-Id: <20220404040153.1509966-4-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404040153.1509966-1-gch981213@gmail.com>
References: <20220404040153.1509966-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_210231_798119_42FDC8C9 
X-CRM114-Status: GOOD (  13.55  )
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

The recently added ECC engine support introduced a generic property
named nand-ecc-engine for ecc engine phandle. This patch adds support
for this new property.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
Change since v1:
  new patch

 drivers/mtd/nand/ecc-mtk.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/ecc-mtk.c b/drivers/mtd/nand/ecc-mtk.c
index 74ddaa46ba7c..9f9b201fe706 100644
--- a/drivers/mtd/nand/ecc-mtk.c
+++ b/drivers/mtd/nand/ecc-mtk.c
@@ -279,7 +279,10 @@ struct mtk_ecc *of_mtk_ecc_get(struct device_node *of_node)
 	struct mtk_ecc *ecc = NULL;
 	struct device_node *np;
 
-	np = of_parse_phandle(of_node, "ecc-engine", 0);
+	np = of_parse_phandle(of_node, "nand-ecc-engine", 0);
+	/* for backward compatibility */
+	if (!np)
+		np = of_parse_phandle(of_node, "ecc-engine", 0);
 	if (np) {
 		ecc = mtk_ecc_get(np);
 		of_node_put(np);
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
