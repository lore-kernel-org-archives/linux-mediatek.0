Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53DFC77B61
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Apr 2023 05:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Wdlz1937eg98NYAB81abic14zLCB/RzHOwbInQ9humY=; b=XyEgFCp/fFiftCaDkHTBmds1OW
	T4cNp7MUUO5szHdJ9t9jbjg8/SnxEiB6SGk7mU+XFA60792Bx6dZzfeuP4aMUZGLiOagEoSfvCxkJ
	ndbxsSWtHdxkuI+l+UV017/a8cSUIh7LbNVSO+kRUBDx8OvQpsZKGqA3frrodFKBqkOEfzQ1dxCpO
	6iy70J/ICg3jg1VNGF9+t+aZccFO6FrH+WnLM/W9h5Dwe9o8Rtb7lYPR/o1Er54ZsC0mPGmsZ0ZTK
	SkplCyRPT80i7nxWPIMNYOJpixH7+KrkKtLyCNsj4z1rXRpGGOmawNCQPebTfHnnIt+/eoBVUPyJp
	dVTCgXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pl12I-00BlIk-1v;
	Sat, 08 Apr 2023 05:22:50 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pl12G-00BlHx-1A;
	Sat, 08 Apr 2023 05:22:49 +0000
X-UUID: 5f812d96d5cd11edb7d8d11f642b8e78-20230407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Wdlz1937eg98NYAB81abic14zLCB/RzHOwbInQ9humY=;
	b=hvQJikB/1Nc8NvLlEUZJGrU4Wf/bXW/yOpA9LCkozheJr5PaNqhiMq/T/s33dgCivmbmoIyZTGk+s5dWU7lF8nzqJ4tDfHPS8Y+R+rjF6mzywjk1UdjRY2Nw6H6x1xQEV5mF3yqywN9y1A+mDN+xSydamZGgxv0sJbJ4KJTfFFA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:dbf071d3-2f50-45ac-b487-05337ea952ba,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:b7781ff8-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 5f812d96d5cd11edb7d8d11f642b8e78-20230407
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <tze-nan.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1489853927; Fri, 07 Apr 2023 22:22:36 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Sat, 8 Apr 2023 13:22:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Sat, 8 Apr 2023 13:22:34 +0800
From: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>
CC: <bobule.chang@mediatek.com>, <wsd_upstream@mediatek.com>,
	<Tze-nan.Wu@mediatek.com>, <stable@vger.kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] ring-buffer: Prevent inconsistent operation on cpu_buffer->resize_disabled
Date: Sat, 8 Apr 2023 13:22:26 +0800
Message-ID: <20230408052226.25268-1-Tze-nan.Wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_222248_547234_41C60534 
X-CRM114-Status: GOOD (  15.40  )
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

Sometimes, write to buffer_size_kb can be permanently failure if we change
the cpu_online_mask between two for_each_online_buffer_cpu loops in
function ring_buffer_reset_online_cpus.

The number of increasing and decreasing on cpu_buffer->resize_disable
may be inconsistent, leading the resize_disabled in some CPUs becoming
none zero after ring_buffer_reset_online_cpus return.

This issue can be reproduced by "echo 0 > trace" and hotplug cpu at the
same time. After reproducing succeess, we can find out the attempt to
write to buffer_size_kb node failure every time.

This patch prevent the inconsistent increasing and decreasing on
cpu_buffer->resize_disabled by copying the cpu_online_mask at the
beginning of the function.

But I wonder if there's any side-effect of this patch,
since the behavior changed, if we turn on a cpu between the two loops,
reset_disabled_cpu_buffer() of that cpu won't be run as before,
meaning the cpu_buffer on that cpu just awake will not be cleaned up.

Cc: stable@vger.kernel.org
Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
---
 kernel/trace/ring_buffer.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 76a2d91eecad..468f46bba71e 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -288,9 +288,6 @@ EXPORT_SYMBOL_GPL(ring_buffer_event_data);
 #define for_each_buffer_cpu(buffer, cpu)		\
 	for_each_cpu(cpu, buffer->cpumask)
 
-#define for_each_online_buffer_cpu(buffer, cpu)		\
-	for_each_cpu_and(cpu, buffer->cpumask, cpu_online_mask)
-
 #define TS_SHIFT	27
 #define TS_MASK		((1ULL << TS_SHIFT) - 1)
 #define TS_DELTA_TEST	(~TS_MASK)
@@ -5353,12 +5350,15 @@ EXPORT_SYMBOL_GPL(ring_buffer_reset_cpu);
 void ring_buffer_reset_online_cpus(struct trace_buffer *buffer)
 {
 	struct ring_buffer_per_cpu *cpu_buffer;
+	cpumask_var_t reset_online_mask;
 	int cpu;
 
 	/* prevent another thread from changing buffer sizes */
 	mutex_lock(&buffer->mutex);
 
-	for_each_online_buffer_cpu(buffer, cpu) {
+	cpumask_copy(reset_online_mask, cpu_online_mask);
+
+	for_each_cpu_and(cpu, buffer->cpumask, reset_online_mask) {
 		cpu_buffer = buffer->buffers[cpu];
 
 		atomic_inc(&cpu_buffer->resize_disabled);
@@ -5368,7 +5368,7 @@ void ring_buffer_reset_online_cpus(struct trace_buffer *buffer)
 	/* Make sure all commits have finished */
 	synchronize_rcu();
 
-	for_each_online_buffer_cpu(buffer, cpu) {
+	for_each_cpu_and(cpu, buffer->cpumask, reset_online_mask) {
 		cpu_buffer = buffer->buffers[cpu];
 
 		reset_disabled_cpu_buffer(cpu_buffer);
-- 
2.18.0


