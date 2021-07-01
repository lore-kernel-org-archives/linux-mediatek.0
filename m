Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A3DC11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 11:29:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0192061467
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 11:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0192061467
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BdfgOHpWzVzmivBokuh8ky2nzTjBOFhHY96n5kbW7k=; b=oQCCaK3VhAa0w+
	OjoKwepktayIcpr0rKqIkhNdPHNcQrm/AxTT3Z+UCc1egJJaoci/43YEpE0n/4kLvTYd7REY32oms
	dZZ8trUoln8+TR3O3Nm4tyMOooR5mj+KWtzuTP0/GIWT/LgJkg45d5kxFNi4waP3fGOr9lQ1poO+n
	AEVeedM+bSJIezCmo1RvvSU9A0Ol1vriPzcnLr7m7LI3uJI5ULLRv04VVxAfPEWHZtp4TnS6VbiRD
	mcJfOBW7xFKvOVTgzXgVOJX0eaViIvDuel740f33WZGjyO/OQU/ZJyHUd0Y6rRF/IHkNr2twXBimZ
	VNGzmSjGFjEQlcVMoD9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyut8-00H2ct-MF; Thu, 01 Jul 2021 11:29:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyut5-00H2c5-PX; Thu, 01 Jul 2021 11:29:45 +0000
X-UUID: 7ec952e363eb46108e659371e8316cc9-20210701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=O7mnMgacfM+PDoX+KrXWapm3R0wi39txk8DWCXpl9Ug=; 
 b=N4LsFibUzIlRdkb+LFMyWrUKAVy4VKtoaLFYT+sTIcsUujH1T5GRNwGNZWNWiSygUCpefWVsGi+0fwfIoxJ2XXfxUJm+xFYcroJRQwfLdTEgX1D5FfP3a4H0WfDFGnl06FmRYi3t0zCvmW06A3Xu0T0YYsmAZiQD4gw41/crydE=;
X-UUID: 7ec952e363eb46108e659371e8316cc9-20210701
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 327973089; Thu, 01 Jul 2021 04:26:49 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 1 Jul 2021 04:26:47 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 1 Jul 2021 19:26:41 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 1 Jul 2021 19:26:40 +0800
Message-ID: <1625138800.17751.2.camel@mhfsdcap03>
Subject: Re: [PATCH v2] pinctrl: mediatek: Fix fallback behavior for
 bias_set_combo
From: zhiyong tao <zhiyong.tao@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: <hui.liu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Sean Wang
 <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-mediatek@lists.infradead.org>,
 <linux-gpio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Date: Thu, 1 Jul 2021 19:26:40 +0800
In-Reply-To: <CAGXv+5Ecbttkw1AAG5KofoR1oDW-ot68BL1OR=Jpiii8v8DTyw@mail.gmail.com>
References: <20210701080955.2660294-1-hsinyi@chromium.org>
 <CAGXv+5Ecbttkw1AAG5KofoR1oDW-ot68BL1OR=Jpiii8v8DTyw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 94021A8371E21F668833002CF2AEE8052927E0CD0813736C787753A19F2D86B22000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_042943_874360_5870C2B9 
X-CRM114-Status: GOOD (  12.28  )
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

On Thu, 2021-07-01 at 16:41 +0800, Chen-Yu Tsai wrote:
> On Thu, Jul 1, 2021 at 4:10 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Some pin doesn't support PUPD register, if it fails and fallbacks with
> > bias_set_combo case, it will call mtk_pinconf_bias_set_pupd_r1_r0() to
> > modify the PUPD pin again.
> >
> > Since the general bias set are either PU/PD or PULLSEL/PULLEN, try
> > bias_set or bias_set_rev1 for the other fallback case. If the pin
> > doesn't support neither PU/PD nor PULLSEL/PULLEN, it will return
> > -ENOTSUPP.
> >
> > Fixes: 81bd1579b43e ("pinctrl: mediatek: Fix fallback call path")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Zhiyong Tao <zhiyong.tao@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
