Return-Path: <SRS0=UlKT=LY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A6FC11F69
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 05:18:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20F296127C
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jun 2021 05:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20F296127C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B+ZA54VX+txmSu/P1eLgiR2uQ+zvigtRw+4ofE92qgA=; b=kOiXnZVpmkNz8A
	vxOZDCe8cyCkbfBbiYEuwJydkkcYhNL3YTmFv4afAzrS5Ix375tUhWDGZaZ5vrvNxf88s0051YALM
	5KhcvVjh2NNLxTg+PW5si7bSIDxTCw8MCW7ont2BbJ8aOSVPRflxf05ezQIuDsQD0Xtk9XyMBAHIv
	MUHD8fkSuPEyUB5755uMPEDB3cdu4z/MloAtOfUTnV67D+XFgHkCfRsI/SGurAyyVr2dSD4I5uz6P
	03FKB7cDzn/v9cT4ATPawrVR1kbH+gHY7D5padvw3XCS16GjJMyfanxgNsXZIWiml2qMDI+nAcrOq
	oqipAJbKACDQCeGbkpgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyScS-00Cnsc-BF; Wed, 30 Jun 2021 05:18:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lySc3-00CnlC-M0; Wed, 30 Jun 2021 05:18:17 +0000
X-UUID: 3319d24a0b9247989ba56c6f1a763905-20210629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oy2prtR/qwpMMKsem3qlkhmH+gZJ19O+hO8jftLwtSw=; 
 b=ZjjxUq3DXloUGKhzjDijbPe29wxScEEQRf1e9BB2C384DONrrJKAuYKVJQDlFCLYgnwHXxBeZqgsGqz2zMx/VKJaFYoMX5w0L//bTQh1Epni12N3YLTwyqbdfNCtu5QVJ1L4CYYEqxgsEBUODjKI8jOJs0WzXuCEDVJoFDes7qQ=;
X-UUID: 3319d24a0b9247989ba56c6f1a763905-20210629
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 457766078; Tue, 29 Jun 2021 22:18:09 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Jun 2021 22:18:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Jun 2021 13:18:05 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 30 Jun 2021 13:18:05 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v1 1/5] dt-bindings: mailbox: add definition for mt8195
Date: Wed, 30 Jun 2021 13:14:14 +0800
Message-ID: <20210630051418.14044-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210630051418.14044-1-jason-jh.lin@mediatek.com>
References: <20210630051418.14044-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210629_221815_765068_45E72665 
X-CRM114-Status: GOOD (  11.87  )
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

Add definition of compatible, clock-names and
dt-binding header for mt8195.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
index 7771ecaac586..ea990d0ba822 100644
--- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
+++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
@@ -9,12 +9,12 @@ CMDQ driver uses mailbox framework for communication. Please refer to
 mailbox.txt for generic information about mailbox device-tree bindings.
 
 Required properties:
-- compatible: can be "mediatek,mt8173-gce", "mediatek,mt8183-gce" or
-  "mediatek,mt6779-gce".
+- compatible: can be "mediatek,mt8173-gce", "mediatek,mt8183-gce",
+  "mediatek,mt6779-gce" or "mediatek,mt8195-gce".
 - reg: Address range of the GCE unit
 - interrupts: The interrupt signal from the GCE block
 - clock: Clocks according to the common clock binding
-- clock-names: Must be "gce" to stand for GCE clock
+- clock-names: Must be "gce" or "gce1" to stand for GCE clock
 - #mbox-cells: Should be 2.
 	<&phandle channel priority>
 	phandle: Label name of a gce node.
@@ -36,8 +36,8 @@ Optional properties for a client device:
   size: the total size of register address that GCE can access.
 
 Some vaules of properties are defined in 'dt-bindings/gce/mt8173-gce.h',
-'dt-binding/gce/mt8183-gce.h' or 'dt-bindings/gce/mt6779-gce.h'. Such as
-sub-system ids, thread priority, event ids.
+'dt-binding/gce/mt8183-gce.h', 'dt-bindings/gce/mt6779-gce.h' or
+'dt-binding/gce/mt8195-gce.h'. Such as sub-system ids, thread priority, event ids.
 
 Example:
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
