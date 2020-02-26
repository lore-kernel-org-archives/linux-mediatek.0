Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E406EC4BA0A
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 05:44:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8B3D206E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 05:44:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ogym4AL6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Lj4miGoL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8B3D206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wc7rGqLnoSe4hxqPzhDzyQdlcJ1jVq31xbFp3AxszUY=; b=Ogym4AL6AQeOfJ
	tVxoxH4ZzQlKtMNKIzLypVXg9mDGzwbmfL1bdLXt/QSnGt5ysLFIG9e+yVgkxXPkLoZ32Uvs7UfDv
	XGwOiZN4hGDNh8dCHQ4O5e14PHvxoSWzOB9lTbTdQTrTj3Yu7MTY+RHshxYBBkRc58MRhHXj9rYdy
	NscSm3vABQVTM3etv8mMOZ/+AecHYXpHTa2kUMLkEi6K12gpl/zAH0iizJyNXorM4YytjrNOA3/Fx
	GfFiWd2Q74Z4QLnLUaCnGwRxXh8+ZdLhVCfG5xXL0JYB3JU6M+VHa8ulDBtKgWAM/wk/Qnn0TOWvJ
	N7jznMfn2pMMuT/UYWAw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6pUL-0007nc-98; Wed, 26 Feb 2020 05:44:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6pTD-0006d3-Id; Wed, 26 Feb 2020 05:42:56 +0000
X-UUID: 8f2db9fae79144d69eebf4e93e6282c4-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=C+alJd8SySA09GfW2zJ8YtQVLjjTVb/Bs9/MLtrlNkc=; 
 b=Lj4miGoL8WRhYNF7TU0lHE3yxdxuRZZOxRv3HpZ7TJfUmeO0UVENggSXST1XEBXq35VIPnBXi8cH1lwbZa0gSEbfbQg+FKHmvkT63jxlrrGk+n1HpwSf61xLyp3Ne3ehl1+nCEfSRaFUSrO2U+y7Gb2Xcc5Z3F0nAAFg1vCV6Hc=;
X-UUID: 8f2db9fae79144d69eebf4e93e6282c4-20200225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1808698555; Tue, 25 Feb 2020 21:42:54 -0800
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 21:33:57 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Wed, 26 Feb 2020 13:33:25 +0800
Received: from mszsdclx1018.gcn.mediatek.inc (10.16.6.18) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1395.4 via Frontend Transport; Wed, 26 Feb 2020 13:31:25 +0800
From: Jitao Shi <jitao.shi@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v9 3/5] dt-bindings: display: mediatek: dpi sample data in
 dual edge support
Date: Wed, 26 Feb 2020 13:32:36 +0800
Message-ID: <20200226053238.31646-4-jitao.shi@mediatek.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200226053238.31646-1-jitao.shi@mediatek.com>
References: <20200226053238.31646-1-jitao.shi@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5400F7844E94B32A68983448F56EE6FB8608AD2B8247DA0C509CB1BF81ADC9342000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_214255_622432_5082BC19 
X-CRM114-Status: UNSURE (   8.87  )
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
Cc: devicetree@vger.kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream@mediatek.com, huijuan.xie@mediatek.com, stonea168@163.com,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 bibby.hsieh@mediatek.com, ck.hu@mediatek.com, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add property "pclk-sample" to config the dpi sample on falling (0),
rising (1), both falling and rising (2).

Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.txt       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
index a7b1b8bfb65e..4299aa1adf45 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
@@ -20,6 +20,7 @@ Required properties:
 Optional properties:
 - pinctrl-names: Contain "gpiomode" and "dpimode".
   pinctrl-names see Documentation/devicetree/bindings/pinctrlpinctrl-bindings.txt
+- pclk-sample: refer Documentation/devicetree/bindings/media/video-interfaces.txt.
 
 Example:
 
@@ -37,6 +38,7 @@ dpi0: dpi@1401d000 {
 
 	port {
 		dpi0_out: endpoint {
+			pclk-sample = 0;
 			remote-endpoint = <&hdmi0_in>;
 		};
 	};
-- 
2.21.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
