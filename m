Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FD3C07E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 11:40:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49D6561059
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 11:40:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49D6561059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZKEYpINcQuIKQMvvjUID7U/WK1o33X2ie8FquIr0IkY=; b=GXwUrF9349SoEi
	9IgQfyF++dsUSf8U/ew15krBWIqpOgPExyd3moq9NFeEMxz512KTDtfqolJ+C5gt/F4rwahGhJuXR
	b5i0/o0lfiBY7jzHyUNW6hSMKRT4LPadGBL1RJphv/W00fbZ/o3RC7Dp/DFqXHXZkTMGPoOltxvHA
	XlSMAP8Vv5rY6T7GnrV4zpIy0TZqAjGnaTumVB+GhkX1Il0MUkWMwlXg1VwQN3qkK68njOtYOvVtc
	g2r2kMteRdtbNgqv1DaLuTG8pTTB1L//fNuKza+F9kq3xU+yueaN1y1MBCReu91vy100mdY4qztEE
	l/u0n//uPXnzP3RODiEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2BKo-003Wgx-Sm; Sat, 10 Jul 2021 11:39:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2BJu-003WTX-6N; Sat, 10 Jul 2021 11:38:56 +0000
X-UUID: cfbf450dbd204f9ea8f3f852eee2e38c-20210710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=6FU8pRrCKD4yE7SNclSRbgAJ5SlolHU8Xh7T5BjptVA=; 
 b=cyIHU8M9vKUx4B1DXDGfOGigi7fjToO8LG8avsYd3UGOBRHx88+fwpAXpkvbuZjjNk5U4MVTEYDmRvk6ZvoZd3MBte8Oqa/fJSyBxBDJQjWC9NNtrk1ut+e8Cy0k61Lnzx8sOD+fOfZctwv0PUutgqJVd+bmP16bmnw0ukienKo=;
X-UUID: cfbf450dbd204f9ea8f3f852eee2e38c-20210710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1260945406; Sat, 10 Jul 2021 04:38:43 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 04:38:42 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 19:38:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 10 Jul 2021 19:38:28 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v2 3/9] dt-bindings: arm: mediatek: add definition for mt8195
 mmsys
Date: Sat, 10 Jul 2021 19:38:13 +0800
Message-ID: <20210710113819.5170-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210710113819.5170-1-jason-jh.lin@mediatek.com>
References: <20210710113819.5170-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_043854_632831_35D014D8 
X-CRM114-Status: UNSURE (   8.63  )
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

There are 2 display hardware path in mt8195, namely vdosys0 and vdosys1,
so add their definition in mtk-mmsys documentation.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 .../bindings/arm/mediatek/mediatek,mmsys.txt      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
index 9712a6831fab..be1761010d3c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
@@ -17,6 +17,8 @@ Required Properties:
 	- "mediatek,mt8173-mmsys", "syscon"
 	- "mediatek,mt8183-mmsys", "syscon"
 	- "mediatek,mt8192-mmsys", "syscon"
+	- "mediatek,mt8195-vdosys0", "syscon"
+	- "mediatek,mt8195-vdosys1", "syscon"
 - #clock-cells: Must be 1
 
 For the clock control, the mmsys controller uses the common clk binding from
@@ -30,3 +32,16 @@ mmsys: syscon@14000000 {
 	reg = <0 0x14000000 0 0x1000>;
 	#clock-cells = <1>;
 };
+
+vdosys0: syscon@1c01a000 {
+	compatible = "mediatek,mt8195-vdosys0", "syscon";
+	reg = <0 0x1c01a000 0 0x1000>;
+	#clock-cells = <1>;
+};
+
+vdosys1: syscon@1c100000 {
+	compatible = "mediatek,mt8195-vdosys1", "syscon";
+	reg = <0 0x1c100000 0 0x1000>;
+	#clock-cells = <1>;
+};
+
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
