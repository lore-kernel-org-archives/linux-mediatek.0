Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104B0C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 09:33:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E5E161181
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 09:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E5E161181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HPSQlb5BoVwDm6xTUAbdKV10VkHNuHg1N0Kie/dOn14=; b=LGBqTQcmDJHKvnysNN17Y/sp+k
	Q0TxXhI+DZcgt9MnP5IspaMiCHB50U7Po7zYYH3YO19T23hLziyw90RT2wr8RjyasK9UHB6ZKO5Gb
	3uy4EwDmtgI5AJmixo4kl+HvaFJNgYnlbm3YZTS/OTuCd9N7xoknFtcAgfWI5xBSwYMC80RTZlBUF
	VtLqtW32GnRbaGWwlNwiBbpzBNNjnNv6BviC9N30aDq/oBwyhDTx1B9Oe8xK1RU7JaodU34ytnVqD
	+z5VywDfY5z1jf/Wh8BaW/sKzmUyHJItho9GuY46IvLC90f5ZbvF218fdso5UsrFowbvEtRQzkzbR
	K+hZnwxg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUnW5-000FmM-UN; Fri, 09 Apr 2021 09:33:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUnVZ-000Ff2-9n; Fri, 09 Apr 2021 09:32:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=ahpjA9tCJvmzP8JNR3fN+DSmcX5nwcvUPJ21UsjNxAY=; b=dx2w9DNZaZYkbBaqJFq7gJ2RVP
 +4vD7KDS2wW6hSrVoKaA9h67JQNOjJFerYemOi15lGpAHG1o1MI2bYttDwCgVwmczWqY5wTXG0Sew
 RjyVSbu2mpMiVWvyzXQ4TGiIw995smCrfpVDjm3jwGYnXDv9tlf4TZy/0dwgDKvOXNe18QHXl8Q9V
 PypQNo3feUsuIoSvkywd2J1zGXYX1Mq4miEqKOpWYtzJRLRv0DUlxCA8q8fTiOzKUdUTH4ngXQabp
 2+4yg5Z5kU/9AKWPaTB014AiIA/MQmCZyesSHDVCRxzCTJIEz97KdHaV4OxA0995gSRFkiHRAX47x
 TWcI0arA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUnVW-0042W5-Er; Fri, 09 Apr 2021 09:32:55 +0000
X-UUID: 6a70f4921340401f859b0a664abab85f-20210409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ahpjA9tCJvmzP8JNR3fN+DSmcX5nwcvUPJ21UsjNxAY=; 
 b=pVOZE9/hDrC2zJVSfbQX0Q6KsMEebeQ5cmLvnDA0HZBED6rOrfWsrZGjud5IBRqeXYp3RdN6k8n53/d+upIdN3ornTDdP8t6QONeZhLjeRrhPqnvDXHsoGZ494a6Wyz6V1Dfv6bkdK9JYxRtf3TEI9gvf4kXbX2vWUwDhpH54w0=;
X-UUID: 6a70f4921340401f859b0a664abab85f-20210409
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2076988517; Fri, 09 Apr 2021 02:32:50 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 02:22:48 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 17:22:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Apr 2021 17:22:44 +0800
From: Fengquan Chen <Fengquan.Chen@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
CC: <fengquan.chen@mediatek.com>, <dehui.sun@mediatek.com>, Fengquan Chen
 <Fengquan.Chen@mediatek.com>
Subject: [v4,
 1/1] clocksource/drivers/timer-mediatek: optimize systimer irq clear
 flow on shutdown
Date: Fri, 9 Apr 2021 17:22:41 +0800
Message-ID: <1617960162-1988-1-git-send-email-Fengquan.Chen@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: EB70484A7A26ECD92D4CC487621E7357F98FB2BCBE6B52620097EDDA15F5C1962000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_023254_521647_DCD65AC0 
X-CRM114-Status: UNSURE (   6.83  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Fengquan Chen (1):
  [v4, 1/1] clocksource/drivers/timer-mediatek: optimize systimer irq clear flow on shutdown

 drivers/clocksource/timer-mediatek.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
