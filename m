Return-Path: <SRS0=W1mV=QC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 060F8C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 03:18:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CEC961A7F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Nov 2021 03:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CEC961A7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qm8zoHIvJ24EP3uOrSOzFY2vLsYq3ujLe9qFaKpiCuk=; b=23ZZNlLqqpvhB1
	Ev1XzzUYnViK9JQ7V5BxghZl3qeNtoR/Vbfheue1PRVZVj5QF2CWPVBYJWhZ4uaZlnbbkSHwn/VX3
	X0SPWxJZxgwiWB8k3xvWyss4Ut/hStOAGqZISfMM2EI7MwVYSVHfeRnpfKNIFtlc08NRY4wxPyqbh
	zXQZoqAD/r127ub9H0gFP8u2j7eHNEcB8vKoNER1Rn6VNopln9EU9WblFGZOUf6LoGmrnojkn9IgG
	jDZBix4cPAooJRTZnP2LV2ws56gYlCaMWajdzrJN1RJ0E/PW88RadQT5xRDK03pF9kV1nD8eb12R5
	dSrSOXl/AJaQLZjsOAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmSVv-00EIYN-6b; Mon, 15 Nov 2021 03:18:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmSVj-00EIWH-A8; Mon, 15 Nov 2021 03:18:24 +0000
X-UUID: aa8ff4371ff64212bf60f6a2e985f7e7-20211114
X-UUID: aa8ff4371ff64212bf60f6a2e985f7e7-20211114
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 124425356; Sun, 14 Nov 2021 20:18:18 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 14 Nov 2021 19:18:16 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 15 Nov 2021 11:18:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 15 Nov 2021 11:18:15 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <chinwen.chang@mediatek.com>, <nicholas.tang@mediatek.com>,
 <james.hsu@mediatek.com>, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] arm64: update compiler option for PAC
Date: Mon, 15 Nov 2021 11:18:08 +0800
Message-ID: <20211115031810.29701-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211114_191823_378450_B3E23DA6 
X-CRM114-Status: UNSURE (   9.56  )
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

We pass -mbranch-protection=pac-ret+leaf to support PAC
when we use GCC 9 or later.

Before GCC 9, we pass -msign-return-address=all to support
PAC.

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 Documentation/arm64/pointer-authentication.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/arm64/pointer-authentication.rst b/Documentation/arm64/pointer-authentication.rst
index f127666ea3a8..055d08b0d42d 100644
--- a/Documentation/arm64/pointer-authentication.rst
+++ b/Documentation/arm64/pointer-authentication.rst
@@ -54,8 +54,10 @@ virtual address size configured by the kernel. For example, with a
 virtual address size of 48, the PAC is 7 bits wide.
 
 Recent versions of GCC can compile code with APIAKey-based return
-address protection when passed the -msign-return-address option. This
-uses instructions in the HINT space (unless -march=armv8.3-a or higher
+address protection when passed compiler option as following.
+Pass -msign-return-address when we use GCC 7, 8.
+Pass -mbranch-protection when we use GCC 9 or later.
+This uses instructions in the HINT space (unless -march=armv8.3-a or higher
 is also passed), and such code can run on systems without the pointer
 authentication extension.
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
