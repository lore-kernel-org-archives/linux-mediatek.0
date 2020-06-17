Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B27FC433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 01:53:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39CFA2085B
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 01:53:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mrthliyg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bSnL6joz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 39CFA2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JF2qKtqsNuanD2m4+3wfL8tDkkPsVXt5DD0aIPhpoxo=; b=MrthliygwtElyX
	MnPICxQP0YxOrC+mONHqZ6w/bMrl2Q34HsqmUiPowHvyZaMitc8jTLKeTKoY68Yes4dl1IrbnRbrc
	gNO63KexGujf0Pu1Io/TiZxYzoOBZpaFfH83bFQx3L4YOg/y3JpDliTVE7TPYQIKec2Y6EsTTyIUN
	n0gY/uFuyTIR7UWaU/Sl/1tD2j645OVJyC0FiCwCXhUJ+GK7/xXVHWLa+Ao6ddoS3YDpsuUFIO6M4
	HE8YxC5HGEXo6c1cXm64B0UuNgcnxaEuyf5hAhTU02r1aQzkHTRXAiyIz5Q9H0Gx9T0ODptyg+Oea
	gFDiuHVgL8UW6Oe19cNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlNGQ-0001mh-9e; Wed, 17 Jun 2020 01:53:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlNGN-0001lI-Cq; Wed, 17 Jun 2020 01:53:16 +0000
X-UUID: aee1f7b0f82540489ac7dfdf702fb3b3-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=AHVzKhLaX2oKGkCZYazZw4xrXIbvh2oXu4tD1iY5vY0=; 
 b=bSnL6jozmOom2MRcFbEMkfOJGaw8QLxRFogdtM3jF7GIEaup+CRJgtJ2shVnfVIr0sxw3N/1QCcrR/+jVlwvSl78Dp1/uf6u5VgBEXZUZlgVa8u1jsqaLLZpINyW2HTbqFklAKpJQAOeDwDJWyHWl/8Iey3kVMiIYB/ooags7FA=;
X-UUID: aee1f7b0f82540489ac7dfdf702fb3b3-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2066208548; Tue, 16 Jun 2020 17:53:07 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 18:53:01 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 09:53:03 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 17 Jun 2020 09:52:57 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Hans Verkuil <hverkuil@xs4all.nl>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/2] media: v4l UAPI: add V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
Date: Wed, 17 Jun 2020 09:49:27 +0800
Message-ID: <20200617014928.4374-1-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: BA3C3E7F9A7679BEB34F77C5A76B6AB4D6C36B310217DF74FF99172E8D4ED8832000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_185315_433925_5022AA13 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds support for the V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS
flag. This flag is used for RO Request.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
index b6d52083707b..7c7451773b8e 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-reqbufs.rst
@@ -126,6 +126,7 @@ aborting or finishing any DMA in progress, an implicit
 .. _V4L2-BUF-CAP-SUPPORTS-REQUESTS:
 .. _V4L2-BUF-CAP-SUPPORTS-ORPHANED-BUFS:
 .. _V4L2-BUF-CAP-SUPPORTS-M2M-HOLD-CAPTURE-BUF:
+.. _V4L2-BUF-CAP-SUPPORTS-RO-REQUESTS:
 
 .. cssclass:: longtable
 
@@ -156,6 +157,9 @@ aborting or finishing any DMA in progress, an implicit
       - Only valid for stateless decoders. If set, then userspace can set the
         ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` flag to hold off on returning the
 	capture buffer until the OUTPUT timestamp changes.
+    * - ``V4L2_BUF_CAP_SUPPORTS_RO_REQUESTS``
+      - 0x00000040
+      - This buffer type supports :ref:`requests <media-request-api>`.
 
 Return Value
 ============
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
