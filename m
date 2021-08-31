Return-Path: <SRS0=bg5C=NW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44768C432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 07:27:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C153603E9
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Aug 2021 07:27:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C153603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=msUjcTg8g6x+nWNZiIauZJ4uOQ6yIk8CooPkhp63s3g=; b=BOdW22/JOozIDm
	zzXibJESK3LwXpms/4zWGhk6ro9q+r3fuTvZayMrNmbBkB7A8dZRYNMSol0bf/NeEuQfpR5PXz0Ok
	2GaBjki2eNVa6PUrLv3DlHdRbp4rxrwEJCWQfhvpwZGA9wzRMbFiJJx+M9SSzxDcniynEHUe67eOq
	7tD1be7GLjQXYB/Y0FlUkJ8w6Ex6J0PvHiXwFi9nZfRChp6Qwo+OUOuNumJ9qJGc9zZuRyAvyfnMl
	XJVfsEmEEkcW5H5+/HnSZWNP+N6OwEuSbNkdtvIcCOsu1gBFojbsQfHjNoxB0c6KC09o3UZA93cAZ
	m+ds/4mH54yC33x97cfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKyAb-001dNT-HY; Tue, 31 Aug 2021 07:26:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKy8D-001cDM-Ow; Tue, 31 Aug 2021 07:24:35 +0000
X-UUID: 277c30bd4b92426b9a674cb1c428564a-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8w6G2IE3sjCnMBO0KwY4vI3XXmg7cJyry2Y2ZvnNaH8=; 
 b=Og6vcPsoAhjl8uCcA47yueE/9d7fOiz8EzLlEl2cq08iT+qdY4BEaeEg5plvDza8AGyk7fQ/HaNuldO7jRqIpCwN4E33ofBcwyhPaErP5+mlGG0Rj8QFANcU3W6PG/Gl/UEV7tmvrxKRX6ABazVTJ+LOjYJp8C1Zln1G/3JSzRk=;
X-UUID: 277c30bd4b92426b9a674cb1c428564a-20210831
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1736225035; Tue, 31 Aug 2021 00:24:25 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 00:14:23 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 15:14:22 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 31 Aug 2021 15:14:22 +0800
Message-ID: <81f4cecd13cd40fcbcdb980bf18375a4a894b118.camel@mediatek.com>
Subject: Re: [PATCH v6 0/5] Add gce support for mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, <hsinyi@google.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>, Devicetree List
 <devicetree@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Date: Tue, 31 Aug 2021 15:14:22 +0800
In-Reply-To: <CABb+yY0rTZrM1J7mFbSf0Z5tdwjYsQ8Tff-DnVfxX8P4HRu01w@mail.gmail.com>
References: <20210825094120.5005-1-jason-jh.lin@mediatek.com>
 <CABb+yY0rTZrM1J7mFbSf0Z5tdwjYsQ8Tff-DnVfxX8P4HRu01w@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_002429_887262_E33B1E68 
X-CRM114-Status: GOOD (  13.53  )
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

Hi Jassi,

Thanks for the reviews.

On Mon, 2021-08-30 at 00:34 -0500, Jassi Brar wrote:
> On Wed, Aug 25, 2021 at 4:41 AM jason-jh.lin <
> jason-jh.lin@mediatek.com> wrote:
> > 
> > Change in v6:
> > - remove the unused define in GCE header file.
> > 
> 
> Please rebase the patches over other previous mtk patchset for
> mt8192.
> 
https://urldefense.com/v3/__https://git.linaro.org/landing-teams/working/fujitsu/integration.git/log/?h=mailbox-for-next__;!!CTRNKA9wMg0ARbw!0KekHANUMQQ7OdH-ky0ch1rSc7kOn3NPFAOjLrsrzsd0Z2rFvysSFRAr3R6adYRnAfJ4$
>  
> 
> Thanks.

OK, I've rebased on mt8192 series at v7:

https://patchwork.kernel.org/project/linux-mediatek/patch/20210831070903.8672-2-jason-jh.lin@mediatek.com/

Regards,
Jason-JH.Lin
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
