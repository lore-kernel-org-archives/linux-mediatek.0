Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41BFFC433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 01:52:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D747421D7B
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 01:51:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ABXGS4t4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="b1SpmACr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D747421D7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MGUB5xNYq1RaYqJY0C0wAsc90pykROXvL6PVD95a7+0=; b=ABXGS4t4WAheesO1cqBDzwEGt
	Fv6yv/t3qhtg1VpwkeynJsWmhVNMvgFIEdDjeZdrDTLLJF0/Ut3iAJUC/HowwVLAVab/Bc9G/+bpN
	6GIe0xyLreIQm9LI4mQlIKhQAPiUs2EkRHdAWpFyYbPkwecBACvmxMBkqDMN47YNhtm+V00ZD2v4p
	kPQfezA2IrGLzWjOHZsqCZ49FZ6g7ntGiaXrvCBWSIfMVxCEo5MV1++41nQ7Iwodnlo86F3tWPqDT
	aKBJ7NtPrbgazSWeenXeR6LLxkQ8skZGPkwlOS5lvnUzAsk+QbWAyzrPvv5Tq/5wUAma4JaQhjoFf
	6v1udN3iA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSVxI-0008F3-OR; Wed, 14 Oct 2020 01:51:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSVxF-0008DP-B0
 for linux-mediatek@lists.infradead.org; Wed, 14 Oct 2020 01:51:50 +0000
X-UUID: 49738f52391d4865b0ff01789405e0cb-20201013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=M0jfuzjqV7E455NTJr6fQC3EWDs6oJ4TvyZIG6UrQ+o=; 
 b=b1SpmACr+6fR6tNXHlgGYxplz3A/Q76UUCvR+5Dtq3S9b1mBe3f6W5BHHsP6IwkARbqL7SV8JbUnYdd+jHhO6bC+tTgJCW5YOTLwjrhAZP2VoLPnjMLJk/2ItQGIQ1q853L48htV+8EV2XZ9pqs9kxyliI1Jdr/WfIBMVFYkZdM=;
X-UUID: 49738f52391d4865b0ff01789405e0cb-20201013
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1492248560; Tue, 13 Oct 2020 17:51:43 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 13 Oct 2020 18:44:51 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Oct 2020 09:44:42 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Oct 2020 09:44:42 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 8/8] MAINTAINERS: update MediaTek PHY/USB entry
Date: Wed, 14 Oct 2020 09:44:34 +0800
Message-ID: <20201014014434.62239-8-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20201014014434.62239-1-chunfeng.yun@mediatek.com>
References: <20201014014434.62239-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_215149_776615_2803C5EA 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Due to the phy/usb bindings are converted into YAML schema and
also renamed, update entries.
Meanwhile add drivers/usb/host/mtk-xhci* files.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: new patch
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index deaafb617361..d68725d87e44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2105,7 +2105,7 @@ M:	Chunfeng Yun <chunfeng.yun@mediatek.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-F:	Documentation/devicetree/bindings/phy/phy-mtk-*
+F:	Documentation/devicetree/bindings/phy/mediatek,*
 F:	drivers/phy/mediatek/
 
 ARM/Microchip (AT91) SoC support
@@ -11028,6 +11028,8 @@ L:	linux-usb@vger.kernel.org (moderated for non-subscribers)
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
+F:	Documentation/devicetree/bindings/usb/mediatek,*
+F:	drivers/usb/host/xhci-mtk*
 F:	drivers/usb/mtu3/
 
 MEGACHIPS STDPXXXX-GE-B850V3-FW LVDS/DP++ BRIDGES
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
