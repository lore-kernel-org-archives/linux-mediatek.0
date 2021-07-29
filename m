Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98173C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 06:45:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EF0861019
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 06:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EF0861019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject:
	MIME-Version:References:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qlYq2FpwOGGy68irkmYJAq+w39C4eBTeV9WhIZ7IABw=; b=K6RGoGru/6ABgZOJkA6zrIrlOJ
	5Ut3lKC5jnh7i7iL7ZQd+besD7tcSuZ3x4lw/XqAFjw/73T5PLHKVNkRfv2sJu5xSJN356OJPrTm/
	EMbOiX0ENApSWCE4TbCkNeeiYGD9SSMZh/hmC6cAUvbILD8RzRWZlTchjH8LRSbkswSIlNQ91qX1C
	RggweFVfPHVQOaah0lHphusNWtE8mauiGobWx785WPCfFH9jRTzZq+8mHkWG+K1GJsyMAUbGIkbGZ
	issql1PGrdymUS29qM3BlsWC2bfcdv7Hc+pQf92YL/1GQi7tNEKY7F/M8qeLKNtG7LpLxrF+AJ4xA
	WI46aRvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8znT-003GxU-8m; Thu, 29 Jul 2021 06:45:35 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8znF-003Guc-3A; Thu, 29 Jul 2021 06:45:22 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout1.routing.net (Postfix) with ESMTP id A70AC3FC27;
 Thu, 29 Jul 2021 06:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1627541118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O0SXPPo0VcEtFyVi5Gn0sJ9VFvQaS1vXTYsU5lQjSUw=;
 b=oFbGNazgU/cZbRAXZnVqNf6Cx1g19coGGvFMICpShzsI5qb/5adNyMbodOAu1fREOBn2/e
 mceerDV+ov4ewN6WSxvSo22vg6G162PPcuT0qAXM7rRaKvc2g7Ui2W26xJu8mSvGcCeLyB
 AmfMLsjG4fpq8ajhOnc3/9tlf+2Hiwc=
Received: from frank-s9 (fttx-pool-217.61.146.92.bambit.de [217.61.146.92])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id DE8263600A5;
 Thu, 29 Jul 2021 06:45:17 +0000 (UTC)
Date: Thu, 29 Jul 2021 08:45:12 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAJMQK-iHfJWnGQRq299pZ9B9ABMsXPEkptyCrGtQqkEyc=HNFg@mail.gmail.com>
References: <20210727174025.10552-1-linux@fw-web.de>
 <CAJMQK-g8g5QJbBkU-A6th1VSWafxVv2fGtym+enQa_hDVaVoBw@mail.gmail.com>
 <97C4FA94-B28A-4F0E-9CD3-4E33B01BA353@fw-web.de>
 <CAJMQK-gQeMidjBZ1E=ReMmffC5G8oiFawB4Ey1PNb2ZWXw_1Bg@mail.gmail.com>
 <6BFE13A3-6A42-455E-BDF7-CD285CC6C66D@fw-web.de>
 <CAJMQK-iHfJWnGQRq299pZ9B9ABMsXPEkptyCrGtQqkEyc=HNFg@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH] soc: mmsys: mediatek: add mask to mmsys routes
To: Hsin-Yi Wang <hsinyi@chromium.org>
CC: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>
From: Frank Wunderlich <linux@fw-web.de>
Message-ID: <85C44C40-9238-49A2-B878-DEB189671324@fw-web.de>
X-Mail-ID: 13508637-946f-43e1-a8f6-3888b1e327ce
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_234521_469585_3E2DE2F6 
X-CRM114-Status: UNSURE (   6.33  )
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

Am 29. Juli 2021 07:58:17 MESZ schrieb Hsin-Yi Wang <hsinyi@chromium.org>:

>Should I create another patch based on this or can you help update the
>mt8183 table in this patch?

I prepared a patch for mt8183 and it is
reported as working. I send out v2 with
the patch squashed ok? It adds only val
again to each element so i take the
review-tag,ok?

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
