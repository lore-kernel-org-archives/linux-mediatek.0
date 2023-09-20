Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0453CE79AD
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Sep 2023 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5pQDPEILnfYhssOsspJi/HLClnlTJNhu9qnEQV02GWs=; b=3zue32gKuDIQsodV/7aVTp8E6N
	mYHeRcAWLYDMwnvwLhY7Bc+/+gL8K4CCtiQcKR9849Mi3A5DbT0S5MibS5kWKeiszuqa/FiXAzZqF
	9D3B37Fm7P6F1tst4fyJ1IUgSZsG+x4Q27IGa3lFSjPzOCAYFll9HqMca5SU4phfln4tcjwYuVDYv
	QESONfhO45d/1x+m51R9/2T3tn/M7Gp+kSXHeJPnNCKEyHeS1aCzLPIj+gXqCHSwJbn3zFAw8rvg9
	9+eSgbIFDiHBYPsLR7gqE/yMfl4GaqqgYHbgRfvy3MV695Cba0Rc5MpUmJyKJkwp9Nc+6D7SuRKzW
	YLhvkWmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiskM-002J5i-1S;
	Wed, 20 Sep 2023 08:39:46 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiskK-002J3X-1c;
	Wed, 20 Sep 2023 08:39:45 +0000
X-UUID: 3aab5636579111ee86758d4a7c00f3a0-20230920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5pQDPEILnfYhssOsspJi/HLClnlTJNhu9qnEQV02GWs=;
	b=oLUo7Nu0uMHgaf3PZuCl2KH8qGUaFGgEnKO2uxlW+pr5vFLEY3AV6pr6cAHKiPQaks/hhDvt14d27i4nBvSBgw/EXZ9N53muzDONKiTY6cpE5fmmc0G3qrsXDu50q7yJOP9IflyxEqWukgnvCBHb9TCHGrz73+O5n1W2xcghfHo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:6fa3abda-1670-428b-99e3-1439f4fa89f5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:03dd3ec3-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 3aab5636579111ee86758d4a7c00f3a0-20230920
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <mark-pk.tsai@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1928650118; Wed, 20 Sep 2023 01:39:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 20 Sep 2023 16:39:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 20 Sep 2023 16:39:27 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Russell King <linux@armlinux.org.uk>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <yj.chiang@mediatek.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] ARM: vfp: Add vudot opcode to VFP undef hook
Date: Wed, 20 Sep 2023 16:39:00 +0800
Message-ID: <20230920083907.30479-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--3.013800-8.000000
X-TMASE-MatchedRID: 9DomuZeNnSa1sMSHsUAj4Lxk3OaETqHeKx5ICGp/WtFLgo8+IIHbcEgC
	lCIX2gewg3p00t6s280nwBB3NtvSKQEzlKcqjzGcA9lly13c/gFU3K6aV1ad7RHfiujuTbedT3R
	jcc0BoKjdgHbDOFCwFL1w52Nz/jeVZz86fqAj7POeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8jfhP
	1xgyx3DMuPepAhR43rmVA2Qontecaf28qhBpYtbAX124h0O/fVGc/R3xyaMvvxWfARh0eB/EG7F
	afXxneqCAvSFapN290+5hawsd+EhY6H7DI0GsVcMmI24qiENwrMpIbcl3IoA+q1XYAYw09qIdY9
	jOi4lTI=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.013800-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 930D6D5A1FDBC23AA7D97CE0F6C28E4A3DDDD614DD17B445283A19010B18C6642000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_013944_545950_545ECD3F 
X-CRM114-Status: GOOD (  12.22  )
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

Add vudot opcode to the VFP undef hook to fix the
potentially undefined instruction error when the
user space executes vudot instruction.

Before this commit, kernel didn't handle the undef exception
caused by vudot and didn't enable VFP in lazy VFP context
switch code like other NEON instructions.
This led to the occurrence of the undefined instruction
error as following:

[  250.741238 ] 0904 (26902): undefined instruction: pc=004014ec
...
[  250.741287 ] PC is at 0x4014ec
[  250.741298 ] LR is at 0xb677874f
[  250.741303 ] pc : [<004014ec>]    lr : [<b677874f>]    psr: 80070010
[  250.741309 ] sp : beffedb0  ip : b67d7864  fp : beffee58
[  250.741314 ] r10: 00000000  r9 : 00000000  r8 : 00000000
[  250.741319 ] r7 : 00000001  r6 : 00000001  r5 : beffee90  r4 : 00401470
[  250.741324 ] r3 : beffee20  r2 : beffee30  r1 : beffee40  r0 : 004003a8
[  250.741331 ] Flags: Nzcv  IRQs on  FIQs on  Mode USER_32  ISA ARM Segment user
[  250.741339 ] Control: 10c5383d  Table: 32d0406a  DAC: 00000055
[  250.741348 ] Code: f4434aef f4610aef f4622aef f4634aef (fc620df4)

Below is the assembly of the user program:

0x4014dc <+108>: vst1.64 {d20, d21}, [r3:128]
0x4014e0 <+112>: vld1.64 {d16, d17}, [r1:128]
0x4014e4 <+116>: vld1.64 {d18, d19}, [r2:128]
0x4014e8 <+120>: vld1.64 {d20, d21}, [r3:128] --> switch out
0x4014ec <+124>: vudot.u8 q8, q9, q10         <-- switch in, and FPEXC.EN = 0
                                                  SIGILL(illegal instruction)

Link: https://services.arm.com/support/s/case/5004L00000XsOjP
Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 arch/arm/vfp/vfpmodule.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/vfp/vfpmodule.c b/arch/arm/vfp/vfpmodule.c
index 7e8773a2d99d..7eab8d1019d2 100644
--- a/arch/arm/vfp/vfpmodule.c
+++ b/arch/arm/vfp/vfpmodule.c
@@ -788,6 +788,12 @@ static struct undef_hook neon_support_hook[] = {{
 	.cpsr_mask	= PSR_T_BIT,
 	.cpsr_val	= 0,
 	.fn		= vfp_support_entry,
+}, {
+	.instr_mask	= 0xffb00000,
+	.instr_val	= 0xfc200000,
+	.cpsr_mask	= PSR_T_BIT,
+	.cpsr_val	= 0,
+	.fn		= vfp_support_entry,
 }, {
 	.instr_mask	= 0xef000000,
 	.instr_val	= 0xef000000,
@@ -800,6 +806,12 @@ static struct undef_hook neon_support_hook[] = {{
 	.cpsr_mask	= PSR_T_BIT,
 	.cpsr_val	= PSR_T_BIT,
 	.fn		= vfp_support_entry,
+}, {
+	.instr_mask	= 0xffb00000,
+	.instr_val	= 0xfc200000,
+	.cpsr_mask	= PSR_T_BIT,
+	.cpsr_val	= PSR_T_BIT,
+	.fn		= vfp_support_entry,
 }};
 
 static struct undef_hook vfp_support_hook = {
-- 
2.18.0


