Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C621CE77188
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2024 22:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PPBNquw9bDve05ZXRyZElIGNn95SHQ0uPV8Ww/9iWX8=; b=XfyLEIkNtXIEhA1FoB8PscIsmK
	if/CUQCphcLSqUFVFkak+RpPThzKMV2iSXIB43ghz6GjosNlI5SgTYNWUdWqLAh2i4pvRyn5cC5AH
	3T2r0urmPfWF+oTSEQiE/QHq8GlcjhCsE+avVgy48yfo/O9X80Ofw6jmx33stWi1xJajFWrTgxZbi
	FUlYmM4yfZ+DduIlNeVbtAmDnJC32ER2qSa/usmOjHQi9U7DJOSAuTrVOw+GyEtxEGgLkRDezyFpS
	7NeVx+T8kRTANp/fuZKc7JDgE+GBfCL/bEg4RXUujxbEhJjNF2nzcETj38z5e9uhTvv0IKs6CgdEB
	et7lX+tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOlrK-00000006DyA-43al;
	Fri, 20 Dec 2024 22:52:38 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOlrH-00000006DxH-1k9l
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Dec 2024 22:52:36 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-216426b0865so23133085ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Dec 2024 14:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734735154; x=1735339954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPBNquw9bDve05ZXRyZElIGNn95SHQ0uPV8Ww/9iWX8=;
        b=jEqbnhm9RgiPpdKEODAhWlvOmnK18AWek0AKiUBqUbVSDxRbsy6lE9VKJy8jZ8E6R2
         CMM2Rrqu6U6XLx4IB05tplVOeBp9a4tGoLqOl356YWC1MjS3mc29ITbN87fSvXgWUt7U
         vqPDky4pg35kC5OWd+8ziOyC21mklsqmMTTSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734735154; x=1735339954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPBNquw9bDve05ZXRyZElIGNn95SHQ0uPV8Ww/9iWX8=;
        b=XBlQ1AiLVMdO3Dpibd79pnyWI61W/+tWyvMlhljnlDkiSseDn9y1EBwmtVgN1eqLJY
         xgZ+hKE+63EUmRwy55aq1XhhGw2tF1SpsbGqpCiPhSBfqEz/7upifdD+d5Pm1Ty+8tC9
         Z8e3YCqUOJj5H2ayuFUmHhpjRzu11r1Mpk8CAqXdvWG7NTbO/caEUsKE7D98JcMiKrVM
         YiDhPkAwygFO1AC9C6fsV4wCx4rc0mLTsiXuo8gEphgh1lK8YQUFN4ORtRfwu66h7kng
         iT8Wg3ZHf5w2jxfvWmAEs26f5jzEUjhjzmtgtaAE/9SlPzjTVYj9ziZsyezM90RQvbGr
         8ghg==
X-Forwarded-Encrypted: i=1; AJvYcCXTGpawxQLHYvOPXh9BvHf7ie7Ngy6p5OAeQBdx4eF1LNBsCn1Ncoix+ntSOd4UH62M5fmvKiEJQ2SxqK1LSA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd2MVfoN8s1lCQXNNMxtO9nGVFJQldhrnUDR7+cUZBYiKwEiOm
	PWsuFBhH6NhMmJHsCpQyYNiU+XisALSDt1J9/OqIxbkOq0klK0fXBXjmVFK/PA==
X-Gm-Gg: ASbGncsEQd0NsYtF710tLnvPyThyVCmTeslYJ3ktHPCRM8dzbds1/OnbllQyDOxBuKw
	TqvvSKYKw5yh+NIg1Z+WrW4lAJXEnsdkMoR6y0D0QJJD2Kc6kBCTufixFDJ5g8K/KHay6gB3IhO
	oVdPlmoWZt2GE7rS1l5Ga9VHns29mtG+4cec/ubF/iOaCFoUhB05SRHXB9b9OI+EaHjdM/eNUYI
	xwY5JHIomCyb7mxaX5kYZZmSGKYPdmby2EEm2DortYoc0R6CIsZ/pYjbyo9Zo/qXuTnCgvlH7pZ
X-Google-Smtp-Source: AGHT+IGAQkf1R3nFR0oaCc4mviuMrzg5Lh74UTX9WYEEnS7yyvUzZLFXHXFR6wAwBwTUIv3/nUaYnA==
X-Received: by 2002:a17:903:22c5:b0:215:7faa:ece2 with SMTP id d9443c01a7336-219e6f145a8mr61141965ad.35.1734735154069;
        Fri, 20 Dec 2024 14:52:34 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2620:15c:9d:2:ac44:423a:e4fb:5757])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc964b54sm34177065ad.1.2024.12.20.14.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 14:52:33 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org
Subject: [PATCH] PCI: mediatek-gen3: Enable async probe by default
Date: Fri, 20 Dec 2024 14:52:05 -0800
Message-ID: <20241220145205.1.Ibf2563896c3b1fc133bb46d3fc96ad0041763922@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_145235_485777_DC7F280D 
X-CRM114-Status: UNSURE (   9.83  )
X-CRM114-Notice: Please train this message.
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

Like other PCIe drivers, the mediatek-gen3 driver has a fairly slow
probe. Turn on async probe since there's no reason to block the rest
of the system.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/pci/controller/pcie-mediatek-gen3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index be52e3a123ab..49512786d5e4 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1301,6 +1301,7 @@ static struct platform_driver mtk_pcie_driver = {
 		.name = "mtk-pcie-gen3",
 		.of_match_table = mtk_pcie_of_match,
 		.pm = &mtk_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
-- 
2.47.1.613.gc27f4b7a9f-goog


