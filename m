Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE6DC54EAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 10:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mNpd3roa5gv6troS6TLhHBAaJw7HpklMLo5JJSNOuFM=; b=PbYCqkPaTB0bimh12It5gEvFzJ
	LrK3qrv06eX2G7X8nidHoQCBA9lFfRumzL6DT3AGCOmL3Y0+LwmceMgU8GRHA4O2DRm27NO1wGG9P
	AAdKVwWrNqczxpiY5DnjGPvoNr4ngm4lWDliwnW2mrI8RbWiBnahsAbek9ZhV5ssx1ybokEsebTTx
	6nfSbTNRTVvgrHIiPWqVn4W/WmLta3hw4q+z0eV3rhWaJQbKiD8tao6JPovvfBIXQ+8sNglF2+mLJ
	H2hOrPJZz0MMUela7yrTAHglmRtJyjW3KBL+mfJV3hzsanzVj9adVTHP9gP37/vguoZRV3EhuHmnG
	TAzZI/zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRR6-003811-Cf; Mon, 30 Jan 2023 10:30:52 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRN2-0037OI-9S
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 10:26:41 +0000
Received: by mail-wr1-x431.google.com with SMTP id t7so2204868wrp.5
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Jan 2023 02:26:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNpd3roa5gv6troS6TLhHBAaJw7HpklMLo5JJSNOuFM=;
        b=HvVgNisJ1GOros7sTO0b7jt6wckJtww8GE0pYFh/mdrEOLAcdKo8vPknDwup16osyM
         116amBTSkKUkZ8ekVMYLvfeqfw5qoBdXOLh4SHUHOOcBkstUcLJjw95obMk6rJSVbKjS
         jHAE6s5PzQaftkaFWBDvZ1Y32Am60WjAZ4zjvWjfB6KlK/GbXWqaBDgX+ZUj+kieeJ3N
         xlZglbm8ucQewISN4rZyw375sWGlYOOpp9mK5o81r+L+y9Nu5mUB36mXBzJdTCCW4/1Q
         NXgBjgb+wtTtDdgBkmjtDiARGJcZK4ENi17cLkZgpm92XEUBp+mW6HAo5xVLPYkbLeXk
         SXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mNpd3roa5gv6troS6TLhHBAaJw7HpklMLo5JJSNOuFM=;
        b=TgTordcKKT7gresViqKPkYTeL9iqmI/xVHCkaDwj0XwRR9V/GB2O1fWuiUkPwfabaz
         M5JoiUhqC8YjrnXulpXkR85rkh4mIz4vSIf3C7H0puH++uXXgRFOuo7V7FxWwa5UyOHj
         5vbf9LxM3lbpYKIjPjGc+AhGoyA65vHpR/G6sRzn6XsEw3Plsd5nVYl4qn3hllt2NUtp
         wVz4Q7jIBgTpsgoOo2cT2XPssyKL8qrPxbedKoG8IizOQZ6dqpN/UPYNoXCAJjNH/8jE
         9mce4AFlULIqEpstQYGMkvhBkd347WcXaYUeiPzunUWOtYqt/jFR7xNrM/1KjG82xRuO
         l3GQ==
X-Gm-Message-State: AO0yUKWcurQilpgMowEP3553wL+sr/FaxfLq0XLk6lBr4HFjVDqV98xx
	mNVUib8S2OiFWPAodQejJ9BVyA==
X-Google-Smtp-Source: AK7set9AyBy9CX25oVJxOx8ewKugRbpLcfdp5pWqnHAyLQivzN79VIqqC6uSU+2kFVMMMrl1nKkKlA==
X-Received: by 2002:a5d:5c08:0:b0:2bf:b775:babd with SMTP id cc8-20020a5d5c08000000b002bfb775babdmr21396377wrb.28.1675074398562;
        Mon, 30 Jan 2023 02:26:38 -0800 (PST)
Received: from alex-T14.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s5-20020a5d5105000000b002bdfcd8c77csm11426785wrt.101.2023.01.30.02.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 02:26:38 -0800 (PST)
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
Subject: [PATCH 2/3] iommu: mediatek: Add support of unmanaged iommu domain
Date: Mon, 30 Jan 2023 11:27:21 +0100
Message-Id: <20230130102722.133271-3-abailon@baylibre.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230130102722.133271-1-abailon@baylibre.com>
References: <20230130102722.133271-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_022640_349407_D9F48F20 
X-CRM114-Status: GOOD (  12.28  )
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

Currently, the driver can allocate an unmanaged iommu domain.
But, this only works for SoC having multiple bank or multiple iova region.
This updates the driver to also support unmanaged iommu domain if
MTK_UNMANAGED_DEVICE is set in the iommu id.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/iommu/mtk_iommu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2badd6acfb23d..5884a1ad409a0 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -858,9 +858,15 @@ static int mtk_iommu_get_group_id(struct device *dev, const struct mtk_iommu_pla
 static struct iommu_group *mtk_iommu_device_group(struct device *dev)
 {
 	struct mtk_iommu_data *c_data = dev_iommu_priv_get(dev), *data;
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct list_head *hw_list = c_data->hw_list;
 	struct iommu_group *group;
 	int groupid;
+	int i;
+
+	for (i = 0; i < fwspec->num_ids; i++)
+		if (MTK_M4U_UNMANAGED(fwspec->ids[i]))
+			return iommu_group_alloc();
 
 	data = mtk_iommu_get_frst_data(hw_list);
 	if (!data)
-- 
2.38.2


