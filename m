Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B4CC77B61
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Apr 2023 03:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RT6t6k0uRnv8KRrBTo9piwxXohY+DCmlYMyknmWtfNY=; b=cY6E116fuVdt2mr4Ke600UhFKF
	/SqGg6c48dU7INHIhGOxLiErcarRiPgPJ5Fx0+nuoxfquoN7Nn8SSRuGyUVPGMIY8eRGsSx5+ypzm
	FPOSFSE9ZIMlE2mj8t++zzWnczUqn/OtSIA3MwA7w7iBn9csnOV+BRYB7sf3zL36xr1MtBwCMyLlZ
	8h/uZph7NA0356PbsIcXb8OfdlZu8I9Hwv1YriLPys4RDQGKS+IqfJ9uE4TrYqD3fVdF+XRGcMe9o
	7gdecdc2Rw2HzWi7iA3F0O5v2cEF1s1VA8tCjMSco6mmPUpmtmy89cKfszxJJbZcLO1EPnj8pSLEF
	4ZQ2IGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plLNy-00D4MF-0n;
	Sun, 09 Apr 2023 03:06:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1plLNv-00D4Li-05;
	Sun, 09 Apr 2023 03:06:32 +0000
X-UUID: 84eb5bb8d68311edb7d8d11f642b8e78-20230408
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RT6t6k0uRnv8KRrBTo9piwxXohY+DCmlYMyknmWtfNY=;
	b=XlJT9ba5DtASdgzl0yqtzF/plWLN4TQikNU5tYUbcABPolQ5egdmArdBqwZIHvlK2EsoWekcjsTTC0adODFBSrPwRi+5abfhQmB54+hu39rNJWR7seMOmcSXtI8kbAmOtUxpxKbT6NGpsmeTUynfycl0Sr67qftoDmnsQIkgxmU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:9544d0eb-c3f9-4228-9560-cdcb278b1506,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:120426c,CLOUDID:56c6bd2a-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 84eb5bb8d68311edb7d8d11f642b8e78-20230408
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <tze-nan.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 97125158; Sat, 08 Apr 2023 20:06:27 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Sun, 9 Apr 2023 10:46:24 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Sun, 9 Apr 2023 10:46:24 +0800
From: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>
CC: <bobule.chang@mediatek.com>, <wsd_upstream@mediatek.com>,
	<Tze-nan.Wu@mediatek.com>, <stable@vger.kernel.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2] ring-buffer: Prevent inconsistent operation on cpu_buffer->resize_disabled
Date: Sun, 9 Apr 2023 10:46:15 +0800
Message-ID: <20230409024616.31099-1-Tze-nan.Wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230408052226.25268-1-Tze-nan.Wu@mediatek.com>
References: <20230408052226.25268-1-Tze-nan.Wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230408_200631_221457_B60133C9 
X-CRM114-Status: GOOD (  11.02  )
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

Write to buffer_size_kb can permanently fail due to cpu_online_mask changed
between two for_each_online_buffer_cpu loops.
The number of increasing and decreasing on cpu_buffer->resize_disable
may be inconsistent, leading that the resize_disabled in some CPUs
becoming none zero after ring_buffer_reset_online_cpus return.

This issue can be reproduced by "echo 0 > trace" and hotplug cpu at the
same time. After reproducing success, we can find out buffer_size_kb
will not be functional anymore.

This patch uses cpus_read_lock() to prevent cpu_online_mask being changed
between two different "for_each_online_buffer_cpu".

Changes in v2:
  Use cpus_read_lock() instead of copying cpu_online_mask at the entry of
  function

Link:
  https://lore.kernel.org/lkml/20230408052226.25268-1-Tze-nan.Wu@mediatek.com/

Cc: stable@vger.kernel.org
Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
---
 kernel/trace/ring_buffer.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 76a2d91eecad..44d833252fb0 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5357,6 +5357,7 @@ void ring_buffer_reset_online_cpus(struct trace_buffer *buffer)
 
 	/* prevent another thread from changing buffer sizes */
 	mutex_lock(&buffer->mutex);
+	cpus_read_lock();
 
 	for_each_online_buffer_cpu(buffer, cpu) {
 		cpu_buffer = buffer->buffers[cpu];
@@ -5377,6 +5378,7 @@ void ring_buffer_reset_online_cpus(struct trace_buffer *buffer)
 		atomic_dec(&cpu_buffer->resize_disabled);
 	}
 
+	cpus_read_unlock();
 	mutex_unlock(&buffer->mutex);
 }
 
-- 
2.18.0


