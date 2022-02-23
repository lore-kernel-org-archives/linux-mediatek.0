Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C2BC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 03:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TqL9x1I0uCx0KZFNPhchVSrpd+POIldijt/XM/AWoiY=; b=X24X7RonsXexkC
	GFIVDJ9cxSp94WL+M+YK2Ia9QUaAuj28ybLtkfoSMVQAuyhOP+Ri9eUQsJOpdt6PKw8i3YyQytrdT
	SBvP70/4CntYXOg36Gy/o8k7RXMtOVAb2hv7jpH3+C16xXlFBp9fK9Ujm6vAk/P5DUD5r6EX90eWN
	6PA6PK+DwhHTjR787fsqe2Zx167KAinefNlNL0VGWvmD8cDBnGVyXz1dGblcWZE6RGAMyQTKQAqKg
	AsrslqoyeDncQEOzkkqBSPyoOGcZtGSNtyKsa/YouHhTpmV6L8FB5c/6Q07T79Poa8HlzjMUayXzU
	wG7gHgnj0ReZP5gZdC0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMice-00CblZ-Me; Wed, 23 Feb 2022 03:47:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMiaw-00Cb5v-93; Wed, 23 Feb 2022 03:45:39 +0000
X-UUID: 0a9b1f50f6274048b80fadcba09230fa-20220222
X-UUID: 0a9b1f50f6274048b80fadcba09230fa-20220222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1330703383; Tue, 22 Feb 2022 20:45:29 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Feb 2022 19:38:55 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Feb 2022 11:38:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 23 Feb 2022 11:38:47 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>
Subject: Re: Share the maintain loading of Mediatek SoC driver (the display
 related part)
Date: Wed, 23 Feb 2022 11:38:47 +0800
Message-ID: <20220223033847.3701-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAAOTY__wJw2QmathuWe9fJsNb=evUbGEFHAZzv9VuzXyL5GK3w@mail.gmail.com>
References: <CAAOTY__wJw2QmathuWe9fJsNb=evUbGEFHAZzv9VuzXyL5GK3w@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_194538_365547_CDCA2A62 
X-CRM114-Status: UNSURE (   7.37  )
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

Hi Matthias,

>Hi, Matthias:
>
>It seems that you are so busy that you do not frequently review
>patches. I would like to share the maintain loading of Mediatek SoC
>driver (the display related part). I list some choices:
>
>1. I would be the sub-maintainer of Mediatek display related SoC
>driver: I pick patches and send pull request to you. This would mostly
>share your loading.
>2. I would be the reviewer of Mediatek display related SoC driver:
>After I reviewed these patches, you could take less effort to review
>these patches.
>

I'd like to share the loading, too.
I think I can start from catching common mistakes I learned from
your reviews.

How do you think?

Cheers,
Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
