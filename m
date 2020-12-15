Return-Path: <SRS0=7Zfj=FT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244B2C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 12:12:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 940BF222B6
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Dec 2020 12:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 940BF222B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SVc16CYUubie8mSrEizhRQrVf7bDIwPKytSeIDQUgRc=; b=MEOqhO7xe9HvZM5QxyG6pnxoNt
	3OTeyIGqbO18/lwYpJNJGNOSxnNw5+g7R76SP+zRZyElLdb7gQoo5e+MYMvj6ibmHGkYs3WQTxmPV
	GWSsVaC9+ido7/xuXMoOmYNZqq3WU46LFx2IzMuSVqw1kzaBRupG8fg0AuD1zjAJfue2PQ391XI28
	jRovFNlZfWZGk6znabov6Sq1d4vRzgyA/RLAmV3yZ/VI8m+B1f6OOkemBZyHhYmzZ8bpEgSoO+g43
	5VrDc/svbp5shfqDftOJds2ARsnk5P7HssQ0R5a5BeMkrJbYbdtfQBKvsdB9nHqfM4M0t9+Taok1Z
	rjuRkuKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kp9Br-0002Em-5J; Tue, 15 Dec 2020 12:12:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kp9Bn-0002EG-QV
 for linux-mediatek@lists.infradead.org; Tue, 15 Dec 2020 12:12:25 +0000
X-UUID: 1561986884064b768404d2e7b26b1b92-20201215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=4pIHA2qbQ3jFn4gQRazum5bFNTkkeQfTiZUa4Lu1GFk=; 
 b=Qscfr0tFiH7nqfOHQ8Dw4eTChVMYnF9Qgnx65fjivUnMN6u3GNR2RLtiSGGtWPYpEWCxrPlfTqJd6ofDd/Y4DyoYav4m/1WjYH8MtkravUk1HC9Ov2g4k6vIQ6v6StR1iofWPIcG6tkIIUylG69tj7qWxUDpO/mJxUvfwn+ELSE=;
X-UUID: 1561986884064b768404d2e7b26b1b92-20201215
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yz.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 117763825; Tue, 15 Dec 2020 04:06:04 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Dec 2020 04:06:03 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Dec 2020 20:06:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 15 Dec 2020 20:06:01 +0800
From: <Yz.Wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] arm64: dts: mt8192: add efuse support for MT8192 SoC
Date: Tue, 15 Dec 2020 20:03:42 +0800
Message-ID: <20201215120342.25452-1-Yz.Wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: D8AD67AA2AD05C1B01D7EB649040817094B4E6F74317AEAA9BE8173548E37B8B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_071224_083056_B80DAE07 
X-CRM114-Status: UNSURE (   8.96  )
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
Cc: Ryan Wu <Yz.Wu@mediatek.com>, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Ryan Wu <Yz.Wu@mediatek.com>

to read Mediatek efuse

Change-Id: If6810b9ec594fcb72cd18c296736cc56109895bf
Signed-off-by: Ryan Wu <Yz.Wu@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 69d45c7b31f1..55a805a61428 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -422,6 +422,13 @@
 			#clock-cells = <1>;
 		};
 
+		efuse: efuse@11c10000 {
+			compatible = "mediatek,efuse";
+			reg = <0 0x11c10000 0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		i2c3: i2c3@11cb0000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11cb0000 0 0x1000>,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
