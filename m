Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEF6C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 05:41:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84FBE60462
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 05:41:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84FBE60462
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fw-web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject:
	MIME-Version:References:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JZAbS+noc8inHBQmB7fXyuATYslBQ/fr3OoC7rhmV8Y=; b=QahfVr4aI20txyh6SWAdmpE+xV
	QiR5LYUIe8tXxxI6nGb3PH5GXGKLAkxeQJJ6v99PhBCZ9+pcv6+2OT+dlNkjDqz+8WPny0tWmrzPa
	yVQ8gsXa+47o69Pye0EfhOH/tsu7NkKfvcCuf/B9jecJMNj+mlWzFyg8Xhe+dM5s5IQrW96MJEQEU
	sy4ZylkyX74Inow5IxlEGNXoU0vHvLkfMWO3ycFm4+vj1PQiNawdVwYh+vrlo/flWabQG9n//xv/b
	siwAoWcexDFv3kdgXetzrh3G5td8W06DDFf6feVKWLCXzKxbyRuYQ9UdUVUSbWu/lQ91X19raKXjM
	Y1yvbkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8ymt-0039hc-5y; Thu, 29 Jul 2021 05:40:55 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8ymf-0039fx-Fc; Thu, 29 Jul 2021 05:40:43 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
 by mxout2.routing.net (Postfix) with ESMTP id 77C505FC17;
 Thu, 29 Jul 2021 05:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
 s=20200217; t=1627537236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jEsruzU+4ZgtOcGuhFC39Opvs7D5hrM/mEZ+uIBk0/g=;
 b=mUFYjuJzoy+38C6KLbFboT9kugZhO3AUS57Qtg6KO5HtMOoznN+urOykz6Ikh8mUHIZgGZ
 VZVN6RHYSTpNzbtEtiRKZrqYKiFXCT6oJPUmVGVMV2pWEEMGqekp+y7b7mKRLI+8BMR3E7
 YcZaDjq5KGhgp1aOn0ghwXbUIZd3uis=
Received: from [IPv6:2a01:598:a001:9235:1:2:c0e0:123a] (unknown
 [IPv6:2a01:598:a001:9235:1:2:c0e0:123a])
 by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 971483600A5;
 Thu, 29 Jul 2021 05:40:35 +0000 (UTC)
Date: Thu, 29 Jul 2021 07:40:30 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAJMQK-g8g5QJbBkU-A6th1VSWafxVv2fGtym+enQa_hDVaVoBw@mail.gmail.com>
References: <20210727174025.10552-1-linux@fw-web.de>
 <CAJMQK-g8g5QJbBkU-A6th1VSWafxVv2fGtym+enQa_hDVaVoBw@mail.gmail.com>
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
Message-ID: <97C4FA94-B28A-4F0E-9CD3-4E33B01BA353@fw-web.de>
X-Mail-ID: df228ebd-c9bf-4ff0-8dcf-16b80d1c6270
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_224041_855451_5BAD6B47 
X-CRM114-Status: UNSURE (   8.04  )
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

Am 29. Juli 2021 05:15:23 MESZ schrieb Hsin-Yi Wang <hsinyi@chromium.org>:

>This patch is breaking the mt8183 internal display. I think it's
>because  ~routes[i].val; is removed?
>Also what should the routes[i].mask be if it's not set in
>mmsys_mt8183_routing_table?
>
>>                         writel_relaxed(reg, mmsys->regs +
>routes[i].addr);
>>                 }
>>  }
><snip>

The mask should reset the needed bits,maybe it needs to be adjusted for your ddp components...

Can you add some debugs inside loops in mtk_mmsys_ddp_connect and mtk_mmsys_ddp_disconnect (show read val,mask and final mask before write) to show differences before and after the patch?

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
