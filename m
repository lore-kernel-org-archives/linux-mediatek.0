Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55333C43461
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:25:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 122F021919
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 06:25:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V2cMbQfR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="prwU7SQr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 122F021919
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hy/eiteGaiLMz1kF2OtdLcVlf2K7HIWRjvNeSvkr7rg=; b=V2cMbQfR5NApz746LQvO5etVc
	8DabW69filUKmWqV1v96A6kZBUqVyaopsMopG3qmqrMluWYOh34u+XrSCFt1WWKv59akCSxCkA8kW
	vXqyKhqAAcBE8euzUCUtgHC/Phj58sYnc6pRkwkL0Axnbqnhy3DIwiI/Q5rUBJBuOTt/Jo1KWY5+I
	Eqs9ephw6Vre8FVkKTFjJaSpqZQp7/zYpglmqyzcLP74M8x37c0dRQuNmr8voyWsGMeXxOAYBB86H
	jufkiyxaxNZDqu7Kc2tQe2PGpp1g7Nvp29MoJnO/o52mZUybYsAC2KQA+NcGtNQ4BE3Fhlr/i4Sum
	L0yx/giig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFX4J-0002ye-5R; Tue, 08 Sep 2020 06:25:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFX4E-0002wq-MC; Tue, 08 Sep 2020 06:25:25 +0000
X-UUID: 43ea92f22ab9455da8f01bbe1f05bd4d-20200907
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JFs/7grVIbwhByvbA9TvSWfC2MnkuM8o1rJWg0q28ws=; 
 b=prwU7SQrBokBZznMYqOs+N3/YLcwVqM5A6Rhq5XKTumxvFyrUaK8OEckVf/LcWQP7uPeRupsvzsoq5C4Q/hJyOg6dCaPMNFpLcZ+j+mWMHYbPg54fSBZJYLqZrxh7fWKA4MnYmYnTCrSwfJVMadRRGhWXrkWZPnYYYxHbAT1Xwk=;
X-UUID: 43ea92f22ab9455da8f01bbe1f05bd4d-20200907
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1102324909; Mon, 07 Sep 2020 22:25:17 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Sep 2020 23:25:15 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 14:25:13 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Sep 2020 14:25:14 +0800
Message-ID: <1599546314.24690.3.camel@mtkswgap22>
Subject: Re: [PATCH v10 3/3] clk: mediatek: add UART0 clock support
From: Hanks Chen <hanks.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 8 Sep 2020 14:25:14 +0800
In-Reply-To: <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
References: <1596115816-11758-1-git-send-email-hanks.chen@mediatek.com>
 <1596115816-11758-4-git-send-email-hanks.chen@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_022522_927592_07C410EE 
X-CRM114-Status: GOOD (  16.99  )
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
 Stephen Boyd <sboyd@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Loda Chou <loda.chou@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 Michael
 Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

Gentle ping on this patch.

Thanks


Hanks Chen


On Thu, 2020-07-30 at 21:30 +0800, Hanks Chen wrote:
> Add MT6779 UART0 clock support.
> 
> Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
> Signed-off-by: Wendell Lin <wendell.lin@mediatek.com>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  drivers/clk/mediatek/clk-mt6779.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
> index 9766cccf5844..6e0d3a166729 100644
> --- a/drivers/clk/mediatek/clk-mt6779.c
> +++ b/drivers/clk/mediatek/clk-mt6779.c
> @@ -919,6 +919,8 @@ static const struct mtk_gate infra_clks[] = {
>  		    "pwm_sel", 19),
>  	GATE_INFRA0(CLK_INFRA_PWM, "infra_pwm",
>  		    "pwm_sel", 21),
> +	GATE_INFRA0(CLK_INFRA_UART0, "infra_uart0",
> +		    "uart_sel", 22),
>  	GATE_INFRA0(CLK_INFRA_UART1, "infra_uart1",
>  		    "uart_sel", 23),
>  	GATE_INFRA0(CLK_INFRA_UART2, "infra_uart2",

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
