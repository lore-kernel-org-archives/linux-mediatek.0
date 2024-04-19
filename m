Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE50C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 09:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TtlViaUk+ppF2YvB3wdQyftKniyUzK8Ej92YBlwMILc=; b=mmxZyKb9GibwQiYoKYCkM8lZee
	+BqGjiY448C11wQnaHphhrgEcxn4ZUT31WgpT2UF/7Dx9qlOma5vijyNr/eSxMH4XBjopxzCMu9+G
	rsw6JRvBZUjScMY+pI2EoTXvaBDkAMBpTYfyisLVRmgwoI9LpLqo8xqZv0aIS51VIQvFvn37KPKyu
	N0ZzAOdSBZdXB8UtPcwWCVh/QmRAqv869tRb+I8Obpb142X9nZRwJbbIBqZx68LkGu4jPg23sGmep
	d7QYAecU9fdK4iKsJQTmnyfmJxd4N9B/75l7rMSBZX5iP5wvq3yViS7aySvheqTmjXzHsb7pU9N/J
	T5VKAvlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksH-00000005953-3YmU;
	Fri, 19 Apr 2024 09:49:41 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxks9-000000058qN-155f
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:36 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-78f02c96c52so109304185a.1
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520160; x=1714124960; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TtlViaUk+ppF2YvB3wdQyftKniyUzK8Ej92YBlwMILc=;
        b=Wk0NTS9TlqBJOjnEII/PeGUvRBZO25ZAWK29Fp2BJeZQIc9bN4mtDRYXvmLcrBlqML
         fANhTAABTRaFXZ9iv9nPYgJE6GupMbC5SYdpbRTCo59RLUMbAdWpgJmJ9J9+N2onV/9C
         1O9Nf11eWtyC1nOzM7mLdMPIfC4xwJdbFkbCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520160; x=1714124960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TtlViaUk+ppF2YvB3wdQyftKniyUzK8Ej92YBlwMILc=;
        b=tBv1ITOe4G2UlgdTo2DrTrNG2rqxPUkx8Lbpbnl/ZtDEGK2wTN317zn1CoqdpjGDOu
         oNzlrTVlNdBwT4qhYHmiHP0kTwsnaMaGcwMfY7ss54XdH9D0S0zg2pLrnP2XlXHgAFwc
         1wjnlhjhnhN2/Lw71pqJyZrY4RS44MMGKA+yjGR290ST1gNcaSj88VL8wPjPRqpWKowc
         ZLqLhhIKhmFF9we8sf2wrFO5esQBZenG7+pUfQ4y1JZr7UwVztOHEmV38Ce6hx+ij8w8
         Ga9hoC2U2Fy9STmYDqolj44Z8NvXqBInPPrUveb/jq0aQ/iNtWIuKoA6PWVx3BafyQXL
         lRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLH3wkqEnXA/4lczeCNcJLoskYwMBTq/UgunwhFR8b96y3riFBaibKBqamy4i6RX02xVPehVNo3tlbVmPDeh/WkqDSOS5zdwPYxEIJ1SSNAx8U
X-Gm-Message-State: AOJu0YyKL9gHm1NvhdbdWy/K5ZjFODk3ZZ+YsJTaqpJVsXTxl3IT1zDQ
	Ez/acuR68MJTtorhm1zG5OVlAs3egHevgRwA7v5eWlOpt+TOReEN8XS8BkN6hA==
X-Google-Smtp-Source: AGHT+IHcSLXPGR/K0waZNqFgMaXNzaf95X9YYFUFUCHgvEpSUHJvLAV/8QVHrr+4o4OmwTvG9tzrkg==
X-Received: by 2002:a05:620a:1da6:b0:78d:5065:c5df with SMTP id pj38-20020a05620a1da600b0078d5065c5dfmr1595944qkn.18.1713520159351;
        Fri, 19 Apr 2024 02:49:19 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:18 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:47 +0000
Subject: [PATCH v2 01/26] media: pci: mgb4: Refactor struct resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240419-fix-cocci-v2-1-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_024933_905842_BD12C026 
X-CRM114-Status: GOOD (  13.65  )
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

The struct resource end field is inclusive not exclusive, this is, the
size is (end - start) +1.

Update the definitions and use the generic resource_size() function.

Fixes cocci check:
drivers/media/pci/mgb4/mgb4_regs.c:13:22-25: WARNING: Suspicious code. resource_size is maybe missing with res

Reviewed-by: Martin Tůma <martin.tuma@digiteqautomotive.com>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/pci/mgb4/mgb4_core.c | 4 ++--
 drivers/media/pci/mgb4/mgb4_regs.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/pci/mgb4/mgb4_core.c b/drivers/media/pci/mgb4/mgb4_core.c
index 9bcf10a77fd3..60498a5abebf 100644
--- a/drivers/media/pci/mgb4/mgb4_core.c
+++ b/drivers/media/pci/mgb4/mgb4_core.c
@@ -493,13 +493,13 @@ static int mgb4_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	struct mgb4_dev *mgbdev;
 	struct resource video = {
 		.start	= 0x0,
-		.end	= 0x100,
+		.end	= 0xff,
 		.flags	= IORESOURCE_MEM,
 		.name	= "mgb4-video",
 	};
 	struct resource cmt = {
 		.start	= 0x1000,
-		.end	= 0x1800,
+		.end	= 0x17ff,
 		.flags	= IORESOURCE_MEM,
 		.name	= "mgb4-cmt",
 	};
diff --git a/drivers/media/pci/mgb4/mgb4_regs.c b/drivers/media/pci/mgb4/mgb4_regs.c
index 53d4e4503a74..31befd722d72 100644
--- a/drivers/media/pci/mgb4/mgb4_regs.c
+++ b/drivers/media/pci/mgb4/mgb4_regs.c
@@ -10,7 +10,7 @@
 int mgb4_regs_map(struct resource *res, struct mgb4_regs *regs)
 {
 	regs->mapbase = res->start;
-	regs->mapsize = res->end - res->start;
+	regs->mapsize = resource_size(res);
 
 	if (!request_mem_region(regs->mapbase, regs->mapsize, res->name))
 		return -EINVAL;

-- 
2.44.0.769.g3c40516874-goog


