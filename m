Return-Path: <SRS0=N2rV=IA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33105C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 07:33:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 990B164DE4
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Mar 2021 07:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 990B164DE4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DCT5ARXP1Vo98hWLhw9ZOq9o0t7gHL+GQrzphR2eZ+4=; b=aBFNNjJw2NFdkPW1ZK5LZu63Ry
	tvjtn8PWY18J67EM8cyIkBDDsNocMMPdVrAd4pEBJrqW9vt/1fHyHHCmVm68IhRO6zteguxKY6L6p
	9eeYOOPHI5S6l45BYRWQTWsX/ZLDIryPmJgMbyboytptNTdd73BrsA/S0ob9t6Jq8iiydP5ik83tb
	kcgf3+NCI4zjPmo8ErXhusbqh0huGE1m2xCEP8ptVbfuFF1BhN6zow0FYm1ab+TFHFnQDvdC+m0pv
	rpfc+4cniPFbJWNquUExYIdwXT61JF1//vm4aK3d9ad/gJydCQmgyyJ9j0Kz0clnv1sIPfdmGg+CU
	gygYdAnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGzWh-00064U-CG; Tue, 02 Mar 2021 07:33:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGzWb-00062f-Nt; Tue, 02 Mar 2021 07:32:58 +0000
X-UUID: 80cb3e4f646e476babc7f1744b2677d2-20210301
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=17S6uzt3AlyfBhSV2Z02T0lpUnBLKM6Z3FTnVz8cVIM=; 
 b=mj53aWCYoaJW3/a8FiMiPIsxT7oHi0zvzBXHL75CSZpx3nkuvKD0uXAMLyqyOT5AG5mS5hBl7Nt973wHUTXrt8mUdD3N71twe2W3WVGtHSj/k3rJo6tby2vYuy0MESCwzI8i1sdPHNvZZE0y08Mc1Ugcii3aytF1Xo+GaPmX63o=;
X-UUID: 80cb3e4f646e476babc7f1744b2677d2-20210301
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1480155426; Mon, 01 Mar 2021 23:28:34 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Mar 2021 23:28:33 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Mar 2021 15:28:29 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Mar 2021 15:28:28 +0800
From: Fengquan Chen <Fengquan.Chen@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
Subject: [PATCH] clocksource/drivers/timer-mediatek: optimize systimer irq
 clear flow on Mediatek Socs
Date: Tue, 2 Mar 2021 15:28:04 +0800
Message-ID: <1614670085-26229-1-git-send-email-Fengquan.Chen@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 4F0E3607ECFC991C1FE455D9024AC4BA0283DB1C04F435AB6898340C7F80F92D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_023257_984208_F314EDB6 
X-CRM114-Status: UNSURE (   7.45  )
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
Cc: Fengquan Chen <Fengquan.Chen@mediatek.com>, dehui.sun@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

clocksource/drivers/timer-mediatek: optimize systimer irq clear flow on Mediatek Socs

1)ensure systimer is enabled before clear and disable interrupt, which only
  for systimer in Mediatek Socs.

2)clear any pending timer-irq when shutdown to keep suspend flow clean,
  when use systimer as tick-broadcast timer

Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>

Fengquan Chen (1):
  clocksource/drivers/timer-mediatek: optimize systimer irq clear flow
    on Mediatek Socs

 drivers/clocksource/timer-mediatek.c | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
