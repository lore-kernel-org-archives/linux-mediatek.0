Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCEC9C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 00:47:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F0AB613A1
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 00:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F0AB613A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sI49vcj8s7XFFQiZmKpGj361knCxCeHvu2wFRZ3O8c=; b=ADG7JdwvO4uD2H
	5q73dQduNkmf/TQqASDji7F6HQsCmWrZ4pD0O6I6yrjpRW1QLt3lef5oZmFMBJmsKSpV9eXaQd4q5
	DYuwqtKFZrRKnuNzT5MJPGs3A4GTfx7llx4dPILWAPTgPItRQV8rO6t2WLzKDDcSjdbrGNwSLIfa7
	BvM6ZgfEgvUBcPbMyARI5FpyA8D9+AszXXCyHTO88jaE8XPQSFVFKlsnd4+b5eqWtdRSDIVeOelGs
	SEmd4usOeA38M4/lZYbXbekW7k6+owd26KjqhC6tI1BJtS1SfXpZhfnQIVhYalmxVZLzzvkAe7SVy
	1iW62rAfcoY344txBkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFQmh-00Fuao-8G; Mon, 16 Aug 2021 00:47:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFQmR-00FuZQ-WB; Mon, 16 Aug 2021 00:47:11 +0000
X-UUID: 6b30e77c21f4423c965711d679f3e2f4-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=sAaOLYBjvsYR1Acs6Grr3F+AAV0ocb/raZ96GUdQ1qo=; 
 b=Ky4ntzBfAuGDi3CtyNxJ9TW36/p3TwrvgdLa7yXgAGkqi3x7u9QSOPn0hBqb785xmVD2w9G+tTdKwIhULEYIB37ggbOf2LisfpAC9RbC8CZuJWzsWSrdY/KWeta3TTHoUOIdpVstIIpvN/1Jf4sT6EiT9vioznLfoWG2Y3eb9s0=;
X-UUID: 6b30e77c21f4423c965711d679f3e2f4-20210815
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1503149526; Sun, 15 Aug 2021 17:47:05 -0700
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 17:47:03 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 16 Aug 2021 08:46:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 08:46:56 +0800
Message-ID: <8324f3197f20dfec3e0d7ea8f32bac75b739eea5.camel@mediatek.com>
Subject: Re: [PATCH v6 1/9] mtk-mdp: propagate errors from clock_on
From: houlong wei <houlong.wei@mediatek.com>
To: Eizan Miyamoto <eizan@chromium.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
CC: "wenst@chromium.org" <wenst@chromium.org>, Yong Wu
 =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?= <Yong.Wu@mediatek.com>,
 "enric.balletbo@collabora.com" <enric.balletbo@collabora.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, Andrew-CT Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= <Andrew-CT.Chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Minghsiu Tsai
 =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= <Minghsiu.Tsai@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date: Mon, 16 Aug 2021 08:46:57 +0800
In-Reply-To: <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
References: <20210802121215.703023-1-eizan@chromium.org>
 <20210802220943.v6.1.I9db0d408ef79d300672ec0311a6bee9556801631@changeid>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: CE6BE3BDA54DFB4013AD420CB44134AF67E90702D765D0A01BFC378D53FE42952000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_174708_085408_729D7F84 
X-CRM114-Status: UNSURE (   7.47  )
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

On Mon, 2021-08-02 at 20:12 +0800, Eizan Miyamoto wrote:
> Up until this change, many errors were logged but ignored when
> powering
> on clocks inside mtk_mdp_core. This change tries to do a better job
> at
> propagating errors back to the power management framework.
> 
> Signed-off-by: Eizan Miyamoto <eizan@chromium.org>
> ---

Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>

> (no changes since v1)
[...]
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
