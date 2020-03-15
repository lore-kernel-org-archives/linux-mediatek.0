Return-Path: <SRS0=fVgr=5A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205D9C10DCE
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Mar 2020 15:08:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7F8220637
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Mar 2020 15:08:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DTbRrmtv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OFxgpzsL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7F8220637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kL+Gm6yQAK6SjplSEJO2botRJpVY/xDNH8Hc1TK1Vfs=; b=DTbRrmtvKdk4v6
	ATySfYHqJDdgsg6hG6tNoIb9E0PFhzyP4+guWJBCNjv6OXJefxpdzWgwCazZT5uDXQnqxUSAV+cQy
	iNz7vSfUzNSNzsUS2lq0a6t8w8kVu6fjBzFkP15DhiRByMkiNXOQOmEAuoRimybnD4GT2QvsMRxL5
	+vvdgwpXljN2qkNACNmoDPSa8N+hq8zL4vPkeHR91/uaQHwGTZ2OM1kg1VJhg312WoSq4pPRV2rbr
	2jr1rI9VkermRWmqmb3ZH32+RKAH+b8ZNqU2du4841TGT3VSy8SbKS9eGQRUA3aQNho9JNK/ztAGk
	moc37vmNQgvmy6y26VFQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDUsH-0000tl-VH; Sun, 15 Mar 2020 15:08:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDUsF-0000sk-P7
 for linux-mediatek@lists.infradead.org; Sun, 15 Mar 2020 15:08:21 +0000
X-UUID: 052b40649cf24b979dfa9a6c5b503d8a-20200315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+CvUngamV2VX3eNG/af1GoftRg2IFOk1is4zBfIJFy0=; 
 b=OFxgpzsLsAqSkkntwnUnK5cn2Dm+E94AGIngfCe1rhb/jsDWDFJLJSUIuWCABYlx0Xv9w9GugAcghFBuClwhXGV1GIN4WYtPlWYKNMBx/UTTwGc2URnwGeN7uVbc4+rwzA7hreuLC2/FnnoAoWHlYwle7QuNe9T69/IKRjkS9Ck=;
X-UUID: 052b40649cf24b979dfa9a6c5b503d8a-20200315
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1073031626; Sun, 15 Mar 2020 07:08:11 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 15 Mar 2020 08:08:25 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 15 Mar 2020 23:07:33 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Sun, 15 Mar 2020 23:07:31 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 1/1] dt-bindings: cpu: Add a support cpu type for cortex-a75
Date: Sun, 15 Mar 2020 23:08:05 +0800
Message-ID: <1584284885-20836-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 860C1638F459CC376E4B34BE0F369F4CB84B24E6D4543CE68454EA5693FFD5262000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200315_080819_825010_DECCA951 
X-CRM114-Status: UNSURE (   7.19  )
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

[Detail]
Add arm cpu type cortex-a75.

Change-Id: I2b05948915acfa6a04a0b8fa88684a12b6d5c2ca
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
