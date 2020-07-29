Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2955C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:11:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BE172070B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:11:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c/nig7Oj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="loBW/c/M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BE172070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4qFnVIvCy0urLejW+yIBqG4xfZNmEpeTB1PeplXukjg=; b=c/nig7OjlP61PsEOiShnpwtyZ
	vnGN883LOtgdeJEuUEfyWQ2TUwHLPKNPaOXtVdBa7PxNGrlPHyPwKtOrK2lMtGoWE+72Xt9x0Vt4R
	JpCqFvqTjtVain1vHQjVptBD9nvSfaUKaCOxGJxodDIm6Fbea0aq3oCfQMF5VmeM9lRsEg0haPdqz
	mK3sSad65bafs7T63CRIOwmkl2s4CxYU5qE/UOeJauBP4DcrrY33MopEpf7b+LEn6gN8eYFpK/BB3
	T20YmliuOh9h0ohFoc82/fmTqHiWhTcYt7A62wTlt770wuRZdCEi6W47LIQu2/cCmvC7lZxCdNvsZ
	rWSwg4MTg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0hB4-0001cy-0y; Wed, 29 Jul 2020 08:11:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0hAX-0001OP-8t; Wed, 29 Jul 2020 08:10:36 +0000
X-UUID: 3f6def0826314300803e58680e6e6416-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bR10KbXtzajag+49gYfd5nFZ5Eo9nw+6eYZQAA/1I/c=; 
 b=loBW/c/M6WOL8dxdgrA+B6w/h6kUziukhtD7os2FiGPEF1Q8jDK8lCQJ/osHxilBSnBrD7Fv79D2v7i5OBT196lRTBlyL/tQwKC1FQzcfgURyuaCM5GqFOBYbowixpNySzFmqkPMXRqAOCRQvC35mlA5NykEpLF+YCaFPuoUVBo=;
X-UUID: 3f6def0826314300803e58680e6e6416-20200729
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1133385146; Wed, 29 Jul 2020 00:10:45 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 01:10:27 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 16:10:20 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 16:10:20 +0800
Message-ID: <1596010221.23124.2.camel@mtksdaap41>
Subject: Re: [PATCH v3 1/3] arm64: dts: Add Mediatek SoC MT8192 and
 evaluation board dts and Makefile
From: CK Hu <ck.hu@mediatek.com>
To: Seiya Wang <seiya.wang@mediatek.com>
Date: Wed, 29 Jul 2020 16:10:21 +0800
In-Reply-To: <1596009775.12468.6.camel@mtksdaap41>
References: <20200729013100.19539-1-seiya.wang@mediatek.com>
 <20200729013100.19539-2-seiya.wang@mediatek.com>
 <1596009775.12468.6.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_041033_568804_CD1D2135 
X-CRM114-Status: GOOD (  20.49  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Seiya:

On Wed, 2020-07-29 at 16:02 +0800, CK Hu wrote:
> Hi, Seiya:
> 
> On Wed, 2020-07-29 at 09:30 +0800, Seiya Wang wrote:
> > Add basic chip support for Mediatek MT8192
> > 
> > Signed-off-by: Seiya Wang <seiya.wang@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/Makefile       |   1 +
> >  arch/arm64/boot/dts/mediatek/mt8192-evb.dts |  29 ++
> >  arch/arm64/boot/dts/mediatek/mt8192.dtsi    | 671 ++++++++++++++++++++++++++++
> >  3 files changed, 701 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192-evb.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > 
> 
> [snip]
> 
> > +
> > +		watchdog: watchdog@10007000 {
> > +			compatible = "mediatek,mt6589-wdt";
> 
> According to [1] and [2], compatible string for mt8192 watch dog should
> be "mediatek,mt6873-wdt","mediatek,mt8192-wdt".
> 
> 
> [1]
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2287090/12
> [2]
> https://chromium-review.googlesource.com/c/chromiumos/third_party/kernel/+/2131598/18
> 
> > +			reg = <0 0x10007000 0 0x100>;
> > +			#reset-cells = <1>;
> > +		};
> > +
> 
> [snip]
> 
> > +
> > +		mmsys: mmsys@14000000 {
> > +			compatible = "mediatek,mt8192-mmsys", "syscon";
> 
> You should define "mediatek,mt8192-mmsys" first, then you could use it
> in this patch

Sorry, this series depend on [1], but mmsys is a syscon, so this should
be

mmsys: syscon@14000000 {

[1]
http://lists.infradead.org/pipermail/linux-mediatek/2020-July/014451.html

Regards,
CK
> .
> 
> Regards,
> CK
> 
> > +			reg = <0 0x14000000 0 0x1000>;
> > +			#clock-cells = <1>;
> > +		};
> > +
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
