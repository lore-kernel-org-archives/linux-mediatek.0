Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DBA1C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 11:36:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08FBF20825
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 11:36:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2VndaCmp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cPaLs2Po"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08FBF20825
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5QeWuEk0DOkJqnkLWKKwaBJNyp8xplIv8J8FKvfi/Ns=; b=2VndaCmpRuh8eNkWBeDH4EvzI
	jQgBG7hrngk9UTp60X39ePEd5GPtskeKRBvhxMe99nfZCJ2iPfFU/UQILQR5Y5pIt8BJ5pyjvhZfN
	ZTK60w+EFeQrt7zAjgw9npJ5/vWb96Va+HKixGeEMyENzsqnzfcNVf6CVgHRKYk8hgs+vRm7Si7St
	DvNx7etrqv9M6/Sp7180ywtID4J1fo+UO7CbjANRslL1VUzNCj/JZG8dKlLbUlXaGhaB0XK18RM8o
	nE946EFaRgyQp4KXwVkn+350ZnVHPuSg855go2iYahhKZSj1jnxG/oVF4TmwzthnvsAYQlR2R3237
	eUz61nR+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyZWM-0002sJ-VE; Thu, 23 Jul 2020 11:36:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyZWK-0002rN-Km; Thu, 23 Jul 2020 11:36:17 +0000
X-UUID: 1f8a75301066416697e4c5b5b5735b91-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=h6iJ9UF693GrpDdmR7RuLUhXwqBFPofdnXMMN+00wK4=; 
 b=cPaLs2PoPr2U6VNyPvRfPCvPyExUKPO2NKDKt5pqZ06nbcQDeJO3nuNHSNyigld7If3UL/E0OyGAKZJOvpVBmXw9q6IPNEi9nTZMQnt70S9Z33/9uwF0YM3B368bIv2DI573jfxZJ73gJJrDhi0w5UBtfoOgvROa8prxjODOL0M=;
X-UUID: 1f8a75301066416697e4c5b5b5735b91-20200723
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2114587400; Thu, 23 Jul 2020 03:34:03 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 04:29:33 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 19:29:26 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 19:29:26 +0800
Message-ID: <1595503768.5511.8.camel@mtkswgap22>
Subject: Re: [PATCH 2/7] dt-bindings: pinctrl: add bindings for MediaTek
 MT6779 SoC
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Jul 2020 19:29:28 +0800
In-Reply-To: <CACRpkdZNL=mnF0dx63bQPpHVLcAHA=oSEiiHzH8vi3+X58y5Jw@mail.gmail.com>
References: <1594717479-8160-1-git-send-email-hanks.chen@mediatek.com>
 <1594717479-8160-3-git-send-email-hanks.chen@mediatek.com>
 <CACRpkdZNL=mnF0dx63bQPpHVLcAHA=oSEiiHzH8vi3+X58y5Jw@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_073616_876783_E611F7E8 
X-CRM114-Status: GOOD (  12.50  )
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
Cc: "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 CC Hwang <cc.hwang@mediatek.com>, wsd_upstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
 Loda Chou <loda.chou@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open
 list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-07-16 at 15:26 +0200, Linus Walleij wrote:
> On Tue, Jul 14, 2020 at 11:04 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
> 
> > From: Andy Teng <andy.teng@mediatek.com>
> >
> > Add devicetree bindings for MediaTek MT6779 pinctrl driver.
> >
> > Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> (...)
> 
> Please make an attempt to reuse the generic schemas in
> Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
> 
> See how other bindings reuse them, e.g.:
> qcom,ipq6018-pinctrl.yaml
> 
> Yours,
> Linus Walleij

Got it, I'll fix it in next version
https://lkml.org/lkml/2020/7/23/385

Thank you for your reply


Hanks Chen
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
