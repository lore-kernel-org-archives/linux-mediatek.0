Return-Path: <SRS0=+oxs=ZK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10FDCC432C3
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2019 03:13:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D3FA2206D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Nov 2019 03:13:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ARHtcAmL";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Yq6vle8q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D3FA2206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5BtL7cCgHg6rQ3SAchZ8ptDP+L2i+JURrNljXJgeLNc=; b=ARHtcAmLSPmjUF
	AHOCIJBuYFLff8OA2/sZgZf7mDs4Zm6BOrPR7/qFSKjAjtRhfdoVahtK//mhqL3+nYum+6Psnlpd3
	Cq8omY9+wzNrbyShRQVscxowt4hHM/hM2aCb7+N+/Ys3Ah1nzWF6LMQN2jtvuT5QwB8+yOLrnf0Iw
	YSbEAw00zsf8sjTPBaV/X22xYlm0qF5YWPYlS7YS2XwzNnyfhmshIWYJO1WPjywTaDZ0g1ifppomo
	ulJlUVOCISvohWqp44dn2qJcLHx7NalGmy3Do7K4avB9v0rE7Il1XV2WNmFLfK6ZCSvP4dvcC1/6C
	uan3mr05UvX0NSrTaoHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWXTp-0001Ol-7e; Mon, 18 Nov 2019 03:13:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWXTg-0001IJ-GG; Mon, 18 Nov 2019 03:13:26 +0000
X-UUID: 9eccd6eaee234408ade24095524cee0d-20191117
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=xPbbzxVQarZrPbulvz4tUDmgJr12lp3+nMlI2Khoddw=; 
 b=Yq6vle8q/+9H5cgR54v/9VVvjBqHabEOCE8K0NoXANuBxENlC5w4gkZVNLaVaz2M3lbaKY7/UlA4k/UDNpqmNg2AsKlE1lju3lSJgnkd1QDGuu2ADjqJfHPxcsaDsBwfJT7WMaRd48Mlaidppt9WieUOOooTOHWliFHxX+ep3Iw=;
X-UUID: 9eccd6eaee234408ade24095524cee0d-20191117
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yun.hsiang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 460387082; Sun, 17 Nov 2019 19:13:18 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 17 Nov 2019 19:12:56 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 18 Nov 2019 11:12:54 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 18 Nov 2019 11:12:39 +0800
From: Yun Hsiang <yun.hsiang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Peter Zijlstra
 <peterz@infradead.org>
Subject: [PATCH 1/1] psi: fix underflow in psi_write
Date: Mon, 18 Nov 2019 11:12:42 +0800
Message-ID: <1574046762-26418-1-git-send-email-yun.hsiang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5F6A65CA0647CF7851E850331F5E5E7D8864E85FA5032B496021299311914FFB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_191324_543533_A6FB0B51 
X-CRM114-Status: UNSURE (   8.60  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Yun Hsiang <yun.hsiang@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There is a stack-out-of-bounds write when running syzkaller test.

psi_write will perform a underflow write if nbytes received 0.
Fix this behavior by return -EINVAL when nbytes == 0.

Here is the KASAN log.
==================================================================
BUG: KASAN: stack-out-of-bounds in psi_write.part.9+0x128/0x270
Write of size 1 at addr ffffffc0e601fb7f by task syz-executor4/25565

CPU: 7 PID: 25565 Comm: syz-executor4 Tainted: G S      W  O    4.14.141+ #1
Call trace:
[<ffffff90080969e0>] dump_backtrace+0x0/0x828
[<ffffff9008097228>] show_stack+0x20/0x30
[<ffffff9009c5a040>] dump_stack+0xd0/0x120
[<ffffff9008411818>] print_address_description+0x68/0x4d0
[<ffffff9008411fa0>] kasan_report+0x1a0/0x3e8
[<ffffff900840fd14>] __asan_store1+0x4c/0x58
[<ffffff90081b44b0>] psi_write.part.9+0x128/0x270
[<ffffff90081b4660>] psi_memory_write+0x30/0x38
[<ffffff900852a220>] proc_reg_write+0xb8/0x108
[<ffffff900843e78c>] __vfs_write+0xdc/0x2d8
[<ffffff900843ec50>] vfs_write+0xe8/0x278
[<ffffff900843f150>] SyS_write+0xd0/0x1a8

Signed-off-by: Yun Hsiang <yun.hsiang@mediatek.com>
---
 kernel/sched/psi.c |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
index 6e52b67..ce89894 100644
--- a/kernel/sched/psi.c
+++ b/kernel/sched/psi.c
@@ -1199,6 +1199,9 @@ static ssize_t psi_write(struct file *file, const char __user *user_buf,
 		return -EOPNOTSUPP;
 
 	buf_size = min(nbytes, (sizeof(buf) - 1));
+	if (buf_size == 0)
+		return -EINVAL;
+
 	if (copy_from_user(buf, user_buf, buf_size))
 		return -EFAULT;
 
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
