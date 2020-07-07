Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27A5C433DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:51:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9025E206BE
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:51:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tlgUguch";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="m598dhiv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9025E206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AiRofckJ1C5quFgWFstCUOdfDbpNMly8civ+a23t/Kc=; b=tlgUguchTT/aCaOo1+5a5JE/y
	8fwPwpFEg3io9Q7NVnp0v4o7YSmyA0zvsvuHNRMwlz0qzoDH9t6aJUxDP9MsjF4End+Alon3eSF1D
	v+ZcmJt4ftDDNyffz04VqlH4w5oMpWf5/GAaQLRD1u+S8NRDQTJqixnLwjXq1G2C1ulfAj6bL4/FA
	xd6TFZa0wbdBXBVI9tGUejuKiUH6BB6JcXf3vPdafYpTPtwiYWhiwG5yP5tafrL+iYK9M/GQLiPPN
	1Fr/Gw5pTokWP9Ii8FhV78gA+CFA8cugOlILqokPyyFnAWHrk9HiQG9Uq8BeqyqhkIhf3AxVZGJg+
	7uNoTUNrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsm7z-0001yl-Vt; Tue, 07 Jul 2020 11:51:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsm7w-0001ws-9W; Tue, 07 Jul 2020 11:51:10 +0000
X-UUID: 31478f8103db4ca88598be1bf9cce5cb-20200707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=3DMwV/Z8QcDuKhf5FKYuKYw/6Ttsn7FiYmhH2inyuNw=; 
 b=m598dhivIyoCn7FiBFuIc58LWXG6u95+ulaNEoVwAOdRRF2akGZ6x42B7UGAFNAt9Jt8y2yXjjZGi1BkHdFZtQ7jGTkUXIwNSOCdAm7/niV24oBxpH2m7UHzky0m9M8K35e5iN3+fIdYViyb6eaNpBK1tVDDCiH0NJkDh+j/kwY=;
X-UUID: 31478f8103db4ca88598be1bf9cce5cb-20200707
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1427406239; Tue, 07 Jul 2020 03:50:55 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 04:51:00 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jul 2020 19:50:58 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jul 2020 19:50:59 +0800
Message-ID: <1594122662.24451.2.camel@mtkswgap22>
Subject: Re: [PATCH v7] Add basic SoC Support for Mediatek MT6779 SoC
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jul 2020 19:51:02 +0800
In-Reply-To: <CACRpkdY+N17VNdzidBdo-Z8rgvRGMh=576-WPULgCmmuSJyN7g@mail.gmail.com>
References: <1593694630-26604-1-git-send-email-hanks.chen@mediatek.com>
 <CACRpkdY+N17VNdzidBdo-Z8rgvRGMh=576-WPULgCmmuSJyN7g@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_075108_486606_1BD297C2 
X-CRM114-Status: GOOD (  14.87  )
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

On Tue, 2020-07-07 at 13:41 +0200, Linus Walleij wrote:
> On Thu, Jul 2, 2020 at 2:57 PM Hanks Chen <hanks.chen@mediatek.com> wrote:
> 
> > Change since v7:
> > Commit "dt-bindings: pinctrl: add bindings for MediaTek"
> > -- fix typo and change order of patch
> > Commit "clk: mediatek: add UART0 clock support"
> > -- add fixes tag and real name
> > Commit "arm64: dts: add dts nodes for MT6779"
> > -- expose all three UARTs in the dtsi
> 
> Oh I see there are still development on this patch set so I took out
> the patches I applied again.
> 
> Waiting for the final reviewed version.
> 
Thank you for taking a look over these so quickly!

Got it, I'll send a newer version.

Thanks!

> Yours,
> Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
