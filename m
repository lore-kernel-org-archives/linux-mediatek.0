Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51A6EC83F3E
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r8m+Ysh7MzIJQJW0je35DqRSDl/nm2DaTMoSX9cJ1NA=; b=R5YLsvevqrt1tsTCGCcOIu39CY
	iYD3k7WDb07QVnoMYX0QXVDmUk00gy1Y2PwFRJKbHzzhUZ4xrK+CC9nFMIrJQmz9Y0DG8hI0rzV8p
	lI3hYFFJdy0EgzwW07iCHr+i1E+yAi1QbjLoQ64bdPOB/0gidMTzb3d0YmT4orFcRVO2MBuhn5q8T
	5GWe21JGe+dtsJ9+JD3/1AmMXJUHH0vl6DLwUG4YycI/TgAlXRXlV+FMAYadNSL1k4UJ8J61AVAV3
	bRyl70Y8FCoqfKBEtIN0pC0hfdyYFqV1wbO5FS8Uz9sZW7N6iJNYmg3np2vRE+zo37P1GlT88bKbY
	wlNwSJdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdWxw-006A8Q-0e;
	Tue, 05 Sep 2023 14:23:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdWxt-006A7U-0G;
	Tue, 05 Sep 2023 14:23:38 +0000
X-UUID: c94a23364bf711ee86758d4a7c00f3a0-20230905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=r8m+Ysh7MzIJQJW0je35DqRSDl/nm2DaTMoSX9cJ1NA=;
	b=rWe9fIQmI7MOPgVE78rl+6d+/kUxS8it5DsKkjqQK8fE3HJtZVReUleyMI6E37dc9yrN5uBdZvj7lfza23sd1LshsLl7vLdcqrgShBrGjwQn3zggmE2ArQfQe00zxNYhcCHhPf90imA5wWpUMO69vXeOlGPInNMnxKN34Yg/zRQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:a032238a-c046-4327-b2f8-a33c778544b5,IP:0,U
	RL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-20
X-CID-META: VersionHash:0ad78a4,CLOUDID:7ae9abc2-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:1,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:
	NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: c94a23364bf711ee86758d4a7c00f3a0-20230905
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tze-nan.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1338159789; Tue, 05 Sep 2023 07:23:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 5 Sep 2023 22:12:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 5 Sep 2023 22:12:53 +0800
From: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>
CC: <bobule.chang@mediatek.com>, <wsd_upstream@mediatek.com>,
	<cheng-jui.wang@mediatek.com>, Tze-nan Wu <Tze-nan.Wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<linux-kernel@vger.kernel.org>, <linux-trace-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] ring-buffer: Do not read at &event->array[0] if it across the page
Date: Tue, 5 Sep 2023 22:12:45 +0800
Message-ID: <20230905141245.26470-1-Tze-nan.Wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_072337_130330_41B725E1 
X-CRM114-Status: GOOD (  17.53  )
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

While reading from the tracing/trace, the ftrace reader rarely encounters
a KASAN invalid access issue.
It is likely that the writer has disrupted the ring_buffer that the reader
is currently parsing. the kasan report is as below:

[name:report&]BUG: KASAN: invalid-access in rb_iter_head_event+0x27c/0x3d0
[name:report&]Read of size 4 at addr 71ffff8111a18000 by task xxxx
[name:report_sw_tags&]Pointer tag: [71], memory tag: [0f]
[name:report&]
CPU: 2 PID: 380 Comm: xxxx
Call trace:
dump_backtrace+0x168/0x1b0
show_stack+0x2c/0x3c
dump_stack_lvl+0xa4/0xd4
print_report+0x268/0x9b0
kasan_report+0xdc/0x148
kasan_tag_mismatch+0x28/0x3c
__hwasan_tag_mismatch+0x2c/0x58
rb_event_length() [inline]
rb_iter_head_event+0x27c/0x3d0
ring_buffer_iter_peek+0x23c/0x6e0
__find_next_entry+0x1ac/0x3d8
s_next+0x1f0/0x310
seq_read_iter+0x4e8/0x77c
seq_read+0xf8/0x150
vfs_read+0x1a8/0x4cc

In some edge cases, ftrace reader could access to an invalid address,
specifically when reading 4 bytes beyond the end of the currently page.
While issue happened, the dump of rb_iter_head_event is shown as below:

    in function rb_iter_head_event:
          - iter->head = 0xFEC
          - iter->next_event = 0xFEC
          - commit = 0xFF0
          - read_stamp = 0x2955AC46DB0
          - page_stamp = 0x2955AC2439A
          - iter->head_page->page = 0x71FFFF8111A17000
          - iter->head_page->time_stamp = 0x2956A142267
          - iter->head_page->page->commit = 0xFF0
          - the content in iter->head_page->page
                0x71FFFF8111A17FF0: 01010075 00002421 0A123B7C FFFFFFC0

In rb_iter_head_event, reader will call rb_event_length with argument
(struct ring_buffer_event *event = 0x71FFFF8111A17FFC).
Since the content data start at address 0x71FFFF8111A17FFC are 0xFFFFFFC0.
event->type will be interpret as 0x0, than the reader will try to get the
length by accessing event->array[0], which is an invalid address:
    &event->array[0] = 0x71FFFF8111A18000

Signed-off-by: Tze-nan Wu <Tze-nan.Wu@mediatek.com>
---
Following patch may not become a solution, it merely checks if the address
to be accessed is valid or not within the rb_event_length before access.
And not sure if there is any side-effect it can lead to.

I am curious about what a better solution for this issue would look like.
Should we address the problem from the writer or the reader?

Also I wonder if the cause of the issue is exactly as I suspected.
Any Suggestion will be appreciated.

Test below can reproduce the issue in 2 hours on kernel-6.1.24:
    $cd /sys/kernel/tracing/
    # make the reader and writer race more through resize the buffer to 8kb
    $echo 8 > buffer_size_kn
    # enable all events
    $echo 1 > event/enable
    # enable trace
    $echo 1 > tracing_on
 
    # write and run a script that keep reading trace
    $./read_trace.sh

    ``` read_trace.sh
       while :
       do
           cat /sys/kernel/tracing/trace > /dev/null
       done

    ```
---
 kernel/trace/ring_buffer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 78502d4c7214..ed5ddc3a134b 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -200,6 +200,8 @@ rb_event_length(struct ring_buffer_event *event)
 		if (rb_null_event(event))
 			/* undefined */
 			return -1;
+		if (((unsigned long)event & 0xfffUL) >= PAGE_SIZE - 4)
+			return -1;
 		return  event->array[0] + RB_EVNT_HDR_SIZE;
 
 	case RINGBUF_TYPE_TIME_EXTEND:
@@ -209,6 +211,8 @@ rb_event_length(struct ring_buffer_event *event)
 		return RB_LEN_TIME_STAMP;
 
 	case RINGBUF_TYPE_DATA:
+		if ((((unsigned long)event & 0xfffUL) >= PAGE_SIZE - 4) && !event->type_len)
+			return -1;
 		return rb_event_data_length(event);
 	default:
 		WARN_ON_ONCE(1);
-- 
2.18.0


