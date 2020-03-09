Return-Path: <SRS0=iNWv=42=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 112F3C10F25
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 23:16:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5B132146E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 23:16:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VWFf6597";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="F+8FFpPD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5B132146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nLuoA8wpcH6EllM4TG+OHv42dOOpj/5G38zd/79Scdw=; b=VWFf65975vC3QP
	SRezW+z5nKV/A6Rni0C4omYnZBTH4Jtur2qon/TZZq43BPBLJ5Cj63F+gGatSI3PpRfK4w+3omG6l
	IFL8BkDroL5nC3tRD7X7AHlATMQxlcB/C6vKNZwimx2dl1utgV92ZN1b8KXREQW94bK4puAIefzNh
	1PIeRY2plCO04D1nHaLO7CHVyFj+m/9J2fdKpraegvcysoK4pkq/Nnv4LNN46Eqc7/VeN2F5Iiaf4
	3hLJS21ByPdtEVtH4f2/h20E1jLGHGbK0kWYMWAZ4qrk7DQ4tfN2ct2ZZpVQ9Myjzih1BK3G7XgC4
	iXZE5U8DTluShzqR/enw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBRdI-0001zk-Cp; Mon, 09 Mar 2020 23:16:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBRd7-0001pU-8a; Mon, 09 Mar 2020 23:16:14 +0000
X-UUID: b2a624b8065442e6a1fbf40a55f379c0-20200309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lWnTG8Dlpfa7Gb5noWGxFDmhnIB+Ok5FYjYFtioW3kU=; 
 b=F+8FFpPDXP8cA1BmgVWsKqvvSX5xcPZAMRHu4+O7xN3VXx/XbYxnIAu8Is9s0XrNLTv2sI3jauZzatayTyTCWxqXyLM0uOCpPGArh030on53EaYLOn8le9R9qfNphKXW2msCOr4bveZj7OSEeYx4sLqrWa/DDA6ymhB9RKjan9k=;
X-UUID: b2a624b8065442e6a1fbf40a55f379c0-20200309
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 865533897; Mon, 09 Mar 2020 15:16:11 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Mar 2020 16:16:13 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Mar 2020 07:14:55 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 10 Mar 2020 07:13:24 +0800
Message-ID: <1583795768.23665.5.camel@mtkswgap22>
Subject: Re: [PATCH v3 4/4] dt-bindings: mmc: mediatek: Add document for mt6779
From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 10 Mar 2020 07:16:08 +0800
In-Reply-To: <96e4df17-999e-2356-f203-4cef26a8d66d@gmail.com>
References: <1581922564-24914-1-git-send-email-chun-hung.wu@mediatek.com>
 <1581922564-24914-5-git-send-email-chun-hung.wu@mediatek.com>
 <20200219030225.GA14824@bogus>
 <96e4df17-999e-2356-f203-4cef26a8d66d@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_161613_309132_A78E5663 
X-CRM114-Status: GOOD (  12.96  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Kate
 Stewart <kstewart@linuxfoundation.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 wsd_upstream@mediatek.com, linux-mmc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh@kernel.org>, Chaotian Jing <chaotian.jing@mediatek.com>,
 kernel-team@android.com, Pan Bian <bianpan2016@163.com>,
 devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-mediatek@lists.infradead.org, Thomas
 Gleixner <tglx@linutronix.de>, Stanley Chu <stanley.chu@mediatek.com>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Mathieu Malaterre <malat@debian.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kuohong Wang <kuohong.wang@mediatek.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-02-20 at 23:06 +0100, Matthias Brugger wrote:
> 
> On 19/02/2020 04:02, Rob Herring wrote:
> > On Mon, 17 Feb 2020 14:56:04 +0800, Chun-Hung Wu wrote:
> >> Add compatible node for mt6779 mmc
> >>
> >> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> >> ---
> >>  Documentation/devicetree/bindings/mmc/mtk-sd.txt | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> > 
> > Acked-by: Rob Herring <robh@kernel.org>
> > 
> 
> With the commit from patch 3/4 the compatible should be:
> "mediatek,mt6779-mmc", "mediatek,mt8183-mmc": for mmc host ip compatible with mt6779
As I know mt8183 is mt6771 platform not mt6779.
mt6771 does not support CQHCI.
> 
> Regards,
> Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
