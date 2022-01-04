Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD21C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 10:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AOX+EXenx5m53AK0Sf/wxjxVvU4zzBhq41vRk/7isJM=; b=CxTod3izDUJeG8
	+fy7jjuwsMb/TQrK2yD2iTRsWRxdhPuZtpKXfYmHgmlO/QF+WP1hCWiSAwAMgiSnzXZ/9hLgivte+
	3UIIw6YA6cWma7eRcl7G+FhApKBpZnsdJ6fr7qG8HXZL5abYbPTSQ5Lzhm4+v1BytUd5pILPTW8rq
	0xBOvcG/E9fHGrTKzKCmHZGDpOozYlrmEoeTve/6RvJLU19R4W2WIdYUW/1VLav6Nn4aIKgDUjZ5A
	pbXxvU+9cvNf4fPLoKEVvhVPvU7mpQcm3L2d5YcmwhRnKzqYtr0uUgkn5j9b6KXaYUFz+OCE8UAT7
	CpW9xCpAcpnmviMX25eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4hH7-00BB5d-E1; Tue, 04 Jan 2022 10:42:41 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4hGw-00BB2x-3D; Tue, 04 Jan 2022 10:42:31 +0000
Received: by mail-pg1-x531.google.com with SMTP id 8so32366062pgc.10;
 Tue, 04 Jan 2022 02:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hfIMdib9TxYU83Yq6/1+x94iJVj27/gjNxj0nCIUnZQ=;
 b=hseIhjJ7gIgUnuNAlcfeplsNBsP3jjj3fyixO1vf0Iapr7bPCnF6uzf/1WRdgaiEGG
 UXopDWZ5sIeMj4RJmaCwk9AcntbB4IOT31NQwHNsRktPYo7G7ksCNAP3P/jPy2LPhVrr
 vgI5GPSvTdi2CN/qE2jHlB6PFFiij4349sSgss74oLDSTpTnoyQwDCINMakwQO5AGdpR
 Swgt419IBkmrv1lf65+b6cxoreTXdNpJ4pa2swsPJ0+mY0jCPvx8RZrtM3R7kV4RRnDk
 qKnpYBxzUFiLqhW/WeRywq0SLMftjlM1XS0IeqaE73Nt5azt2VYnH1ytD6KQCcmGXMqx
 p0KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hfIMdib9TxYU83Yq6/1+x94iJVj27/gjNxj0nCIUnZQ=;
 b=kRRRJzFO2CBM0EqlYalijkM7G0wxq2ij2wetKZOWC1eRpqbXDzs7kddwcEEWJDQC0M
 9seTXmuKbmWSOd8mtbbf6xaPMPPcjqKGBlmZ0sqChze8b0w5f7VrENkDE2qqM9YgDTX3
 uwq4gmL26i8bBSyplyhgGpxcVAmIy1O2byuBS/NForrWqEAThXDijDyx4Z0MGmXWqLQ/
 QMkoQ/4SiTdvql+0U7cGK25hfOABIoWzlTwFyLC85T0j7ilORmA011CfsISThTZvZNUQ
 cmsLFhFJQ4tuBywpG0KZwV6gHgGt3pmQHfu1Ih+6LLhmUSmrmZKQi7CTJPKYgt6D+ZXC
 lUvA==
X-Gm-Message-State: AOAM533HJ4rIHXWuvbmnk6Fv4hcDJQH0d7C/cUwvK17x9BAWJDAhV0FK
 /Z60vqU6HMkUIG3diylNUjc=
X-Google-Smtp-Source: ABdhPJyekr+/HCc4S1iUD9Wk1bLLzXUYiJQe5k8EP0fzYwfGZKR1m9n7LMoWNzXOV5kPrgFjkSUTYg==
X-Received: by 2002:a63:ff4f:: with SMTP id s15mr43216991pgk.215.1641292948802; 
 Tue, 04 Jan 2022 02:42:28 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id o11sm42564988pfu.150.2022.01.04.02.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 02:42:28 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: lgirdwood@gmail.com
Cc: broonie@kernel.org, matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Minghao Chi <chi.minghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 CGEL ZTE <cgel.zte@gmail.com>
Subject: [PATCH] drivers/regulator: remove redundant ret variable
Date: Tue,  4 Jan 2022 10:41:39 +0000
Message-Id: <20220104104139.601031-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_024230_187399_DC2D8D04 
X-CRM114-Status: GOOD (  11.64  )
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

From: Minghao Chi <chi.minghao@zte.com.cn>

Return value from regmap_update_bits() directly instead
of taking this in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
Signed-off-by: CGEL ZTE <cgel.zte@gmail.com>
---
 drivers/regulator/mt6380-regulator.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/mt6380-regulator.c b/drivers/regulator/mt6380-regulator.c
index 9efd8710a6f3..2e6b61d3b0cf 100644
--- a/drivers/regulator/mt6380-regulator.c
+++ b/drivers/regulator/mt6380-regulator.c
@@ -183,7 +183,7 @@ static const unsigned int ldo_volt_table4[] = {
 static int mt6380_regulator_set_mode(struct regulator_dev *rdev,
 				     unsigned int mode)
 {
-	int ret, val = 0;
+	int val = 0;
 	struct mt6380_regulator_info *info = rdev_get_drvdata(rdev);
 
 	switch (mode) {
@@ -199,10 +199,8 @@ static int mt6380_regulator_set_mode(struct regulator_dev *rdev,
 
 	val <<= ffs(info->modeset_mask) - 1;
 
-	ret = regmap_update_bits(rdev->regmap, info->modeset_reg,
+	return regmap_update_bits(rdev->regmap, info->modeset_reg,
 				 info->modeset_mask, val);
-
-	return ret;
 }
 
 static unsigned int mt6380_regulator_get_mode(struct regulator_dev *rdev)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
