Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AADEC433E3
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 03:09:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5766E207CD
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 03:09:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fujBShkF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="VlXzJ8wV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5766E207CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8agmLSucCbrBGB+xS3g6ol0JQtIlJMgdz2Rx9riTkaY=; b=fujBShkFNHxGSx9ycetRpgDHk
	pxowM7a/x3oqZTp2QJ5kn+187rY7u2m25m13CfwbHbLFP0fIZ01BEWE1SPpuqUpyFBZW9SlHI+Qmh
	q2fZk9a+NKuJOQ1vAE8MW8gYpSnFlbSEl1m4SoyOHigLLOkhxS79JGZEa8zqUnbV8mnPFT5dZh1pA
	g2nAAY5nL6/4B4J1aszDeCa5lLtFlWUN9tOf/vF29ExWq8///cnt9mInd/I9OmEYehlXkTPzSX4GZ
	U8ufCqnPypbGO4X/msuc10g+6jowwLok3NzU+IN74Q1t90Bt6f+VdL228TzkHybdCB5zb5M2m6oYg
	8ISqyvbNw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy58K-0003QB-JN; Wed, 22 Jul 2020 03:09:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy58H-0003Pf-A2; Wed, 22 Jul 2020 03:09:26 +0000
X-UUID: a95aff14a10d475f9fe6d94b08d41e4f-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=EQlBNdgxDDQYmxmxAAY+m5Jl7VPvZcgaU2N1aVAS/UA=; 
 b=VlXzJ8wVm7greNXxv565ne8y6i2sXYMTtiJEJ3xb7TesYg/NrtmWy4KUe2UNDWqSAtVZqpCiWT+0w3pQixkmlxbdmPjnOmcYa9omcTXXLWSuThPeu/wVIqUbCj4g1YFcYsrI8GC3Zg+GmNJgT3hPHIrxITlcoXV2eTXk0l4qkoM=;
X-UUID: a95aff14a10d475f9fe6d94b08d41e4f-20200721
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1985787266; Tue, 21 Jul 2020 19:09:24 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 20:09:20 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 11:09:19 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 11:09:19 +0800
Message-ID: <1595387359.12347.0.camel@mtkswgap22>
Subject: Re: [PATCH 1/2] dt-bindings: clock: remove UART3 clock support
From: Hanks Chen <hanks.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 22 Jul 2020 11:09:19 +0800
In-Reply-To: <22a7a43b-1345-f316-f212-4d956ada50c4@gmail.com>
References: <20200721054033.18520-1-hanks.chen@mediatek.com>
 <20200721054033.18520-2-hanks.chen@mediatek.com>
 <22a7a43b-1345-f316-f212-4d956ada50c4@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_230925_805402_99253841 
X-CRM114-Status: GOOD (  15.38  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, wsd_upstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-22 at 00:10 +0200, Matthias Brugger wrote:
> 
> On 21/07/2020 07:40, Hanks Chen wrote:
> > remove the redundant clk interface of uart.
> > 
> > Fixes: 710774e04861 ("clk: mediatek: Add MT6779 clock support")
> 
> These are cosmetic changes. They don't fix any bug, so we won't need a Fixes tag 
> here. Neither on 2/2.
> 
> Regards,
> Matthias
> 
Got it, I'll remove it in next version.

Thanks!

Hanks

> > Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> > ---
> >   include/dt-bindings/clock/mt6779-clk.h | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/include/dt-bindings/clock/mt6779-clk.h b/include/dt-bindings/clock/mt6779-clk.h
> > index b083139afbd2..2b5f2354d7eb 100644
> > --- a/include/dt-bindings/clock/mt6779-clk.h
> > +++ b/include/dt-bindings/clock/mt6779-clk.h
> > @@ -229,7 +229,6 @@
> >   #define CLK_INFRA_UART0			21
> >   #define CLK_INFRA_UART1			22
> >   #define CLK_INFRA_UART2			23
> > -#define CLK_INFRA_UART3			24
> >   #define CLK_INFRA_GCE_26M		25
> >   #define CLK_INFRA_CQ_DMA_FPC		26
> >   #define CLK_INFRA_BTIF			27
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
