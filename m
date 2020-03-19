Return-Path: <SRS0=inF0=5E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0815C4332B
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 09:56:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97DE620732
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 09:56:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ftWbWlWy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oY66sdEF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97DE620732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mK73SAafwrE3ooZSRf0132ewvqjYbKYi8UWvC67U0/w=; b=ftWbWlWy6vLLwY
	c98Z0n8aJSE19U2oCt/Ys/5GB/okfeewnxfk5s8wZJFFuOU3eTnczbiep7BhIyqd6Ng369crNrNu+
	VdDY+qMUAH7jlLd/5izc29zXIyzpxTu57vFpMSzDfAtby/fAtG1ZPlCdE1KZI3MCvqQbdQPdmvNA8
	WqZ1rtPBcdZlgcAxwOEg6jkRqUyFPw4ScKEc6Qaf3BM/bhlUezr4v58jDwQNjzaU7F/08yzczFHLb
	PVfy0K2dl56LkYpp0yZgJB7e0jedq0j2NB8+SNb0KRk4DpG9rDR/VmGTGa7cIgWU7TaaVI0sgjtau
	06BROT3AvG83CQJd0Shw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jErty-0002R2-9C; Thu, 19 Mar 2020 09:55:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jErtk-0002GR-HQ; Thu, 19 Mar 2020 09:55:34 +0000
X-UUID: acfaec9ac72644cb9f3e84107b496905-20200319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=eAP4t7CT+ZTox+ouHvAMB5H/l5cIuHdf3USlLwvMS5Y=; 
 b=oY66sdEFmCBVNQ9ZuL0OkbFWGhHr4c8T4PiH2eMs3xZqOQzCHvCOTlUakqaTtkbu6HK5y8KTiXCyegD0WVnABFhPHj2gh+SruiFYL3Suv8hP8nzuWYTPUqDr3Igne3UALiDOKnAo1xocp3F5HRtethedgR1ly/NMUx759/+0T3o=;
X-UUID: acfaec9ac72644cb9f3e84107b496905-20200319
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <henry.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 834903801; Thu, 19 Mar 2020 01:55:26 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Mar 2020 02:55:25 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Mar 2020 17:52:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 19 Mar 2020 17:52:16 +0800
From: Henry Yen <henry.yen@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 0/2] Add Mediatek thermal driver for MT7622
Date: Thu, 19 Mar 2020 17:54:51 +0800
Message-ID: <1584611693-3553-1-git-send-email-henry.yen@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: CE5A3A715436CF45EA217465AFB9DE324815F7979766A429500461C9CCCC66552000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_025532_741064_93B48542 
X-CRM114-Status: UNSURE (   6.53  )
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
Cc: Steven Liu <steven.liu@mediatek.com>, Henry Yen <henry.yen@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Michael
 Kao <michael.kao@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Mediatek owns two thermal systems, which are almost the same except for
the way of reading calibration data and converting temperature.
MT8173, MT2701, MT2712 and MT8183 belongs to version 1 thermal system,
and MT7622 belongs to version 2. The current code has already supported
version 1 system. Then this patchset adds the support for another
platform (e.g., MT7622 SoC).


Henry Yen (2):
  thermal: mediatek: prepare to add support for other platforms
  thermal: mediatek: add tsensor support for MT7622 SoC

 drivers/thermal/mtk_thermal.c | 244 ++++++++++++++++++++++++++--------
 1 file changed, 189 insertions(+), 55 deletions(-)

-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
