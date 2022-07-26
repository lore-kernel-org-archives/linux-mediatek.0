Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F90C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 03:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+iXdcAXjpQhkP8mOGiashF0qbPDGEo8HN3Ljtkp7288=; b=jCFr5hUjFRjpoC9BDVZboxsEK5
	MO6c/tD9zlr7pWxUAj3Y4WDWHY4CcjPqC+FrBGt/g9zBs6/OWy9nVtrozjUGw0NXZcvJmwcOxgDF8
	DzxfOU7zGRzQdITKoCX6HsWwJci2M99SQPniki1jZ/jEVRbIQcLUoiP0rA75hAsGX8qdiIonydEmi
	T/yKUYfnj/gT6bjxKUxpcOwo0/595ME1AI2T5qQNZY8Ie5mzuH+0t5QhP9v6JvcxJtlSniNcuzS5p
	sjh71AkQamYeR0uWYGl3k2HR9GgLcykyQY1qPbU8CUOpADMPmLIC5WeUPlbsCsG4o+gBCyAlHgAVT
	6OD2F5Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGAuf-0071SR-9X; Tue, 26 Jul 2022 03:07:13 +0000
Received: from mail-m121145.qiye.163.com ([115.236.121.145])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGAuL-0071JY-5w; Tue, 26 Jul 2022 03:06:55 +0000
Received: from amadeus-VLT-WX0.lan (unknown [113.118.189.34])
	by mail-m121145.qiye.163.com (Hmail) with ESMTPA id B41D9800089;
	Tue, 26 Jul 2022 11:06:49 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 1/3] dt-bindings: soc: update MT7623A power dt-bindings
Date: Tue, 26 Jul 2022 11:06:19 +0800
Message-Id: <20220726030621.7555-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTxpNVkoZGUgeS09DHktPSlUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKSFVKSkNVSkNCVUhPWVdZFhoPEhUdFFlBWU9LSFVKSEpCSE1VS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6KyI6Lxw6IT0rOE4MGUgNNx4u
	K0wwFBhVSlVKTU5DQ0tPQ0pLSENNVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	SFVKSkNVSkNCVUhPWVdZCAFZQUpCS0M3Bg++
X-HM-Tid: 0a823878b113b03akuuub41d9800089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_200653_386356_BA2E2C31 
X-CRM114-Status: UNSURE (   6.57  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add new power domains(VDEC/DISP/ISP/BDP)
for MT7623A from MT7623 side.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 include/dt-bindings/power/mt7623a-power.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/power/mt7623a-power.h b/include/dt-bindings/power/mt7623a-power.h
index 2544822aa76b..27d198e207b7 100644
--- a/include/dt-bindings/power/mt7623a-power.h
+++ b/include/dt-bindings/power/mt7623a-power.h
@@ -6,5 +6,9 @@
 #define MT7623A_POWER_DOMAIN_ETH	1
 #define MT7623A_POWER_DOMAIN_HIF	2
 #define MT7623A_POWER_DOMAIN_IFR_MSC	3
+#define MT7623A_POWER_DOMAIN_VDEC	4
+#define MT7623A_POWER_DOMAIN_DISP	5
+#define MT7623A_POWER_DOMAIN_ISP	6
+#define MT7623A_POWER_DOMAIN_BDP	7
 
 #endif /* _DT_BINDINGS_POWER_MT7623A_POWER_H */
-- 
2.25.1


