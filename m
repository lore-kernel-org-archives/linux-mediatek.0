Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248A9C76196
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 03:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rKK8gfPQSiSzT2PbEWUauzLFSX/mIJo3ZK6c1RroMIU=; b=KJj6t7aPb259rAR9ydjnVqb7SA
	fjkoPgqNXpaqtJ2S6PSKJNNTNKpM6WDH1QUQdh1H/BjzeWBO4iSnHwyd1a6MdyU+MFKxbAw/gy4g7
	3/74cOVZdyM/P8bdaMvKXuLtk5yLAmmiSX0bRiQb2YQlQdP4Mdf4oFJMEbpDKO6s4JsN6rjkEGsMF
	Y/Dn5NocHnbTnH6MBoKrRvgnpaNiRylgD+BTer/f2YPPaikvBe4JnCHMqBDJTQHGGdCMkkijYmzWt
	QsKY1VsgLWiXUumdHupUJE2jfYBp0kh8tcOONp/F7T7xu31XfBSI0CKEEyGhd/V3DPTKMysi2tqos
	gtDaNz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkcrO-0095Q6-29;
	Fri, 07 Apr 2023 03:33:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkcrM-0095PS-2K;
	Fri, 07 Apr 2023 03:33:58 +0000
X-UUID: 02479aeed4f511ed8687db9d93187ff1-20230406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rKK8gfPQSiSzT2PbEWUauzLFSX/mIJo3ZK6c1RroMIU=;
	b=vAXCt97BToUHUHD3cvPgWfE3/yAqZ4hNaWJWa+IvqEFBI1FBBPi1DULYZ1XKol3eb60U/zaciJeswfjFQrxbGqkyNddqL376FG6EmdaVrpf+9FQsLwnF84NT6w1DUrNJTLz8V21Cr2xXNTK26MlUh6JWS04U5buzkqwm4Ac1u74=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:2a27002e-1472-4c4a-9a7a-edd3986281c5,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.22,REQID:2a27002e-1472-4c4a-9a7a-edd3986281c5,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:120426c,CLOUDID:1a1806f8-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:230407113347AOKI9KG9,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:nil,Bulk:40,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 02479aeed4f511ed8687db9d93187ff1-20230406
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 841785645; Thu, 06 Apr 2023 20:33:48 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 7 Apr 2023 11:33:43 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 7 Apr 2023 11:33:43 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: Russell King <linux@armlinux.org.uk>, <linux-kernel@vger.kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Haibo Li <haibo.li@mediatek.com>,
	<xiaoming.yu@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Russell
 King <rmk+kernel@armlinux.org.uk>, Alex Sverdlin
	<alexander.sverdlin@nokia.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] ARM:unwind:fix unwind abort for uleb128 case
Date: Fri, 7 Apr 2023 11:33:41 +0800
Message-ID: <20230407033341.5139-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_203356_764361_AB445CA5 
X-CRM114-Status: GOOD (  14.68  )
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
 arch/arm/kernel/unwind.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/unwind.c b/arch/arm/kernel/unwind.c
index 53be7ea6181b..e5796a5acba1 100644
--- a/arch/arm/kernel/unwind.c
+++ b/arch/arm/kernel/unwind.c
@@ -20,7 +20,6 @@
 #warning    Change compiler or disable ARM_UNWIND option.
 #endif
 #endif /* __CHECKER__ */
-
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/export.h>
@@ -308,6 +307,22 @@ static int unwind_exec_pop_subset_r0_to_r3(struct unwind_ctrl_block *ctrl,
 	return URC_OK;
 }
 
+static unsigned long unwind_decode_uleb128(struct unwind_ctrl_block *ctrl)
+{
+	unsigned long result = 0;
+	unsigned long insn;
+	unsigned long bytes = 0;
+
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
 /*
  * Execute the current unwind instruction.
  */
@@ -361,7 +376,7 @@ static int unwind_exec_insn(struct unwind_ctrl_block *ctrl)
 		if (ret)
 			goto error;
 	} else if (insn == 0xb2) {
-		unsigned long uleb128 = unwind_get_byte(ctrl);
+		unsigned long uleb128 = unwind_decode_uleb128(ctrl);
 
 		ctrl->vrs[SP] += 0x204 + (uleb128 << 2);
 	} else {
-- 
2.25.1


