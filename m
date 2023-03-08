Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67288C6FA99
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 02:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=13Wy0Ed++1zXh0KzmnLa4BZ0fSU9hMpfdWuFisECxUA=; b=Q7fYjbmby9tc3waKCNGtwVqDok
	Y+/Qk9S4bk565ktKrW9X4CDoX40BqfnoGK7/jASs3qdX5WkYbeNvSXqrdSuPEenBSk/IwyCbIQN9U
	d3pLRb/rkHC2Ix/D1lE626I0DmbOcWebkyCn6ETQYCz2RSMBK9PADidZlXy1CbVA2O3CQC8OvKkb1
	IR+HlIdiALSgyAt0DLdLke03YfF5mHZ48F0VZoMDLyL4DWbGTtVmT3+4Q2sKVOT8Vdk/+qhMTX/3c
	bepC3+W0VjZqqsTDvLV0e354EC4doGb4sB0bwNwi5BhJ7p6qnKpQ+kDTUKs0gxLtf/OhymfDGxQBY
	POnqDbuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZjak-003CqW-12; Wed, 08 Mar 2023 02:31:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZjah-003Cpz-Dt; Wed, 08 Mar 2023 02:31:44 +0000
X-UUID: 5922d828bd5911edbbe3f76fe852e059-20230307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=13Wy0Ed++1zXh0KzmnLa4BZ0fSU9hMpfdWuFisECxUA=;
	b=p9xVSjlu85X97VqmsUP1EoW0h7c+G3qBfxHAdOFe7FoOdXDWNvMtir6WIiFA4FeWwqVhTDZInK7b4JglgZ2KQS7y55qmgjH9csmxPv6Lr6skGBBAzAKXdxGs/no91MmloS0gswgAerheuZ5/vspbbNKSEgeCM94nELVWv8V6bu4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:88a5388e-0f9a-4836-954c-30883dc31d93,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:25b5999,CLOUDID:9046a927-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-UUID: 5922d828bd5911edbbe3f76fe852e059-20230307
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <haibo.li@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 841848256; Tue, 07 Mar 2023 19:31:36 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 8 Mar 2023 10:20:59 +0800
Received: from mszsdtlt102.gcn.mediatek.inc (10.16.4.142) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 8 Mar 2023 10:20:58 +0800
From: Haibo Li <haibo.li@mediatek.com>
To: Marco Elver <elver@google.com>
CC: Dmitry Vyukov <dvyukov@google.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <kasan-dev@googlegroups.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <xiaoming.yu@mediatek.com>,
	<haibo.li@mediatek.com>
Subject: [PATCH] kcsan:fix alignment_fault when read unaligned instrumented memory
Date: Wed, 8 Mar 2023 10:20:57 +0800
Message-ID: <20230308022057.151078-1-haibo.li@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_183143_502934_302D0393 
X-CRM114-Status: GOOD (  12.75  )
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

After enable kcsan on arm64+linux-5.15,it reports alignment_fault
when access unaligned address.
Here is the oops log:
"
Trying to unpack rootfs image as initramfs.....
Unable to handle kernel paging request at virtual address
  ffffff802a0d8d7171
Mem abort info:o:
  ESR = 0x9600002121
  EC = 0x25: DABT (current EL), IL = 32 bitsts
  SET = 0, FnV = 0 0
  EA = 0, S1PTW = 0 0
  FSC = 0x21: alignment fault
Data abort info:o:
  ISV = 0, ISS = 0x0000002121
  CM = 0, WnR = 0 0
swapper pgtable: 4k pages, 39-bit VAs, pgdp=000000002835200000
[ffffff802a0d8d71] pgd=180000005fbf9003, p4d=180000005fbf9003,
pud=180000005fbf9003, pmd=180000005fbe8003, pte=006800002a0d8707
Internal error: Oops: 96000021 [#1] PREEMPT SMP
Modules linked in:
CPU: 2 PID: 45 Comm: kworker/u8:2 Not tainted
  5.15.78-android13-8-g63561175bbda-dirty #1
...
pc : kcsan_setup_watchpoint+0x26c/0x6bc
lr : kcsan_setup_watchpoint+0x88/0x6bc
sp : ffffffc00ab4b7f0
x29: ffffffc00ab4b800 x28: ffffff80294fe588 x27: 0000000000000001
x26: 0000000000000019 x25: 0000000000000001 x24: ffffff80294fdb80
x23: 0000000000000000 x22: ffffffc00a70fb68 x21: ffffff802a0d8d71
x20: 0000000000000002 x19: 0000000000000000 x18: ffffffc00a9bd060
x17: 0000000000000001 x16: 0000000000000000 x15: ffffffc00a59f000
x14: 0000000000000001 x13: 0000000000000000 x12: ffffffc00a70faa0
x11: 00000000aaaaaaab x10: 0000000000000054 x9 : ffffffc00839adf8
x8 : ffffffc009b4cf00 x7 : 0000000000000000 x6 : 0000000000000007
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffffffc00a70fb70
x2 : 0005ff802a0d8d71 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 kcsan_setup_watchpoint+0x26c/0x6bc
 __tsan_read2+0x1f0/0x234
 inflate_fast+0x498/0x750
 zlib_inflate+0x1304/0x2384
 __gunzip+0x3a0/0x45c
 gunzip+0x20/0x30
 unpack_to_rootfs+0x2a8/0x3fc
 do_populate_rootfs+0xe8/0x11c
 async_run_entry_fn+0x58/0x1bc
 process_one_work+0x3ec/0x738
 worker_thread+0x4c4/0x838
 kthread+0x20c/0x258
 ret_from_fork+0x10/0x20
Code: b8bfc2a8 2a0803f7 14000007 d503249f (78bfc2a8) )
---[ end trace 613a943cb0a572b6 ]-----
"

After checking linux 6.3-rc1 on QEMU arm64,it still has the possibility
to read unaligned address in read_instrumented_memory(qemu can not
emulate alignment fault)

To fix alignment fault and read the value of instrumented memory
more effective,bypass the unaligned access in read_instrumented_memory.

Signed-off-by: Haibo Li <haibo.li@mediatek.com>
---
 kernel/kcsan/core.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/kcsan/core.c b/kernel/kcsan/core.c
index 54d077e1a2dc..88e75d7d85d2 100644
--- a/kernel/kcsan/core.c
+++ b/kernel/kcsan/core.c
@@ -337,6 +337,11 @@ static void delay_access(int type)
  */
 static __always_inline u64 read_instrumented_memory(const volatile void *ptr, size_t size)
 {
+	bool aligned_read = (size == 1) || IS_ALIGNED((unsigned long)ptr, size);
+
+	if (!aligned_read)
+		return 0;
+
 	switch (size) {
 	case 1:  return READ_ONCE(*(const u8 *)ptr);
 	case 2:  return READ_ONCE(*(const u16 *)ptr);
-- 
2.25.1


