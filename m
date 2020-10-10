Return-Path: <SRS0=AZ7y=DR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FA7CC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 08:54:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31B99207C4
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2020 08:54:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XuIPjsAV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qoNEQRJi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31B99207C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s4Q9NAJoK3IDRQbisrtxFLfYFJ8asi6ZDaX0qOricXw=; b=XuIPjsAVxeJXoqGAG46k4cOag
	/tfQBeZiKeaauhfjH0YU1/2YgJfm0kYxpsvBznkdg99RAHvnyM1L4QjVqL0lPRCAg4fns3x/ASU3I
	MqFqr9tEmkAm5/T3TaafiyYNiKVxVgnSR5Mvg5/cScNmrz+xHCOWiNUS50TvegACHDxvRkG+dyiOZ
	RRybpvy14jltbIwEswFkQ2ATgmttFVGBp1meC+nlkFC+najgBTE5ypsFEaF5t+MPLjADDpukvtuMn
	An5sY+i7st/XDlY1KtK+OdA5rqNz3ejCQw9JImhEFA85aGRl1tOUq+AKic/A9iVvvExJuvDebdpo8
	r9ZGRQAuQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRAdQ-00080o-Gb; Sat, 10 Oct 2020 08:53:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRAdM-0007z9-7D; Sat, 10 Oct 2020 08:53:46 +0000
X-UUID: b23144c3f37247f6bd194e2be9becba4-20201010
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6sHUyhe2bp+cJmLh9RM83LrzEjRu1vXNQUSVqfN6Cao=; 
 b=qoNEQRJiwntNi/+KJ5e9mH61aQ9FkvqvRDwYBZYH/yYNULlToAehrawqaJstJTUmNVoavTiWD0duhAxZ8blVjSpZk0IXWwl7YVtQROW0tx+fHGlgDkNhcw1HtL/PGUR1pUUUt07EfVtVsUxKloFLvQhM29lDcXlAm/2EO2VnOGQ=;
X-UUID: b23144c3f37247f6bd194e2be9becba4-20201010
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1437913648; Sat, 10 Oct 2020 00:53:23 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Oct 2020 01:43:20 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Oct 2020 16:43:15 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 10 Oct 2020 16:43:16 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 4/4] dt-bindings: usb: use preferred license tag
Date: Sat, 10 Oct 2020 16:43:14 +0800
Message-ID: <d76ca8b2d64c7c017e3ddaca8497eb38ee514204.1602318869.git.chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <3db52d534065dcf28e9a10b8129bea3eced0193e.1602318869.git.chunfeng.yun@mediatek.com>
References: <3db52d534065dcf28e9a10b8129bea3eced0193e.1602318869.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 81C7BFD56C3FF5DF0971974FD98E8AF19CD3EED26B38F255A7C641B7BC3D0FC82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201010_045344_491361_C20AA074 
X-CRM114-Status: GOOD (  12.07  )
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
Cc: devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-mediatek@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is used to fix the checkpach.pl WARNING:SPDX_LICENSE_TAG

See bindings/submitting-patches.rst:
"DT binding files should be dual licensed. The preferred license tag is
 (GPL-2.0-only OR BSD-2-Clause)."

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v2: new patch
---
 Documentation/devicetree/bindings/usb/usb-hcd.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/usb-hcd.yaml b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
index 42b295afdf32..11b9b9ee2b54 100644
--- a/Documentation/devicetree/bindings/usb/usb-hcd.yaml
+++ b/Documentation/devicetree/bindings/usb/usb-hcd.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/usb/usb-hcd.yaml#
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
