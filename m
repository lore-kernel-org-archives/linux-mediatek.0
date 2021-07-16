Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28AE7C12002
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 09:11:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E77ED613EE
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 09:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E77ED613EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dVtpuHPk9ONBVI45rMdrfVLb3TEIX2eNpgGyQSn76I=; b=1lGAfmXu/PT75B
	xq8sBN4Oxgsl5fLc/Akzj6ZdaPRaeXS4IRbuUh+VzVWFTdOzHmZyfIsKwlIhQkexiu+AbbtrBy9+j
	GN2Uti5M6o8tt80ufHPf348PEwibes5tBqGezizF1bK/O9IdaPiQDH4fI04Tev38PCb4zEZ3TsOQq
	TcnC5TcD86PLgqa04njFaB9zkaYD0GoPUDmpiNyyHpJlDqtD1JGVUJw2ogMMVL2PYcwSvuODBKwnU
	CI5FQzL1thmqaaO16XmHYPV9YLx2PUZ72LwVr+4CA3+LICJuGkxAuAzaGlgg97qUL11ydPHLyHPpB
	auHsY2iwNa0/Ab8CjqAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4Jsk-003txy-EG; Fri, 16 Jul 2021 09:11:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4JsW-003twg-EC; Fri, 16 Jul 2021 09:11:29 +0000
X-UUID: 6034360f624d4eb8be1162b4a1ec15ea-20210716
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QJPe5Hrz+Ccs/oSD8OMTuwsvU24MenG6++k0YmRyOu8=; 
 b=Z3rjG5ldCmvdR8xfndgP6uRnNJbkrypCkbactu6nJBQF8RUV4Ty76s4qO1KzzIiGGKEWvS1Xa6Har3zJYrfDgjaTJYGhh4KFq4LszK7exkwyiY4yCDik3FnWnM+jRhni+9L9ZQC8/VemurAsAPsqKOvqpHJiQKNcewmRjUsj8nE=;
X-UUID: 6034360f624d4eb8be1162b4a1ec15ea-20210716
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2025127154; Fri, 16 Jul 2021 02:11:24 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Jul 2021 02:09:57 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 16 Jul 2021 17:09:52 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 16 Jul 2021 17:09:52 +0800
Message-ID: <1626426592.29703.2.camel@mhfsdcap03>
Subject: Re: [PATCH 3/8] i2c: mediatek: fixing the incorrect register offset
From: Kewei Xu <kewei.xu@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: <wsa@the-dreams.de>, Matthias Brugger <matthias.bgg@gmail.com>, "Rob
 Herring" <robh+dt@kernel.org>, <linux-i2c@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>,
 <qii.wang@mediatek.com>, <qiangming.xia@mediatek.com>,
 <ot_daolong.zhu@mediatek.com>
Date: Fri, 16 Jul 2021 17:09:52 +0800
In-Reply-To: <CAGXv+5EOkBvxyigPF8vgnYXfF5Qz472aonPzB-Yw0n=XQU+03g@mail.gmail.com>
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
 <1626316157-24935-4-git-send-email-kewei.xu@mediatek.com>
 <CAGXv+5EOkBvxyigPF8vgnYXfF5Qz472aonPzB-Yw0n=XQU+03g@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FC0D5B6CA3B4A06A7DB943822C655303E4E0D63BA706CBC4E3367977457C91722000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_021128_521425_7CF1F49C 
X-CRM114-Status: GOOD (  14.45  )
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

On Thu, 2021-07-15 at 13:23 +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Thu, Jul 15, 2021 at 10:31 AM Kewei Xu <kewei.xu@mediatek.com> wrote:
> >
> > The reason for the modification here is that the previous
> > offset information is incorrect, OFFSET_DEBUGSTAT = 0xE4 is
> > the correct value.
> >
> > Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>
> 
> This needs a fixes tag:
> 
> Fixes: 25708278f810 ("i2c: mediatek: Add i2c support for MediaTek MT8183")
> 
> Otherwise,
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Hi Chen-Yu,

OK, I will resubmit a patch to add a fixes tag.

thanks
Kewei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
