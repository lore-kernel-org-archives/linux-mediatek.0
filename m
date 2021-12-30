Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 098DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Dec 2021 08:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7U5HYFh8kMkSOZ4oYImODjdYNDVyA1sm5gpJDxfc5aY=; b=uWBJECgisHZYT8
	pu9ehYZcIA+3TYLlqhfDatLytMKIys0kLRAjMK+Jyzt8xuKnCRM8z331PQfrPMV7pmCzLU0aWi1cV
	JAGOhcxltsX6Gzlr9kuYWnVrsBGRJjtyWc9opRV3Vo05TFIHHsSA9OpatyDFt3Qfmu9xjnpqAtaAY
	iuTY2wGZs+SwS5l7KZ3sbPrG7KVLsyJMjTH3LBj4NQKdDrPQQvfbTyHt0HiMcDoKHexMuoiOWUpst
	Cuzqoh+QlTPD09YqdcULaTfUDxn1FAortpsXFeRTIsmjaOhww/XcoX38vYGfyeRsQdfYV/ZxhE2zy
	MhzaQ0c45/+IM67isEAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2r07-0041l6-Vx; Thu, 30 Dec 2021 08:41:32 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2r05-0041kM-Vr; Thu, 30 Dec 2021 08:41:31 +0000
Received: by mail-pj1-x1033.google.com with SMTP id co15so20725951pjb.2;
 Thu, 30 Dec 2021 00:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=gOSR7Y5DhmldlZYZfgKoXEayFeN352tbiKfrmxSItQc=;
 b=WBrUjKZ1MYrPSt00PeR/mTNRrVpCvHel0Lg3ImvjYrpFZDbWLK/UnfPLg6rZWPeI3s
 Si60i3Aaj2AyUUMW0xXXnnZgAaFG22VM/YW3ILLJ/KEamEiBVhhxUWy1zg3NTG0uksIc
 aFG+jX43bMqYzYfMwXnGGLouv/ga81ZvAOSsDGLO5w8VRpCSAlWRHnf+8MrGHlonel/Y
 AjFH1wloszk4fPX32kaJzvRfprgl685dJUQvSbEqD0//nIAxewNsuc1CE9ZDb/Ac/NTl
 iD1qlBDxnJNUNVUZYaCpA515E29AZGbXEAJuCdfxLYP0XFD+idJy6SOMf1jQwQUJTY+i
 5k7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gOSR7Y5DhmldlZYZfgKoXEayFeN352tbiKfrmxSItQc=;
 b=L/stMDXOkCwq7JGd8C4v+Of+IbENMMCoKmFGf3JssDQS7IPNpq4ICA6OnYfk3rTNSh
 ngupChm/heVoz8oqstOQH0vkBSzeaRhB/30WNdv0/RMe+a8x3ScErgZQfs5ON3+63hio
 OcQ5D/YfKFsyXt2wAbAok6epNDm1JrZmAMPZ7x6Rm3jMYv8gpgeajYbMUAjK/S7sBAAn
 be9gc7hSo2fPJmumMGguX4XiFNCs8lRkv5i5OzxsdQ+IRTCQPMj4Tkfw90/OtfUs5jCG
 RqvhLVoj5e+TRG1TpgxjsuC6eFSm8uUJndRIqjCXZ+lOy61FroT69WwrNMLa+5xHK4IJ
 UDXQ==
X-Gm-Message-State: AOAM532meH2K2eXQ6K1uW6NPxlP9xb9LBkDV1k0ZZNGa02YyL60Qtxwj
 n12vb8PQHsw0Iy+rERWpfKDze0imASoo0cco0rs=
X-Google-Smtp-Source: ABdhPJyH2XwTtE9Nzyy6f297GaPnRvARYrZckPTba0wOcm8Ng7MoLinGyFkMGnhgZso5EuXvpfs9Ow==
X-Received: by 2002:a17:902:b10e:b0:149:a59c:1417 with SMTP id
 q14-20020a170902b10e00b00149a59c1417mr2392252plr.165.1640853685835; 
 Thu, 30 Dec 2021 00:41:25 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id k23sm4171216pji.3.2021.12.30.00.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 00:41:25 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Cc: linmq006@gmail.com, Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [PATCH] memory: mtk-smi: add missing put_device() call in
 mtk_smi_device_link_common
Date: Thu, 30 Dec 2021 08:41:15 +0000
Message-Id: <20211230084115.5375-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211230_004130_052933_B62DF2D0 
X-CRM114-Status: GOOD (  12.62  )
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

The reference taken by 'of_find_device_by_node()' must be released when
not needed anymore.
Add the corresponding 'put_device()' in the error handling paths.

Fixes: 4740475 ("memory: mtk-smi: Add device link for smi-sub-common")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/memory/mtk-smi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index e201e5976f34..2131f2c9e7ed 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -386,8 +386,10 @@ static int mtk_smi_device_link_common(struct device *dev, struct device **com_de
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
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
