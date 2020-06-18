Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C096DC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 16:17:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 932B12080D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 16:17:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rr4/SFaz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tDcZvIQh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 932B12080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dj5Xkqq6tWEzzXKkKj04YLZ3tUAFG96TePWmrHOQzM0=; b=rr4/SFazfMaAAG
	Mn5JlOKTQgGShpts3eBErO23wPTr6aRau56EyUBZyls2v1EqO5S8has/8M0Swa2oZ0QpdUbU1vzRO
	R3y1RD1Q+qS9wHkurqjTBDusjtdb95MJXlb3CRgLQKqKm+KMXzKUa0Rw1zUdAk489DMWlADCNUAHQ
	oLevMmEJAOzuncQmkkgA6rTKwudhTroVGIJNo8IltRmYbsfHX49F8fMW6iMu91YBdzdGbSX2OuWHn
	k8kaPyNt8yqC6xh7h7q5dHDkoIzB/1mqmO/U30PvtMrPnRsfB2htxpwV+d9EAX0rQL9oQscAuhLSu
	7Q++tMVBQXKao0o286zg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlxE6-0007ag-13; Thu, 18 Jun 2020 16:17:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlxDx-0007S6-7v; Thu, 18 Jun 2020 16:17:10 +0000
X-UUID: a84adcdcd00f47e3b9563b89e6615b83-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Iw5MdckpEx2wQHfZxi4v7hZqKr+61I5sVoMJrktXj5o=; 
 b=tDcZvIQhLEnEvjxHAC9mX7MyH6/x23QUaGzFMqfZ1bXIsFRxYiExxRGUKQJBDkqZUjRcfLgBpyfu/K+OSZq0wv9psDK9EZ4+L0XX1OnIRzWal5fxF96dX1XOvtqqe+YMY2/C39RWxpA3XnQGnrmw/Rvts3uAaMHXnr+EK/ZfdPM=;
X-UUID: a84adcdcd00f47e3b9563b89e6615b83-20200618
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1439357229; Thu, 18 Jun 2020 08:16:49 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 09:17:01 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 00:16:52 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jun 2020 00:16:51 +0800
Message-ID: <1592497015.10773.21.camel@mtkswgap22>
Subject: Re: [PATCH v6 6/7] clk: mediatek: add UART0 clock support
From: Hanks Chen <hanks.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Fri, 19 Jun 2020 00:16:55 +0800
In-Reply-To: <a61ed70c-a360-f3af-e215-6377ea25a6ab@gmail.com>
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
 <1592480018-3340-7-git-send-email-hanks.chen@mediatek.com>
 <a61ed70c-a360-f3af-e215-6377ea25a6ab@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BF32A141C01CA4CBE6F5B3E0BD896765BF1D1AEE3E31B59103E3586B8D6FC1572000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_091709_289205_BB28C229 
X-CRM114-Status: GOOD (  11.66  )
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
 wsd_upstream@mediatek.com, Stephen
 Boyd <sboyd@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-06-18 at 17:51 +0200, Matthias Brugger wrote:
> 
> On 18/06/2020 13:33, Hanks Chen wrote:
> > Add MT6779 UART0 clock support.
> > 
> 
> Please a dd fixes tag:
> 
> Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")

Got it, I'll add it in next version.

> 
> > Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> > Signed-off-by: mtk01761 <wendell.lin@mediatek.com>
> 
> Must be a real name not "mtk01761"

Oops, I'll update his name. 

Thank you for your comment.

> 
> > ---
> >  drivers/clk/mediatek/clk-mt6779.c |    2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
> > index 9766ccc..6e0d3a1 100644
> > --- a/drivers/clk/mediatek/clk-mt6779.c
> > +++ b/drivers/clk/mediatek/clk-mt6779.c
> > @@ -919,6 +919,8 @@
> >  		    "pwm_sel", 19),
> >  	GATE_INFRA0(CLK_INFRA_PWM, "infra_pwm",
> >  		    "pwm_sel", 21),
> > +	GATE_INFRA0(CLK_INFRA_UART0, "infra_uart0",
> > +		    "uart_sel", 22),
> >  	GATE_INFRA0(CLK_INFRA_UART1, "infra_uart1",
> >  		    "uart_sel", 23),
> >  	GATE_INFRA0(CLK_INFRA_UART2, "infra_uart2",
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
