Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCC1C4363A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 10:10:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62C1D21D6C
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 10:10:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q032x1lD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DRNz6zE2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62C1D21D6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ak03iR3aiAaiUBtWjxROWa8TRskxXqnErOjBFxgGNso=; b=q032x1lD7zKPtQFmbUsd6VdvX
	6PqtMNqw7CsLnaaGQd6b7LM0Iw8F1R2wDPEtn5s01vlnQCTxrR7xsphR9w/5ttsBtSaobkbwDe9QH
	VGfJWs6evg130tc5ufO6HiVJ2aftAMVJPnLfTaKp9DS7fEw/VQ8oiAh6Wycnqd+nw7Fs10eb+zFms
	Yrhi3P829P4HYraTVlwAMgDV1Y3GlXO2yrNM2GfpH1GNQlxyKwNejOf653JjOXgwbGV5z3rqf4zec
	teHp/Q8v75bsCahDdJ71fWj85G8uLlfiPhwmodab+HPhQd8FT2TC+G2rlh+KIZD08dCThrHaIYVdA
	P4VuPbohw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVXXt-0001fY-Bx; Thu, 22 Oct 2020 10:10:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVXXp-0001e3-8c; Thu, 22 Oct 2020 10:10:06 +0000
X-UUID: 286846f2523549409fa0ba51763fb383-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/pWlKbK+2FYWyyCxb4qgVtC6XtrPsrK8S8hX+HS2blI=; 
 b=DRNz6zE2WX6m1Uwwb9De5VQLqYfxkCYBVc6186fgeGBHZGIEP1Yd+GHq/nzqe2z25KcbVUaRwwcZL7cHEj1YVqCn6yR+J6ac2ElRaBHc+uksUmhB9dDv0t6Iiw4QyAcZsfsFQmfHwX3LqAu+1xPyCa8iPKk4sXUjdW1KTc50fRM=;
X-UUID: 286846f2523549409fa0ba51763fb383-20201022
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2048626578; Thu, 22 Oct 2020 02:04:49 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 03:04:47 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 22 Oct 2020 18:04:45 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Oct 2020 18:04:45 +0800
Message-ID: <1603361084.8921.26.camel@mhfsdcap03>
Subject: Re: [PATCH v2 2/5] ASoC: mediatek: mt8192: add platform driver
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 22 Oct 2020 18:04:44 +0800
In-Reply-To: <20201021132339.GF4497@sirena.org.uk>
References: <1603270435-3548-1-git-send-email-jiaxin.yu@mediatek.com>
 <1603270435-3548-3-git-send-email-jiaxin.yu@mediatek.com>
 <20201021132339.GF4497@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_061005_522047_05B3B9AD 
X-CRM114-Status: GOOD (  14.42  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, shane.chien@mediatek.com, tiwai@suse.com,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-10-21 at 14:23 +0100, Mark Brown wrote:
> On Wed, Oct 21, 2020 at 04:53:52PM +0800, Jiaxin Yu wrote:
> > This patch adds mt8192 platform and affiliated drivers.
> > 
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > ---
> >  sound/soc/mediatek/Kconfig                    |   10 +
> >  sound/soc/mediatek/Makefile                   |    1 +
> >  sound/soc/mediatek/common/mtk-afe-fe-dai.c    |   13 +-
> >  sound/soc/mediatek/common/mtk-base-afe.h      |    1 +
> >  sound/soc/mediatek/mt8192/Makefile            |   14 +
> >  sound/soc/mediatek/mt8192/mt8192-afe-clk.c    |  669 ++++
> >  sound/soc/mediatek/mt8192/mt8192-afe-clk.h    |  244 ++
> >  sound/soc/mediatek/mt8192/mt8192-afe-common.h |  170 +
> >  .../soc/mediatek/mt8192/mt8192-afe-control.c  |  163 +
> >  sound/soc/mediatek/mt8192/mt8192-afe-gpio.c   |  306 ++
> >  sound/soc/mediatek/mt8192/mt8192-afe-gpio.h   |   19 +
> >  sound/soc/mediatek/mt8192/mt8192-afe-pcm.c    | 2389 +++++++++++++
> >  sound/soc/mediatek/mt8192/mt8192-dai-adda.c   | 1489 ++++++++
> >  sound/soc/mediatek/mt8192/mt8192-dai-i2s.c    | 2139 +++++++++++
> >  sound/soc/mediatek/mt8192/mt8192-dai-pcm.c    |  409 +++
> >  sound/soc/mediatek/mt8192/mt8192-dai-tdm.c    |  778 ++++
> >  .../mediatek/mt8192/mt8192-interconnection.h  |   65 +
> >  sound/soc/mediatek/mt8192/mt8192-reg.h        | 3131 +++++++++++++++++
> >  18 files changed, 12006 insertions(+), 4 deletions(-)
> 
> This is *way* too big to be a single patch, please split it up - it's
> over 600K.

I will split the dai driver files as a seperate patches. Such as:
ASoC: mediatek: mt8192: support adda in platform driver
ASoC: mediatek: mt8192: support i2s in platform driver
ASoC: mediatek: mt8192: support pcm in platform driver
ASoC: mediatek: mt8192: support tdm in platform driver
They're still in series of "ASoC: mediatek: mt8192: add platform
driver". 
Is this appropriate? Please correct me if there is any misunderstanding.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
