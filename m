Return-Path: <SRS0=A00R=PR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79EA1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 13:56:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4908C61167
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Oct 2021 13:56:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4908C61167
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8o93Q9+YaEPBLAY8H6eTjmghO1fawX33nJlWaDEI1yk=; b=QgsZMcINu5MA9d
	37+IEHS5F/jNCh1qAuTie5Sa0pDOobeQ81yTdrHf5ZZ3GVUDfhd66bNQZK8OUwcpL3SHwI4KyLKyK
	+yWdtIfCG8GbBSevFLgllhluSCrD6/CTyCD0ZZENfka26ZYEg/Z6a0j4061at7y8mLc+6nDqui15X
	QWhPmDfJazPsQlZW0BOh8RRNYTsqG9sFaqQVn/O411qGN9byKw69Bdt1/KrdLRbAi/EFsHWJ38xKa
	CXlt4tZksnb1wl0hPm3D27LSBJqYK4ZYDvyyJf9pMg4alTP1oqIobmh0ZFUsi7gsyDMFcVn9vQmLC
	x8FgTAho6KEQ2bVqBAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgSNB-00B6IO-LO; Fri, 29 Oct 2021 13:56:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgSN7-00B6HX-Qw; Fri, 29 Oct 2021 13:56:44 +0000
X-UUID: a48837cb20a94dc98b902e4324148324-20211029
X-UUID: a48837cb20a94dc98b902e4324148324-20211029
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hector.yuan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 393302099; Fri, 29 Oct 2021 06:56:38 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Oct 2021 06:56:36 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 29 Oct 2021 21:56:35 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 29 Oct 2021 21:56:35 +0800
From: Hector Yuan <hector.yuan@mediatek.com>
To: <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>, "Rafael
 J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <wsd_upstream@mediatek.com>,
 <hector.yuan@mediatek.com>
Subject: [PATCH v1] cpufreq: mediatek-hw: Fix double devm_remap in hotplug case
Date: Fri, 29 Oct 2021 19:42:22 +0800
Message-ID: <1635507743-17919-1-git-send-email-hector.yuan@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_065641_894594_C063CB72 
X-CRM114-Status: UNSURE (   7.11  )
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

When hotpluging policy cpu, cpu policy init will be called multiple times.
Unplug CPU7 -> CPU6 -> CPU5 -> CPU4, then plug CPU4 again.
In this case, devm_remap will double remap and resource allocate fail.
So replace devm_remap to ioremap and release related resources in cpu exit.


Hector.Yuan (1):
  cpufreq: mediatek-hw: Fix double devm_remap in hotplug case

 drivers/cpufreq/mediatek-cpufreq-hw.c |   33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
