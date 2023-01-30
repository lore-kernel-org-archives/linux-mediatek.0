Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29B3C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 10:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=a1sabGNp0i0jnpvKtDcfkVpINZEUTfpEqzCGhBjXqIw=; b=OZ/NC0ZgqpKahiJsSc3a9xAYau
	8k3XzFPdLJKVmR6UwFx60Ip6ekPOrg04tBHW9474CyegQgB+77dmjllE1zIu0Y6BoCWlOQjbZ6tgz
	L1OLseD2dYwraUFzfaiZMX44kMm/SLa1aRbXUVdA+/7hNb2etE3TCHDvLgoNNga0yo+MELQporV3y
	JHM3z5YZ+5GOcPSIm9MshAnRtZ4FmXIsowOflBgHqDcvuycj3QMpwAB+XzJHk/9LgYRYoYt2OmR5x
	+ByRlS07P1f/Z6M5B/V8TwiNrlxrFswoSte2lo/5Po8S1O8LboiS4kO6am4sKY2yVioHVOFWxHG+u
	usei8zrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMROJ-0037WR-AQ; Mon, 30 Jan 2023 10:27:59 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRN0-0037Nj-Lo
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 10:26:40 +0000
Received: by mail-wr1-x42e.google.com with SMTP id t18so10578887wro.1
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Jan 2023 02:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a1sabGNp0i0jnpvKtDcfkVpINZEUTfpEqzCGhBjXqIw=;
        b=TGbOhzz/rPG3jSJFwXwz9IARb5DEJa0LNKqqAhM8Or6IuR3iLbqSOj9ah3EQaWUZv3
         QtpJDEd/CQRktCQqVLtB4vMZaVkaUSlj+f5413ziTkTbsZUGJC4difgipU7P2mnJ841b
         zG1f6EeK7NeiAN/BqZVB1ON0FvRmlPDDVE9eVMZVPoBM9CLB5O5dIyX2rQeA6GAJEwJ6
         16CHJhQItoI+eKYhP7OGYNAFW1GMAdm5Dtrr41T9yxgdjS3/MmzxF9LWlc0xEXyuXtgP
         cmZDGJRW7Ap0j75DnTuemaHRy5l01XZKOCvIULOdnHGtgMI/vE9fKap6yzNcupMNxijc
         Q35A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1sabGNp0i0jnpvKtDcfkVpINZEUTfpEqzCGhBjXqIw=;
        b=8EIWfuUD6qSGBUCCmOnIXGX9iVje/JlPPYbWq9Ao69P3UN/Yq3hCCW47etwIafjR15
         h/fsg1nYN00IW8dMeecKGFH0wuEIf7ds0F9pC+ORHqTL0ayNUrtJK0/8k7QGYKFWX2uA
         ZmFIJ0amlAKlE4byvjY5SJmc6UF6HVqFXC+102+Ocfs1ciVsc8m8fg2Y6O2Av7+PABBO
         Rj6EoN977T6CL9nwRTjwq1oSxJlpRZp9IMQw6nmKTI6nbGypbnu1nSiu3ytHb/oeNzlg
         k4c6ULoNymeJ76tBBmumd465Thxk3T0zLQIBs4WEhWqu85QxUx7BBfqgO8U8x2wRQcIn
         rWzQ==
X-Gm-Message-State: AFqh2koA4B99C7FKB0Yw117azib2NYklEPt6IwWCtUyd/s8zWGuEGQM+
	wnVygfpEKp6/kGhTKvcyVf4Uyw==
X-Google-Smtp-Source: AMrXdXusnxR1vGulnY9qOYGIrAj2fP/mpLLBdaOBnAzh7KNVOon1ShfM7VQfgnYhs0CrTstGHVq8UA==
X-Received: by 2002:a5d:6e8b:0:b0:2bd:d9b5:8191 with SMTP id k11-20020a5d6e8b000000b002bdd9b58191mr42677507wrz.61.1675074396348;
        Mon, 30 Jan 2023 02:26:36 -0800 (PST)
Received: from alex-T14.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s5-20020a5d5105000000b002bdfcd8c77csm11426785wrt.101.2023.01.30.02.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 02:26:35 -0800 (PST)
From: Alexandre Bailon <abailon@baylibre.com>
To: yong.wu@mediatek.com,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	matthias.bgg@gmail.com,
	krzysztof.kozlowski@linaro.org,
	robh+dt@kernel.org,
	iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH 0/3] Add support of unmanaged domain to mediatek IOMMU
Date: Mon, 30 Jan 2023 11:27:19 +0100
Message-Id: <20230130102722.133271-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_022638_733922_6C7B205C 
X-CRM114-Status: UNSURE (   8.60  )
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

Mediatek mt8365 SoC APU support (AI Processor Unit) is being upstremed.
This device, behind an IOMMU uses remoteproc which requires unmanaged domain.
This updates the iommu driver to support unmanaged iommu domain and let
remoteproc use the IOMMU.

Alexandre Bailon (3):
  dt-bindings: memory: mediatek: Add support of unmanaged iommu domain
  iommu: mediatek: Add support of unmanaged iommu domain
  dt-bindings: iommu: memory: Use unmanaged iommu domain for the APU

 drivers/iommu/mtk_iommu.c                              | 6 ++++++
 include/dt-bindings/memory/mediatek,mt8365-larb-port.h | 4 ++--
 include/dt-bindings/memory/mtk-memory-port.h           | 3 +++
 3 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.38.2


