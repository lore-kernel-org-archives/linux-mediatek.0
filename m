Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C76C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:12:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A700E60E93
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 15:12:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A700E60E93
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CMFha1fRu/v1lAH/0YPNJktRPlknOxTsvYJGJkOf5MU=; b=0B9tRL0Xj7k0Ws
	3j6jAxdo4iboPhcQjtGF5hKAfALtXNOLQQFLnxJqrwYsKQqpha74NQvpnvkeniyd0IHfPO2g5rW+3
	iYUDm3/E4gp1EYgRM0XHqlU1+M5VvsdwKpag+k2FV+Y/LhRZMCyrrjAsSnfKgFiWNlYO2AuMrJ9wp
	4GHJrU6KrBFOpZzHAnTNaUxeqfgcKeX/YN1wkswZCU81BELmiVdz9EtppAPZNW/5DYEETtaiRYeeW
	dnjfotWog4vBDfk8EFhx8qj/ZVot6kzXbhL+10p3wG0McBhX9iRPHbVOKmKk3wt2mUwiF6lIuzlry
	d4cVx/igGCf4pHjWOUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGjiY-008kKh-Dg; Thu, 19 Aug 2021 15:12:30 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGji9-008kCL-8T
 for linux-mediatek@lists.infradead.org; Thu, 19 Aug 2021 15:12:07 +0000
Received: by mail-wr1-x42d.google.com with SMTP id x12so9591380wrr.11
 for <linux-mediatek@lists.infradead.org>; Thu, 19 Aug 2021 08:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5fuKx796Elw77gjwAl8zSUCyFS8ubJYZz/EESfgpkks=;
 b=yJO+jMFUHCHJyCh9Zu40TaUlUDaMmBDwvj6GBQ5q50P79oWOYEdyNpawb3tXW2vj/z
 DNDwKA1kERRV4sFALw7q4B+eIHB9W0uAUI4UQT4nKyHTJ4HxggF05nBG32WgnRHI4hHz
 GSZuIy1M61HsgU1IZwAkH78cpaMLJEcjOAm02QVu+HScUOkVgDIhfMfJdeDHeyzFtpth
 8uWrVpmv004XMwHmWy0zyJOVKGSK3WXMx3a8wgsP0avywV5rNzXDAaT0O3yM3+sakDNb
 ifH07P/3cHXavrfVgGWJ4pH4oYS8NlWeypmvN4syL1o0U6/c1x9c3jItYf3jTMQWNAyv
 FBqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5fuKx796Elw77gjwAl8zSUCyFS8ubJYZz/EESfgpkks=;
 b=J7XMZfMM/oRc43OMW7imsbeJJniN02IsA/XQ6Ew6mHQEN4sW8NhgUcajT9q5ofQ6b5
 ViZ7ezuG8vygbk3ueRoiNv4Xu/sghYvwpctOZSGpfzumHlLcg1i0OI+XZNaj7IbJmEc0
 bDP5tAvI/kkl9+u18sgCNwW1ASalFn3uG1RcjTbLrKojofSc7uhzeEnK+nugSAZANQda
 FSmzF5bMz/JP6H4CPqpsjfvIPZWxARKGxe2f+89vpJRJijK3+XUaYpQwvaH1U8lUmKka
 37dXnX/pZw+w3bChj25Py6cn0YFoBJb5SVNFtcMFCJweaFdrQQIYQw9htc1or/3oSvHv
 oQmA==
X-Gm-Message-State: AOAM530ret/SAwKMDhnbB1OS5J8e+l6JdzeabmEB5AfObzAdmitTMpB7
 oofZqhhW1iUHPhAwz0d+VntGTQ==
X-Google-Smtp-Source: ABdhPJz4GjMnmtkXigDTLZBtL+MRkj19w1VdlfTSBix8abrDJ1TrXre8hr9XFACVNZy95wL68RZRmA==
X-Received: by 2002:adf:d085:: with SMTP id y5mr4549112wrh.209.1629385922579; 
 Thu, 19 Aug 2021 08:12:02 -0700 (PDT)
Received: from alex-xps13.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id j37sm1556962wms.39.2021.08.19.08.12.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 08:12:01 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 robh+dt@kernel.org
Cc: matthias.bgg@gmail.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 stephane.leprovost@mediatek.com, gpain@baylibre.com, khilman@baylibre.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH v3 0/4]  Add support of mt8183 APU
Date: Thu, 19 Aug 2021 17:13:36 +0200
Message-Id: <20210819151340.741565-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_081205_412572_F33C744F 
X-CRM114-Status: GOOD (  18.82  )
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

Some Mediatek's SoC have an Accelerated Processing Unit.
This adds support of the one available in the mt8183
(aswell some derivative SoC).

This v3 attempt to handle memory differently.
In the v2, the memory was reserved in dts and all dma allocation made by
remoteproc was using it. Since we may load many firmwares with different size,
this could lead to a memory waste or out of memory issues.
In addition, the APU itself expect the memory to mapped at a specific address.
The firmware, because of many hardware / software limitations use hardcoded
address.
To simplify memory management of userspace application, kernel and firmware,
and to rmeove a couple of hacks, we changed the way to manage the memory.
With the v3, only the virtio memory (that won't never change) is reserved
in the dts. The firmware declare resource similar to the CARVOUT_RSC 
that used by this driver to allocate and map the memory using the IOMMU.
I am not sure that the best solution but the simplest one I found so far.

Changes in v3:
- Remove IOMMU hack. Instead, manage the IOMMU directly from the driver
- Update the device tree bindings: only use reserved memory for virtio.
  All the other memory allocation will be done using DMA API.
  This sould simplify the memory management.
- Add more comments
Changes in v2:
- Drop the workarounds needed to load bad firmwares
- There are many name for the APU (most common one is VPU).
  Rename many functions and dts nodes to be more consistent.
- Use the bulk clock API, and enable / disable clock at a better place
- add few comments explaining how to start the APU
- update the way to use pinctl for JTAG
- fix some minors issues
- fix device tree bindings

Alexandre Bailon (4):
  dt bindings: remoteproc: Add bindings for MT8183 APU
  remoteproc: Add a remoteproc driver for the MT8183's APU
  remoteproc: mtk_vpu_rproc: Add support of JTAG
  ARM64: mt8183: Add support of APU to mt8183

 .../bindings/remoteproc/mtk,apu.yaml          | 118 ++++
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |  48 ++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  40 ++
 drivers/remoteproc/Kconfig                    |  19 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/mtk_apu.c                  | 590 ++++++++++++++++++
 6 files changed, 816 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
 create mode 100644 drivers/remoteproc/mtk_apu.c

-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
