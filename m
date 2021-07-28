Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7694C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 05:21:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C566060F91
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 05:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vCsTcabPd26XHpNdDB/ATxneQCG0Q8Ztr3ErWjghWg8=; b=5BxN3okt/toL9n
	QegmgO82xneQ2j+K1KAMh9Z0ShWQ1CTuMo4dJOmJTXRgy9SRBqKoOxTfw3aVpy+UieUP8u74amc2O
	umMvhU6UYuaFyqNWAzBim/lS3ozdr8SczMF/ZlbvpugP8LMOBEE70HnMdiW6m50+Xrt8+DhvGawuK
	ZbkCtgbBr/cNtTSZuit8kWgWQ1SOGzwc4/xg7ibeJvg86/wmVJIOwW+LC5YyFraXPNH5xozEYBwfS
	cJTD1swE6kwAm0WCJ7zg0N1v8A7xYMm4MfIDhjskBiBtKfuxzhrdRr6/ebFicBLFFQb2ZakELvwjm
	d0cbhjpCrh6U7yg5hvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8c0V-00H7kS-2y; Wed, 28 Jul 2021 05:21:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8c0F-00H7ge-CV; Wed, 28 Jul 2021 05:21:14 +0000
X-UUID: b47da3b9434c44ba9d3c88828377e4eb-20210727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=K31VI0Q2wfSoWAA+OtQW+zkU6Kz1I+iyytddAARfBA8=; 
 b=ZB0vQuQvmSEEJiM2x7ATikZYSlvnpIzEb511mg+rhTsUnmcderm2N9o3bHjz53MsBDTsAK3nitcZ/ykb90ehPIdifMpSf0qD6+VTZ6S45OXZnlPz5pkD/0CgWGCMlQnN+yI7kDRiX5Qfj+qPUuIja+3kJrelS+eqbMfGLItS4Y8=;
X-UUID: b47da3b9434c44ba9d3c88828377e4eb-20210727
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1912859015; Tue, 27 Jul 2021 22:21:08 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Jul 2021 22:21:06 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Jul 2021 13:21:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 28 Jul 2021 13:21:04 +0800
Message-ID: <c8860122beb3263025fad139e507f496bd563820.camel@mediatek.com>
Subject: Re: [PATCH v2 04/14] dt-bindings: reset: mt8195: Move reset
 controller constants into common location
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>
CC: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, devicetree
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>, linux-kernel
 <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Date: Wed, 28 Jul 2021 13:21:04 +0800
In-Reply-To: <CAFqH_50qC985oTcPWDLRJt6yVvwtHsizPOTnTMBh84m6Hy6hFQ@mail.gmail.com>
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
 <20210722094551.15255-5-nancy.lin@mediatek.com>
 <CAFqH_50qC985oTcPWDLRJt6yVvwtHsizPOTnTMBh84m6Hy6hFQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210727_222112_893357_116E6F47 
X-CRM114-Status: GOOD (  23.31  )
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

Hi Enric,

Thanks for your review.

On Fri, 2021-07-23 at 13:10 +0200, Enric Balletbo Serra wrote:
> Hi Nancy,
> 
> Thank you for your patch
> 
> Missatge de Nancy.Lin <nancy.lin@mediatek.com> del dia dj., 22 de
> jul.
> 2021 a les 11:46:
> > 
> > The DT binding includes for reset controllers are located in
> > include/dt-bindings/reset/. Move the Mediatek reset constants in
> > there.
> > 
> 
> I think that the patch that introduces mt8195-resets.h into the
> reset-controller directory didn't land yet, please sync with the
> author of that patch and just put it in the correct place the first
> time.
> 
> Thanks,
>   Enric
> 
OK, I with sync with the author.

> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > ---
> >  include/dt-bindings/{reset-controller => reset}/mt8195-resets.h |
> > 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  rename include/dt-bindings/{reset-controller => reset}/mt8195-
> > resets.h (100%)
> > 
> > diff --git a/include/dt-bindings/reset-controller/mt8195-resets.h
> > b/include/dt-bindings/reset/mt8195-resets.h
> > similarity index 100%
> > rename from include/dt-bindings/reset-controller/mt8195-resets.h
> > rename to include/dt-bindings/reset/mt8195-resets.h
> > --
> > 2.18.0
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
