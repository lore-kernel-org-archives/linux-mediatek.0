Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD93C636C9
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:15:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A251600CD
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:15:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A251600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OZQKr9DNhg2X7xc+F47wKAvUy+zU3eY0OOVsFJGQtU=; b=myrh8neS2H78VD
	5RVS9H5iQVyEzOtVeKEZNVmCnEeYgK+BbblXXg2YpexSu1whifIuCwGkHL850jXhORhCEEeCUM5yT
	P4d53ZSxhBWMu7/5j37EhKN398ntdoqKFiR0Gf/xeQT7bV1/cUBC86xLymD7AdV9co9eGORT5e4B0
	hwcPmKO+EV2F6omsaOI/POgEoy0EXd1ysIeOqj1ru9NQ15DqeCd+9X1AAhDWpbaRpXFmd9WZNwi6X
	YxLPu/1GhGaDifYGv+81S3sLMnrGQ1WeCYbW5CwgLE/N1flQb+jhkDTCleAL+YyWQYfKdCQ3s54rD
	XrRxj/Lvwlaw46GTCfjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4gQ4-006LHZ-Mr; Sat, 17 Jul 2021 09:15:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4gPD-006L0P-Lp; Sat, 17 Jul 2021 09:14:46 +0000
X-UUID: d9ca7c4fa2fe40f5b70d19ab62b80892-20210717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=RtLPdB7W1L1ISzH1RJkeBeFtIGnaD9ES9bFQpDbh7ng=; 
 b=GBPShCH4VBq6Ud99QscbOh5NiRGG8Rfpiety+yKCg6m6YZG0iIXmEauRUkJ6jsC139aIYlqkZeWVTNfaDQpcDOINFJNqGRpMc/SRHw1uJ8yKpnLSzUIC1H/hK5CVNeC6slUV9tOej4dRmWoKoM8/tc9d+qAqK8GQkHUOK61s5QE=;
X-UUID: d9ca7c4fa2fe40f5b70d19ab62b80892-20210717
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <kewei.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 368585514; Sat, 17 Jul 2021 02:14:39 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 02:05:18 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 17 Jul 2021 17:05:01 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Jul 2021 17:05:01 +0800
Message-ID: <1626512701.29703.26.camel@mhfsdcap03>
Subject: Re: [PATCH 0/8] Due to changes in hardware design, add patch to
From: Kewei Xu <kewei.xu@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: "wsa@the-dreams.de" <wsa@the-dreams.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, Leilk Liu
 =?UTF-8?Q?=28=E5=88=98=E7=A3=8A=29?= <Leilk.Liu@mediatek.com>, Qii Wang
 =?UTF-8?Q?=28=E7=8E=8B=E7=90=AA=29?= <Qii.Wang@mediatek.com>, Qiangming Xia
 =?UTF-8?Q?=28=E5=A4=8F=E5=BC=BA=E6=98=8E=29?= <Qiangming.Xia@mediatek.com>,
 Daolong Zhu =?UTF-8?Q?=28=E7=A5=9D=E9=81=93=E9=BE=99=29?=
 <ot_daolong.zhu@mediatek.com>
Date: Sat, 17 Jul 2021 17:05:01 +0800
In-Reply-To: <CAGXv+5FKvz7zwi1k=TZ3YTJJ+facezqN_oigRFEeR26OrejRnw@mail.gmail.com>
References: <1626316157-24935-1-git-send-email-kewei.xu@mediatek.com>
 <CAGXv+5FKvz7zwi1k=TZ3YTJJ+facezqN_oigRFEeR26OrejRnw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8D9D5E5FF085A829D84BE3EA40A55E9C4D77E284B99C28EE19B60EB1B4F3EBB52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_021443_782857_212BCB27 
X-CRM114-Status: GOOD (  26.16  )
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

On Thu, 2021-07-15 at 11:03 +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Thu, Jul 15, 2021 at 10:37 AM Kewei Xu <kewei.xu@mediatek.com> wrote:
> >
> > 1. In order to facilitate the review, the two series of patches submitted
> >    before have been integrated together.
> 
> I'm not sure that really helps. We'll see.
> 
> > 2. Resubmit a patch to fixing the incorrect register value.
> 
> Fixes can be submitted separately, or at the very least, put at the very
> front of the series.
> 
> > 3. Add modify bus speed calculation formula patch
> 
> When resubmitting patch series, please add appropriate versioning and
> changelogs. This will help maintainers understand that this is a new
> version of the series, and what has changed. This includes times when
> the original patches weren't changed, but additional patches were added.
> 
> Please also keep the original series subject, which IIRC was about adding
> support for MT8195 I2C. The subject you now used should be part of the
> cover letter.
> 
> If you combine different patch series, you should use the highest version
> number + 1.
> 
> 
> Regards
> ChenYu
> 
> >
> > Kewei Xu (8):
> >   dt-bindings: i2c: update bindings for MT8195 SoC
> >   i2c: mediatek: Dump i2c/dma register when a timeout occurs
> >   i2c: mediatek: fixing the incorrect register offset
> >   i2c: mediatek: Reset the handshake signal between i2c and dma
> >   i2c: mediatek: Add OFFSET_EXT_CONF setting back
> >   dt-bindings: i2c: add attribute default-timing-adjust
> >   i2c: mediatek: Isolate speed setting via dts for special devices
> >   i2c: mediatek: modify bus speed calculation formula
> >
> >  .../devicetree/bindings/i2c/i2c-mt65xx.txt         |   3 +
> >  drivers/i2c/busses/i2c-mt65xx.c                    | 229 +++++++++++++++++++--
> >  2 files changed, 217 insertions(+), 15 deletions(-)
> >
> > --
> > 1.9.1
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

Hi ChenYu,

2. OK, I will place the fixes at the very least in the next patch.

3. I will take your opinion combine different patch series, you should
use the highest version number +1.

I have submitted two different series of patches before. The topics are
"Add i2c support for mt8195" (highest version number: V1) and "Introduce
an attribute to select timing settings" (highest version number:V3).
Later I will combine the above two series of patches and submit V4 with
"Introducing an attribute to select the time setting" as the subject
title.

Thanks

Regards
Kewei
  



























_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
