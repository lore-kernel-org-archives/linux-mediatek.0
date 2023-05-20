Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922C8C77B7D
	for <linux-mediatek@archiver.kernel.org>; Sat, 20 May 2023 18:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TZRR07+vctVM8WdxwVywanvArQDn3S9Ioav5/tEFdfU=; b=r2p0IIsCkPHBUPuARgeHADbxpd
	eqvqhyfcu6C0Y9X+MmzK6f/t7Wh845MnvbYrnec0H9jqSBPcoxnwL1j+JbGyeBUQZCx3DLBNf/Sjx
	7LIV5sj473R/68T2JvIUQmkQSz5oB0zR7YX4dlG6a3hNEJLEnZkyRNTHb4jvZAIOJW5O6Qxir9n7A
	6/g0T6WaOPlczLHSRkLhiMU7Ew6NNz73TCffocOjKYuZfFPE+6H2zAqtvhFBrB90FiEehoOloaZRr
	Ocq5LAEEj6l4b72co0CUX23t/7lDIksLa6z+zAnlQwdMg4vRUPECqxKvlv0236u2+u50wO66x7/yw
	+Fmofryw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0RFd-0022Q3-0n;
	Sat, 20 May 2023 18:24:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0RFY-0022Of-2w;
	Sat, 20 May 2023 18:24:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 68DEC60F88;
	Sat, 20 May 2023 18:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82660C4339B;
	Sat, 20 May 2023 18:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684607055;
	bh=PsdLhYUW2/2yOHPd/tsa7m1zstJtfVAA7v3QvF6juMM=;
	h=From:To:Cc:Subject:Date:From;
	b=YY+WaiNCbCo4oJ7hA7HVmHQOgxerSLjBy8WrJ4o90IQAnljZl31tR/LGB0B2u1rG3
	 MS9oBhAidLQuOEyhd9HVYNlfP1txj7ZoTqUeguwV3LcHZwO/ZOCs/n6XFh8i9zzFPi
	 HttYZMxDmvjiC3y+5mCuMxIjSDbik5YYrikmjtYMiU2eBtQfkcHv5WCu8IB2rWVHYs
	 W6yYAEChDs6DOebUEms2v8JTGTnekAm9xmseobZguwpo5JKDLFqqRSRC2bVeefv1vs
	 sq4byOYrUIDn2uN5n5hz/Dmi+IU1jAKn882+vu2q7tXNSiIz/iJzcd14oLAkGIVyA5
	 X7x4Qtfec7SyQ==
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
Subject: [PATCH AUTOSEL 4.19 1/5] ARM: 9295/1: unwind:fix unwind abort for uleb128 case
Date: Sat, 20 May 2023 14:24:05 -0400
Message-Id: <20230520182412.860973-1-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_112417_023540_4FF8EF46 
X-CRM114-Status: GOOD (  17.57  )
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


