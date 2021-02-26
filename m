Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E131C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:34:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C133564F13
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C133564F13
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RjaKXHDXr3Xi3VW2whBGprstbOU/iYr5DfnqAC2J7tw=; b=UKFymKbPKlI0G9DTV+MwvCmNyu
	UlMhYhMk1SYz+ELJYtzLV5JjbSuBHE5Ft11eekH7PaFiOTnsg2EGLIiPkXYyh5pE4OimM5qp30DX6
	9YfdCfnGZALfdswbjKO7XJsUEfDRHqLaGF2e+mwT6LyfE2ovSb2K0XOtcM0IVJBt3PTkoIaxAlwns
	d30Y9gVHz0MdHAuWvHyk/UDcMeO+cK7Sau9xYnrFqaI6mYR+QVvt6aTeAfLcGNmkdva0/gNM+Ydm4
	eczENVPz4mwgO/Pb3Y6UcNkUDOLeTEuOktbQuA72ztecw0AN5nHDPVZip6IxiXCrjQUMyUn1sjTf+
	yhNjMBDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFaS2-00038m-4n; Fri, 26 Feb 2021 10:34:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFaRs-00035P-AF; Fri, 26 Feb 2021 10:34:17 +0000
X-UUID: ad8823222145470abd788203bda62248-20210226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=eaZXWMj5Jr5fCCmSmKdtCCHLYavLPNBKkPfaZ+8Rllw=; 
 b=kXvSq9W8bAjASB3aefUfUlK2OJLfe34r6NtSvrp/7tFGiv7iO5+kmiULNhHDVSR8poY/RnPnN6wzGFfSb+b5o+od13Pn3XY4VLZYIVOMTHmC4jnUOTA4SA+SfK/lF/neOGHae+3l72Hnkye8mzYfG+luu3VTWjXsQkt3zf21nwg=;
X-UUID: ad8823222145470abd788203bda62248-20210226
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 358762837; Fri, 26 Feb 2021 02:34:08 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Feb 2021 02:34:06 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Feb 2021 18:33:52 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 26 Feb 2021 18:33:46 +0800
From: Mason Zhang <Mason.Zhang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 1/2] dt-binding: mediatek: mt6779: update spi document
Date: Fri, 26 Feb 2021 18:26:15 +0800
Message-ID: <20210226102614.9265-1-Mason.Zhang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_053416_648068_30B859AA 
X-CRM114-Status: UNSURE (   9.27  )
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
Cc: devicetree@vger.kernel.org, mtk22786 <Mason.Zhang@mediatek.com>,
 wsd_upstream@mediatek.com, hanks.chen@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: mtk22786 <Mason.Zhang@mediatek.com>

this patch update spi document for MT6779 SOC.

Signed-off-by: Mason Zhang <Mason.Zhang@mediatek.com>
---
 Documentation/devicetree/bindings/spi/spi-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt b/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
index 9e43721fa7d6..7bae7eef26c7 100644
--- a/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
+++ b/Documentation/devicetree/bindings/spi/spi-mt65xx.txt
@@ -13,6 +13,7 @@ Required properties:
     - mediatek,mt8183-spi: for mt8183 platforms
     - "mediatek,mt8192-spi", "mediatek,mt6765-spi": for mt8192 platforms
     - "mediatek,mt8516-spi", "mediatek,mt2712-spi": for mt8516 platforms
+    - "mediatek,mt6779-spi", "mediatek,mt6765-spi": for mt6779 platforms
 
 - #address-cells: should be 1.
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
