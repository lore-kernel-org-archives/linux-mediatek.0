Return-Path: <SRS0=bQ/H=J5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60281C4360C
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 May 2021 14:05:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22BA36102A
	for <linux-mediatek@archiver.kernel.org>; Sun,  2 May 2021 14:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22BA36102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=stVwARg+jbqN/mGMbgwNCTm0LdCNYsCejUQad7LOswg=; b=ZQLswCf+vdqjlLbhg2RZb1zHN
	jKDTUqWbbqHkrTX2TWGyzrFWYNpiRW+8NWPoiAHTsy61g/K3t6nCY1z7979YYfLyMI+tgoalVtQp6
	/rgKe/KuD9EOh04tvHmHZknxb6vTVSsSk2gD74cfY3c3qxbSO6ySgKxRY9ugUb6/D1BjMtlKoo40V
	YsQa+hYh4JeL8YoBqKOpdrS9tVGPNp7iRID4EPJM3YPlR3cGHUApB4U4C22o6GA1m5mCPxqVz46zY
	DICPsONTnmxQYYvNTVt9Z0nVxvTcJLRxI7jFaYA/QPfQMfx0u/Mzp9gXEh5PLcCMu5Nam6cZdGkdh
	qk9FpkdWg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldCit-00Bszd-5g; Sun, 02 May 2021 14:05:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldCiS-00BsrV-L7; Sun, 02 May 2021 14:05:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=DakwZhCT9T4cb1W27KnTKYqEJVlOdj23KOErhxfKghU=; b=M3vB2gO3gXXC9hdGVFRKUtBiwU
 /ETbquUNly5AAE7B2YyrEVOg0mC/X+hnwXlAEUzp+Kw94jM9olR5DJxuh6ki7jqYsTM0aIONKgG8l
 TO+EaxgHNhyiTkS39jKVAXwGRcaTjrMx5e0gOr2j0rBDTXRYMv441oBRRWAcx9Dn3YsuFqGQP/8yE
 6WsCemWQ3Tz59AEMnM768j3S0GMC36r2U5lJuQR/RKxiClCQZmeB10f2MOTNDzVr18t3qC5+kHzSD
 nd6JkrNtAL558wKpTqTcSbLRfJImV0EpONSAqEXiRHIL9TmlSYp6l3olgyZjAGrrjrgkrIPgCIOBK
 nVErm6bw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldCiP-002YRQ-G2; Sun, 02 May 2021 14:04:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5424C613C6;
 Sun,  2 May 2021 14:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619964297;
 bh=/LzrbPktzhyQ1nIou3ef3Jihzk5fClU2jPJvhIfDLUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tJV1gkGSLPW7Pd4ZdxB4bBygqSn011DcELbG7byeU2TXIVvq4R16mIfyr6iIDX56e
 fEV2bHMlW/k6Rsvp/dBeu+dQHPdgLdchzqpaKmfv/ZN087T2MLcFglJbaRJvPxuKGJ
 C/xlA+WLm3bTVBS1Y6uZGsNS8AbSTp1ng7U1dQbjQncuHcpZo8iZCAD+AyMnVQdelT
 f8O+yM4QkCjrZ67ztkDRxlm/cdfAAaTUdxlQUKsOYIE2+3tBxoV48xWSGQysEpIXgq
 r3mXlIsiWXgsnWananKY5IM+v1dU4Px5tU6h4Ivzm7dAqcLK4SDaOYsl44NB8O3gpj
 ImUNCkGf6eHTQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 18/34] usb: xhci-mtk: support quirk to disable
 usb2 lpm
Date: Sun,  2 May 2021 10:04:18 -0400
Message-Id: <20210502140434.2719553-18-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210502140434.2719553-1-sashal@kernel.org>
References: <20210502140434.2719553-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210502_070457_575808_BD390133 
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
index 5fc3ea6d46c5..5c0eb35cd007 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -397,6 +397,8 @@ static void xhci_mtk_quirks(struct device *dev, struct xhci_hcd *xhci)
 	xhci->quirks |= XHCI_SPURIOUS_SUCCESS;
 	if (mtk->lpm_support)
 		xhci->quirks |= XHCI_LPM_SUPPORT;
+	if (mtk->u2_lpm_disable)
+		xhci->quirks |= XHCI_HW_LPM_DISABLE;
 
 	/*
 	 * MTK xHCI 0.96: PSA is 1 by default even if doesn't support stream,
@@ -469,6 +471,7 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 		return ret;
 
 	mtk->lpm_support = of_property_read_bool(node, "usb3-lpm-capable");
+	mtk->u2_lpm_disable = of_property_read_bool(node, "usb2-lpm-disable");
 	/* optional property, ignore the error if it does not exist */
 	of_property_read_u32(node, "mediatek,u3p-dis-msk",
 			     &mtk->u3p_dis_msk);
diff --git a/drivers/usb/host/xhci-mtk.h b/drivers/usb/host/xhci-mtk.h
index 734c5513aa1b..d9f438d078da 100644
--- a/drivers/usb/host/xhci-mtk.h
+++ b/drivers/usb/host/xhci-mtk.h
@@ -150,6 +150,7 @@ struct xhci_hcd_mtk {
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
