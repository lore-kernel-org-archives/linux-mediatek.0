Return-Path: <SRS0=2Vnt=J2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45101C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 13:48:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 805626144B
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Apr 2021 13:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 805626144B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kOlufHFKjNu0z02G5S0UH8oBR/X731A7RZ5KaCdjjNg=; b=cmDXHXG99MrUDyzlALVKLt+8gJ
	mw2Dv/2C0iZmQOtLIF2ApCF60tiM1O+Ls1IYOcZGepk32YWs4ESnSbZ2qF5w4p3GK4WCby6SHFB0p
	Z9RjWVvcjrtTkO10fKRrDIAKc8C3AfjpaHFmP+K59Pn4S1iWMVeXKrHZcI9AbMM3m7+vrAWivuG4N
	Kca7MTGEGgqMy2YWqX8wM7eeHxMpb47miDUXG26X1BVMgNNQcF5u83UZi/cx6ePzdS/g+5q5qcxJJ
	E+xBTZbvLIy59I7CTKQVlSe0ZdufevaRetl+V/bW4v1OZ0ORnlpp9eFRIVDdF4V35/PS2Gz23ILoJ
	Y2OjtPPg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lc71R-005j0J-QK; Thu, 29 Apr 2021 13:48:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc71Q-005j09-6f; Thu, 29 Apr 2021 13:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=PlH3+2vfZTyuFfAqFBDTmRaRDdNNygl3Tgthx29aiWE=; b=ppp3HxOldXVhwEWDixtsxpaTv8
 7HJvZH16QH3WepkqqoK9dnVN0nJZQLWHi6dcIKcVVOqCksuAcBibsQL7WH+XLntboFqx59RcEBxO+
 mTMaPAlp7RsJfGLpUA4nQYdjX7uCYQgX2nBYJQI+wAAuzH33ah7CTk2Ykw2TaCXdXy2/dzE7NvGbI
 /SoWyrksNL0+m7VbxljFkQJheIAJAMvCdKi7qT0kWB6v6FGvwdw2Y0vgBSZ79tF+SMJNePbbAgDl8
 kvdNoDj0TfobL2Ne9StKmMzsHuZBGfa7omuuwE4XlIVtPho2H4HWpge20n/CzC0Kk18SoieXwWwrI
 EATY8AHw==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lc71N-000f6i-OK; Thu, 29 Apr 2021 13:48:02 +0000
Received: by mail-pl1-x62a.google.com with SMTP id p17so8862616plf.12;
 Thu, 29 Apr 2021 06:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PlH3+2vfZTyuFfAqFBDTmRaRDdNNygl3Tgthx29aiWE=;
 b=C0AkQKD0SAMi4Wyu71J5JywvoQzblYpGXd4pTiwkoBY3JmovzQKSQaKYVb8Jd2UDHb
 gagiQtYRjqKVBxw5zTR5vGN9ucSKnzuNWiixecHwx1D3q8E/JwwKH0/T8E6ykWJUi+nQ
 Mw1IKlzIchnCInVjXwXRkae3CUsX4B+aiyTTIj403sEi+K+vg9TPyE5UeCM8lRNv6Fc2
 SgOmVEVGVw1relf9JjfDWdz8RGkMkkKvi08uw/nO1aYBW0eqEH1kiHS4xlBtjIqjLBSV
 hRVXwGw6I2qcFtYYJ28dVdWrOvJOMRmiwKkcTYwZIDsjcfeGXkP4QeO6FLzIUCzjThOg
 8Cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PlH3+2vfZTyuFfAqFBDTmRaRDdNNygl3Tgthx29aiWE=;
 b=Nsxj90dUhE/L31/VxCaWN8uGWKhFZv8H3pu/wcQGbUT/cxCHE1rMttBLMCtfKNemJk
 i5ZNMzctK9tzaO69DGSowdr95H1pUbWAiUqLbdPTAYlbuye4tmWHrxoSTqSL+4dwOaO5
 DGo3GsS7/Vc3iqGEC0UrawE3ZIHm9zStynl+s5o9OO9cBJ8BoeXakYKsWLpi/1PFnzQs
 4r1h/iHXxw/ghEmzzCuNP+qENCJT6XLgxrk81OE/qc2ykVc+ko2Z2996ZIQ7djk0ltX+
 mbI+KyAdy2skqPwONCrZ9V+A86LIL2h9JYU7vQJ2RZ5SjSFhAtRjb3lnb9H8KOXFIUcv
 2HGg==
X-Gm-Message-State: AOAM533PDKiMBY8beM/4qQnACXHhm3ojvh3FURhCrnaolWAErG1W2w8i
 SISL4PTg7olv7zaGS+0tFsU=
X-Google-Smtp-Source: ABdhPJxcrHPq0Yh2vzbld5D+XYsyxSrLVwVp1i8jSMbpNjL77MDoBAE9H02D6VqQOX42z8fGsjVxsA==
X-Received: by 2002:a17:903:1243:b029:ed:8298:7628 with SMTP id
 u3-20020a1709031243b02900ed82987628mr6112715plh.11.1619704080057; 
 Thu, 29 Apr 2021 06:48:00 -0700 (PDT)
Received: from localhost.localdomain ([103.248.31.149])
 by smtp.googlemail.com with ESMTPSA id n9sm37175pgt.35.2021.04.29.06.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Apr 2021 06:47:59 -0700 (PDT)
From: Amey Narkhede <ameynarkhede03@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Amey Narkhede <ameynarkhede03@gmail.com>
Subject: [PATCH] PCI: mediatek: Verify whether the free_ck clock is ungated or
 not
Date: Thu, 29 Apr 2021 19:17:49 +0530
Message-Id: <20210429134749.75157-1-ameynarkhede03@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210429_064801_814224_8A9CAC70 
X-CRM114-Status: GOOD (  13.35  )
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

Verify that the free_ck clock is ungated on device resume
by checking return value of clk_prepare_enable().

Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 23548b517..9b13214bf 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -1154,11 +1154,14 @@ static int __maybe_unused mtk_pcie_resume_noirq(struct device *dev)
 {
 	struct mtk_pcie *pcie = dev_get_drvdata(dev);
 	struct mtk_pcie_port *port, *tmp;
+	int ret;

 	if (list_empty(&pcie->ports))
 		return 0;

-	clk_prepare_enable(pcie->free_ck);
+	ret = clk_prepare_enable(pcie->free_ck);
+	if (ret)
+		return ret;

 	list_for_each_entry_safe(port, tmp, &pcie->ports, list)
 		mtk_pcie_enable_port(port);
--
2.31.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
