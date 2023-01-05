Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35908C4708E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Jan 2023 23:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQxJ8mog5ezSsMdjmsKqEBp6+hXiOvAg1jR6vm7PG+8=; b=och7j4n2TJEUFihxmVnNU/G+kF
	h1wplZEVqHOcF1OzT9Un+xY6A4uua/61hTlTs8ZLQQK48GVSbREpq+PpnHxElmcQxIqPJMIfH8itK
	yxq//ndphWmI6npx8MCoD2jBsYGTsY71dY4ayO/l5nnk10CtTkdp7KZo2gVrZ28V6i8V9bzMY2F49
	FHCdiPL4ZB9jSAahdovT2sW08GkQHzDtHGrOfioE2Hs9W4t+fl/qaOoTSG2cbGibtt0OA5hiwUcFS
	Awgyj4gjCJOCGMafeg2zTipjKmIc/ELpxh3BBIxdUwmYuyvnheFFj+EbMDxIiHYEytxR3nL9bYBKk
	/l7rvijQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDZQ0-00G0aj-BD; Thu, 05 Jan 2023 23:13:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVUx-00Dvv9-W9
	for linux-mediatek@bombadil.infradead.org; Thu, 05 Jan 2023 19:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XQxJ8mog5ezSsMdjmsKqEBp6+hXiOvAg1jR6vm7PG+8=; b=aYf+eji4/s9B3cBrFkg71QiCm+
	WHBXl4qO0Qlomwr8W+iFIZgI9LDJ1tGSR1LLHAfkAlBd/y0g2hnV7wKjd5i7AdbbyT4zTNtB7HciP
	8e157zI/GTcnL0MzsLapZEu6nP5bZZlY63NI0aCCM5QE3SBXRUEU52OB41pbXFopC3c5x98DikcQn
	e7rsSzjF29Ghzh7KMzVqTPc27MUAq0GURZYBhx833oMEeS8NOu0TAUgxVqP6HiWKu+n3SjRu1etJn
	1RRWGUyGaMrkSJMlqNtW2Yk70M9+lghj+CThPIW7yVnr4TTGAe3uGCcUwTZtdj1gDYSZRbjI27aMJ
	Kboqv8iw==;
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDTiU-001Veu-0m
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Jan 2023 17:07:48 +0000
Received: by mail-wr1-x42e.google.com with SMTP id d4so28790668wrw.6
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Jan 2023 09:07:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XQxJ8mog5ezSsMdjmsKqEBp6+hXiOvAg1jR6vm7PG+8=;
        b=4kxlkctBN34tswnclEHBz3Zz73r4pUFC3OC7ddlY91cJy5vWRE78R5eHn/ugD86m3o
         jJh9k7A9+zB7UWJtwYiyQP5yb/m+gYZJOcY6bTC6XJsH6Y4oduXx6hjq0322pOClRJqr
         PZwUiUfdQRKJkQPm00aWn2qRJ3J0U+jAqOBw9IbL4/Y3kN2NmSwIVKuW2qUdXslRjIcA
         iVqbzc9PtKskIO1dfXDCdTKTFFk39hIB8FQ/0WIpCL+RfpI9xuRfIbpyThFlSQsrGA8i
         G0FnEuyS3Nxrm/0Up0tup4tht2hBMA2X68hicu/hs698GRIdbIRbXAkG5Jh+akhGAimJ
         tC7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XQxJ8mog5ezSsMdjmsKqEBp6+hXiOvAg1jR6vm7PG+8=;
        b=noc3EtwnLn0Uwp0qiZd1kn2lq3tyLhZui9FFAKWUiX4DrlW77N0zNH9cmgiuDYr4nA
         XKZO+oUjw6azFHYkvLCgh6UddWa5G+fjNstx0cVYc03Hf7cQ7BrpZRSz1B6qHxoBTZdf
         aPkF8QgxIWUXf3neR+dEBujx6X3oonCDipT2Eax3AatxybJVtV+mWDZhHFialhYZT9mj
         Tw83YocgiMVRoiqE2Lb5NeM2WcY1uS15YI8L4+bLAoJl7/gG44xS+vmSpCO97XAkZv9S
         4CBurtdJ9Q4kZ0U9EIEr6ui3vm4wMFCKW8XrJMcJcXdKEGiS5+QSFF/7Oa0hRC4x2qEi
         c5tg==
X-Gm-Message-State: AFqh2ko+ARR4eMQSwkts0yufC8spWICisWXqXXOMkJx4knmmwRWTV0I0
	s0u30NM5FUxEVqJqKFkXzDOT+g==
X-Google-Smtp-Source: AMrXdXuj6LXzblcUMFL7Ac48d0ZUS2gXbM/A1z/fodQupcf7Yy/HCR4r5KENqvOgeaf+oVvjoUeOzg==
X-Received: by 2002:a05:6000:789:b0:242:43d1:6d8a with SMTP id bu9-20020a056000078900b0024243d16d8amr40267367wrb.59.1672938470765;
        Thu, 05 Jan 2023 09:07:50 -0800 (PST)
Received: from blmsp.fritz.box ([2001:4091:a245:805c:9cf4:fdb8:bb61:5f4e])
        by smtp.gmail.com with ESMTPSA id f14-20020adfe90e000000b002365730eae8sm37164853wrm.55.2023.01.05.09.07.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 09:07:50 -0800 (PST)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <parent.f@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH 4/8] soc: mediatek: pm-domains: Document scpsys_bus_prot_data
Date: Thu,  5 Jan 2023 18:07:31 +0100
Message-Id: <20230105170735.1637416-5-msp@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105170735.1637416-1-msp@baylibre.com>
References: <20230105170735.1637416-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_170746_331726_EE0140D2 
X-CRM114-Status: GOOD (  10.04  )
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

Add a short documentation for the fields in struct scpsys_bus_prot_data.

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/soc/mediatek/mtk-pm-domains.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
index 8aaed1c939d7..da827e91d462 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.h
+++ b/drivers/soc/mediatek/mtk-pm-domains.h
@@ -66,6 +66,18 @@
 				INFRA_TOPAXI_PROTECTEN,		\
 				INFRA_TOPAXI_PROTECTSTA1)
 
+/**
+ * struct scpsys_bus_prot_data - Bus protection setting
+ * @bus_prot_set_clr_mask: Bitmask used for the set and clear registers.
+ * @bus_prot_set: infracfg set register.
+ * @bus_prot_clr: infracfg clear register.
+ * @bus_prot_sta_mask: Bitmask used for the status register.
+ * @bus_prot_sta: infracfg status register.
+ * @bus_prot_reg_update: Only update the register bits given in the mask, do not
+ *			 write the whole register.
+ * @ignore_clk_ack: Ignore the result in the status register for clear
+ *		    operations.
+ */
 struct scpsys_bus_prot_data {
 	u32 bus_prot_set_clr_mask;
 	u32 bus_prot_set;
-- 
2.39.0


