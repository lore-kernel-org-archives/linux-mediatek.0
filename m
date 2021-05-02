Return-Path: <SRS0=bQ/H=J5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D9AEC43460
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 May 2021 14:06:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A766613C7
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 May 2021 14:06:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A766613C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9R3x4NrKy4Mwz4gY5ltZkGrz7xFP38By4dk/Ka1jxmU=; b=cIQkb5CC9AIRgP0xYttHLQM84
	zoBMC9O7C/dHcnFQiej4F8H0XLl1rbShJSwyS187zf9vThnLCcqgQlPV8IWgQxXrj/pFgQys55JKQ
	lNa9aLkDwL4i9JsRzCZ6kWNnspxH9K5+RfZ1Dz90yZLcDGEmFrx6Fp7Ul9BiYN0cVyGg44JbVmpAn
	BQrjcaxrNUht0gz/N7TV63fuDz9uFQdKlH3YnvmW9NCCW4qEr9eWn4U6oF6LKSts/wQ/rNergFXoy
	ZoDmtfHKlv7YlglAkEkCTsaSQVRJccO0UtwKCmBIkFI4LGdti3VOguLq1iQc6z/K98TwspLs7liE2
	teTnrBF0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldCjy-00BtIS-64; Sun, 02 May 2021 14:06:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldCj2-00Bt3c-C0; Sun, 02 May 2021 14:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=UT0zqV94BJNszPHwXs/EMweThw266Agq+VBGJdcjAZQ=; b=c1TABpSsorphzoC9aFa8VOrdxS
 AejJP+25B2TK8stc1iMC4AfEY/sCEf08tx9zLQTlwlkjTbl+cIW/NQG4nBOSuBuJnG5oJFAWIsJYi
 rsh8Em7TwO+OW/pPWcp+ktrhO9VUbgKsutx5b/jxIDteNcnCcyRl45ykxMxf6bqQNZkjIQq+c8JJ1
 eFWgianPmfJ0aGATWaem+eV5uyMhHvruPSByZTtLKuB2D3drruCVAPcQW4sEg96jl49doF0Y/2TO8
 HQQZ70V5NNxcZ63b1ft/sqdBiGfjxHCSZeTEroW/9GAYeqNk7TSA/hOUCbHHWpbvZUNNgVnD4wppj
 qpYLs5bg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldCiz-002YWA-Of; Sun, 02 May 2021 14:05:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96323613B0;
 Sun,  2 May 2021 14:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619964333;
 bh=Jfp2iIYgHJRSaV2HyRvRnNTudasMjHvEd9wkE7q3ZyM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t7ESafim1Qbqapyl8xqbB+WwJ/0DxvLwicNtN7+KnlIe57VICQi8YWshLcbGVw93B
 a/IoS08VXLtFrjap5rWWBGpoKKlrKPCuBvStKiUECiua6EEn9ttgMN192ePPuv20oT
 c9kjxgmN9cWgvAFaNaIsBzPGBMxjey040Di3Bo7V34LXZNEvVTwbCp+vzOvl5CRDKg
 aNx+HAAGmTJAM7kDp08rcsF/CsueES9oUkxpa+WfJrX9Lr8FuQwZK8Q6GeTE+tAuSf
 nyrd2WCYCsHuUEXC5nmjZF4o8CMO1RjnRygc9OwVD8x6MAkdTXL6Yv/bBTYhw8Xn3i
 7+CZgKBDktlWw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 12/21] usb: xhci-mtk: support quirk to disable
 usb2 lpm
Date: Sun,  2 May 2021 10:05:08 -0400
Message-Id: <20210502140517.2719912-12-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210502140517.2719912-1-sashal@kernel.org>
References: <20210502140517.2719912-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_070533_841579_EA240DFB 
X-CRM114-Status: GOOD (  10.47  )
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

From: Chunfeng Yun <chunfeng.yun@mediatek.com>

[ Upstream commit bee1f89aad2a51cd3339571bc8eadbb0dc88a683 ]

The xHCI driver support usb2 HW LPM by default, here add support
XHCI_HW_LPM_DISABLE quirk, then we can disable usb2 lpm when
need it.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
Link: https://lore.kernel.org/r/1617181553-3503-4-git-send-email-chunfeng.yun@mediatek.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/usb/host/xhci-mtk.c | 3 +++
 drivers/usb/host/xhci-mtk.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index 09d5a789fcd5..f4b2e766f195 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -395,6 +395,8 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
 	xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
 	if (mtk->lpm_support)
 		xhci->quirks |= XHCI_LPM_SUPPORT;
+	if (mtk->u2_lpm_disable)
+		xhci->quirks |= XHCI_HW_LPM_DISABLE;
 
 	/*
 	 * MTK xHCI 0.96: PSA is 1 by default even if doesn't support stream,
@@ -467,6 +469,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		return ret;
 
 	mtk->lpm_support = of_property_read_bool(node, "usb3-lpm-capable");
+	mtk->u2_lpm_disable = of_property_read_bool(node, "usb2-lpm-disable");
 	/* optional property, ignore the error if it does not exist */
 	of_property_read_u32(node, "mediatek,u3p-dis-msk",
 			     &mtk->u3p_dis_msk);
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index cc59d80b663b..1601ca9a388e 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -123,6 +123,7 @@ struct xhci_hcd_mtk {
 	struct phy **phys;
 	int num_phys;
 	bool lpm_support;
+	bool u2_lpm_disable;
 	/* usb remote wakeup */
 	bool uwk_en;
 	struct regmap *uwk;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
