Return-Path: <SRS0=iNWv=42=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AA84C10F27
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 07:56:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18D6520663
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 07:56:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rIK4ulRz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GqfUcdR9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18D6520663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EANZoh1ysAKr8VQYnlSPg2QrHJ5KHrLVfrsrfWiyQPM=; b=rIK4ulRzTXXCDJ
	t9mlYLH9YCJE/3uk3BuV21MDxeotpgRuTVdiH4XsmiHo3M+6S5WugghMkzwxUGWRHCKAnRc/MuKW/
	KmU/bNu1ZCC1ofIE7bi2wl+6Na1GhCTcWRbACNa/IFIYXejSQBjtxgiwUXAQa61L7fD2dTGefTWUa
	dZVmoirnZbalyHS0aQ5dmAo/VNEy2LI/0y6OzrsW1q8oFPqGW8jI0Ql/W9P6iJM7uRcWDTcNSF8Sv
	fhBJDWiRnHZHURu1r5iuDqsqf3h61UydvbmgiITy7CURkHCIA6GG2izSIJ/Zdkxq37eExQm3jB1qo
	0FZ31yKccfmKIPf5N2Jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBDGe-0005Cl-IA; Mon, 09 Mar 2020 07:56:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBDGV-00055O-DL; Mon, 09 Mar 2020 07:55:56 +0000
X-UUID: cbb1a81486114dd8a3380419321c1c36-20200308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=d0wnLlS3PKlRwicESnqS4F2qX7BxraxwO4F/6cuzvFM=; 
 b=GqfUcdR9MCWpnbgw4rLso8SUipYFib64zGOBH0bgByrx7i3JuVgRrZ1o87yYSKMA2JNeln/SsFZCHhy65EZakGf8pwVbTVcBifChPhkABtFrNFYOcwbTEyophI4NtNVV/fNkKy4Z4UtKSASNQRwzmRhyzmw/tgL53INdtdZ5c54=;
X-UUID: cbb1a81486114dd8a3380419321c1c36-20200308
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nick.fan@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1424799485; Sun, 08 Mar 2020 23:55:41 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Mar 2020 00:55:39 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Mar 2020 15:54:27 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Mar 2020 15:55:55 +0800
Message-ID: <1583740539.3995.15.camel@mtksdaap41>
Subject: Re: [PATCH v4 1/7] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
From: Nick Fan <nick.fan@mediatek.com>
To: Steven Price <steven.price@arm.com>
Date: Mon, 9 Mar 2020 15:55:39 +0800
In-Reply-To: <20200306144336.GA9234@arm.com>
References: <20200207052627.130118-1-drinkcat@chromium.org>
 <20200207052627.130118-2-drinkcat@chromium.org>
 <20200225171613.GA7063@bogus>
 <CANMq1KAVX4o5yC7c_88Wq_O=F+MaSN_V4uNcs1nzS3wBS6A5AA@mail.gmail.com>
 <1583462055.4947.6.camel@mtksdaap41>
 <CAL_JsqLoUnxfrJh0WCs0jgro1KHAjWaYMsaKkKfAKA2KJ252_g@mail.gmail.com>
 <20200306144336.GA9234@arm.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_005555_465998_006230F3 
X-CRM114-Status: GOOD (  14.50  )
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 lkml <linux-kernel@vger.kernel.org>, Sj Huang <sj.huang@mediatek.com>,
 Mark Brown <broonie@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, Daniel
 Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-arm
 Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-03-06 at 14:43 +0000, Steven Price wrote:
> On Fri, Mar 06, 2020 at 02:13:08PM +0000, Rob Herring wrote:
> > On Thu, Mar 5, 2020 at 8:34 PM Nick Fan <nick.fan@mediatek.com> wrote:
> > >
> > > Sorry for my late reply.
> > > I have checked internally.
> > > The MT8183_POWER_DOMAIN_MFG_2D is just a legacy name, not really 2D
> > > domain.
> > >
> > > If the naming too confusing, we can change this name to
> > > MT8183_POWER_DOMAIN_MFG_CORE2 for consistency.
> > 
> > Can you clarify what's in each domain? Are there actually 3 shader
> > cores (IIRC, that should be discoverable)?
> 
> The cover letter from Nicolas includes:
> 
> > [  501.321752] panfrost 13040000.gpu: shader_present=0x7 l2_present=0x1
> 
> 0x7 is three bits set, so it certainly looks like there are 3 shader
> cores. Of course I wouldn't guarantee that it is as simple as each power
> domain has a shader core in. The job manager and tiler also need to be
> powered somehow, so they are either sharing with a shader core or
> there's something more complex going on.
> 
> Steve
> 
There are actually five power domains in total for MT8183 GPU.

There are 3 shader cores in MT8183.

They can be listed as following for each power domain:
1.MT8183_POWER_DOMAIN_MFG_ASYNC : SOC bus logic
2.MT8183_POWER_DOMAIN_MFG : GPU job manager & tiler
3.MT8183_POWER_DOMAIN_MFG_CORE0 : GPU shader core 0
4.MT8183_POWER_DOMAIN_MFG_CORE1 : GPU shader core 1
5.MT8183_POWER_DOMAIN_MFG_2D : GPU shader core 2

There are other power domain dependency can be reference in the
following link.
https://lkml.org/lkml/2019/2/1/166

You can check the power domain dependencies as following
==========================================================
+static const struct scp_subdomain scp_subdomain_mt8183[] = {
+	{MT8183_POWER_DOMAIN_MFG_ASYNC, MT8183_POWER_DOMAIN_MFG},
+	{MT8183_POWER_DOMAIN_MFG, MT8183_POWER_DOMAIN_MFG_2D},
+	{MT8183_POWER_DOMAIN_MFG, MT8183_POWER_DOMAIN_MFG_CORE0},
+	{MT8183_POWER_DOMAIN_MFG, MT8183_POWER_DOMAIN_MFG_CORE1},
==========================================================

Thanks

Nick Fan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
