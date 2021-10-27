Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE7DC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 11:32:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D359D6109E
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 11:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D359D6109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYnUqF38ZaDfcAeurVurB9JnbZeZDYLTlpxS2HwPUbk=; b=sVWRvVqPTYTvLh
	+a16775PQfJqLdA9GF/MFaGuZebD+HlsoosK5xqeI1Z2ZqIRKlF19LXwXZYmp58uwqgQazDlb7dNX
	4xvc4BcbMu6rcIak63IzEoM3Qa1GqcPVwFRpS6bfn2VpZVSwlG6IhfTlVDPYZuOOWrxdKWuGtZYjG
	SD6IDm1MVLBgwmIk1UXe+1avXRjwDs4iMKd6+0TRfy4IBZUor4HOStZrr2oz7ORAorl2bcePjuGuN
	jbgTlqTq6ql6btRfPugikLS8NFl3nCJgPaI5eE7uqFs15Er6+1+9TAYZl8U0ZxO333/9Ji8ZKxFt2
	22WUCARLc5jyZTc+3bhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfhAj-004iut-AK; Wed, 27 Oct 2021 11:32:45 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfhAI-004imk-FJ; Wed, 27 Oct 2021 11:32:19 +0000
Received: by mail-oi1-x230.google.com with SMTP id y128so2982156oie.8;
 Wed, 27 Oct 2021 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ulhn4KODo+M8bQOCOaLaS+XZsUOCyPb8RqRWLn0FhBo=;
 b=NdNt/0mG63IMHrYdKrGRchjJA3NLl73blNkn2CLJ9iW1ZGGJ4MjZszel2piHsEUbqg
 fgJkDpG5l92TH9cRhCifTd3dJGqR9XvpH/s3lIz3TJQYunHu+bpJkkR5GyuJd4glmzNB
 MoeygbQ1FmfFSAd4XsZFnkJEpN7S5ohnzRxB9oy340onnnsQ92ug9E0NfVPwaQJM0p2H
 fkA00Po14HGp91tFWr71+2Cx+EFhyptZPPomx/++zsiPJDHj0OyNQiAhrUB2d5MZ5Lxs
 WeuOdKgc5Qki/ja4jIgfWIws7UAV5wdOydVxdhtqR8zZuXLxcC8AsaXp5v7b3N5g/F9w
 Rxzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ulhn4KODo+M8bQOCOaLaS+XZsUOCyPb8RqRWLn0FhBo=;
 b=RTsbpj0HcNx5HsqcVVuwpL6j9hX7NpnvSbC09k56sthWfXsV1c9RZqvTXB/fyb/moW
 mlBzq77//i0NpGFsfjp2tJ3aodU6G0042L1bVE6q1fuEasaqGuqRdaEXV2S7cm68UYkQ
 rHXM75cJmfLCvbnB3u4xFTDCr7swS8n1/tbAAy3vf6AjkzCVT5ObQvRVqNojtF4C0/Hl
 SXWnzTi4vRUo+hp3Etljk5qHP70UVLEdNmqJ32LQE7ul1btAo29wQBYW02jujLtbjzA4
 sgGUJNnymD+drQolcualfz9JMrDx+wWkazexulSt0tvIyOZ3BrPATCDMomTWjzuEcap7
 eoyA==
X-Gm-Message-State: AOAM533aEIWQUP381AQvrbFi/ZDAJ2MFQMWHlnAAXzP1Gr2v6Ez7TIZB
 TSIBJF/hkoE/0Xf59xvZsHc=
X-Google-Smtp-Source: ABdhPJyDtqXolJD9smrK9+TJiNjHaGA863agytaUNdu/NWWpgx1LiqcUGcw3mrk5rjhk7cXU0TEVEg==
X-Received: by 2002:aca:3343:: with SMTP id z64mr3098600oiz.100.1635334337149; 
 Wed, 27 Oct 2021 04:32:17 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.170])
 by smtp.gmail.com with ESMTPSA id e23sm5430106oih.40.2021.10.27.04.32.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 04:32:16 -0700 (PDT)
From: Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To: sergio.paracuellos@gmail.com
Cc: Yanteng Si <siyanteng@loongson.cn>, lorenzo.pieralisi@arm.com,
 robh@kernel.org, kw@linux.com, bhelgaas@google.com, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
 chenhuacai@kernel.org, sterlingteng@gmail.com
Subject: [PATCH 1/2] PCI: mt7621: Add MODULE_* macros to MT7621 PCIe host
 controller driver
Date: Wed, 27 Oct 2021 19:31:39 +0800
Message-Id: <50f5f509c15251fb10b0c87304d272e2c89841f0.1635333327.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1635333327.git.siyanteng@loongson.cn>
References: <cover.1635333327.git.siyanteng@loongson.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_043218_560716_BEF67894 
X-CRM114-Status: GOOD (  11.93  )
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

Since commit 2bdd5238e756 ("PCI: mt7621: Add MediaTek MT7621 PCIe host controller driver")
the MT7621 PCIe host controller driver is built as a module but no MODULE_*() attributes
were specified, causing a build error due to missing license information.

ERROR: modpost: missing MODULE_LICENSE() in drivers/pci/controller/pcie-mt7621.o

Fix this by adding MODULE attributes to the driver.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 drivers/pci/controller/pcie-mt7621.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/controller/pcie-mt7621.c b/drivers/pci/controller/pcie-mt7621.c
index b60dfb45ef7b..668b737f86fb 100644
--- a/drivers/pci/controller/pcie-mt7621.c
+++ b/drivers/pci/controller/pcie-mt7621.c
@@ -598,3 +598,5 @@ static struct platform_driver mt7621_pci_driver = {
 	},
 };
 builtin_platform_driver(mt7621_pci_driver);
+
+MODULE_LICENSE("GPL v2");
\ No newline at end of file
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
