Return-Path: <SRS0=GJVM=24=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19456C33C99
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 08:17:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC915207E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jan 2020 08:17:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JGxsMjB1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC915207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InrR9VhGl72B240cDyyUyRevAKJX9MoEAfpaXI3HB8k=; b=JGxsMjB1Pyy4+C
	5hnoHaNRRi/bF3HhHO5OR6lO2zOS7yXrORmJBw4A+CQrqjcSkd9T2CXVmCuphX4lIpdIBnAI2dMWQ
	yr6FyRp/JM6BEr9rC1act6G1/1Rt753L1FRj+wrSoFPxod/w70Tys41cMo04pNM04rw6kIifok8aS
	HQaX3WOJ8i0nwG0vgkQjOeq1BsDbBc27bCIElUWXB2khdNhWAA8yCYMJ0jPZEygZiX3GnrqYiVaPR
	99gEhvPB+tN1ZS0cgCXIJxNFIJeTrH/RcCEdNnPSg6+MzI/1zlIx3JG06kVOYkfeVACcZMYVImm5Z
	KpLHrrfbQhZnRoUThn8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iok2w-000698-1G; Tue, 07 Jan 2020 08:17:02 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iok2n-00060a-Pi; Tue, 07 Jan 2020 08:16:55 +0000
Received: from mail-qt1-f176.google.com ([209.85.160.176]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1My3AX-1jdErf3QAZ-00zWdd; Tue, 07 Jan 2020 09:16:49 +0100
Received: by mail-qt1-f176.google.com with SMTP id l12so44639194qtq.12;
 Tue, 07 Jan 2020 00:16:48 -0800 (PST)
X-Gm-Message-State: APjAAAVNs9cUyRiD8hfFEb7ZzTxZ2CxE4i31aPpqZdOCWowP/bIaMVbd
 3RYDVCoTTG1pNi8i8gAriXnMobgl/pCLe7t0CQQ=
X-Google-Smtp-Source: APXvYqy5Ck9gkPV52yg24WY0VrQ2y2C1CXBRF6Y6+8OBXLwg0dzkbS2jd5oixwoipa94cQmOYesNS9M2hLIm4uQS2qw=
X-Received: by 2002:ac8:709a:: with SMTP id y26mr78397663qto.304.1578385007686; 
 Tue, 07 Jan 2020 00:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20191210195333.648018-1-arnd@arndb.de>
 <d739240f-aaa6-c310-9c68-16c1a08ce759@nvidia.com>
 <9c9169cc-0da5-f247-c8f7-f6913ca2bfb5@linux.intel.com>
In-Reply-To: <9c9169cc-0da5-f247-c8f7-f6913ca2bfb5@linux.intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 09:16:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1it2a1CmkkOfVqhLE33jmKWhHEtria+ESoz6uSkcP8_w@mail.gmail.com>
Message-ID: <CAK8P3a1it2a1CmkkOfVqhLE33jmKWhHEtria+ESoz6uSkcP8_w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: rt5677: add SPI_MASTER dependency
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
X-Provags-ID: V03:K1:sGTxaUX2A0H5envO3FrEziEkgMpF1tmBuTOz5sJgdNRKvBtlz1h
 bJj2dbFQYpofORBtF4TGNypgdnWLtJP1y1iYMZfMSMpTO6Yw9/nbzdprTEwW91BWY2i1nju
 F08vAY472h520Ta00W+Y/MzprbiGO3vw13uw9FGw8n71psg/4RjcnU9GJBpO39IdMSEf2ak
 bcL1BMcBU0Ro494aZ6pFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DXt8epKEjKY=:v6XC5T5ui0g5owdllBtdcq
 gMlF2jeMyvD0FPxJ54b9GIVdOAReh4WJynnrPSfencpE0wa2YSE7PZVm+nTmMi4neNhymNTL0
 9SRnUWQApgHgougmgm3jMWJu/HnusJP3b3SsGZ74m7iC56FcAeCwNVZ9uY1qDi4zjYJPr2+r5
 rOZ8wcuWXPh76PfgvyKOPLTZ+h4wxWLA8xpVH6MlC84XVQkf3Xg0kneTOlrBtA4dy2bth8p4M
 80ZxZKk8gyT1T8vVwsl5gqc6iIAYtCpH2IMIuWzyAfc1ngchDYbxlZtA/Zawt/r7eFqtwS+cS
 VgtqbAF7H/VKRcpYU+jI/1gi09lpzs2/rIa9pU/hNp56V+PCvgZJttm9G+UzkPAB1ji+nxUrU
 4ZSQxuQH3DCy+vuasF3kWncSSaHG2utt4Z1UmE9teOQGkpTirKYCeffBoXKawvzGYgfcOepxc
 cQ8cBJimQjVIX3xhgdbf8Y7HLHuvFB1UZf2rd5CNOUPDg5gsCzq+DAPplNg4TZdcg7fbzBab3
 IVxIJk52xIUgn8sOZIIGfRdjw8aWVrhhFfjOuZVTx6CLemGT8yhwjPr2eBF1RJSlLaFXZmwLQ
 3b1J+QF8ujZs9iZbeMzaItIMZL41qP8PanZKW6q517lceJFYujbIOH6I3CzOyq2+qKGInjMQp
 9KnZyWKFzHAFk9/+KAsQVDKZT5isZnAyAmyyXIhS89epe9GZ1DiDu8MyFaMn8N4X6d8CzquGd
 g/5IiRBdjf229UNkolQlof00NpEmT1xX0vlxISzr0zxKgIagMBnUvK/gjyacITZN6vsPjgr6t
 zh/8OULy2BF+IWJ/55E3PddOxsTNsC8UX1yyXOKJ88xG4kF72/h11cxnZIZHGhm8WYNBKBa4/
 5uhOlfmrIwiJFLhzKusA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_001654_124431_A8674517 
X-CRM114-Status: GOOD (  14.89  )
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
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Curtis Malainey <cujomalainey@chromium.org>, Jon Hunter <jonathanh@nvidia.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 KaiChieh Chuang <kaichieh.chuang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 6, 2020 at 10:55 PM Pierre-Louis Bossart
<pierre-louis.bossart@linux.intel.com> wrote:
> On 12/11/19 4:59 AM, Jon Hunter wrote:
> >
> > On 10/12/2019 19:52, Arnd Bergmann wrote:
> >> When CONFIG_SPI is disabled, the newly added code for the DSP
> >> firmware loading fails to link:
> >>
> >> ERROR: "rt5677_spi_hotword_detected" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!
> >> ERROR: "rt5677_spi_write" [sound/soc/codecs/snd-soc-rt5677.ko] undefined!
> >
> > Would it be better if the above functions or the functions that call
> > these are conditional on CONFIG_SND_SOC_RT5677_SPI?
>
> they are already conditional, with a fallback provided:
>
> #if IS_ENABLED(CONFIG_SND_SOC_RT5677_SPI)
> int rt5677_spi_read(u32 addr, void *rxbuf, size_t len);

Right, this fixed the problem.

> in theory if SPI is not enabled the fallback static inlines would always
> be selected?
>
> Arnd, if you can share the .config that exposes this problem it'd be nice

I just tried it again and it seems that the issue was already fixed by
commit fb3194413d1e ("ASoC: rt5677: Fix build error without CONFIG_SPI"),
which had not been merged by the time I created my patch as an
alternative workaround.

      Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
