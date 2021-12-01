Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21231C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Dec 2021 03:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OAz9+zvbgGWOPfsB1i0GkFSaTlgp5yT/0n5x/cMrr2Q=; b=YIG8L+FESnIhbY
	xXt+Y2Fde3i2VPyv8yeuI5e3daZHqlSm2iCWb9oq1Bq0Y848rESLwNWlyxgP9KWYA/TgDduuW/uyv
	0NLZFAMgp+i0T2t3fjDquOZk69uCRwauJQwdb+mb5kHqHqgYke/mcfjDZc5l0aQAeo4TEasOA7N2c
	j77g+XxnbuQQFiktaiH7loBpe7QCoYnTzhvIgtC8mGBod/hBuFvIMcRE4iAxmyjvLTyuRBFeIjo8U
	YyWpdRoU30Nr3SNOXlwBRj+q4RSBqwD6A/7dakWsI1Fx7bc1ihAECVups6Jbs8DNIFZuDUQ/UwtWK
	v2V+uSqBvtFQfL/9a/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msGYB-007OAY-GY; Wed, 01 Dec 2021 03:44:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msGXw-007O8O-MY; Wed, 01 Dec 2021 03:44:43 +0000
X-UUID: d72c078652c24c75b258ce420ead0604-20211130
X-UUID: d72c078652c24c75b258ce420ead0604-20211130
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kuan-ying.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 876209291; Tue, 30 Nov 2021 20:44:33 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Nov 2021 19:41:01 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 1 Dec 2021 11:40:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Dec 2021 11:40:59 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Matthias Brugger <matthias.bgg@gmail.com>
CC: <chinwen.chang@mediatek.com>, <nicholas.tang@mediatek.com>,
 <james.hsu@mediatek.com>, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] arm64: update PAC description for kernel
Date: Wed, 1 Dec 2021 11:40:10 +0800
Message-ID: <20211201034014.20048-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_194440_766755_C690B9BB 
X-CRM114-Status: GOOD (  13.26  )
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

Remove the paragraph which has nothing to do with the kernel and
add PAC description related to kernel.

Suggested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
v1 -> v2:
  - Remove compiler option description
  - Add PAC description for kernel

 Documentation/arm64/pointer-authentication.rst | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/arm64/pointer-authentication.rst b/Documentation/arm64/pointer-authentication.rst
index f127666ea3a8..e5dad2e40aa8 100644
--- a/Documentation/arm64/pointer-authentication.rst
+++ b/Documentation/arm64/pointer-authentication.rst
@@ -53,11 +53,10 @@ The number of bits that the PAC occupies in a pointer is 55 minus the
 virtual address size configured by the kernel. For example, with a
 virtual address size of 48, the PAC is 7 bits wide.
 
-Recent versions of GCC can compile code with APIAKey-based return
-address protection when passed the -msign-return-address option. This
-uses instructions in the HINT space (unless -march=armv8.3-a or higher
-is also passed), and such code can run on systems without the pointer
-authentication extension.
+When ARM64_PTR_AUTH_KERNEL is selected, the kernel will be compiled
+with HINT space pointer authentication instructions protecting
+function returns. Kernels built with this option will work on hardware
+with or without pointer authentication support.
 
 In addition to exec(), keys can also be reinitialized to random values
 using the PR_PAC_RESET_KEYS prctl. A bitmask of PR_PAC_APIAKEY,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
