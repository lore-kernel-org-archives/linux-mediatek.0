Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35220C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Dec 2021 20:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w2nbjRDBtNeawUjOK1Pk1TbyQpHEpse0cfLgyY171lQ=; b=hfevPYXu40TtKW
	TVhAtIXFtv9LqqZezP5f9Rj5ITtN1bpSK1AUbyTF1fm5szEiuI276sHfWBN7cpZnqc3qHHl8QCeAy
	hV4Q/5e8RQGcjoeyZRz6WKinrnTrhJaTrZUgWQDAR5gwQ/BTJUO1LbKwuT4czf5RZDvD5COYrblBi
	avIux2bwHjh761DErHBiL0mNS9wv/iYoWclckT/A8EN84/bbJdYfPlArXMwOJKM/yjMxSJHMDNTXi
	ZHYjFVvHRK92jBEcRPvz6sqK5BadqMNJwEnGyyTh3AbP/zDyq6EmeCl0YulGTahY67ZlFSYa7hmwq
	5nrePHLsgr4pIMP88DGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvmx6-003oGR-Ag; Fri, 10 Dec 2021 20:57:12 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvmx3-003oF9-G4; Fri, 10 Dec 2021 20:57:11 +0000
Received: by mail-ot1-x336.google.com with SMTP id
 v15-20020a9d604f000000b0056cdb373b82so10849268otj.7; 
 Fri, 10 Dec 2021 12:57:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wobD4Jbzi5ufjdCOWA/nVYk8n1ISd9Z61aPS0wQf5zE=;
 b=JdY2WDN2p461FkGvsxWWgssB5bJvFhZYhUHH63DdzZaOS/BF8ZQTp0ZRohildNIGfX
 alWei8hF/dOiYXd1Z9hS5CEigliRsXzQO8xzs+kxd+ajDHK3eNMRM87q4Ju4rj6fd/gv
 lYsbndjN7dSsbgrIBFXGjMTA4PdACS//XRVN3ZbYkoy1n3FT5jlT/d0jDR4IQCv9A+Uy
 KByWYGgTkvVMxsGsOL2XYtQWqLYAPwOihXIJCui3XCZ95CJhgQCB1P4mw+mNY823BKGt
 0I8P5dypvRWs2TbprRkp1owmaruN+NMkRC5sjMK6j3MfLzBbi2qubfSIZVBUZhE9ccKN
 zL7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wobD4Jbzi5ufjdCOWA/nVYk8n1ISd9Z61aPS0wQf5zE=;
 b=MvLYVn0h/9OvzeBe2E2xauJT0kZGkPclTnWtolJT05oQNI++zobn7CfXDlF4fH8lbr
 3odS4jPQgjFH5zxELsHeK//40fS2jncYUCNN+wpR96TEp8UZb6r52UY1JNAKeXo6JTbY
 6aIEdxWdrFouWqykcBCpDT8NltGWum5ij+mjNglx9XyG8wxCWT+CliKItml52ZBCHZK1
 GRr9JaWESktMHsP2WEyNgqahmZSkK8fIbArCSShl6MupgJjRvHm+ozp1FjqP5XkIZ1Nq
 y1ozxK2oZDPUVf4esVqEWl+7eLKTEJAR26+XY+nwH5mutuJ5hCH44ymgdQlQK2Oe9eeJ
 q+hA==
X-Gm-Message-State: AOAM531s0JqOFqsXhvGCirEC9MgTFsaSaWY9JuErhD/gu0IlzEShKwW6
 EPbi/IEscOYnJAKGONmEZ3k=
X-Google-Smtp-Source: ABdhPJwjZrKA3qk3BYYk+5CCrYVxJPalsMFrhHqeEmEj9Q654spZxrRQ5lvqR74363+dwnEBfK8Nyg==
X-Received: by 2002:a05:6830:314b:: with SMTP id
 c11mr12958654ots.224.1639169827221; 
 Fri, 10 Dec 2021 12:57:07 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t13sm926128oiw.30.2021.12.10.12.57.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 12:57:06 -0800 (PST)
From: Guenter Roeck <linux@roeck-us.net>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>, Tomasz Figa <tfiga@chromium.org>,
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] iommu/mediatek: Validate number of phandles associated with
 "mediatek, larbs"
Date: Fri, 10 Dec 2021 12:57:04 -0800
Message-Id: <20211210205704.1664928-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_125709_649302_9714E1DE 
X-CRM114-Status: GOOD (  13.96  )
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

Since commit baf94e6ebff9 ("iommu/mediatek: Add device link for smi-common
and m4u"), the driver assumes that at least one phandle associated with
"mediatek,larbs" exists. If that is not the case, for example if reason
"mediatek,larbs" is provided as boolean property, the code will use an
uninitialized pointer and may crash. To fix the problem, ensure that the
number of phandles associated with "mediatek,larbs" is at least 1 and
bail out immediately if that is not the case.

Cc: Yong Wu <yong.wu@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Fixes: baf94e6ebff9 ("iommu/mediatek: Add device link for smi-common and m4u")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/iommu/mtk_iommu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 25b834104790..0bbe32d0a2a6 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -828,6 +828,8 @@ static int mtk_iommu_probe(struct platform_device *pdev)
 					     "mediatek,larbs", NULL);
 	if (larb_nr < 0)
 		return larb_nr;
+	if (larb_nr == 0)
+		return -EINVAL;
 
 	for (i = 0; i < larb_nr; i++) {
 		u32 id;
-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
