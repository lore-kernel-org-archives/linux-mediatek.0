Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F29C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 02:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuT/TzXEHGqXcCBqJIp1ffomEppPRJ8FgzCqXA5p/Mc=; b=FBh+mc/rWy45w+BI/i4SB0V3sa
	FZcALWUn0pgJwjeuEquhMhP58xdxqLgtXq+7/w1w5u1rVJguX6TGfcw0GI7FIPg+8yrb04xk3XCgQ
	5ZwjAOzc1uiaqPNH4f0iNUctvXO4ksLLXcWTF249WeuoAMyDqjgrxT5+8e/deV9t3VGVO6elGffkP
	LWvfZ4B/JOvajIqRdNITvTJwsL66dorgkLVDG637qrGkRqqsusXLJpPlhYOcj4+i7hXm+Lt2snRrf
	NtkgktqbtbwyPSNHPt/m2fzjEtQ0XxO3+4ts+Xb/UUU5ifouZM3x4OeOQLF2VcDpNd62/HhHCYcNq
	tSp2ADEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBoGv-009wjn-67; Thu, 14 Jul 2022 02:08:09 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBoGs-009wcG-6w
	for linux-mediatek@lists.infradead.org; Thu, 14 Jul 2022 02:08:08 +0000
Received: by mail-qk1-f175.google.com with SMTP id o26so311064qkl.6
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Jul 2022 19:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OuT/TzXEHGqXcCBqJIp1ffomEppPRJ8FgzCqXA5p/Mc=;
        b=BEhL3Haey3g6V2GyQIqeMwCAuVWxm3HQFFgEw+u+wRQuuoV3xxnF74CDlfroWo1oNx
         +BqTOQKVwiMSN+Vr37J8gIbX8KjNYXMHLfJJh4LBpWobjHOhc0peIwWfHajgSq4ktCZF
         CD3hZ1ZbFKC2Qi75JJoDd0WiN/ShvxtddwORIKnxQwAMOJex+WZErwwamFbASFZqTxW+
         e9aofzf7uq//mVTnXfnQRTe4AE53wJmLjEUNoIqo1gcL3yU/6fFJCDby7PgGXCIn+M2u
         sGpXfdx/hyyKuu6YJwdd5UXgkxOcJGyb5FzWwABBoJZePqLsLEbWbU2pLCTgW5tXJ9uI
         6euw==
X-Gm-Message-State: AJIora/nrQnfHBZymOlyLzaFBofrWbPXgoVVt8/quOUz937hAcVpMGd+
	g/blnqu7y6OZY9341J8+LLg=
X-Google-Smtp-Source: AGRyM1v40EVFxOH/18KPkHrl6v+EDr4c44EB4egdYc5BOeT5KKWmFHlwX713NTFf5nJ/HjMuaVf1fw==
X-Received: by 2002:a05:620a:269a:b0:6b5:b76c:11c9 with SMTP id c26-20020a05620a269a00b006b5b76c11c9mr4398861qkp.100.1657764472620;
        Wed, 13 Jul 2022 19:07:52 -0700 (PDT)
Received: from localhost.localdomain (107-199-63-251.lightspeed.sntcca.sbcglobal.net. [107.199.63.251])
        by smtp.gmail.com with ESMTPSA id d22-20020a05620a159600b006b5517da3casm308537qkk.22.2022.07.13.19.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 19:07:51 -0700 (PDT)
From: sean.wang@kernel.org
To: stable@vger.kernel.org
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Felix Fietkau <nbd@nbd.name>
Subject: [PATCH 5.15 5/5] mt76: mt7921: Fix the error handling path of mt7921_pci_probe()
Date: Wed, 13 Jul 2022 19:07:41 -0700
Message-Id: <2632b391af6d3e268567c6931e49f3f4490ce502.1657764335.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <4bdcd29552ba78c87d8799181b9acddec465ad3c.1657764335.git.sean.wang@kernel.org>
References: <4bdcd29552ba78c87d8799181b9acddec465ad3c.1657764335.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_190806_271167_100FA3D3 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

commit 4e90db5e21eb3bb272fe47386dc3506755e209e9 upstream.

In case of error, some resources must be freed, as already done above and
below the devm_kmemdup() and __mt7921e_mcu_drv_pmctrl() calls added in the
commit in Fixes:.

Fixes: 602cc0c9618a ("mt76: mt7921e: fix possible probe failure after reboot")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/wireless/mediatek/mt76/mt7921/pci.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
index 815b926e52e9..36e6495ae658 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci.c
@@ -254,8 +254,10 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 	dev->bus_ops = dev->mt76.bus;
 	bus_ops = devm_kmemdup(dev->mt76.dev, dev->bus_ops, sizeof(*bus_ops),
 			       GFP_KERNEL);
-	if (!bus_ops)
-		return -ENOMEM;
+	if (!bus_ops) {
+		ret = -ENOMEM;
+		goto err_free_dev;
+	}
 
 	bus_ops->rr = mt7921_rr;
 	bus_ops->wr = mt7921_wr;
@@ -264,7 +266,7 @@ static int mt7921_pci_probe(struct pci_dev *pdev,
 
 	ret = __mt7921e_mcu_drv_pmctrl(dev);
 	if (ret)
-		return ret;
+		goto err_free_dev;
 
 	mdev->rev = (mt7921_l1_rr(dev, MT_HW_CHIPID) << 16) |
 		    (mt7921_l1_rr(dev, MT_HW_REV) & 0xff);
-- 
2.25.1


