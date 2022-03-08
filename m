Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 07:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nbgjofKU3JDQj1w946tp8yMMY9Xv/SuYIHzJ0rppSJ0=; b=obOhjiWjX99Rgp
	Xw4ibwkNQomUevE+iTxPxTeEQth5B9rgX5I1DcPhJkubqxhTTM2+QL+4UCddNGi94xyKlP9VvhTZ6
	QS4xKSWNCiTQicnmdI0yV6ToIZysC4b8R1J7EkBbv1XpVt9UUcOlnFUht8s8MzkaCWNHbqidEBXJW
	GYXPGmZxGjQAwe/bubelFcgNqZHiUm0RgC+bCdg+C39VTYYX6VswcMzEepcEy++9NOkk46HznS7uv
	QCeTDKoYORQ7oAlroWjbebmOyOhUESKEdZx0ZwXq6ux68zHT7rAbqRs8Cv9AhNKH+hQN1Jy1/mFCm
	WTnYdNVt5awPS/Plzk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRU0q-0030Vq-Dd; Tue, 08 Mar 2022 07:12:04 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRU0n-0030Un-QW; Tue, 08 Mar 2022 07:12:03 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 kx6-20020a17090b228600b001bf859159bfso1444363pjb.1; 
 Mon, 07 Mar 2022 23:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=dOUBo/Sc0yjq3ebr0wQH/B7bwQxh2odqELk9JgfPdwU=;
 b=LB/94ADMeswaD5pO59KrBobz0IlCQSDS646x7RnJ62nnUQK86bDW7ludK6KDoJ6XrX
 cMeCAN3HM4t0qrQJVGiQXUxRdcmybJTBeCXidCPvcfunKGOgmF5F8cuqaPH/EOx2kkBq
 /zBGqOsaflp4f8jRT8yUHWRxJ880rzU0O+avb0doPFW01+/yJ7ZsZRDRyKQZsD3OESrO
 NB9KpW6PpI41YRA9/fpWwRJhlNrX1FQJItUL/0X17435XAgZ7haBv4g0lKt71Js0TGBn
 n2m5UkoAEkcPuu9CAfjtjwtQvWUk82oy9lqGuG2QzcjiDxDoCgXUHTWIBsXVSPSHMcDW
 vAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dOUBo/Sc0yjq3ebr0wQH/B7bwQxh2odqELk9JgfPdwU=;
 b=4d3qBI777p523siOscSeoQrhAf3rrMwCVN7+LcF5eJJjoun+MIkqjs2fR2Maf+FSuA
 0XWQgrR9WV0gEttfY0I83zDBWKwTrU4VcUEkieVeCSYCdgZ3ruLx7yTAoRI6CmN5Du4L
 A+Udp4XMkUnT3U1E4XUY3ToDxf/zwIaVBb8nfSe/Kp5gFfzDwM1Fxh9GzvlRURuFw5pG
 Q9o3un4T02IZbCWl+iDSiH0OoPmgmCpCyNNJDi54aDS1Yz+YGJbj+T0aK5DI/IY7APQy
 DLP9Th2qO016CYp2WAqP8kLAhbZiyfNNEBANvveY8Vp4OQQ17mEtkLPQut/89FaVWHtj
 7Owg==
X-Gm-Message-State: AOAM530v6wi6wkzks+UTz2DuFd0XyXlTPKct+/UrOcVYecS9bZEX2Mj1
 z53R4Hch8oGNrOi4C+gRE+s=
X-Google-Smtp-Source: ABdhPJxouGfigEMrShjCATvfXIOp5b0R3izV6OiagBsPFTLCsXQKjyip+qEPFuUh0IY/PvKVe9WlCA==
X-Received: by 2002:a17:90b:4f8f:b0:1bf:84ad:1fe6 with SMTP id
 qe15-20020a17090b4f8f00b001bf84ad1fe6mr3145309pjb.189.1646723520761; 
 Mon, 07 Mar 2022 23:12:00 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 j7-20020a637a47000000b003803fbcc005sm5516633pgn.59.2022.03.07.23.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:12:00 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linmq006@gmail.com
Subject: [PATCH] pinctrl: mediatek: Fix missing of_node_put() in mtk_pctrl_init
Date: Tue,  8 Mar 2022 07:11:54 +0000
Message-Id: <20220308071155.21114-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_231201_883191_AF2D940E 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The device_node pointer is returned by of_parse_phandle()  with refcount
incremented. We should use of_node_put() on it when done.

Fixes: a6df410d420a ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt8135.")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 5f7c421ab6e7..334cb85855a9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -1038,6 +1038,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	node = of_parse_phandle(np, "mediatek,pctl-regmap", 0);
 	if (node) {
 		pctl->regmap1 = syscon_node_to_regmap(node);
+		of_node_put(node);
 		if (IS_ERR(pctl->regmap1))
 			return PTR_ERR(pctl->regmap1);
 	} else if (regmap) {
@@ -1051,6 +1052,7 @@ int mtk_pctrl_init(struct platform_device *pdev,
 	node = of_parse_phandle(np, "mediatek,pctl-regmap", 1);
 	if (node) {
 		pctl->regmap2 = syscon_node_to_regmap(node);
+		of_node_put(node);
 		if (IS_ERR(pctl->regmap2))
 			return PTR_ERR(pctl->regmap2);
 	}
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
