Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D9DC3F2CE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 07:51:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A28F20674
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 07:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tA4ENfHh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Jxr+spec"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A28F20674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d1arTPtVuJtOBrwb3a6AoTARnCW1+dx+is8vaRZSbNo=; b=tA4ENfHheSBUMh
	OnLx2HtQldXrFxz/ZjI6R55bB7ErQ+Ou9Ah2KVVczLJ96zfWCHe4xDeQ7hTr0pCsljdEZxDWt9+tQ
	t6SBvGOPjQtPgB83p2vJcSXCi0uFGhk3qbkMMFLoIi5BeFyJkzqBVe0NhKeYiJ49epRrqSV/aTcJp
	rq9H0x6hOlmVd+RWtG12aGazQ0bePVU1T2yd+77xY81UNu80q5vJzgrhMF4uty1ChtG0J3de/fRQv
	b8la1RGwonwCJpz19VBOe8vd3h5JYEoWctvjYw71suZBUaVNgYXVztVRir//aDsGHDF8apXppiGmO
	SZY+w8SVP56P5dfAmPTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDkWb-0008Jp-DH; Mon, 16 Mar 2020 07:51:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDkWX-0008J0-VE
 for linux-mediatek@lists.infradead.org; Mon, 16 Mar 2020 07:50:59 +0000
X-UUID: e304b7b7aaa448d2978922a4973ad99f-20200315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=yeo4h6DvN3NLgI/noju6bhQdpGHApRy5klUw2BjdFtc=; 
 b=Jxr+spec7j3GKcjuG4+wLqMymXiyGHEMRDUzlnB7XTjnZdCSlG7nrxqkj9FTP4cWfyrn8F94LwQWQGzW7juwdSpez7i3W8OopglWQRMqRCvbFLhTafc/35gJLOrtMGjrzL9575dDf9HLX1jiSrA+OF5sOETGnsr/dNvs5df2xsY=;
X-UUID: e304b7b7aaa448d2978922a4973ad99f-20200315
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1027376316; Sun, 15 Mar 2020 23:50:55 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Mar 2020 00:50:53 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Mar 2020 15:49:55 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 16 Mar 2020 15:47:55 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/1] dt-bindings: cpu: Add a support cpu type for cortex-a75
Date: Mon, 16 Mar 2020 15:50:50 +0800
Message-ID: <1584345050-3738-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_005058_010736_157ECD6F 
X-CRM114-Status: UNSURE (   7.03  )
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
Cc: devicetree@vger.kernel.org, Hanks Chen <hanks.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add arm cpu type cortex-a75.

Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
---
 Documentation/devicetree/bindings/arm/cpus.yaml |    1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Documentation/devicetree/bindings/arm/cpus.yaml
index c23c24f..51b75f7 100644
--- a/Documentation/devicetree/bindings/arm/cpus.yaml
+++ b/Documentation/devicetree/bindings/arm/cpus.yaml
@@ -128,6 +128,7 @@ properties:
       - arm,cortex-a57
       - arm,cortex-a72
       - arm,cortex-a73
+      - arm,cortex-a75
       - arm,cortex-m0
       - arm,cortex-m0+
       - arm,cortex-m1
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
