Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2E3C2B9F8
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 05:54:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B754561413
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 05:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B754561413
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qlK6p6uhqAMNXglMjEMSzst4kkcHa6j/KNzRWoxsjs8=; b=z3XOQegJQf3Yuk
	9MdAHCxFFhI/KLgqDXM8nBAOFq0Bd5Rh1Eai3ERTkV3Fz0lJzNb6uVUIO0+0VzIKNPM3B7a0C/YSV
	y9ozVJ8+0QzGpr8wiLajXYhNeTZkyKXCbk5mFFwd8YxGYlw8i5+drCzfyDpFsmxGn9dcHVdPSJXGn
	mvohllfOCWbhsTDXqZ1mp5v27Wo3st+S8aQpqXFNOm0cbz/K7RAj8eOuZYi5FeH9s5dorSVG8wDUX
	KWdBYdbFQB/EuFSD8zwMJ2qvwqT33RTQPclr7Lk2kFyJZxek9SZ8d2bcxgbV9IeWE1ACbgF4gdfkb
	/ZLo5URDzlQ/GamcSUAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llQ1G-003UYK-S0; Tue, 25 May 2021 05:54:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llQ0Z-003UOK-Fa; Tue, 25 May 2021 05:53:42 +0000
X-UUID: 7ce4b7d99efe4fac915ddaaf69afb10d-20210524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Z3YgRiUcPI7aSIbmkqVoe3OpEl0GTL9O36vKr7jIn+M=; 
 b=OVimEB8Xplq2K0VQY8SuePyZP05mOCKPB3H8VOGm2Kjgvq+i6Xs6M5IECv/2sNyA5l8e76BBHqPoAgIj2fOg0TFbjsWk+ZarmC0FKvm77q22o61Ud+dpy6zepm881tPHKbXS8M73y2MbMrfWaDRbgXNpfZ0zPnCOpYBcZm+4pYw=;
X-UUID: 7ce4b7d99efe4fac915ddaaf69afb10d-20210524
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nina-cm.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 667782685; Mon, 24 May 2021 22:53:33 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 May 2021 22:53:16 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 13:53:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 25 May 2021 13:53:14 +0800
From: Nina Wu <nina-cm.wu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Zhen Lei <thunder.leizhen@huawei.com>, Nina Wu <Nina-CM.Wu@mediatek.com>, 
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>, <Jackson-kt.Chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v4 1/7] dt-bindings: devapc: Add 'vio-idx-num' field to
 support mt8192
Date: Tue, 25 May 2021 13:53:00 +0800
Message-ID: <1621921986-20578-1-git-send-email-nina-cm.wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_225340_990189_CC14188B 
X-CRM114-Status: GOOD (  11.77  )
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

From: Nina Wu <Nina-CM.Wu@mediatek.com>

For new ICs, there are multiple devapc HWs for different subsys.
We add a field 'vio-idx-num' in DT to indicate the number of
devices controlled by each devapc.
To be backward compatible with old ICs which have only one devapc
HW, this field is not required. The 'vio-idx-num' info will be set
in compatible data instead.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Nina Wu <Nina-CM.Wu@mediatek.com>
---
 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
index 31e4d3c..69abd03 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
@@ -20,11 +20,16 @@ properties:
   compatible:
     enum:
       - mediatek,mt6779-devapc
+      - mediatek,mt8192-devapc
 
   reg:
     description: The base address of devapc register bank
     maxItems: 1
 
+  mediatek,vio-idx-num:
+    description: The number of the devices controlled by devapc
+    $ref: /schemas/types.yaml#/definitions/uint32
+
   interrupts:
     description: A single interrupt specifier
     maxItems: 1
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
