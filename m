Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3490CC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 10:08:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9DBC2074B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 10:07:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qYPbbDPg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YSM4RwS7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9DBC2074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y8ZoZpKSdoTYyUGuvKaAJMa8K4q5JPewcKjI9CFFFQ4=; b=qYPbbDPgxC32NabeHNkIoVey/W
	4ZvdOwdizzxaZq2W8COJXG9MIEPHBiy2yw5hWVjQh+ry0CawZrLqFffp8d7Ggq29dogsNK9w6d2OO
	i6yxtz7jpS8xT2KiF/DUWqLwgc63Xongx30iApUWrjQjUOSaD7B+H/9jH86Bp8earZ6HJj23ETmPR
	3t8av5RhawbUZUNO3qiPMAtEBcyxdIcy85eyvgtbS7l61NaMGqYt/PK9G7sNZ9jkPKA9sWeKj1jEK
	5AL+JuHBBQ/ua7k3e9JJJBwCrdQz0AyAuYelD/KumS5evgQ1ACxEhGpuH1IOemsljinEZ51f1oWIb
	Z/rivWLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0j00-0006EQ-F0; Wed, 29 Jul 2020 10:07:48 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0izp-0006Bu-PY; Wed, 29 Jul 2020 10:07:41 +0000
X-UUID: 1a3659535a69490fbf2db03b71eb9899-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=PQhqwCQspnAXNFobjzXHfwsqOP2Lc1A+L/OtZnfUCGg=; 
 b=YSM4RwS7CdHSnR+0/wj3NkKaYPdb8BQMtAEziLOQcxwkPe9/QKvEdRkHFuu4acYaPhCAZZ/XqsAVVvFCnavjVcdiWmd6UxGQahaNQvosfO3FbvUA1sz+RO4zEfCX+7TH5+d1HFxLDiThiBSa/dJ3aOOkkRElub6uX4Kx9nD51vc=;
X-UUID: 1a3659535a69490fbf2db03b71eb9899-20200729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1273855762; Wed, 29 Jul 2020 02:07:30 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 03:02:37 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 18:02:27 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 18:02:26 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v2,0/3] add watchdog support for mt8192 
Date: Wed, 29 Jul 2020 18:01:59 +0800
Message-ID: <1596016922-13184-1-git-send-email-crystal.guo@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_060738_355740_C7D92D99 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, erin.lo@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

v1 changes:
https://patchwork.kernel.org/patch/11680495/
https://patchwork.kernel.org/patch/11680497/

Crystal Guo (3):
  dt-binding: mediatek: mt8192: update mtk-wdt document
  dt-binding: mt8192: add toprgu reset-controller head file
  watchdog: mt8192: add wdt support

 .../devicetree/bindings/watchdog/mtk-wdt.txt       |  5 ++--
 drivers/watchdog/mtk_wdt.c                         |  6 +++++
 .../dt-bindings/reset-controller/mt8192-resets.h   | 30 ++++++++++++++++++++++
 3 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
