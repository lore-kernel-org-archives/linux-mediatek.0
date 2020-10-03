Return-Path: <SRS0=+yJE=DK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4A83C4363D
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2020 10:07:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EBE8206CA
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Oct 2020 10:07:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="x5Z3ZeRK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="t0Tw5DJ7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EBE8206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AR9gKVupHR+1w+Wg1NdL64baKBImyWy13x72NdLqWN0=; b=x5Z3ZeRKLi3C8C4FQVy9hJlAl
	G1OC2I/LGcryo83Pu9SXEFKtRLOtIej0byToE47FaVauzBiOFSgzyDXzaKiiFadrDwB84hR0LSvNT
	gG51BaMOD/6gRlQch/1eH1pZvkD4ZxkiktH/VnRkH84DwDECa+lf9R5HPxaa1qK0SdVp024TKcSqq
	0LZbCPrGZqA17jphzoN0eilXNjQCc74lrrBb9RwAgOAm2jN7pyxQIey2hMT6Qb6lpNWV9tuTqqe9X
	wxBrEgGm8PsPZ2rg84MCH4+k/1EzWyJh7ITKU/6OUlm9Ny2swvvSmLktwytOuVC4ZFbvpMnfkskuQ
	Gc3x9vwyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOeRh-0002zv-3Z; Sat, 03 Oct 2020 10:07:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOeRZ-0002y7-Pn; Sat, 03 Oct 2020 10:07:12 +0000
X-UUID: 03d033b64a7547028677ead076542fa9-20201003
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=XNRzXuFMSlzxxGZrXmTzf78PDDjCanucLXGX3tXCMVc=; 
 b=t0Tw5DJ7Z3pjppfPTnYfGF9fTrRsw6yRcOwXRJNTnJymGVujSqGUSxSmYbKevSuWdrFAF4i1IiEkenEUxuThmix/hlOreIFW1sKbw3+Qsbuy8DyO49E+N5seS/pVu+WiUcvTHdnmBV+JxaA78Iu2A20Um+mm+ssMqQTa3qVxu80=;
X-UUID: 03d033b64a7547028677ead076542fa9-20201003
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1783892160; Sat, 03 Oct 2020 02:06:56 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 3 Oct 2020 03:06:54 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 3 Oct 2020 18:06:42 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 3 Oct 2020 18:06:42 +0800
Message-ID: <1601719607.774.1.camel@mtkswgap22>
Subject: Re: [PATCH v10 3/3] clk: mediatek: add UART0 clock support
From: Hanks Chen <hanks.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>
Date: Sat, 3 Oct 2020 18:06:47 +0800
In-Reply-To: <1599546314.24690.3.camel@mtkswgap22>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
 <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
 <1599546314.24690.3.camel@mtkswgap22>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6297D8A22D190C79E560529B8B9A1614A3F0EDC1D7AD1F9E0539D6629E5EC1AA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201003_060709_970586_133FE54F 
X-CRM114-Status: GOOD (  19.34  )
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
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 Andy Teng <andy.teng@mediatek.com>, Linus
 Walleij <linus.walleij@linaro.org>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Loda Chou <loda.chou@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 mtk01761 <wendell.lin@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Michael & Stephen,

Please kindly let me know your comments about this patch.
Thanks

Regards,
Hanks


On Tue, 2020-09-08 at 14:25 +0800, Hanks Chen wrote:
> Hi all,
> 
> Gentle ping on this patch.
> 
> Thanks
> 
> 
> Hanks Chen
> 
> 
> On Thu, 2020-07-30 at 21:30 +0800, Hanks Chen wrote:
> > Add MT6779 UART0 clock support.
> > 
> > Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
> > Signed-off-by: Wendell Lin <wendell.lin@mediatek.com>
> > Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > ---
> >  drivers/clk/mediatek/clk-mt6779.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
> > index 9766cccf5844..6e0d3a166729 100644
> > --- a/drivers/clk/mediatek/clk-mt6779.c
> > +++ b/drivers/clk/mediatek/clk-mt6779.c
> > @@ -919,6 +919,8 @@ static const struct mtk_gate infra_clks[] = {
> >  		    "pwm_sel", 19),
> >  	GATE_INFRA0(CLK_INFRA_PWM, "infra_pwm",
> >  		    "pwm_sel", 21),
> > +	GATE_INFRA0(CLK_INFRA_UART0, "infra_uart0",
> > +		    "uart_sel", 22),
> >  	GATE_INFRA0(CLK_INFRA_UART1, "infra_uart1",
> >  		    "uart_sel", 23),
> >  	GATE_INFRA0(CLK_INFRA_UART2, "infra_uart2",
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
