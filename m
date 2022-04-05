Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 653FFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Apr 2022 04:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FjxrnS4vVMHkjSBtWT3DJ3quIf/YyFA5pbgYn90HGao=; b=R9dHAvcrAk6FLp
	+jMHNfcefrZm+aQ0w8PzvklHHecqQKgtnsLH+FlCF2OX8NbmP0zgIUXlOF/tNVgiU6Av7ciP8nylA
	dH9MHMYwrgOSI6ZMGAbHji85azM7E1Hahp/DEd2SVFCKOXbJNjcLNG7OXvhXgmMUiBILXpoetK1Uy
	t4eX3SQT5YhfmDFqAMRaaDWnLjnClkq63EAvl1wRNC02fsyXamLsQljvBbSCPgyRPUZ5toXz2X/3C
	WA7LFnJWXsD9885p6nqZjqSv0Jw7lSlf3BQSM4KYGzKX8x0ptIwEL0gUYXw+lZcI51V3CuisP0MFR
	pJpFz/pBGd1z7WnCZX3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbaWp-00H3wP-2N; Tue, 05 Apr 2022 04:10:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbaWm-00H3vq-JI; Tue, 05 Apr 2022 04:10:50 +0000
X-UUID: b38b992ebac640779462b2ae5d0c0fa1-20220404
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DQouUMdTQumf6TOmOTGFpkuHNijy1EEtI8U+i1BoQ3c=; 
 b=nTtUMsaIzHkyd98sH3+0N0L0FyS30r4Zz9lwaap+0xJcRzGTVGHig9O60nu+p424AfDGSxYix1sKurMWD0XdSGXMS8KFIeqA0ERxWx0r82yvVPJxC/mFh5HbDki3o1F8QPPbN7n6qtFQi3/68IXczxPvm478XkpkdGl9nCy2kKo=;
X-UUID: b38b992ebac640779462b2ae5d0c0fa1-20220404
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 873062367; Mon, 04 Apr 2022 21:10:43 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Apr 2022 21:06:38 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 5 Apr 2022 12:06:30 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Apr 2022 12:06:29 +0800
Message-ID: <6a29c32f42c25ec6e19de0db999ac7ca25869c36.camel@mediatek.com>
Subject: Re: [v3 15/19] ASoC: mediatek: mt8186: add machine driver with
 mt6366, da7219 and max98357
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <broonie@kernel.org>, <robh+dt@kernel.org>
CC: <aaronyu@google.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, 
 <tzungbi@google.com>, <julianbraha@gmail.com>,
 <alsa-devel@alsa-project.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 5 Apr 2022 12:06:29 +0800
In-Reply-To: <d13b7bb3-989c-55eb-c7b9-41836ccb95a9@collabora.com>
References: <20220313151023.21229-1-jiaxin.yu@mediatek.com>
 <20220313151023.21229-16-jiaxin.yu@mediatek.com>
 <d13b7bb3-989c-55eb-c7b9-41836ccb95a9@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_211048_840643_2FAD2976 
X-CRM114-Status: GOOD (  21.36  )
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

On Mon, 2022-03-14 at 11:44 +0100, AngeloGioacchino Del Regno wrote:
> Il 13/03/22 16:10, Jiaxin Yu ha scritto:
> > Add support for mt8186 board with mt6366, da7219 and max98357.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >   .../mt8186/mt8186-mt6366-da7219-max98357.c    | 924
> > ++++++++++++++++++
> >   1 file changed, 924 insertions(+)
> >   create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-
> > da7219-max98357.c
> > 
> 
> Hello Jiaxin,
> 
> I see some duplication between this one and the mt6366-rt1019-
> rt5682s....
> ....for this reason, I would propose to split out the MT6366 bits
> into a
> common file, something like mt8186-mt6366-common.c, as to reduce the
> duplication.
> 

Hello Angelo,

I'm sorry to reply so later about this comment. I've been thinking
about the repetition of these two machine driver recently. The biggest
difference between them are the .init .ops and .be_hw_params_fixup
callback functions of BE's dai_link. So I want break them down into
rt1019-rt5682s.c and da7219-max98357.c, the rest becomes mt8186-
mt6366.c.

SND_SOC_MT8186_MT6366 ==> mt8186-mt6366.c
SND_SOC_RT1019_RT5682S ==> rt1019-rt5682s.c
SND_SOC_DA7219_MAX98357 ==> da7219-max98357.c

Or put these three files in the same mt8186-mt6366.c, then distinguish
by different compatible string.

If it is expected to see MT8186 machines with DA7219 or MAX98357,
> then it'd be a
> good idea to also do something about preventively commonizing these
> ones, like
> it is being done in ... MT8192, if I remember correctly.
> 
> Regards,
> Angelo

Yes, I will change this part that being done in MT8192 to simplify the
code. But the part of mt8192 is being reviewed. I'm not sure if you
have any comments about this series.

Link: 
https://lore.kernel.org/linux-arm-kernel/20220402051754.17513-1-jiaxin.yu@mediatek.com/T/

Jiaxin.Yu
Thanks.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
