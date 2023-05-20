Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC6EC7EE2D
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 May 2023 18:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TZRR07+vctVM8WdxwVywanvArQDn3S9Ioav5/tEFdfU=; b=SKmtlD5MZ4yeKSHc0TzkCCHk77
	79LUpuKrhWWt5J5e5QT6yhGkgTyLT3N7VdjFcYXGlbUCTf+ZQs1Diw1ltRa06/q7fg0WNyEQM/v26
	3WRUo1dhZ1Ehc+kDZifGvk+jLeczhK/YG3QQX6ddFLI6aR+SOxmnMHOYYiP4P4Ln0aoErIb5EjjdA
	BK1E6ejIgNG7yp/BTae09clOm31WutSYE6HgkS3Xru+IaB/bt5yuWc7itEo66+antL12ZVNRNAipI
	CAyFc9z6yGNsTf/A6UaZaiikVln2ItmvhM1blVBZLI8UsSs5aawK8N4P/OXsTiwYOUJSd0H9e6+8H
	OijOFI1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0RFw-0022Yi-12;
	Sat, 20 May 2023 18:24:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0RFs-0022Ww-2g;
	Sat, 20 May 2023 18:24:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 67DAA60F38;
	Sat, 20 May 2023 18:24:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DEA5C433A8;
	Sat, 20 May 2023 18:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684607075;
	bh=PsdLhYUW2/2yOHPd/tsa7m1zstJtfVAA7v3QvF6juMM=;
	h=From:To:Cc:Subject:Date:From;
	b=gaX70WFj3qSo53kBkcs9wVrxESrOO6qPQay5z917wwLGcfqFsx/p5PsC3fFJTx6Bz
	 eHG28YpCZ2koaSHF1YCQ7dOV4am/6u2j/g5wRb3nX/21MgveTU2tgDaXcryslvFnke
	 F/9tnwaug3R2Z3FaH7lc8x9lgpFvNGt5EU9dlohWcc4hV6sJfeAtcdnstrbZRxuiL/
	 W69wZwDZ4CiZL1Kh52pHKFr7jU6bczW4/cS4lPQx50ccN10u+pI2ypNIwOGRhbqhGw
	 00PdnSixHNwG3TqgcQcfUZ6k5zhgu6ob6SNzhUxeJzwL/lYw6CER2WnKYXwXxCpEDz
	 VY/XI/7KmcTnA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Haibo Li <haibo.li@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Russell King <rmk+kernel@armlinux.org.uk>,
	Sasha Levin <sashal@kernel.org>,
	linux@armlinux.org.uk,
	matthias.bgg@gmail.com,
	alexander.sverdlin@nokia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 4.14 1/4] ARM: 9295/1: unwind:fix unwind abort for uleb128 case
Date: Sat, 20 May 2023 14:24:26 -0400
Message-Id: <20230520182432.866012-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_112436_951341_23D1051E 
X-CRM114-Status: GOOD (  17.37  )
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

From: Haibo Li <haibo.li@mediatek.com>

[ Upstream commit fa3eeb638de0c1a9d2d860e5b48259facdd65176 ]

When unwind instruction is 0xb2,the subsequent instructions
are uleb128 bytes.
For now,it uses only the first uleb128 byte in code.

For vsp increments of 0x204~0x400,use one uleb128 byte like below:
0xc06a00e4 <unwind_test_work>: 0x80b27fac
  Compact model index: 0
  0xb2 0x7f vsp = vsp + 1024
  0xac      pop {r4, r5, r6, r7, r8, r14}

For vsp increments larger than 0x400,use two uleb128 bytes like below:
0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c
  Compact model index: 1
  0xb2 0x81 0x01 vsp = vsp + 1032
  0xac      pop {r4, r5, r6, r7, r8, r14}
The unwind works well since the decoded uleb128 byte is also 0x81.

For vsp increments larger than 0x600,use two uleb128 bytes like below:
0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c
  Compact model index: 1
  0xb2 0x81 0x02 vsp = vsp + 1544
  0xac      pop {r4, r5, r6, r7, r8, r14}
In this case,the decoded uleb128 result is 0x101(vsp=0x204+(0x101<<2)).
While the uleb128 used in code is 0x81(vsp=0x204+(0x81<<2)).
The unwind aborts at this frame since it gets incorrect vsp.

To fix this,add uleb128 decode to cover all the above case.

Signed-off-by: Haibo Li <haibo.li@mediatek.com>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/kernel/unwind.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm/kernel/unwind.c b/arch/arm/kernel/unwind.c
index 314cfb232a635..f2bb090373c67 100644
--- a/arch/arm/kernel/unwind.c
+++ b/arch/arm/kernel/unwind.c
@@ -313,6 +313,29 @@ static int unwind_exec_pop_subset_r0_to_r3(struct unwind_ctrl_block *ctrl,
 	return URC_OK;
 }
 
+static unsigned long unwind_decode_uleb128(struct unwind_ctrl_block *ctrl)
+{
+	unsigned long bytes = 0;
+	unsigned long insn;
+	unsigned long result = 0;
+
+	/*
+	 * unwind_get_byte() will advance `ctrl` one instruction at a time, so
+	 * loop until we get an instruction byte where bit 7 is not set.
+	 *
+	 * Note: This decodes a maximum of 4 bytes to output 28 bits data where
+	 * max is 0xfffffff: that will cover a vsp increment of 1073742336, hence
+	 * it is sufficient for unwinding the stack.
+	 */
+	do {
+		insn = unwind_get_byte(ctrl);
+		result |= (insn & 0x7f) << (bytes * 7);
+		bytes++;
+	} while (!!(insn & 0x80) && (bytes != sizeof(result)));
+
+	return result;
+}
+
 /*
  * Execute the current unwind instruction.
  */
@@ -366,7 +389,7 @@ static int unwind_exec_insn(struct unwind_ctrl_block *ctrl)
 		if (ret)
 			goto error;
 	} else if (insn == 0xb2) {
-		unsigned long uleb128 = unwind_get_byte(ctrl);
+		unsigned long uleb128 = unwind_decode_uleb128(ctrl);
 
 		ctrl->vrs[SP] += 0x204 + (uleb128 << 2);
 	} else {
-- 
2.39.2


