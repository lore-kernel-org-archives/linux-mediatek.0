Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3616EC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 09:10:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B833613D5
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 09:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B833613D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aTa4iL7OBgX4RHzuJdTAL1+DKPrnBRuNIg9lePTnMfk=; b=n9mflGjRSt+8jnEjO8+oxpch9o
	NaQwD94nK+rpP4G0vVU8tX0tAb/Vp+Gu7j8EuNE+hYeyZO0us8wSm9PON1Uw1cGA8xvAm/hatYCWl
	CG2A5bNuIKj2eCqlC33wDG3CIb0pvPjqefbDY2H8ofd45KmVKJjsgFxy5Rnla9ZGHhrGBn2XAHq5q
	HX33DtGK9oY1IcQZNzzRMiiHKuYw/8hH34TxOkDRDal1gAxJ7Ty1DHHLIbFP3GEiYLN9rzhs3e69q
	bp4Y0Bn+iu0lh2b56kLGeGRMx3/lTTnuOOhTSsFRBw19sk2QvbgTmSmuU28f2tmWel/DCn0HLCdCp
	TVKh7Neg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZVLe-00GLTK-94; Thu, 22 Apr 2021 09:10:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZVLT-00GLQC-Ie; Thu, 22 Apr 2021 09:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=LtKfLenrGbNib+oramueMYsEOwH9Lq7CH8hV1OdCreg=; b=zQTU0KBt8kRj+eVjLmj1FNzjwE
 64FZc+iEHNfGqQL4PqpFavv8MWeeIraWgfWw/7Ajex+juIh74s5LqWsHv/ehGXoHa9Xrn0GJFcfn8
 fCDp7/d0wM69uLQQjJ5gKH5k+YlzW351w0Fp5Wi/KgUMXKFWYbA/9vBPwtBcVKQsMJf/4TQZ6Zcct
 3vnyiob4K4xsAhoPCJrIc9WvOI7x4sEeFvzXMcUWK3tXcqcabnZ/4USPfgbpz88CVzUiHATSefRoa
 wA5P53ujSqllsloftA+8lbSAXysyVnXf5Pl3AheBbFADeuq/G/XW2gX3fjtINswwMF1EDK/RqJGu1
 pfaM8Jhg==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZVLQ-00DWy1-P0; Thu, 22 Apr 2021 09:09:58 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FQs4r1MY9z16Ljm;
 Thu, 22 Apr 2021 17:07:24 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 22 Apr 2021 17:09:39 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Rob Herring <robh+dt@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-serial <linux-serial@vger.kernel.org>, devicetree
 <devicetree@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>, Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 1/1] dt-bindings: serial: 8250: Remove duplicated compatible
 strings
Date: Thu, 22 Apr 2021 17:08:57 +0800
Message-ID: <20210422090857.583-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_020956_989510_73A2EB04 
X-CRM114-Status: UNSURE (   7.60  )
X-CRM114-Notice: Please train this message.
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

The compatible strings "mediatek,*" appears two times, remove one of them.

Fixes: e69f5dc623f9 ("dt-bindings: serial: Convert 8250 to json-schema")
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index f54cae9ff7b2..d3f87f2bfdc2 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -93,11 +93,6 @@ properties:
               - mediatek,mt7622-btif
               - mediatek,mt7623-btif
           - const: mediatek,mtk-btif
-      - items:
-          - enum:
-              - mediatek,mt7622-btif
-              - mediatek,mt7623-btif
-          - const: mediatek,mtk-btif
       - items:
           - const: mrvl,mmp-uart
           - const: intel,xscale-uart
-- 
2.21.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
