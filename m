Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DAAEC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 05:39:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B42BD651D1
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 05:39:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B42BD651D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NOZPMajmAeGX3SVFr/nQSkUjTVPX4mwfT+GSqH5eLKI=; b=LfL/N/IaTTe9UJ0M+4xDLHeO7Y
	/YMw6pENJaqTC6Bc3gqtdVTnpH3HlM7M9LAk9n/l2A3vPyTHNTm7CLmpPKgRo6/RHARGxRy3YFcNz
	a2AZrqfEWZsMwx1DiLg/Tk9Sp1BRqKaM9Uq2qVBntMTtje+uRf+ePppCEFmkYAzp0qnr/epH5N1OB
	NMOeGOuWUvUWU6ZWaQzglvWTh5Ndi9OL/CE+2z8+UrJiqDBUJ3Cn3USwEQmDT3ROkRHE6oq6NI+Pv
	j68V1jSfOx8+RCCBEXiSSN3MBXo5nO99s/NuOVYwIVnP7T+M5zPycn0huHtYyQjwqlVbAMs14EJBc
	TBl14jdg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJ8cG-00FITy-Ja; Mon, 08 Mar 2021 05:39:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJ8c8-00FILb-Pa; Mon, 08 Mar 2021 05:39:35 +0000
X-UUID: 9b4eef002b0b4d2ab289df14ca19926b-20210307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=duibJY2YTv+C41rmyl3rhe2lKcaSBNkOYAKx83YZv+M=; 
 b=nzS7vp86YEC0Be9WhWmuabO+HymqNbnYfF3Lv0AeXJtijhvUBR9d/wgyGo4wXS54ZHdLd9ZtLus9+y/+GFPFu8+bR7NS43uKIn3WB7t9MdItfuSrJV6THIBC+L8FqJk2lhp8VF6G1ljka8MP2ComImERk19M87enWa90tkhuJcI=;
X-UUID: 9b4eef002b0b4d2ab289df14ca19926b-20210307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 39082893; Sun, 07 Mar 2021 21:39:26 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Mar 2021 21:37:49 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 13:37:47 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 8 Mar 2021 13:37:46 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
Subject: [PATCH v4 01/12] dt-bindings: usb: fix yamllint check warning
Date: Mon, 8 Mar 2021 13:37:34 +0800
Message-ID: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: B6070E33E0F9755F98E1E00DDE465C3EE16D1F23FB292A9A27C75017C074CF8A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_053933_595967_B7479C06 
X-CRM114-Status: UNSURE (   9.12  )
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

Fix warning: "missing starting space in comment"

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2~v4: no changes
---
 Documentation/devicetree/bindings/usb/usb-device.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
index d4c99809ee9a..b77960a7a37b 100644
--- a/Documentation/devicetree/bindings/usb/usb-device.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
@@ -82,9 +82,9 @@ required:
 additionalProperties: true
 
 examples:
-  #hub connected to port 1
-  #device connected to port 2
-  #device connected to port 3
+  # hub connected to port 1
+  # device connected to port 2
+  # device connected to port 3
   #    interface 0 of configuration 1
   #    interface 0 of configuration 2
   - |
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
