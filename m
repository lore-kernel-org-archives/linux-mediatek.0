Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC950C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 07:16:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 717546142A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 07:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 717546142A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eAVHqZFvZxkfV2+LLLu6nhchTrrKtiZDIuDupMp8C3c=; b=eiSp0XgYdRAUQBfu03TQD5Adb
	n/yMMGd3bvUzDfxxXqd72bbBjp7DKBNlCE7zhlgVdxS//HmMqKooXYHPb+zDh64ZurtzpfelNpfDm
	Uw38p+wWZ9qMn75cxSXP6NVBk2HmVnU3DfjfUfrhzxb8ZODbNMwK0RjRUKJYFO8M3kZpByy+fwfgQ
	z/FQq6tMW98cu6tYn1RNO60v/u7r0vkPS/fTXOuYCkaxUD3Zh7vg9Hb2jTCkFj69VVE5sPFvZijAs
	cXY34LT1rukf6WmhTnLEqPy5GfnXIdwYWIzlCscOEb/gXvTnjoo4YvjpsDhPGSv+Gv2AEQ8uZoLU6
	EhpYS1BjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcNNV-007PPD-5w; Fri, 30 Apr 2021 07:15:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcNNP-007PNK-OZ; Fri, 30 Apr 2021 07:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=BrTRvIcjOW2USUQ1ERoFwNBIKEQKiqJ7JvuIGfNxJfw=; b=u9w2gbCL+gWOIpQcQeHTvqyw/w
 0hqt7YgaAZIRwQbsMfWxR7d1X403+/IFSj1EiRc/1aDc+48eHr3qxx9B3U93Fe0hS/CG2LaugKP+M
 O/jVrl1iqew+/Z5DSRGSq1xBsYG4xVLN92EkYf1RRhC2tG+pMJVs+bPS0O3fxMcLruRNKt4cLABvL
 +Tu60GxPzSk+VsYyP8XzK0SHCK+mM1mYCW+zfl0IUn57f+F0raGzh/5eTlVsKtHeearFsebRRb65X
 4BvEwtTkKBzkY/S9PAkBjRewBRWa5BvKHgrWd+ij45/arRxerTvwtFjyNnh9Ms1pKdA6SMAIlPRSe
 3RBFzdxg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcNNL-001C2Q-KM; Fri, 30 Apr 2021 07:15:50 +0000
X-UUID: c7587361e948482885f7d83136cb1efd-20210430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=BrTRvIcjOW2USUQ1ERoFwNBIKEQKiqJ7JvuIGfNxJfw=; 
 b=YsxS+Vyfk6V1y7FPk9I6/LgvRHfbx/j7CazyL2ggkSBOyq88ivGESex2bfxxBqxd27bz+71N8lIP48I/nQRIhuDUQ4P4uucur8p4pMiU72GeINONqF3zRifsUQgfvwdkbV2VTTHvNhcusONbZx6Lz4lRuhQBSsVgEH8znF5mNMc=;
X-UUID: c7587361e948482885f7d83136cb1efd-20210430
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 329610806; Fri, 30 Apr 2021 00:15:43 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Apr 2021 00:15:41 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Apr 2021 15:15:40 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 30 Apr 2021 15:15:40 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ikjoon
 Jang" <ikjn@chromium.org>, Eddie Hung <eddie.hung@mediatek.com>
Subject: [PATCH 3/3] usb: xhci-mtk: use first-fit for LS/FS
Date: Fri, 30 Apr 2021 15:15:32 +0800
Message-ID: <20210430071532.51794-3-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210430071532.51794-1-chunfeng.yun@mediatek.com>
References: <20210430071532.51794-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_001549_108561_CA489566 
X-CRM114-Status: GOOD (  10.98  )
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

Use first-fit instead of best-fit for LS/FS devices under TT,
we found that best-fit will consume more bandwidth for some
cases.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/usb/host/xhci-mtk-sch.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/usb/host/xhci-mtk-sch.c b/drivers/usb/host/xhci-mtk-sch.c
index 9fb75085e40f..c07411d9b16f 100644
--- a/drivers/usb/host/xhci-mtk-sch.c
+++ b/drivers/usb/host/xhci-mtk-sch.c
@@ -634,6 +634,11 @@ static int check_sch_bw(struct mu3h_sch_bw_info *sch_bw,
 			min_bw = worst_bw;
 			min_index = offset;
 		}
+
+		/* use first-fit for LS/FS */
+		if (sch_ep->sch_tt && min_index >= 0)
+			break;
+
 		if (min_bw == 0)
 			break;
 	}
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
