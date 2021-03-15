Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08655C433E9
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 13:53:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A4AC64E89
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 13:53:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A4AC64E89
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4G6Nt7KwpatTdm1jzKFj8SnSc8j6Fr1C2vwcU3q0Siw=; b=dJ5vDu3GLsq+vdZ7cSZESb8RS
	sUD7wRN5Li/QruTZhg4/HxF7aiclnmCEh1vary/1ZzE6lfij/QHWSbkATjoQkfZqrYBjyGhWi/1j5
	FpL6sCJkl7AendjR9O5UK6oS3jLA+BtiKorZ4Y155JOmuo3vlvGw0KnSAs5ZQSD/HsrXjAZCVdqn5
	+gcxVjr/hRy/IdzuOcZ7YJ6JGCDCkaFg6/7sSPVvp65hluliBW2k+Yzy9bPOMV2g3p3zEenTTes6M
	TMlt2jAtTYq2wAf+mfKpSYB7hfB6gaJV2rzJ27iQyLs5mOZUCA3Q79sdbMkVr4eAVDTDS1pUKC9ld
	377UCkRCg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLnec-00G0bl-AE; Mon, 15 Mar 2021 13:53:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLneD-00FzcG-0o; Mon, 15 Mar 2021 13:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=XZ21YgNzPB5LImuKFR4cDltmVkdh1ZEDxYzQ4iclMDc=; b=HX/eRESKO+f9Amy32o/HrUvJF4
 Nb7eYv9w0+zrHbAtAWQWfxnJ2rTsdp46SduHopdunmZsoEa1K6/468bnMuDaabydLuzfVFsK+8LIi
 YPcFNFpCNk6imJ/pnpciVv6e0EC2+EnTcTI9wx8OW5bigqTCuV3b73PJGOTwF/oTIt2FmG0ZNm/G9
 krjB5KWLzkfOYHZiorC3ZYp73BXAjnojKA1ukUnON076FMTtNpZaqf7nL/30EQePvl3KYayNiuTBc
 Zh/QWYF6AXihEvwgTHWpylm6/G6TGB060hylpQcHCb6N7J5qBGnet2H62eVpwYnjl0jZy3ZfnSUmP
 cORbbLkA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLnKz-000EjJ-8G; Mon, 15 Mar 2021 13:33:16 +0000
X-UUID: c24c0b8180644591853223d821dc36ec-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=XZ21YgNzPB5LImuKFR4cDltmVkdh1ZEDxYzQ4iclMDc=; 
 b=Ju49V7yRBrVXo0T3gPbaMcPhnPOp2l0d5VkXZ42EWNZ/kZRmLYvrHE2ea3JiHmGqKy4IoVwTLmKlB6BsKMS/V6JtPJtqUSheHQL2lW/f+G44/ghQnfjk8H1x4EMueVMcCMb6L/h5E5JD6a8WHGLiKFNcEgGF8mmzd/hAE88JXiM=;
X-UUID: c24c0b8180644591853223d821dc36ec-20210315
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1073280037; Mon, 15 Mar 2021 05:30:48 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 06:30:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 21:30:44 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 15 Mar 2021 21:30:43 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>, Roger Lu
 <roger.lu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v12 5/7] dt-bindings: soc: mediatek: add mt8192 svs dt-bindings
Date: Mon, 15 Mar 2021 21:30:16 +0800
Message-ID: <20210315133018.4976-6-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210315133018.4976-1-roger.lu@mediatek.com>
References: <20210315133018.4976-1-roger.lu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 982E96737CD7DC355C6EE94DEDA94CA8253080F3AE7172726871ECD7ED7544BB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_133252_140688_A00903F5 
X-CRM114-Status: UNSURE (   8.14  )
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

Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/mtk-svs.yaml         | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
index 0d8d12f927de..ed113fe80fb6 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     enum:
       - mediatek,mt8183-svs
+      - mediatek,mt8192-svs
 
   reg:
     maxItems: 1
@@ -48,6 +49,13 @@ properties:
       - const: svs-calibration-data
       - const: t-calibration-data
 
+  resets:
+    maxItems: 1
+
+  reset-names:
+    items:
+      - const: svs_rst
+
 required:
   - compatible
   - reg
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
