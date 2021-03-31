Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E26C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 09:06:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 727EC619CA
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 09:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 727EC619CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bRAxzRuYaq8y5Kt42t1p3XwNddO2r0/hmLnO3XguWls=; b=pB/cRob1L/KJr6VzlZxaHJhMv
	TRGfFIDIuDnQQo6EmYvyzI+JyNzf2hoHj/6dS6VakTXsXCD2ZyzQiSArR4/mSuRrX6QZn6rmm1GsN
	W0m1k9pVGg5NNBrbFi4vYbeVwlQYXRchArc5p/HA3mS49BSvNiA2thknrWuP614fV1J+ESHh/cgNo
	LPo4HIMpp1JmS7Kr6yvNbaJX4Yhs0tfxgoDvJjNdc47MLjyLJO6Jy7kqCs3F7ggtev2o6Kl0zr7/e
	ihea615CWDdCE/CNfWnycxv23Ok2Beid2sdk7+hdRUc9iEFTwvguZTd/c0HxO+BWhg1WJW4Slkg8S
	h6TUVs+VQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRWnl-0063WZ-4Q; Wed, 31 Mar 2021 09:06:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRWnb-0063Ug-90; Wed, 31 Mar 2021 09:06:05 +0000
X-UUID: 8f3cebfdab4c42dd964641e3160ba398-20210331
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=wfxjMvgUcXk1ggU1hMecdWaMxF4+mnAP7/91CZSY7PA=; 
 b=WCky8ojTjzDLg0QnjCGPTAyLqdie2EqkpXqwPfZ6wievtiIIse5aDf0FZpBVBhcSK8yha7YfRHBIT3U/xIdGO0mSEOE0iVtLa+C8AEQmLroJT7hdYNeN0UXNckD7n1Yy3Oa+x+mfWS6o0or9DYKsjGTrIK0X7hmMRLPH/u1lAVU=;
X-UUID: 8f3cebfdab4c42dd964641e3160ba398-20210331
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2026219837; Wed, 31 Mar 2021 02:05:59 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 02:05:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 31 Mar 2021 17:05:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 31 Mar 2021 17:05:54 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
 "Nicolas Boichat" <drinkcat@chromium.org>, Frank Wunderlich
 <frank-w@public-files.de>
Subject: [PATCH v4 2/4] dt-bindings: usb: mtk-xhci: remove redefinitions of
 usb3-lpm-capable
Date: Wed, 31 Mar 2021 17:05:51 +0800
Message-ID: <1617181553-3503-2-git-send-email-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1617181553-3503-1-git-send-email-chunfeng.yun@mediatek.com>
References: <1617181553-3503-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1E5EE4607C045384FE7FFA8328CD21E61974EE9345F4E1D3800DBDBBBB0691402000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_100603_940097_D6C2ADD7 
X-CRM114-Status: GOOD (  10.81  )
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

The property usb3-lpm-capable is defined in usb-xhci.yaml which is
already referenced in this file, so no need 'description' and 'type'
anymore.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v4: add acked-by Rob
v3: new patch
---
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 291749f49f35..69c3e7d0f9dd 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -100,9 +100,7 @@ properties:
   vbus-supply:
     description: Regulator of USB VBUS5v
 
-  usb3-lpm-capable:
-    description: supports USB3.0 LPM
-    type: boolean
+  usb3-lpm-capable: true
 
   usb2-lpm-disable: true
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
