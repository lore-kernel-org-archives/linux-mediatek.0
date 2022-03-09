Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90355C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Mar 2022 09:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wgUB7QYqdWQngN5mUrY5SgYjCd/lSG1HbReEUvt8CT4=; b=GYFCOBwHi+r+AL
	RTBdor/Bfk9N/OEpfGycocdissaJQ6/caVp9o76jQd1+xecQKCh9KuZiULkl44xANVaam0J0cObPf
	sIfIZtiXc/nk07e6RNLpXYvttKZtwe7COfcFL4qM/mTyOTWn1CZ6DVfoVYwPgykhos+Av3mkoi/fv
	haJQSZ+NKCb2rd1TOzMZyLlFg2+7+9KnnVvIshGS8ZI/IXQCBNmIHlGBURZZeBL3YMi2bSlsA8hsa
	Cg+VzJJa+Q7d+8FGlj6HowU7r0KJxxJ148Fi0k2t976h2kHPEkANptUufBmaDLeo81Q5P9hgrdk5W
	EvY5Nwp1w50mKZfXMtFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRsUE-007tGR-PY; Wed, 09 Mar 2022 09:20:02 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRsUB-007tEk-Tf; Wed, 09 Mar 2022 09:20:01 +0000
Received: by mail-pf1-x436.google.com with SMTP id z15so1707310pfe.7;
 Wed, 09 Mar 2022 01:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=bEfAhcbqdZYeRPwL35nsLH5O9/gJamZgyeCS3FefDNw=;
 b=BsoKPHGooVGX5YiMJYd3QMKPcI1SY0zHSNffkRhDtqHmSki7knDnJM3+Bh6oOky7NN
 zPjSxKAQ7RGDiJzONdOBMO4dgnSI2QdLCxwDTnGOevdEvLdkuMCthRygXJlJKnRGj/pX
 pCNPjcrtedFH4PyMzq0YY1+g6c56R+l9+G7wKhprjCKFBIVxbJjmymVwFyB1xdkJ6nO6
 34UIDl3yWMtHys6p0eK1K3RbZkEOMIl5TNKrFjhJhQV4EvzJUlLazm96GegfmlUN8/oQ
 wVuWvn29XcBbEAgyH5hHixV2OcDAQ1Ajf4wf42IHmAMSaUJfsgJBxadnTJi6NFYpWNmP
 HQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bEfAhcbqdZYeRPwL35nsLH5O9/gJamZgyeCS3FefDNw=;
 b=uxUpb2q6/nnInDj/rLCQ9YzLqKdiN9D3/IkgkTL4T5hd3eHAnbIC0I9U+X/o5tnYRY
 /AfiAwmAlUTW1hduE7QVDIRHDNe2cIdut91DiGyWMDZyyYY1/9MGGXOFd+6Fl6bECf2p
 RJmhiSIQALhWznRWLLvGWQ+Nw0HMY/icSwJsrdhTphHSJMX2PvtBFuywpRPBSZ5VAQDL
 ghUetuB8w6arv64P4YUFRn3soX1kLchbk8VT9RhyYs4q0NGAZINKRsEyd4zeGBtTSbwl
 vfsLELD/dlNNBUUc1Vx+HeVGVRkksfi1ICCsxtaBfrqt+xpXRnYf5H0v/jbZYgq824cP
 8QOg==
X-Gm-Message-State: AOAM530Kz9fVwJWVlP/KVtSmdzXFKe871LC01iEnEobFezsxcqhgzR1C
 8qnx4BHLFkjkq5YqS4hQNgYKiw2DDtW9xRElJ0WfTg==
X-Google-Smtp-Source: ABdhPJz154842HCAn71vp+FZHXMEdU/ZMNx3OLEChgK28OxSn1qfQPpKo19ta6GkpOADMhYbIb7XJA==
X-Received: by 2002:a05:6a00:8ca:b0:4e0:2ed3:5630 with SMTP id
 s10-20020a056a0008ca00b004e02ed35630mr22900242pfu.3.1646817599116; 
 Wed, 09 Mar 2022 01:19:59 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 78-20020a621451000000b004f6e8a033b5sm2071595pfu.142.2022.03.09.01.19.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 01:19:58 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanjia Liu <chuanjia.liu@mediatek.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: linmq006@gmail.com
Subject: [PATCH] PCI: mediatek: Fix refcount leak in mtk_pcie_subsys_powerup
Date: Wed,  9 Mar 2022 09:19:52 +0000
Message-Id: <20220309091953.5630-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220309_011959_982642_47F1D8C1 
X-CRM114-Status: GOOD (  11.63  )
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

The of_find_compatible_node() function returns a node pointer with
refcount incremented, We should use of_node_put() on it when done
Add the missing of_node_put() to release the refcount.

Fixes: 87e8657ba99c ("PCI: mediatek: Add new method to get shared pcie-cfg base address")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index ddfbd4aebdec..be8bd919cb88 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -1008,6 +1008,7 @@ static int mtk_pcie_subsys_powerup(struct mtk_pcie *pcie)
 					   "mediatek,generic-pciecfg");
 	if (cfg_node) {
 		pcie->cfg = syscon_node_to_regmap(cfg_node);
+		of_node_put(cfg_node);
 		if (IS_ERR(pcie->cfg))
 			return PTR_ERR(pcie->cfg);
 	}
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
