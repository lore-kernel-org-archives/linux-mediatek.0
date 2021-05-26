Return-Path: <SRS0=P9v4=KV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B260C4707F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 01:54:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1E886141C
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 May 2021 01:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1E886141C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p+ZVTyx6NbPzdejhVfZgV4oL3BRyxUyAlFqmigIse+g=; b=qsWozocKnZ3R+P
	GP4Q57Dg2EDeBx8vyXJ9SyoQQ6Pb4wKg7IIo3xExBN6Z5iWpmnTIyQJ5E5fNafWqI6KNPd0Rjtmf0
	0CcoUK5M4o9DHoGEmsmJd1/4ZP+0GAoKtYxQN+ACNiG8TxXnT1EO7P24hTMW6wm1r/LUvDc5O0CQL
	9zIQ9FZMSsFXp6ardpTekwsB8PKPwkORBDEEW34UJDZEOxkDjS/n54MpW4Rz6fZrOy/suiWxjhcBh
	YiB34d242xUVYd9sbcARmzVTlbVsqVvQLx0vf3bsPJ3uhRZZ3QmMSSvpgQem2U3DuAYb9el/zOxhH
	iLnj8zZdmC38OKcXp8yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llikX-009wAF-5X; Wed, 26 May 2021 01:54:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llikT-009w8d-Qq; Wed, 26 May 2021 01:54:19 +0000
X-UUID: 0893ae4cc663468b9c4b895233bf18ac-20210525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OL48yFH+2xYnJfSiWPGce5BsZriz5riusFvvUVxlXRA=; 
 b=YciqDgZCYJ7uTw7LyNJbn7sg1g8z7l6i4WkMEm2sh1dMlFmLWPNPBg2j7OTTukFuUaYiPTB8+h/5uG+Svm/pL06gdzTZsBgIIZYDR74OoYj+LUaanfBWOgOOBrlK8gYj7EnYzOGvRnaAKIf96AZVxc5g22Ypl3IFOQj81b9VqiQ=;
X-UUID: 0893ae4cc663468b9c4b895233bf18ac-20210525
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1356368615; Tue, 25 May 2021 18:54:11 -0700
Received: from MTKMBS33N1.mediatek.inc (172.27.4.75) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 May 2021 18:54:08 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 26 May 2021 09:54:04 +0800
Received: from [10.16.6.141] (10.16.6.141) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 26 May 2021 09:54:03 +0800
Message-ID: <1621994043.32080.9.camel@mszsdaap41>
Subject: Re: [PATCH v2 1/3] pwm: mtk_disp: clear the clock operations
From: Jitao Shi <jitao.shi@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, "linux-pwm@vger.kernel.org"
 <linux-pwm@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, 
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>, Eddie Huang
 =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?= <eddie.huang@mediatek.com>,
 Cawa Cheng =?UTF-8?Q?=28=E9=84=AD=E6=9B=84=E7=A6=A7=29?=
 <cawa.cheng@mediatek.com>, Bibby Hsieh
 =?UTF-8?Q?=28=E8=AC=9D=E6=BF=9F=E9=81=A0=29?= <Bibby.Hsieh@mediatek.com>, "CK
 Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?=" <ck.hu@mediatek.com>,
 "stonea168@163.com" <stonea168@163.com>, Huijuan Xie
 =?UTF-8?Q?=28=E8=B0=A2=E6=85=A7=E5=A8=9F=29?= <Huijuan.Xie@mediatek.com>
Date: Wed, 26 May 2021 09:54:03 +0800
In-Reply-To: <YDO/0Onf6a09YRsP@ulmo.localdomain>
References: <20210130141226.25357-1-jitao.shi@mediatek.com>
 <20210130141226.25357-2-jitao.shi@mediatek.com>
 <YDO/0Onf6a09YRsP@ulmo.localdomain>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: EAF69C26BC8B6484722F8C014C612CE0297C6B427E74CF4A88B0DBC3B5786F2F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_185417_898816_20DD42BC 
X-CRM114-Status: GOOD (  19.10  )
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

On Mon, 2021-02-22 at 22:29 +0800, Thierry Reding wrote:
> On Sat, Jan 30, 2021 at 10:12:24PM +0800, Jitao Shi wrote:
> > Remove the clk_prepare from mtk_disp_pwm_probe.
> > Remove the clk_unprepare from mtk_disp_pwm_remove.
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > ---
> >  drivers/pwm/pwm-mtk-disp.c | 23 ++---------------------
> >  1 file changed, 2 insertions(+), 21 deletions(-)
> 
> It's not clear *why* you're doing this change. It's already obvious from
> the changes in this patch that you're removing the calls to
> clk_prepare() and clk_unprepare(), so instead of duplicating that
> information in the commit message, take this opportunity to describe why
> this change is needed. Without any further context, this would seem to
> just break operation of this chip because now these clocks are never
> enabled in the first place.
> 
> Thierry

Thanks for your review.

I'll update the commit message next version.

The original issue is the clocks doesn't be disabled when system enter
standby.

Then I adjust the the clock sequence. and Uwe subject convert thelegacy
APIs of .apply().
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
