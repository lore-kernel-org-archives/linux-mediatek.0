Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02739C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QP7sQjwZzKXI0b464YWLSZqML8grLgd1UX3dg7K3rSA=; b=S08xD2NhmRNEdgYqrP/pnp4b24
	ufO6wtOuV3YbfL6NwQ/4E4SGyUFfYnYoBtwcwdBbWFhK7ptEQGyk94WxqQLsvSJu/kD/JW4cV1qWu
	mwg8WRLrcvNolqN8tUTAWLDiqpE4X2Dcy7PBQbRSUFsSyWHdDsRlScRqGb2tH2bccAXB2VU1he4BO
	faUuaZgKtmiKhf2qAao8rsQLLd9OnorFaJyaE2ho9+DylZHJob5LlLVN7ELp8GGEqQpzdhxb9JHhF
	3MA3U4DffPiAN7g8VImHYmGKB61SNwbOqRKwcMVqRvMwPkRCmqRUunKUTmxx0WDxoEEt/eHkgwc9G
	03Hc4JTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYay-002n89-1O;
	Wed, 12 Apr 2023 11:25:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYav-002n7H-1m;
	Wed, 12 Apr 2023 11:24:59 +0000
X-UUID: a1fd8d04d92411ed8687db9d93187ff1-20230412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QP7sQjwZzKXI0b464YWLSZqML8grLgd1UX3dg7K3rSA=;
	b=QgezrJLGrXlXX/1TvSBmalnHr1z23JCPcE6nXNPDzDumPGVvmBymdwaX/VY3FHSV1XDXcQ58DfyjfdqVQFBzKaV5jYdkdPfK/vNTEasXbZaxTNvUndgxiRjVVJNq0n2xZG/Iv1BVqCGRLc0xEvw44nE09OIZmDVcrl1wMpBlK98=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:15ce2ae4-1e35-422f-8454-21f8c061fb4c,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.22,REQID:15ce2ae4-1e35-422f-8454-21f8c061fb4c,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:120426c,CLOUDID:a65618a1-8fcb-430b-954a-ba3f00fa94a5,B
	ulkID:2304121924148FJCQDB8,BulkQuantity:1,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: a1fd8d04d92411ed8687db9d93187ff1-20230412
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <tze-nan.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1168751615; Wed, 12 Apr 2023 04:24:47 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Wed, 12 Apr 2023 19:24:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Wed, 12 Apr 2023 19:24:10 +0800
From: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>
CC: <bobule.chang@mediatek.com>, <wsd_upstream@mediatek.com>,
	<Tze-nan.Wu@mediatek.com>, <cheng-jui.wang@mediatek.com>,
	<npiggin@gmail.com>, <stable@vger.kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, "Paul E. McKenney"
	<paulmck@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-trace-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Subject: [PATCH v4] ring-buffer: Ensure proper resetting of atomic variables in ring_buffer_reset_online_cpus
Date: Wed, 12 Apr 2023 19:23:56 +0800
Message-ID: <20230412112401.25081-1-Tze-nan.Wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042457_599389_E64A983D 
X-CRM114-Status: GOOD (  16.59  )
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

In ring_buffer_reset_online_cpus, the buffer_size_kb write operation
may permanently fail if the cpu_online_mask changes between two
for_each_online_buffer_cpu loops. The number of increases and decreases
on both cpu_buffer->resize_disabled and cpu_buffer->record_disabled may be
inconsistent, causing some CPUs to have non-zero values for these atomic
variables after the function returns.

This issue can be reproduced by "echo 0 > trace" while hotplugging cpu.
After reproducing success, we can find out buffer_size_kb will not be
functional anymore.

To prevent leaving 'resize_disabled' and 'record_disabled' non-zero after
ring_buffer_reset_online_cpus returns, we ensure that each atomic variable
has been set up before atomic_sub() to it.

Cc: stable@vger.kernel.org
Cc: npiggin@gmail.com
Fixes: b23d7a5f4a07 ("ring-buffer: speed up buffer resets by avoiding synchronize_rcu for each CPU")
Reviewed-by: Cheng-Jui Wang <cheng-jui.wang@mediatek.com>
Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
---
Changes from v1 to v3: https://lore.kernel.org/all/20230408052226.25268-1-Tze-nan.Wu@mediatek.com/
  - Declare the cpumask variable statically rather than dynamically.

Changes from v2 to v3: https://lore.kernel.org/all/20230409024616.31099-1-Tze-nan.Wu@mediatek.com/
  - Considering holding cpu_hotplug_lock too long because of the
    synchronize_rcu(), maybe it's better to prevent the issue by copying
    cpu_online_mask at the entry of the function as V1 does, instead of
    using cpus_read_lock().

Changes from v3 to v4: https://lore.kernel.org/all/20230410073512.13362-1-Tze-nan.Wu@mediatek.com/
  - Considering that the size of cpumask may not be too big on some machines
    We no longer adopt the approach of copying cpumask at the beginning of
    the function. Instead, we ensure that atomic variables have been set up
    before atomic_sub() is called.
  - Change the title of the patch.
---
 kernel/trace/ring_buffer.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 76a2d91eecad..8c647d8b5bb4 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5361,20 +5361,28 @@ void ring_buffer_reset_online_cpus(struct trace_buffer *buffer)
 	for_each_online_buffer_cpu(buffer, cpu) {
 		cpu_buffer = buffer->buffers[cpu];
 
-		atomic_inc(&cpu_buffer->resize_disabled);
+#define RESET_BIT	(1 << 30)
+		atomic_add(RESET_BIT, &cpu_buffer->resize_disabled);
 		atomic_inc(&cpu_buffer->record_disabled);
 	}
 
 	/* Make sure all commits have finished */
 	synchronize_rcu();
 
-	for_each_online_buffer_cpu(buffer, cpu) {
+	for_each_buffer_cpu(buffer, cpu) {
 		cpu_buffer = buffer->buffers[cpu];
 
+		/*
+		 * If a CPU came online during the synchronize_rcu(), then
+		 * ignore it.
+		 */
+		if (!(atomic_read(&cpu_buffer->resize_disabled) & RESET_BIT))
+			continue;
+
 		reset_disabled_cpu_buffer(cpu_buffer);
 
 		atomic_dec(&cpu_buffer->record_disabled);
-		atomic_dec(&cpu_buffer->resize_disabled);
+		atomic_sub(RESET_BIT, &cpu_buffer->resize_disabled);
 	}
 
 	mutex_unlock(&buffer->mutex);
-- 
2.18.0


