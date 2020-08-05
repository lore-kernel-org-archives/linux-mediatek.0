Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7853C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 10:53:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A73462173E
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 10:53:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LGvVftSf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CwMdNAXH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A73462173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9Q6Idu5rinqkb+DiWsY4ZsgQpbSorlNJE4q0IWpdvuo=; b=LGvVftSfiGoDH/NoZV44Br3Zs
	n8lEstoh1BNPQMfsyDvx4Stxs38csISCB+/cTxVR/DayptfADGRZHVvGyq0wbTGTUifejfmTPAu7f
	ZgzVw249fFcttb2NvuAFIViGMDTZ63PKx2BoIioXwo7ehwVct1npQa3WeNYjUd01AT4lcO2wmGskD
	4J+pMNurRrBqk6ssBszSpavzZ2SSbVVFr3YmNGDyRbZ7S3N+WyUhV2HBITcxx9xEOiQ0KgrZcbpdB
	8QxHhEtw5UhlJX70MerAOCbnhz5ZhWR9zKp5wTgFE9api+/pLyJVcFORDoeqbfu4Xwnlx39Mh9xtz
	lz0hT5Tnw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3H3E-00020l-NB; Wed, 05 Aug 2020 10:53:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3H33-0001vo-Bz; Wed, 05 Aug 2020 10:53:31 +0000
X-UUID: ff43801dbdc2486d8cb694bf8bcc2c6d-20200805
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=rgglf6GVKnv1Jkvp64Ht2UoQ1fYb0dBQwks3oFNLEHQ=; 
 b=CwMdNAXHypaiPgbzk0HdMEaZbUntKlPxOeopJwJQ9VZCsuS8KH1SPvpAt+UzKy0KhkGg3ov/ssOCSJVknV5TDiF11FkEsYN4UUaADFOEWqk1IIFSABa4atRhzY5kypeSUz+WpvgcEZB6wC6KYtPjU4AfHSrJzdJV7uZ7C039WG4=;
X-UUID: ff43801dbdc2486d8cb694bf8bcc2c6d-20200805
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2080159800; Wed, 05 Aug 2020 02:53:36 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Aug 2020 03:53:19 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 5 Aug 2020 18:53:18 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 5 Aug 2020 18:53:19 +0800
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
Subject: [PATCH v3 3/4] dt-bindings: i2c: update bindings for MT8192 SoC
Date: Wed, 5 Aug 2020 18:52:21 +0800
Message-ID: <1596624742-14727-4-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1596624742-14727-1-git-send-email-qii.wang@mediatek.com>
References: <1596624742-14727-1-git-send-email-qii.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_065329_636191_E8F31868 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: devicetree@vger.kernel.org, qii.wang@mediatek.com,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a DT binding documentation for the MT8192 soc.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Qii Wang <qii.wang@mediatek.com>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
index 88b71c1..7f0194f 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
@@ -14,6 +14,7 @@ Required properties:
       "mediatek,mt7629-i2c", "mediatek,mt2712-i2c": for MediaTek MT7629
       "mediatek,mt8173-i2c": for MediaTek MT8173
       "mediatek,mt8183-i2c": for MediaTek MT8183
+      "mediatek,mt8192-i2c": for MediaTek MT8192
       "mediatek,mt8516-i2c", "mediatek,mt2712-i2c": for MediaTek MT8516
   - reg: physical base address of the controller and dma base, length of memory
     mapped region.
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
