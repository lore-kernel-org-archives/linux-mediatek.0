Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09BE1C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 07:14:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF82760F56
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 07:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CF82760F56
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vpwk/3GMZLqEbvrdtY2Kr/wAmxKsc5GhqsCgEVWxAPM=; b=WfpEfODvkN0y+x
	bhdYSdR++22Mx78yG54IjjSnmwl5OhGTM6c9P3hauGr0KbYpnXTfXPXpX1YlzvYG69oL05BBmmmWK
	+ikiZyqSj/t4Q5SbLQ5u5XzFzFYg5DZPc7MvyVmCOewkeVKXVC/eWRsyWRbnlj9VKnXTez8cPfxvP
	1KATLl6MG4spFXc63L84dI9PdhZAfaufn5KxJhMgttOIspAr97fCYP3oNtTt454om2veBoPD7oisv
	qg6EjOHcp3oXR2K45wlHOHH9enJkMX5VekAnMlVi1xJ1bXBvyV0FufKJZnStIrYdFcpHf5c82FRFP
	p/K/zvb5rqP9e9LRKjBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAocc-001O7G-Nf; Tue, 03 Aug 2021 07:13:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAocP-001O4o-TF; Tue, 03 Aug 2021 07:13:43 +0000
X-UUID: 06e73f6c106a48fb99700ad3d4f70834-20210803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cjyj0A//ulUCqmO3s8eZSFr3P8jVVkLVEgiwZnpuf3s=; 
 b=CTELDCpGZoWFl37lt5LD8i7eZuO1rADyW8HHVnlwd8rhW3SvQrBYjXIbCLdCQMxrZxeJBf6sN9MbtD4Oc9KdL5QnRXpWDgWlaUNn1bckRvbZYItCQy/6eIq7IwUVZl1FHIrXDNkv5U5181202aaHD8d5ZOPTrvnfx7qAQ9+vsIs=;
X-UUID: 06e73f6c106a48fb99700ad3d4f70834-20210803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yee.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1286905071; Tue, 03 Aug 2021 00:13:41 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 00:08:29 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 15:08:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 3 Aug 2021 15:08:27 +0800
From: <yee.lee@mediatek.com>
To: <linux-kernel@vger.kernel.org>
CC: <nicholas.Tang@mediatek.com>, <Kuan-Ying.lee@mediatek.com>,
 <chinwen.chang@mediatek.com>, Yee Lee <yee.lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v4 0/1] arm64/cpufeature: Support optionally disable MTE
Date: Tue, 3 Aug 2021 15:08:21 +0800
Message-ID: <20210803070824.7586-1-yee.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_001341_991650_118062C2 
X-CRM114-Status: GOOD (  10.02  )
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

From: Yee Lee <yee.lee@mediatek.com>

An option in runtime to disable MTE support is necessary for some
scenarios such as HW issue workaround, FW tests and 
some evaluation works in performance and resoruce costs.
 
This patch supoorts to override id-reg on the
shadow capability via comandline and suppress MTE feature.

SCTLR_EL1.ATA/ATA0 setting is moved to cpu_enable_mte()
since they are not allowed to be cache TLB.

All works in this patch turn off related software support,
but not fully disable MTE in HW side.

=== Test ===
QEMU5.2 + MTE

(1) normal boot
MTE feature is enabled and HW-tags KASAN works.

(2) passed "arm64.nomte" in cmdline
boot log:
..(skip)
[    0.000000] CPU features: SYS_ID_AA64PFR1_EL1[11:8]: forced to 0

====
Changed since v4:
 - Move ATA/ATA0 setting to cpu_enable_mte()

Changed since v3:
 - Add documentation text

Changed since v2:
 - Use id-reg override machanism to suppress feature.

Yee Lee (1):
  arm64/cpufeature: Optionally disable MTE via command-line

 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/include/asm/sysreg.h                 | 3 +--
 arch/arm64/kernel/cpufeature.c                  | 3 +++
 arch/arm64/kernel/idreg-override.c              | 2 ++
 4 files changed, 9 insertions(+), 2 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
