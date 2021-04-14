Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45876C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 07:19:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0799560FF0
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 07:19:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0799560FF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2jha+xAVAiwc81OloEngNK7O1iEJ0X8VzElLklc5yTw=; b=E+zbdzDXMeY0Guu0dJVBSsmty
	uujEpQHrZZUYZfUj/s3Hjv0g5zY4eTM68WFdWA5J4bSZRTYejBOsQatD4jqK07atbAFZZb39DQE5A
	Scp1u+Cggo/5oMrGj6uUIsPzNOjmV/rBR9GOj4Qm012rbopt2/em2tlKjt4U3Nb0utFZrouV3ljXa
	3edhJ1i4qCzRrTsSjZdVQ+MfvFDZFQF3Xjl1XfOhrrIbzTCkBXUlTiTZanDJoWZvM+wC1zXbUpbUO
	SRv/Eyaz9Yn0/eJ5SU1ZisBOR5LAuuLCekTN9gU/YAL0aVOx3uW0aKcJB4g4Bmyt2Epew0mpeZBje
	ih+gv/RHQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWZo6-00BoJh-5c; Wed, 14 Apr 2021 07:19:26 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWZnR-00BoCK-Oc; Wed, 14 Apr 2021 07:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=JgxD1co6oMB39XrYKObcH2kfvRdtmogu9Jkt8ZK/NwY=; b=DBCdDsHyw+NVCEu2S4BYmEbjES
 zbePXYP7Jg46oolEguTf4W1OYYzK+1VlTK8jpiGtNJK1wQf/UJEggzbQCznQf7sQmJShHzYHUxg9Y
 SRuip6xcI/guAzLgCy47OZXp8jZatiKqIFWocQpI+2d3pvyFthvLkj/wB27O2c1sUQMofy2/eaArK
 R7Y6FS5MFSoAl0wtt35VWwBeCY9VgMD6fh0WGiDtJieJJnc1A8RBCZRGNqiIgeMyneM+GwH0rSXol
 HXKwgwWNavTeajQeb1PItINVKvYTj2fzckvm5kEqf5mXla+76/m9TZq5FNJUS8CWxJNCjcf7wBWnN
 jlTeek3g==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWZnO-007Z5w-3C; Wed, 14 Apr 2021 07:18:44 +0000
X-UUID: 5be665a9cfd045f2a5faa3a1f5a7f8a5-20210414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JgxD1co6oMB39XrYKObcH2kfvRdtmogu9Jkt8ZK/NwY=; 
 b=I6nLxjvtKB8+PqzRazLiSN2Ra7bkAxEGFAkok7fZ42mIcdadQsbTMSxqsjGIzA4MtKSF+qorvInso+aYdZOnLonLmDlk1yp9EN8XT50cFb6qIgki45exNa3Wjf/vcnsfsqpL+6tufwHvR4qPu6EGBcsxJwzVNobCLftsv8WZVeY=;
X-UUID: 5be665a9cfd045f2a5faa3a1f5a7f8a5-20210414
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yz.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1250479367; Wed, 14 Apr 2021 00:18:37 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 00:18:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Apr 2021 15:18:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 14 Apr 2021 15:18:34 +0800
From: <Yz.Wu@mediatek.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Seiya Wang <seiya.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Ryan Wu <Yz.Wu@mediatek.com>
Subject: [PATCH v5 2/2] arm64: dts: mt8192: add eFuse support for MT8192 SoC
Date: Wed, 14 Apr 2021 15:17:49 +0800
Message-ID: <1618384669-30070-3-git-send-email-Yz.Wu@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1618384669-30070-1-git-send-email-Yz.Wu@mediatek.com>
References: <1618384669-30070-1-git-send-email-Yz.Wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_001842_159490_6A200372 
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

From: Ryan Wu <Yz.Wu@mediatek.com>

Add eFuse node to read Mediatek eFuse

Signed-off-by: Ryan Wu <Yz.Wu@mediatek.com>
---
This patch dependents on "arm64: dts: Add Mediatek SoC MT8192 and evaluation board dts and Makefile"[1]

mt8192.dtsi file is needed for this patch.
Please also accept this patch together with [1].

[1]http://lists.infradead.org/pipermail/linux-mediatek/2020-November/019378.html
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index 9757138..4d4e4de 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -436,6 +436,11 @@
 			status = "disable";
 		};
 
+		efuse: efuse@11c10000 {
+				compatible = "mediatek,mt8192-efuse",
+							 "mediatek,efuse";
+		};
+
 		i2c3: i2c3@11cb0000 {
 			compatible = "mediatek,mt8192-i2c";
 			reg = <0 0x11cb0000 0 0x1000>,
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
