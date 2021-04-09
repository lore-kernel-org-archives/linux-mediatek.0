Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0F9C43460
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 08:38:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F6B66103E
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 08:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F6B66103E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GlNCqMYO+z1JWhEGNO2Y9jhHj9M3KCw32cbgkH+LwJ0=; b=PHUVuEfh83dKdLqGVdWgf7mydE
	zfKmIn7tW7DkVYrxxKksW4gdC7TzB4FzGZI+27YsQSFFugrLVIaYQL1K+jHvn1AGptKbpDllocRnr
	0SQ16Tebxyu4lIaI8KUaVKQ2N06fHRthT8vszLfhs1lzZQN4Nlm2haNptoXRGp0KDD5NXHzPG1Zbt
	MTeDbP8hDc1WmDVp7gzNIqwsGZb9ldP0qy0c6Sg2VbaAhC2zPicerkKbRibKEo03/HfVA+rXIQw9P
	z3KCw+jQhsBznewIAnXgfRtOv92vlsuXOPyGxi7EnqfZdPh28WaH/3kUi990cWPT0VAVVy8bc26Iv
	wjv4p39w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUmeI-0004PQ-Ja; Fri, 09 Apr 2021 08:37:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUmd3-0004H5-H3; Fri, 09 Apr 2021 08:36:46 +0000
X-UUID: 41c14765a43540b5835f1740097f479b-20210409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Oyf0jbTwSQmbmSkWyprlo/wiwNcv4WIixF/7I3yPLac=; 
 b=tM0S5qUduBkmkujQ4skAF60vcsNEl57bsLDyKYc2PEMNTl+verZM1569eQ/aZz7V0EvtL5Mv+Cibs9odGb6/hRKja9rH46T4MAJOub0uBG66z+1IluYJqdhpN8GzhI/bn/gfastWJwfiP4OH9+OoL7fDql3lBf4n/h6o+C7+XG4=;
X-UUID: 41c14765a43540b5835f1740097f479b-20210409
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 861555579; Fri, 09 Apr 2021 01:36:28 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 01:36:27 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 16:36:18 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Apr 2021 16:36:11 +0800
From: Fengquan Chen <Fengquan.Chen@mediatek.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner
 <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>
CC: <fengquan.chen@mediatek.com>, <dehui.sun@mediatek.com>, Fengquan Chen
 <Fengquan.Chen@mediatek.com>
Subject: [PATCH] [v3,
 1/1] clocksource/drivers/timer-mediatek: optimize systimer irq clear
 flow on shutdown
Date: Fri, 9 Apr 2021 16:36:06 +0800
Message-ID: <1617957367-479-1-git-send-email-Fengquan.Chen@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-TM-SNTS-SMTP: 036FC9AB9D37B16DDA3D07D0176824E258CCE17098652B8B1A2B560D4C420FB52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_093644_192492_56A9F94D 
X-CRM114-Status: UNSURE (   8.18  )
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

mtk_syst_clkevt_shutdown is called after irq disabled in suspend flow,
clear any pending systimer irq when shutdown to avoid suspend aborted
due to timer irq pending

Also as for systimer in mediatek socs, there must be firstly enable
timer before clear systimer irq

Fixes: e3af677607d9("clocksource/drivers/timer-mediatek: Add support for system timer")
Signed-off-by: Fengquan Chen <fengquan.chen@mediatek.com>

Fengquan Chen (1):
  [v3, 1/1] clocksource/drivers/timer-mediatek: optimize systimer irq
    clear flow on shutdown

 drivers/clocksource/timer-mediatek.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
