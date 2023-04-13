Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C019C77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 07:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YaTPAzl/heZ+h8rUiiBKWDbrCg55o/k0t045jGrMKak=; b=UmylcUOecSd0qcNeTTf7leI1ln
	Kd7SHBrKb2v1aSoE3v9qhjrGTbjpctRVqjpUs7bD9fHfl7Dg2kvt/d3H7D6vJEpmVDYwx87o1DeL1
	UStcKDzaIU+mUK38oVJSIt6TqUNxha2ha65hG6ODEsNsijFE18djfupmmAfyWKsfmSc/6FYGwOKUw
	spYDD/Bfg9u2rAJXd0TecOMgZUNF2TqZuv1fijyQ6lXrNHI6J9QsU9/AEd8+bpd/k2VDsuAZWSuIH
	ttnX4ZoV2l5fBeiIVmmD/AFMYG/6+BDSez2CyNO6Du5N71jy789cBuVdIj+rj7hvZHnl54HUi6f2y
	YNX7F8eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmrTq-005IEM-2h;
	Thu, 13 Apr 2023 07:34:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmrTo-005IDL-1P;
	Thu, 13 Apr 2023 07:34:53 +0000
X-UUID: a73a5500d9cd11edb7d8d11f642b8e78-20230413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=YaTPAzl/heZ+h8rUiiBKWDbrCg55o/k0t045jGrMKak=;
	b=CeZatF4CNK5FW1Fpj7uBv4tQ0/9JuA2rBP/2JqPf+LbZBj7jNMhkZWrwrp4nAMBEKmRkP7cp0C+HXfpTQDLqlAs8TmFeFf6bzRHW69GpLGDFZVtRDXMqpfrxzBBCT9FvP0UafNKhMPstMDWGzioT4j5GIQFOzpAbDKCUHKOe14E=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:5a7f20ea-1f0b-4f37-af92-e2df01a8978d,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.22,REQID:5a7f20ea-1f0b-4f37-af92-e2df01a8978d,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:120426c,CLOUDID:fe5c31a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:230413153443Z5NTOWH1,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,CO
	L:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: a73a5500d9cd11edb7d8d11f642b8e78-20230413
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1199924236; Thu, 13 Apr 2023 00:34:41 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 13 Apr 2023 15:34:39 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Thu, 13 Apr 2023 15:34:38 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: Russell King <linux@armlinux.org.uk>, Linus Walleij
	<linus.walleij@linaro.org>, <amergnat@baylibre.com>,
	<linux-kernel@vger.kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Haibo Li <haibo.li@mediatek.com>,
	<xiaoming.yu@mediatek.com>, Russell King <rmk+kernel@armlinux.org.uk>, Alex
 Sverdlin <alexander.sverdlin@nokia.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<ardb@kernel.org>, <catalin.marinas@arm.com>, <a.anurag@samsung.com>
Subject: [PATCH v2] ARM:unwind:fix unwind abort for uleb128 case
Date: Thu, 13 Apr 2023 15:34:29 +0800
Message-ID: <20230413073429.40050-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_003452_625301_4690BA07 
X-CRM114-Status: GOOD (  15.81  )
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
---
v2:
- As Linus Walleij and Alexandre Mergnat suggested,add comments for unwind_decode_uleb128
- As Alexandre Mergnat suggested,change variables declaration in Alphabetical order
---
 arch/arm/kernel/unwind.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm/kernel/unwind.c b/arch/arm/kernel/unwind.c
index 53be7ea6181b..f37e55fcf81d 100644
--- a/arch/arm/kernel/unwind.c
+++ b/arch/arm/kernel/unwind.c
@@ -308,6 +308,29 @@ static int unwind_exec_pop_subset_r0_to_r3(struct unwind_ctrl_block *ctrl,
 	return URC_OK;
 }
 
+static unsigned long unwind_decode_uleb128(struct unwind_ctrl_block *ctrl)
+{
+	unsigned long bytes = 0;
+	unsigned long insn;
+	unsigned long result = 0;
+
+	/* unwind_get_byte() will advance ctrl one instruction at a time,
+	 * we loop until we get an instruction byte where bit 7 is not set.
+	 * Note:It decodes max 4 bytes to output 28bits data.
+	 * 28bits data(0xfffffff) covers vsp increments of 1073742336.
+	 * It is sufficent for unwinding stack.
+	 */
+	do {
+		insn = unwind_get_byte(ctrl);
+		result |= (insn & 0x7f) << (bytes * 7);
+		bytes++;
+		if (bytes == sizeof(result))
+			break;
+	} while (!!(insn & 0x80));
+
+	return result;
+}
+
 /*
  * Execute the current unwind instruction.
  */
@@ -361,7 +384,7 @@ static int unwind_exec_insn(struct unwind_ctrl_block *ctrl)
 		if (ret)
 			goto error;
 	} else if (insn == 0xb2) {
-		unsigned long uleb128 = unwind_get_byte(ctrl);
+		unsigned long uleb128 = unwind_decode_uleb128(ctrl);
 
 		ctrl->vrs[SP] += 0x204 + (uleb128 << 2);
 	} else {
-- 
2.25.1


