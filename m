Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94406C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 02:44:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 373F560F4A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 02:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 373F560F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7sWJVMm+6Z9c0+ho7zNbmJxIRH+NoIYd5rbgWhjyjbQ=; b=Dx+cS1tV6RSVaE
	B2hCgH2Oj272Xjn4/bmL95wDEMwueTEEncwBhOq8/Lmxnw7snDGZrKibQv2UhvWZDOgv/J1LyCkro
	9ecKHb988SaHwdG/z9ikrdg7tOeyH6OO9ryeTRsXucLTMUsN+9f3PWpXvgWR3QaZeXTHL/eM3al8k
	99RtwNGpLfvyAlxmdufbqwuEI9suH3SqAbUHSZ9YUAvf/1r1P59qgqe2NaMEzpjOKeue+mGFEm4jt
	z/oW9a2qgsyRkS7gKaGOUdsENMgXy5H6wRwecEP9OHD7ocNrxkxK7CduutZ5dR5Z0vSJQwd53Y6Jb
	t9si8yEMDCut6uENvL7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9IV0-006i8A-Ui; Fri, 30 Jul 2021 02:43:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9IUl-006i78-7y; Fri, 30 Jul 2021 02:43:34 +0000
X-UUID: 80fda3514a2d418d967ec5f57acda7f8-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=MhJjzMJaCLiOt7zZ1oxqTMuNoTCEa6P7XqQdm1VKRgY=; 
 b=HByxBdsrKL93WmMu1OctRxGSmIK64pUkldii6iD0JWUVP5w6714xwV6/7x4q7AmBy9sk/0pop9QL30bhHVCRMe4iiOmze7MuUpuVr1kRMm7ukytuirbSWT4IerTK0raDDHiHhl+YMJtyXHhXfZwFwaDlmdqYegulEi1QnzYGF8g=;
X-UUID: 80fda3514a2d418d967ec5f57acda7f8-20210729
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1757002382; Thu, 29 Jul 2021 19:43:27 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 19:43:25 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 10:43:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Jul 2021 10:43:23 +0800
Message-ID: <a48525422d4c953a2dac2a907895c20b9fd6d232.camel@mediatek.com>
Subject: Re: [v6 2/2] arm64: dts: mediatek: Correct UART0 bus clock of MT8192
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Ikjoon Jang <ikjn@chromium.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 30 Jul 2021 10:43:23 +0800
In-Reply-To: <CAATdQgC-X6pijkgTBsWJJKp__J6N=7JNKHQJmOMvTAjivwPM5w@mail.gmail.com>
References: <20210727023205.20319-1-chun-jie.chen@mediatek.com>
 <20210727023205.20319-3-chun-jie.chen@mediatek.com>
 <CAATdQgC-X6pijkgTBsWJJKp__J6N=7JNKHQJmOMvTAjivwPM5w@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_194331_329716_A7C3A612 
X-CRM114-Status: GOOD (  17.99  )
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

On Wed, 2021-07-28 at 14:14 +0800, Ikjoon Jang wrote:
> Hi,
> 
> On Tue, Jul 27, 2021 at 10:43 AM Chun-Jie Chen
> <chun-jie.chen@mediatek.com> wrote:
> > 
> > infra_uart0 clock is the real one what uart0 uses as bus clock.
> > 
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > index c7c7d4e017ae..9810f1d441da 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > @@ -327,7 +327,7 @@
> >                                      "mediatek,mt6577-uart";
> >                         reg = <0 0x11002000 0 0x1000>;
> >                         interrupts = <GIC_SPI 109
> > IRQ_TYPE_LEVEL_HIGH 0>;
> > -                       clocks = <&clk26m>, <&clk26m>;
> > +                       clocks = <&clk26m>, <&infracfg
> > CLK_INFRA_UART0>;
> >                         clock-names = "baud", "bus";
> >                         status = "disabled";
> >                 };
> 
> There're many other nodes still having only clk26m. Will you update
> them too?
> 

Others will be updated by IP owner.

Best Regards,
Chun-Jie

> > --
> > 2.18.0
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!1bIz6X2EiFbigCImzQmbqtezIFfl1LRBuPOYTqBdl5wfx8b-zp0zQP68R7RhaIcAAXXF$
> >  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
