Return-Path: <SRS0=56RK=F5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EDE7C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 07:31:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 902EF221FB
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Dec 2020 07:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 902EF221FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kNBSDgmgf2jDmx9rXmFtPDB+H6//uyKHV9v1IiCTIWc=; b=iPppppW1rg9UMOE/P+ppEV3u63
	qZ6abUBNsP52JKYRcZwiESAc/WWJWmiQFFIUAIjbeF427ZDYeKa1r9zHKpqM/ADC+vmUmNo4eRImO
	Hv62twoohTCPT3EFxNvjiegxVTo7ZrNwPmKftNeRz6EOTp7ApfrPLs2GG4XDk7em3AdPRhIpCCLYb
	ovIfb9hyDARzIV2++H67LVePK5IMFXqwJkfMqrqviAnM84u7fgsFW3IdaVMxmx2VDhIrFBRunL0Qe
	biw9ReNCT6wN/jE7EBvB9y9exV/prjyqmFkF/cQQrKkawFd2BnkAzusJOYq67AFiS1PrlVXrMIw+K
	5vVJigpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kshZ8-00038S-RE; Fri, 25 Dec 2020 07:31:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kshZ6-000372-If; Fri, 25 Dec 2020 07:31:09 +0000
X-UUID: b6a2f46be2344594bf5ce008493a239c-20201224
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=HSd4QSANHtOXBxk9HXKgRolmb/hcf5CJbQbM4NB7skI=; 
 b=uWe4BO4IhScpTeMTkCiF/694ly+ImkgOryBE3/Jb97vhr5mVkm5U6IIVvI8931pDdMfGpQUmddaJmjwHB2EVf/Bcz1F6S9A9wEkt6DDSOObIm/9CvMBEgIWN2VELEN6BRF9sjKxsKXEvBA3H3y4QBR0cWVW+D4AvOHDvY7x6CaY=;
X-UUID: b6a2f46be2344594bf5ce008493a239c-20201224
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <freddy.hsin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 471713291; Thu, 24 Dec 2020 23:30:57 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Dec 2020 23:30:55 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 25 Dec 2020 15:30:53 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 25 Dec 2020 15:30:53 +0800
From: Freddy Hsin <freddy.hsin@mediatek.com>
To: Freddy Hsin <freddy.hsin@mediatek.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-watchdog@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Subject: driver: watchdog: Remove mtk_wdt_stop() in probe() to prevent the
 system freeze and it doesn't reboot by watchdog problem 
Date: Fri, 25 Dec 2020 15:30:49 +0800
Message-ID: <1608881450-11081-1-git-send-email-freddy.hsin@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201225_023108_844336_8F3C5FAB 
X-CRM114-Status: UNSURE (   8.06  )
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
Cc: kuohong.wang@mediatek.com, chang-an.chen@mediatek.com,
 wsd_upstream@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Before user space daemon start to access the watchdog device,
there is a time interval that watchdog is disabled in the
original flow. If the system freezing at this interval, it
cannot be rebooted by watchdog hardware automatically.

In order to solve this problem, the watchdog hardware should be
kept working, and start hrtimer in framework to ping it by
setting max_hw_heartbeat_ms and HW_RUNNING used in
watchdog_need_worker to determine whether the worker should be
started or not
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
