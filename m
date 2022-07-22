Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2019FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 07:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qo5ylaCxuzgKhJn9U7zXuJRczgF1D0UWplgFpZcY8eo=; b=XUdkKvCl5TsdeSlLXABSIVk9ZI
	IcK0UPPfPvcdRWGQwwQ4uqH8FKhZEQgvk24X24SH35bTvdkVQH0/29L3kPkElk4r/aLTZdcHoK8S3
	x5efAkIgPGON+B4vJPxGDgaI+XRJkdV3iTY8GzZ422lf2IE4ZjedcqQV3VXlbE++ofQQ5DKBn1EpO
	2dgu7SLrL/RmPLbLvh/WgdcmfxQpX+R0KYFxkarZmrFYzb8bUrMIQSCp8PdQHXO6p3wChGC4S4E6w
	2eXYAfAIavSkYWLVWtSVm77hoMMfRHjiN0YpI/GvZKrNpNtoJ6WRryhQBXI46k9jA9Vtu3EOF7BLF
	ElmCMe7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEmjn-000WSw-8s; Fri, 22 Jul 2022 07:06:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEmjl-000WR0-69; Fri, 22 Jul 2022 07:06:14 +0000
X-UUID: 3bd15ff120cf491fba0d5dfe1410048d-20220722
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:963b8dbb-fee5-43f5-9878-8998fb2f1bfc,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:25cc2dd8-5d6d-4eaf-a635-828a3ee48b7c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3bd15ff120cf491fba0d5dfe1410048d-20220722
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 486731696; Fri, 22 Jul 2022 00:06:05 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 22 Jul 2022 14:35:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 22 Jul 2022 14:35:31 +0800
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: <chinwen.chang@mediatek.com>, Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH] scripts: Fix no space expression between sp and offset
Date: Fri, 22 Jul 2022 14:35:28 +0800
Message-ID: <20220722063529.7166-1-Kuan-Ying.Lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_000613_247615_FB56007F 
X-CRM114-Status: GOOD (  10.66  )
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

When I use older version aarch64 objdump (2.24) to disassemble
aarch64 vmlinux, I get the result like below.
There is no space between sp and offset.

ffff800008010000 <dw_apb_ictl_handle_irq>:
ffff800008010000:       d503233f        hint    #0x19
ffff800008010004:       a9bc7bfd        stp     x29, x30, [sp,#-64]!
ffff800008010008:       90011e60        adrp    x0, ffff80000a3dc000 <num_ictlrs>
ffff80000801000c:       910003fd        mov     x29, sp
ffff800008010010:       a9025bf5        stp     x21, x22, [sp,#32]

When I use newer version aarch64 objdump (2.35), I get
the result like below.

ffff800008010000 <dw_apb_ictl_handle_irq>:
ffff800008010000:       d503233f        paciasp
ffff800008010004:       a9bc7bfd        stp     x29, x30, [sp, #-64]!
ffff800008010008:       90011e60        adrp    x0, ffff80000a3dc000 <num_ictlrs>
ffff80000801000c:       910003fd        mov     x29, sp
ffff800008010010:       a9025bf5        stp     x21, x22, [sp, #32]

Add no space support of regular expression for old version objdump.

Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
---
 scripts/checkstack.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
index d2c38584ece6..e404b6b11295 100755
--- a/scripts/checkstack.pl
+++ b/scripts/checkstack.pl
@@ -56,7 +56,7 @@ my (@stack, $re, $dre, $sub, $x, $xs, $funcre, $min_stack);
 	if ($arch =~ '^(aarch|arm)64$') {
 		#ffffffc0006325cc:       a9bb7bfd        stp     x29, x30, [sp, #-80]!
 		#a110:       d11643ff        sub     sp, sp, #0x590
-		$re = qr/^.*stp.*sp, \#-([0-9]{1,8})\]\!/o;
+		$re = qr/^.*stp.*sp, ?\#-([0-9]{1,8})\]\!/o;
 		$dre = qr/^.*sub.*sp, sp, #(0x$x{1,8})/o;
 	} elsif ($arch eq 'arm') {
 		#c0008ffc:	e24dd064	sub	sp, sp, #100	; 0x64
-- 
2.18.0


