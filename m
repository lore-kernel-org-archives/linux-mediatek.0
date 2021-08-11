Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6AD6C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 12:13:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7548360FC0
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 12:13:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7548360FC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A22CfXIeAfGE/PA5PIkwqo13iMKLqpHmnmf3JYdI/3g=; b=VCxM983NB7po4n
	Xmbh1NS1w7zf/QlADiQm71d5p/ExEL4jC0o8uMeKT1X/vdhDDJkxhZIqyTEplngCAveWJQb1hz1xv
	g1z/uxk3HjvOL6pP2Dobx2LrK8lzkC8bwLpUPxoRVJgy4tYuWi9Avlyg4/YXQgvvAitfZs3DoduX7
	obMGeLSdAxZzw8fkbqt+E4w0tBWluHXsqfmCCHapY+vBVeilYEs9aWAX3fP17v0mLiUvVqNlsnMLK
	rkKvjlxCFsR9I+oeemM+dBR28eb6GIgAhrH5Ut6tvKBWX3f5v/Ep1gViODylgNvIiQvkH8eWgjMWu
	VC8p2y6IOTy3APU+siVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDn6m-006wVK-Do; Wed, 11 Aug 2021 12:13:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDn6J-006wNG-SE; Wed, 11 Aug 2021 12:12:57 +0000
X-UUID: 2c737f17639945c7a1eee65afad22c15-20210811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wozoe7kFjE8qPjz1M4fr5WJfU/E/RA/En/zjFHWQWkw=; 
 b=Sejl83A0OmWHSJ1DtKCGwFt7Wfc2mJ41D/kz8HlxOU0fproBCcFihfCuS0pxIvRCYVHBhWZ4bWpeXTo6V5MPVrR1upSEp2LwfQG/gZD+gQKz9mogO9NxUGFQpUwZflbRpHhSd46EdNsLVrd/G5ZdFyRpvSe22FCc98iOhbnNCJM=;
X-UUID: 2c737f17639945c7a1eee65afad22c15-20210811
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1743534199; Wed, 11 Aug 2021 05:12:41 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Aug 2021 05:12:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 11 Aug 2021 20:12:38 +0800
Received: from mtksdccf07 (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 11 Aug 2021 20:12:38 +0800
Message-ID: <ba4174599b40b5cc2f6397bb9b8772f75b945365.camel@mediatek.com>
Subject: Re: [v6 2/2] arm64: dts: mediatek: Correct UART0 bus clock of MT8192
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Ikjoon Jang <ikjn@chromium.org>
CC: Rob Herring <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 11 Aug 2021 20:12:38 +0800
In-Reply-To: <913973ef-e3ee-5015-a010-b436fe620e1c@gmail.com>
References: <20210727023205.20319-1-chun-jie.chen@mediatek.com>
 <20210727023205.20319-3-chun-jie.chen@mediatek.com>
 <CAATdQgC-X6pijkgTBsWJJKp__J6N=7JNKHQJmOMvTAjivwPM5w@mail.gmail.com>
 <a48525422d4c953a2dac2a907895c20b9fd6d232.camel@mediatek.com>
 <913973ef-e3ee-5015-a010-b436fe620e1c@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_051251_979110_54CCE895 
X-CRM114-Status: GOOD (  27.60  )
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

On Thu, 2021-08-05 at 17:44 +0200, Matthias Brugger wrote:
> 
> On 30/07/2021 04:43, Chun-Jie Chen wrote:
> > On Wed, 2021-07-28 at 14:14 +0800, Ikjoon Jang wrote:
> > > Hi,
> > > 
> > > On Tue, Jul 27, 2021 at 10:43 AM Chun-Jie Chen
> > > <chun-jie.chen@mediatek.com> wrote:
> > > > 
> > > > infra_uart0 clock is the real one what uart0 uses as bus clock.
> > > > 
> > > > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > > > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > > > ---
> > > >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > > b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > > index c7c7d4e017ae..9810f1d441da 100644
> > > > --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > > +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> > > > @@ -327,7 +327,7 @@
> > > >                                      "mediatek,mt6577-uart";
> > > >                         reg = <0 0x11002000 0 0x1000>;
> > > >                         interrupts = <GIC_SPI 109
> > > > IRQ_TYPE_LEVEL_HIGH 0>;
> > > > -                       clocks = <&clk26m>, <&clk26m>;
> > > > +                       clocks = <&clk26m>, <&infracfg
> > > > CLK_INFRA_UART0>;
> > > >                         clock-names = "baud", "bus";
> > > >                         status = "disabled";
> > > >                 };
> > > 
> > > There're many other nodes still having only clk26m. Will you
> > > update
> > > them too?
> > > 
> > 
> > Others will be updated by IP owner.
> > 
> 
> As it seems we will have some time before this can be merged, could
> you help
> work with the other IP owners to get one big patch that updates all
> clocks?
> 
> Thanks a lot,
> Matthias
> 

Ok, I will update all clock setting (uart/nor_flash/i2c/spi) in
mt8192.dtsi at the latest kernel version. Did you suggest to merge all
to one patch or separate to different patches but put in same
series?

Best Regards,
Chun-Jie

> > Best Regards,
> > Chun-Jie
> > 
> > > > --
> > > > 2.18.0
> > > > _______________________________________________
> > > > Linux-mediatek mailing list
> > > > Linux-mediatek@lists.infradead.org
> > > > 
> > 
> > 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!1bIz6X2EiFbigCImzQmbqtezIFfl1LRBuPOYTqBdl5wfx8b-zp0zQP68R7RhaIcAAXXF$
> > > >  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
