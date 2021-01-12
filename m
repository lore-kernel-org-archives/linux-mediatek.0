Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD22C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 08:00:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F84A22D2C
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 08:00:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F84A22D2C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IPzIVpKShjn4ZIVAaAToy3Nk/+NVgiFb47uFwKOUiUs=; b=mSqfzIVNhAjIrf6KfPPvcFrVv
	SBoqPTXr5JYwQ9JCsS+sSEk8uq7shr09j+s1Lvu/9VKYU3RI2RC0y/N5RGdCzJCgc3ZwL0aIMubub
	192AOSG2+r8cq095FV2O9FvDE+p7Wm1C9CU8mKr0PCJTALjjkqWdwG+kYKF4+A8SmlD/YgqaT5M7Y
	fJ6FdH0rXfEeRliLeNQCtsglTBDeXdglU/VBMtOwJVHIOBOHhSAcGI49k07f6dkH9rR1gbNqOfwpm
	zmk+2nl575300X7ASXSU4IBTYVcOa0zI7nubSCH3Y5scINw3rcm2QDjEbVDrXKBHv25A9soEUkqF9
	reYYyP6FQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzEbG-0002ft-5z; Tue, 12 Jan 2021 08:00:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzEbD-0002dk-Kg; Tue, 12 Jan 2021 08:00:21 +0000
X-UUID: 30ee173c2dcf4a6c8f787b4121cc96ad-20210112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MSCj26hBYC5yhFYlqz1zDqlpvUKDf/hx4JpIFhfQLI4=; 
 b=W16oFPTeJaN1RA97Wu0YZIKaA88aXNvJ7EUm4Ixma6NxFTB2TVNI3KWFd8Wf/yQHBeJfTVVabbqcYS7tPLbn7ock6OCnIovZ4XFok0xgUI3ffeSMuP9ctEggoZiaVVVbswBz4FpQivOwyMYMNTxsy1DhsgWJLfus87XjjoWFB7M=;
X-UUID: 30ee173c2dcf4a6c8f787b4121cc96ad-20210112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1106109324; Tue, 12 Jan 2021 00:00:14 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 23:57:53 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Jan 2021 15:57:44 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Jan 2021 15:57:44 +0800
Message-ID: <1610438264.31838.1.camel@mtksdaap41>
Subject: Re: [PATCH V7 01/13] dt-bindings: soc: Add dvfsrc driver bindings
From: Henry Chen <henryc.chen@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Tue, 12 Jan 2021 15:57:44 +0800
In-Reply-To: <CAL_Jsq+W3UL4-s6ezFJrhUYko2EBPsO9nMOGzGR1nQT3x_VtdQ@mail.gmail.com>
References: <1610092095-5113-1-git-send-email-henryc.chen@mediatek.com>
 <1610092095-5113-2-git-send-email-henryc.chen@mediatek.com>
 <1610163019.789930.3762037.nullmailer@robh.at.kernel.org>
 <1610333553.2992.7.camel@mtksdaap41>
 <CAL_Jsq+W3UL4-s6ezFJrhUYko2EBPsO9nMOGzGR1nQT3x_VtdQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E12981678A47B5256F94D79B6C1A2E72C722F0897B9519C75472F6B9F7E0D2322000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_030019_832194_1139AAD9 
X-CRM114-Status: GOOD (  19.37  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, James Liao <jamesjj.liao@mediatek.com>,
 Nicolas
 Boichat <drinkcat@google.com>, "open list:THERMAL" <linux-pm@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Ryan Case <ryandcase@chromium.org>,
 Georgi Djakov <georgi.djakov@linaro.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-01-11 at 09:42 -0600, Rob Herring wrote:
> On Sun, Jan 10, 2021 at 8:52 PM Henry Chen <henryc.chen@mediatek.com> wrote:
> >
> > Hi Rob,
> >
> > On Fri, 2021-01-08 at 20:30 -0700, Rob Herring wrote:
> > > On Fri, 08 Jan 2021 15:48:03 +0800, Henry Chen wrote:
> > > > Document the binding for enabling dvfsrc on MediaTek SoC.
> > > >
> > > > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> > > > ---
> > > >  .../devicetree/bindings/soc/mediatek/dvfsrc.yaml   | 67 ++++++++++++++++++++++
> > > >  1 file changed, 67 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/dvfsrc.yaml
> > > >
> > >
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > >
> > > yamllint warnings/errors:
> > >
> > > dtschema/dtc warnings/errors:
> > > Documentation/devicetree/bindings/soc/mediatek/dvfsrc.example.dts:19:18: fatal error: dt-bindings/interconnect/mtk,mt8183-emi.h: No such file or directory
> > >    19 |         #include <dt-bindings/interconnect/mtk,mt8183-emi.h>
> > >       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > Sorry, because this header file is added on "[V7,07/13] dt-bindings:
> > interconnect: add MT8183 interconnect dt-bindings".
> > Should I change the order of the patchset (let the yaml pathc behind the
> > header) to fixed that ?
> 
> DT headers should be part of the binding schema patch. (Or at least come first).
OK, I will merge DT header and binding schema patch into a single patch.

Henry
> 
> Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
