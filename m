Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314A1C388F2
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 07:19:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE233208A9
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 07:19:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TE/wujXD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="j5/ZmuF5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE233208A9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tw6C1hBQt4w1ElSYz8sbq1fOpUtvBLZ+S11G8q7PWRk=; b=TE/wujXDDRJ/fWcorJ1oGu6Gdy
	ICPwZfN0HTKl1wDlFpXOjsEThSgdvAb8NL84nHCbMwwLiA2sjv2yfzwlsF6tgFvSzWWAr2E5Mmkvn
	S/SGcf5Syugea75PmZeSHONQ3BuQAto0WrCg3E6pvdkkryMKG9BVjo6TcjoZ+g2/P3ijkuUnOAGOh
	74o75HGkaxnkmockuWjaWnXqMXoXBsqWKSDjdy9g9aRxFT6NBse+C8PcVBMu7tXO9so8D9VPJDTnA
	F5Acnz5eTx8m+3cbMyksRDZVPEDmiFZv7O3VCAZ1ws7V6cs6FGmC/YMdPDBEgTzcMfpWOAnBkxgRz
	IqlMeBBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZU7b-0005ki-6y; Mon, 02 Nov 2020 07:19:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZU7R-0005jw-AS; Mon, 02 Nov 2020 07:19:11 +0000
X-UUID: 24cd0558220e4600ad10159ea18e2447-20201101
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=kZvapf7pIFQLgezOg35dcW/H2iGzgefNvWKVVQEly1I=; 
 b=j5/ZmuF50d8JHesImRH2jBA+mZd/ht5Y8U1Cez2CcM6b80bna/nyXWJ3EQF9cFMDB16i1CgQTT8hWzE5axsoNolJOBBp7YpO/sc/NpqS+cD6IUQKKnJWlqOYlodilVz8ruiOuLx1R7kIH7macdeWzKrc927Jg/s1UoaaBB6i35g=;
X-UUID: 24cd0558220e4600ad10159ea18e2447-20201101
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 17905647; Sun, 01 Nov 2020 23:19:02 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 1 Nov 2020 23:19:00 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 2 Nov 2020 15:18:59 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 2 Nov 2020 15:18:59 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Mathias
 Nyman" <mathias.nyman@intel.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: usb: mediatek,mtk-xhci: add keep-clock-on
Date: Mon, 2 Nov 2020 15:18:48 +0800
Message-ID: <1604301530-31546-1-git-send-email-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_021910_180486_E31CD21B 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: Macpaul Lin <macpaul@gmail.com>, Eddie Hung <eddie.hung@mediatek.com>,
 Ainge Hsu <ainge.hsu@mediatek.com>,
 Mediatek WSD Upstream <wsd_upstream@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Option "mediatek,keep-clock-on" means to keep clock on during system
suspend and resume. Some platform will flush register settings if clock has
been disabled when system is suspended. Set this option to avoid clock off.

Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index ea696c8..a956dde 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -104,6 +104,12 @@ properties:
     description: enable USB remote wakeup, see power/wakeup-source.txt
     type: boolean
 
+  mediatek,keep-clock-on:
+    description: |
+      Keep clock on during system suspend and resume. Some platform will flush
+      register settings if clock has been disabled when system is suspended.
+    type: boolean
+
   mediatek,syscon-wakeup:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     maxItems: 1
@@ -175,6 +181,7 @@ examples:
         imod-interval-ns = <10000>;
         mediatek,syscon-wakeup = <&pericfg 0x400 1>;
         wakeup-source;
+        mediatek,keep-clock-on;
         usb3-lpm-capable;
     };
 ...
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
