Return-Path: <SRS0=1w4W=BI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F42C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:22:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93A4421744
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2020 08:22:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SU0qk4RO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YOHx7014"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93A4421744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SHjaxwIafgqOE7DA0atuwcd1GtK0xjKnjAFuQ2VBY2s=; b=SU0qk4ROwKcfVAydDSgVlXEZR
	81Prx/ZTFQdeSdBZeDwbGw/TbyCdTAqR2sP7NEKPXu6PYLWiKKG6OrrDDDQcBgkyh70f2D3ItF1pp
	XBisRLcQoEGDRSR1DrCSpVVnaE/6ZGk9k6bs3pTPFlFimOZNCrjthSu+wLE9o5cTVh7HcK1p0xHIG
	VXX3cBxF6259WD472N//LTNEd/HxpMSCHt86UF2kfIbi9ti25nUQwlpl4vOHSHgROMvC5ajHFETJY
	3jGJD5xSKTH10jiFLk9h66zg6ZzOitdlsf8lD/xi/j9k8VIAJuc7v4sbl+5n4sFhdUgSvX/0caLTo
	UIS/AUvrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0hLg-00048K-2a; Wed, 29 Jul 2020 08:22:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0hLX-00045U-VN; Wed, 29 Jul 2020 08:21:56 +0000
X-UUID: 9a53933aa7204743b59d7dc9261644d2-20200729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=UNLqnEsdKNmSGXuBOvN1uBWFDDUciwsnHV7r4PQfRiM=; 
 b=YOHx7014d6+Zce3cWaK/zSTv5Kyqu1y0/pVmyCGKwWmVm331EC+tqZusLxn8AcHOB+SQu2v1ip+cRnzf5oJvCkGPSg/YFk+9aS7BQ+hmh6eAJJTkJeXcvW5fzaeLMgp6Aj5MCAmnqNsdlxbshDJJRgf79azNozhivxSAQXcOR1A=;
X-UUID: 9a53933aa7204743b59d7dc9261644d2-20200729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 373103851; Wed, 29 Jul 2020 00:22:02 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Jul 2020 01:19:11 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 29 Jul 2020 16:19:08 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jul 2020 16:19:07 +0800
Message-ID: <1596010724.11360.6.camel@mhfsdcap03>
Subject: Re: [PATCH 2/2] arm64: dts: mt8192: add infracfg_rst node
From: Crystal Guo <crystal.guo@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 29 Jul 2020 16:18:44 +0800
In-Reply-To: <b81f1936-caf0-e843-9556-14e3024d6d6f@gmail.com>
References: <1596008357-11213-1-git-send-email-crystal.guo@mediatek.com>
 <1596008357-11213-3-git-send-email-crystal.guo@mediatek.com>
 <b81f1936-caf0-e843-9556-14e3024d6d6f@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_042156_210439_AEF144C0 
X-CRM114-Status: GOOD (  17.50  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Seiya Wang =?UTF-8?Q?=28=E7=8E=8B=E8=BF=BA=E5=90=9B=29?=
 <seiya.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-29 at 15:45 +0800, Matthias Brugger wrote:
> 
> On 29/07/2020 09:39, Crystal Guo wrote:
> > add infracfg_rst node which is for MT8192 platform
> > 
> > Signed-off-by: Crystal Guo <crystal.guo@mediatek.com>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 +++++++++-
> >   1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index b16dbbd..adc6239 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -217,9 +217,17 @@
> >   		};
> >   
> >   		infracfg: infracfg@10001000 {
> > -			compatible = "mediatek,mt8192-infracfg", "syscon";
> > +			compatible = "mediatek,mt8192-infracfg", "syscon", "simple-mfd";
> >   			reg = <0 0x10001000 0 0x1000>;
> >   			#clock-cells = <1>;
> > +
> > +			infracfg_rst: reset-controller {
> > +				compatible = "ti,syscon-reset";
> > +				#reset-cells = <1>;
> > +				ti,reset-bits = <
> > +					0x140 15 0x144 15 0 0 (ASSERT_SET | DEASSERT_SET | STATUS_NONE) /* 0: pcie */
> 
> You have Texas Instruments hardware inside infracfg? Are you sure?
> 
TI reset-controller driver is a common driver, MTK SOC has the similar
control flow, thus can reuse it.

> > +				>;
> > +			};
> >   		};
> >   
> >   		pericfg: pericfg@10003000 {
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
