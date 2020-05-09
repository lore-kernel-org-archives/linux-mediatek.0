Return-Path: <SRS0=UIhI=6X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89ADAC38A2A
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 02:11:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5725B218AC
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 02:11:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="udt7a7Xc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="P/v6ztqm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5725B218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ai7oRg2V3AwpyR2dxridBfNh37VNykcituZ6DoNHdFQ=; b=udt7a7Xcbk7TZU
	CrQyBe0NNf+z1A6JNvEyLLUAFCRGp5W5buAgnPb7BI8c045wSk1NfQ+PGGVHNH03f+hIwzGeUGZJ6
	4ve5+2LzBwrtcPexBCuUfz1ch2Exlr35VSilELGHG8JDMYVrhM7I9nlrgAhGXDbgHOfmS4gc3lslc
	xR2/Z7uPGWcoFAiPiykqI69HGT3BdyGsF7QUCBX4M7sh7NZxzhNSnlSq1h4v3bXhKNGs56BFrgoc3
	9BYNt4lxRHJ1Fmz55PqP4cmkM5SsF5rPydyM0HrkX1SkysfH3hmTnbM8ZaCX84i3tHNTvI/+kl7U/
	xPmkwTKxhKLHvKg9KTIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXExf-00040g-Qa; Sat, 09 May 2020 02:11:31 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXExW-0003s2-SX; Sat, 09 May 2020 02:11:24 +0000
X-UUID: 75704eff49934046887191641b39f049-20200508
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HTuAwQCBdXgvzm3xbEDiwOqzl1HXsQN9gZyGP3iYBws=; 
 b=P/v6ztqmbV0uHqZl/Zs6t2c63tZRJ1IhuEMWnccLwGGXLdBLBXfNjzwnI/XQuZjpzaNLDL6x634NfeYymu6D/g3R48VPYzj2VMlP9Ru+xhQE3CnSNiBvCHW3AgdQDzMHJxbdYSZz9Gu7pPKEMjLGdyoUkxTZOR9BfNGL31OJ3jQ=;
X-UUID: 75704eff49934046887191641b39f049-20200508
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <fengping.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 101874581; Fri, 08 May 2020 18:11:15 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 May 2020 19:10:43 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 10:10:40 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 9 May 2020 10:10:36 +0800
From: Fengping Yu <fengping.yu@mediatek.com>
To: Marco Felsch <m.felsch@pengutronix.de>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: [PATCH v6 3/3] configs: defconfig: Add CONFIG_KEYBOARD_MTK_KPD=y
Date: Sat, 9 May 2020 10:05:03 +0800
Message-ID: <20200509020458.8359-4-fengping.yu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200509020458.8359-1-fengping.yu@mediatek.com>
References: <20200509020458.8359-1-fengping.yu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CF2C098CE9B34A2263C5666380456D08079DD07514599DAB651C0E9BD794A0782000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200508_191122_928688_7A23872F 
X-CRM114-Status: UNSURE (   7.18  )
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
Cc: "fengping.yu" <fengping.yu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "fengping.yu" <fengping.yu@mediatek.com>

Add Mediatek matrix keypad support in defconfig.

Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7863352521e5..140c7a5832f7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -317,6 +317,7 @@ CONFIG_KEYBOARD_SNVS_PWRKEY=m
 CONFIG_KEYBOARD_IMX_SC_KEY=m
 CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_KEYBOARD_MTK_KPD=y
+# CONFIG_KEYBOARD_MTK_PMIC is not set
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_INPUT_MISC=y
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
