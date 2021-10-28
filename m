Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBBCC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 04:06:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2E8361073
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 04:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2E8361073
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nG++3DReZllsuejU84qznkdz/fFWzpN5VfD2xlnv8b0=; b=XrHYqYtAE9I5Ds
	Tr2z7iWW0vrxdJneICci6p0lq2qk8EA0/g1mNcTocD7oQPZOc3ZfqoFaFRka1fOVPiw37z+neipbn
	iZ0RXMWkQc0UWUuZ0FwmPBZOIXy8EAsEV+ulebSV735Otfrx7nyEiuhXnfFTk422v2fdetzEwzctT
	1RrmmJYSoNMVx32cfd7XODfWWtrtIbIsTmXQMfpD69C9B5FDtTQQaPSR10660bq9otDuLGVnysHRP
	PXF1a5A4h9bA21LznUWxWDKA1DubQGBbfoezNvnrbS4iPzwXL52cC3zcIN/HmmF8wAUgpo5saU8xH
	ki9vP4vnkDZLKQbJ7f+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfwfo-006o7y-Cq; Thu, 28 Oct 2021 04:05:52 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfwfU-006o31-B3; Thu, 28 Oct 2021 04:05:33 +0000
Received: by mail-ot1-x333.google.com with SMTP id
 t17-20020a056830083100b00553ced10177so6592001ots.1; 
 Wed, 27 Oct 2021 21:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WwuffgxU3wRmVa+DpmHIPcZE6CmK1JPJZJMS0/ZH4Jo=;
 b=YUw1lmx4OIdq79Cg2MrmNj3sAmreSf6/zZ6cCsqLs9Hf0cNzulCsCnTIoCSje7Juf5
 4MW6RqbCUqIxhZ/sgg957aojyu5OyPKUwQ7lwKyjHl/RnX5n2BOzdeHUGfS2xI4R1o1R
 k7pSk3Z4BcLXxu+kcblwePAQW+E/y4Wvc4vQ/TnpfEkDuuWEs+m1Nfp12xc5h4DyYgcd
 cOun6umiPHH1thhpyEVi64FS1aUzGshAXAINyCxx8fJtRlf2d36H8wzYOHjXz4rbxPes
 CZWXhLk+mlHO4E+DABFubVzJHUXgwD2wHVPe2LwduH9vdeQkopq3jjAlXBOcoO+66L1a
 JkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WwuffgxU3wRmVa+DpmHIPcZE6CmK1JPJZJMS0/ZH4Jo=;
 b=IMw3/NoZUMgge1GzarRS28EJWFWZUeJkdOadx4MpNOx5rLzyNxP+P8Qj2OeXcWTdm3
 TwMvtKPDopdpRL599xiNAcZwkjsmwHNeQScPjWvoWwHvFfTKSSP2VamQzltNAlxOX2gl
 xmjXX3/gKJ/xMB5rVSjqtU0LWNK/pi8X6OOFHE5TZdVuTkKpw6ExgjLfOwb2Hwn3zWY0
 5YSc56JzPoldI5MXhNnRiI2x/CTlZPCTVm69l49RPBvyUrlSkcq7Av/WslEd62S73mmB
 NxAAdzcsI3GnOm4p9L/d4hXGBkvt4GMKcE5m3zmFN5sFnP1ZdqWfGWT6CjUwYHBPQFpr
 Aa+w==
X-Gm-Message-State: AOAM530iBLfn7PBSAIej9VofeNVR0wTIR1gK4Gqpc4cuRyVRcFiMo2Qy
 wn8iQ29TR5qbRailA4F4vHA=
X-Google-Smtp-Source: ABdhPJyUsB/5+7FwNb66y//mjG3vnJaBme5QHb/EqdW/iuW79NaMesoAdP7HsruDu3dQtHaezLflkA==
X-Received: by 2002:a9d:655a:: with SMTP id q26mr1516675otl.20.1635393931070; 
 Wed, 27 Oct 2021 21:05:31 -0700 (PDT)
Received: from localhost.localdomain ([8.26.182.76])
 by smtp.gmail.com with ESMTPSA id v13sm720310otn.41.2021.10.27.21.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 21:05:30 -0700 (PDT)
From: Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To: tsbogend@alpha.franken.de, sergio.paracuellos@gmail.com,
 f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com
Cc: Yanteng Si <siyanteng@loongson.cn>, sfr@canb.auug.org.au,
 lorenzo.pieralisi@arm.com, robh@kernel.org, kw@linux.com,
 bhelgaas@google.com, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org,
 chenhuacai@kernel.org, sterlingteng@gmail.com, linux-next@vger.kernel.org
Subject: [PATCH v2 1/3] PCI: mt7621: Add MODULE_* macros to MT7621 PCIe host
 controller driver
Date: Thu, 28 Oct 2021 12:04:52 +0800
Message-Id: <9f78c60ccef522115271bd406497a828fe5cd29d.1635390750.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1635390750.git.siyanteng@loongson.cn>
References: <cover.1635390750.git.siyanteng@loongson.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_210532_408684_1A4989C2 
X-CRM114-Status: GOOD (  11.84  )
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
Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
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
