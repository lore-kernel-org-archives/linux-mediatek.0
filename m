Return-Path: <SRS0=K1YL=GT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9C6C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 09:17:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EF1823A56
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 09:17:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EF1823A56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2m9ojZM4QF1EZVlbFK9BA+lWCIVPMwyQhUHA2tLdskM=; b=vvmTTGEVhY7iV7mEGfUArJOpT
	O3PJod4jCCQByBI6/O6YLteSYQUe9kCdiqpBPeqjF5i6C8yWARvQG0lp8pg3OAvr8Y150GfaiKTv0
	0ibpig25/VBELYD7Vm6NVAgCnbYyM88lz3OPJzBl2yjXLekikt4nx17k4M2X4KXhOigRoeSLmf3ns
	9CM410YYxI0ALlHG5Drh5HRUtaXufbxibT7FNndLwn/D+ZdaHrInoehw2hHmlr4vlAVd8ILtMLGo+
	uUvRUozGSakHnXwAIUUWrkRUKOUwLeUGebn+Yrtgtui33HyUM+1BUZrwMF/GBfDcwQCvvKNlKcd/t
	w99B4YMUA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0hi4-0001TT-4S; Sat, 16 Jan 2021 09:17:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0hhq-0001MN-Fd; Sat, 16 Jan 2021 09:17:15 +0000
X-UUID: b9580b14b7a24335bb20e03234955d9c-20210116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=jcPT0Ouro3sFfGACLVKC62buUbGfh+WkruUymncuilQ=; 
 b=eAoovHvJoocIovqzfTRsHSWajdi9iS6ufFS/OxeCtaGedipnKzNR3+QNpPWqOvye5vuAdXN5VXh0O8a6C9Q1DaiLFC4revTvE8eUrvy+1OsHBTzbvgYD6MPUiPl2NQCxZ0MfLO4W3L1ECDLeFh9dvPynNfRlfVyrFYdtHOoHtg8=;
X-UUID: b9580b14b7a24335bb20e03234955d9c-20210116
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1479145472; Sat, 16 Jan 2021 01:17:05 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 Jan 2021 01:07:03 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 Jan 2021 17:06:58 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 16 Jan 2021 17:06:58 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Matthias Brugger
 <matthias.bgg@gmail.com>
Subject: [PATCH next 02/15] dt-bindings: usb: mediatek: fix yamllint check
 warning
Date: Sat, 16 Jan 2021 17:06:43 +0800
Message-ID: <20210116090656.11752-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 950C4F545F68DBC63BF8CFA97B963ECC14D56E0EA4CF1E0805DB59BDFF6F46BE2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210116_041714_734316_A7A5D5FD 
X-CRM114-Status: GOOD (  11.26  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix warning: "too many spaces inside brackets"

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml          | 2 +-
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml    | 6 +++---
 Documentation/devicetree/bindings/usb/mediatek,musb.yaml    | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 38b1fe18aa79..a3817f3af59d 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -139,7 +139,7 @@ patternProperties:
     description: The hard wired USB devices.
 
 dependencies:
-  wakeup-source: [ 'mediatek,syscon-wakeup' ]
+  wakeup-source: ['mediatek,syscon-wakeup']
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index f5c04b9d2de9..66d78f534722 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -172,9 +172,9 @@ patternProperties:
       example if the host mode is enabled.
 
 dependencies:
-  connector: [ 'usb-role-switch' ]
-  port: [ 'usb-role-switch' ]
-  wakeup-source: [ 'mediatek,syscon-wakeup' ]
+  connector: ['usb-role-switch']
+  port: ['usb-role-switch']
+  wakeup-source: ['mediatek,syscon-wakeup']
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
index 790efe8b6274..a515c9f30b96 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,musb.yaml
@@ -66,8 +66,8 @@ properties:
     type: object
 
 dependencies:
-  usb-role-switch: [ 'connector' ]
-  connector: [ 'usb-role-switch' ]
+  usb-role-switch: ['connector']
+  connector: ['usb-role-switch']
 
 required:
   - compatible
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
