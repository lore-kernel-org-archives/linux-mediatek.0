Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DEB4C43381
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 16:21:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4135864F80
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 16:21:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4135864F80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ymfo9stGlPUORbJdHGWpCZLwq+hLazIG8og2qr9Qnqg=; b=ZZR4g836/fOLcetceo2Dozqcu
	xBOXZ8AbRY6Q7RbpL3R8sxGC1ONcd68lf+DRKxwrY4hLlqg73QK30Rnt4oO5RHq43XXIGdK3wRxmr
	DF13v016iWw0zcc4to+/wOaSvuz+WSzZI7MBtk11SwjVm2Vjy5acyRX9MWPAkQahHFZq4awqSIQFa
	zFvzE8KqSYfwPCyXXIqarVYSulJbrpoQ0SPBuRP8gysxswfTBLSnzhlXoSdconSas0cCKw5vicnIG
	JfIAHLmhx7DJzmOrNp8e3owW3DokgyyUMpnmmOHQu5BfhAeqbuYrhMngsvZiJpq0cY3ypXekm6w23
	Fo5OSfENg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKkX8-00Bvwx-HU; Fri, 12 Mar 2021 16:21:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKkWo-00BvrY-Lm; Fri, 12 Mar 2021 16:20:46 +0000
X-UUID: 1ce02ee69f034c6995f3682f6c7656f8-20210312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=63lLgyhShcz7hBrpoA+jQ3pPfygS4j51tNuMwt/5+Hk=; 
 b=R/+d07dxKnfShHwEMfyGFND/Q4EzY2Kb+4zGeLRJ4BcrCrk5/gWTVp3uWnmjG1IZuFICN4obx14YNvZbtdqzv3qrQoFcAmgJnx8iwg4LiI91HSl07hzKyarhOvOm/e4rPZprGNQvxv8VQSorjQoPzEj9PsjwbdzgXK1a+3+OQh4=;
X-UUID: 1ce02ee69f034c6995f3682f6c7656f8-20210312
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1564603254; Fri, 12 Mar 2021 08:20:38 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 08:20:36 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Mar 2021 00:20:34 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 13 Mar 2021 00:20:34 +0800
Message-ID: <1615566034.27101.5.camel@mtksdaap41>
Subject: Re: [PATCH RESEND v5 7/8] regulator: mt6359: Add support for
 MT6359P regulator
From: Hsin-hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Alessandro Zummo <a.zummo@towertech.it>, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Fei Shao <fshao@chromium.org>,
 Eddie Huang <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Yuchen Huang <yuchen.huang@mediatek.com>, Ran Bi <ran.bi@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Sat, 13 Mar 2021 00:20:34 +0800
In-Reply-To: <20210301102156.GJ641347@dell>
References: <1611913781-23460-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1611913781-23460-8-git-send-email-hsin-hsiung.wang@mediatek.com>
 <20210301102156.GJ641347@dell>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 720C1621FB1260E7C53FD91671EB4931ED0AA89ED611D0A41887A4B6E089299B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_162043_211484_D1D82FE4 
X-CRM114-Status: GOOD (  18.53  )
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

On Mon, 2021-03-01 at 10:21 +0000, Lee Jones wrote:
> On Fri, 29 Jan 2021, Hsin-Hsiung Wang wrote:
> 
> > The MT6359P is a eco version for MT6359 regulator.
> > We add support based on MT6359 regulator driver.
> > 
> > Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> > ---
> > changes since v4:
> > - add the regulators_node support.
> > ---
> >  drivers/regulator/mt6359-regulator.c       | 379 ++++++++++++++++++++-
> 
> >  include/linux/mfd/mt6359p/registers.h      | 249 ++++++++++++++
> 
> Although the code is fine, just be aware that Linus can get grumpy
> having 100s and 100s of unused register defines in the kernel.
> 

Thanks for the comment. We will mull it over.

> >  include/linux/regulator/mt6359-regulator.h |   1 +
> >  3 files changed, 623 insertions(+), 6 deletions(-)
> >  create mode 100644 include/linux/mfd/mt6359p/registers.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
