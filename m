Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C27AC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 02:54:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E068F611ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 02:54:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E068F611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5e1DkCeeI9ndbH4jYgoOlOCLOyGnwajeOKHtX9pZDKw=; b=g8sD2UbxE6ApJMIG7gnDy0MLZ
	OPT2vH4lhPZNVgYJrIbR+3jJ8uHCn//grsZnzkk4aGjTV27U8AyE//FaiOOqt4GF3hq5BxR+4Wx3g
	n9sfhm894tEv2tBRxbRkfxHfmSr5co8FRZofOlsrrmmiFObY5z1+zYAKs2NGXfs+IUp6twhcs/0q7
	YIOTEfDM/9SqXrUhFMvcIhrWYq61sFccvdn2hutqxoo4rzUcn8sxlCQ4lnanp9iF7ebFd/5NvfUFj
	xGAFOg6LbivUSKg5ZJBv57KAEoM56lX7MTC8oD4CyX4mDmMSMNpcFmcVwiraU4hf8186kybS8YEX/
	WiI6Z3w9g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leqcs-005unf-Li; Fri, 07 May 2021 02:54:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leqcn-005unL-Cu; Fri, 07 May 2021 02:54:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=17AVwokirAS1AR6IOk6p7+KGxpSqtHojvEwuZDWS4W8=; b=VaRjPtzqshXY3cF9khvg7EWAme
 frFtLlwaaI81cl314R9MOEIZPb2M6yr+qqeH6NOVa2rQCQFAyMm5okfHZfPPJ6BNeBQBQAG7IHG0K
 CUOvef7nPQCdy4zg6sle4aauouu1O9kg9W/j8zVZO7aJ9rrDsyZ6/IaGuJ7DtjiUvu91viXOp7P0o
 PZ5Ag5xuIRob71Iqtr2gGPYzsrWuw/UnyraIBTCzQzL+zJIbN2fi9VTr448WBElTh/0cyRKtBk6at
 F4Q6YNjCeCIslBfGwBmNb8fe0qC2BmSrLK8aXzLuJEapKd6g9BQOsferGqBW4zY/G80/kH+dJmiq1
 2ZGH71rA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leqck-006XOV-1H; Fri, 07 May 2021 02:53:55 +0000
X-UUID: 80f22168f2ff45f6b28cd742fdae1ef7-20210506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=17AVwokirAS1AR6IOk6p7+KGxpSqtHojvEwuZDWS4W8=; 
 b=WjBogmQ/CTHJJWlIpglnlLFWDapt+0Bn8QRM3H6ChdsUv7GkklXchn7h0crQaD/39JeRGhkBs8edFuQ9JQL9VRZd5sasbp0/H1iaORcuUddq2MfOK/QGw4KOEjF2dr0sFUqMU+y1S3SM4XCiHG5fL+CRUgYBFDHBdjrFTueS9Go=;
X-UUID: 80f22168f2ff45f6b28cd742fdae1ef7-20210506
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <john.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 386970229; Thu, 06 May 2021 19:53:49 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 19:53:47 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 10:53:44 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 May 2021 10:53:44 +0800
From: <john.wei@mediatek.com>
To: <john.wei@mediatek.com>, <louis.kuo@mediak.com>, <mchehab@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <wsd_upstream@mediatek.com>
Subject: [RFC PATCH V0 2/2] media: v4l2-ctrl: Add user defined base for ISP
 user control
Date: Fri, 7 May 2021 10:53:37 +0800
Message-ID: <1620356017-26486-3-git-send-email-john.wei@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1620356017-26486-1-git-send-email-john.wei@mediatek.com>
References: <1620356017-26486-1-git-send-email-john.wei@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4A7844A57F2EE1055F8E10CEB30C986A9EB0024C59559241BD322A03A6385BD12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_195354_099430_6655C134 
X-CRM114-Status: GOOD (  10.48  )
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

From: John Wei <john.wei@mediatek.com>

This patch is to add V4L2_CID_USER_SENINF_BASE and
V4L2_CID_USER_MTK_SENSOR_BASE for Mediatek ISP-only features

Signed-off-by: John Wei <john.wei@mediatek.com>
---
 include/uapi/linux/v4l2-controls.h |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d43bec5..2bcde70 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -211,6 +211,16 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_CCS_BASE			(V4L2_CID_USER_BASE + 0x10f0)
 
+/* The base for the mediatek sensor driver controls
+ * We reserve 64 controls for this driver.
+ */
+#define V4L2_CID_USER_MTK_SENSOR_BASE		(V4L2_CID_USER_BASE + 0x1100)
+
+/* The base for the mediatek sensor driver controls
+ * We reserve 64 controls for this driver.
+ */
+#define V4L2_CID_USER_MTK_SENINF_BASE		(V4L2_CID_USER_BASE + 0x1140)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
