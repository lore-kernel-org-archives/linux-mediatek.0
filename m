Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6378BC4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 06:32:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CA4723B81
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 06:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CA4723B81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CUlKeq/8IKZQXvreCkJ8y6G48Y0PR26urfJWw1szxd4=; b=niiK1DfQFX2C0ccLrNrMl3A6x
	24CC2066KBX1BPTtsjTJ2T6Sirt2IwDa8UTgqyoXQp/an0Y0tmJpRuExXfQnpeUfGR7ftraR1Avel
	asjXvLcMN26eRLxXy7j5GCReY9PEh93sKRcnLubyCSDmZuHthYwfKCva+hbMYT90ixqyiH4LdCaoT
	n13mwkk894oWdUTscVsRy1Dsl8+PSDbMs+weCmXJheYrWk9H6JUSkQP9GE2I8Ilfe2GeZNdo5sZD1
	m1SnS3Rp8Ns5ms90zckv8wFTAxuV5MSa1o7UuZ4T8ljOLQ82tuHtSmgLyuq+yPKeeXmqGLecZggHv
	2Xf+1lbGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmt1s-0005D9-Ag; Wed, 09 Dec 2020 06:32:48 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmt1k-0005Bh-H9; Wed, 09 Dec 2020 06:32:41 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CrRzD55MFzM2YQ;
 Wed,  9 Dec 2020 14:31:52 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.9) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Wed, 9 Dec 2020 14:32:22 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Stanley Chu <stanley.chu@mediatek.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, "James E . J .
 Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen"
 <martin.petersen@oracle.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-scsi <linux-scsi@vger.kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] scsi: ufs-mediatek: use correct path to fix compiling
 error
Date: Wed, 9 Dec 2020 14:31:44 +0800
Message-ID: <20201209063144.1840-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20201209063144.1840-1-thunder.leizhen@huawei.com>
References: <20201209063144.1840-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.9]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_013241_074210_5A7B8448 
X-CRM114-Status: GOOD (  12.06  )
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

When the kernel is compiled with allmodconfig, the following error is
reported:
In file included from drivers/scsi/ufs/ufs-mediatek-trace.h:36:0,
                 from drivers/scsi/ufs/ufs-mediatek.c:28:
./include/trace/define_trace.h:95:42: fatal error: ./ufs-mediatek-trace.h: No such file or directory
 #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)

The comment in include/trace/define_trace.h specifies that:
TRACE_INCLUDE_PATH: Note, the path is relative to define_trace.h, not the
file including it. Full path names for out of tree modules must be used.

So without "CFLAGS_ufs-mediatek.o := -I$(src)", the current directory "."
is "include/trace/", the relative path of ufs-mediatek-trace.h is
"../../drivers/scsi/ufs/".

Fixes: ca1bb061d644 ("scsi: ufs-mediatek: Introduce event_notify implementation")
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/scsi/ufs/ufs-mediatek-trace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufs-mediatek-trace.h b/drivers/scsi/ufs/ufs-mediatek-trace.h
index fd6f84c1b4e2256..895e82ea6ece551 100644
--- a/drivers/scsi/ufs/ufs-mediatek-trace.h
+++ b/drivers/scsi/ufs/ufs-mediatek-trace.h
@@ -31,6 +31,6 @@ TRACE_EVENT(ufs_mtk_event,
 
 #undef TRACE_INCLUDE_PATH
 #undef TRACE_INCLUDE_FILE
-#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_PATH ../../drivers/scsi/ufs/
 #define TRACE_INCLUDE_FILE ufs-mediatek-trace
 #include <trace/define_trace.h>
-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
