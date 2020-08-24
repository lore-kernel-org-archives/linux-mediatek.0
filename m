Return-Path: <SRS0=7UDR=CC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 740FCC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 02:47:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E3A420768
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2020 02:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DUMWbXzP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="NkEM55mq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E3A420768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q80NI9QWA/8t2aoemUimiMc5lwUINqJOVG4BYuQT9dU=; b=DUMWbXzPSupJpjtnNAIabCIJu
	r/K6QasiCDOKYo6EYmTeCDzwMRSVCEhhIsRFMqZVehdpqymxHtsMz+8WwrJJWlxzpLS1oAg2GkRe0
	hNqYt+fPSX2BJJDrLEvmDenmrYPkmHQku/uxCDKKB/Efohjnc3Hy5zTiow41rTY+yRmwPOwqWxTaZ
	Hxc5yDQUJtIUclMHX+X0eEMMe/2JmwlskP6XcEX8nCsGH68bfhUn5WJBEmR+g4VK9HPoFBqcTTaeh
	UyjGDb0s49M0BASCFgH6PQlR/CXiVBOEdxLl6ft8eSWbapmUD+NPUOVbgwq+Fzu0tqMOuTMzQbkKD
	6jOzEzNiQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kA2VU-0006hg-25; Mon, 24 Aug 2020 02:46:48 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kA2VJ-0006gn-Hd; Mon, 24 Aug 2020 02:46:39 +0000
X-UUID: 0ff17aaef5084377aac0fcc5584642d1-20200823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DGXAb/0Vl5Dez9+vEDFYuUVf9EcPLGR8eaFdhVWVXVQ=; 
 b=NkEM55mqaTTFbe9ofPB2EPse6Ev1uXSjFyTDSKG1xnK+iIVkvAWzUO1CZDrNM9jX+bXsZfh3gwwXa8MPfsewfZoJmyr9hdJs05kLnMR2gnLc4mreJbPkJ/Tpk7ZFKwT92LTizzMD7/iOY9JwSATfY8Z6e2mc+oTgWVbOXwVtpzk=;
X-UUID: 0ff17aaef5084377aac0fcc5584642d1-20200823
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1857532782; Sun, 23 Aug 2020 18:46:28 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 23 Aug 2020 19:36:26 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 24 Aug 2020 10:36:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 24 Aug 2020 10:36:24 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <daniel@0x0f.com>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH v2 1/2] irqchip: irq-mst: Add MStar interrupt controller
 support
Date: Mon, 24 Aug 2020 10:36:08 +0800
Message-ID: <20200824023608.12694-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAFr9PXni=BmDY6_iuJPnYb3d6XB1VrxE6WP3YtSBxT6NciZMMA@mail.gmail.com>
References: <CAFr9PXni=BmDY6_iuJPnYb3d6XB1VrxE6WP3YtSBxT6NciZMMA@mail.gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6E4C3BF49D4DFB9E466CFBA5624D59848AA25DE09D0CFEF9A30BC7D17FB7468C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200823_224637_928000_B027A567 
X-CRM114-Status: GOOD (  13.88  )
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
Cc: devicetree@vger.kernel.org, alix.wu@mediatek.com, jason@lakedaemon.net,
 maz@kernel.org, yj.chiang@mediatek.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 tglx@linutronix.de, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Daniel Palmer <daniel@0x0f.com>

>Hi Mark-PK,
>
>On Thu, 20 Aug 2020 at 00:38, Mark-PK Tsai <mark-pk.tsai@mediatek.com> wrote:
>>
>> Add MStar interrupt controller support using hierarchy irq
>> domain.
>>
>> Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
>
>I've integrated this version into my MStar/SigmaStar tree and tested
>on an MStar MSC313E
>based board (BreadBee) and I'm happy to say it seems to be working:
>
>$ cat /proc/interrupts
>          CPU0
>17:       1219     GIC-0  29 Level     arch_timer
>18:          0     GIC-0  30 Level     arch_timer
>21:          0     GIC-0  42 Level     arm-pmu
>24:          0  mst-intc  44 Level     1f002400.rtc
>30:          0  mst-intc   2 Level     1f006000.wdt
>31:          0  mst-intc   0 Level     1f006040.timer
>32:          0  mst-intc   1 Level     1f006080.timer
>33:          0  mst-intc  12 Level     1f0060c0.timer
>34:          0  mst-intc  40 Level     1f200400.bdma
>35:       3977  mst-intc  41 Level     1f200400.bdma
>37:        196  mst-intc  34 Level     ttyS0
>40:          0  mst-intc  30 Level     soc:usbphy@0
><snip>
>
>So here's my tested by:
>
>Tested-by: Daniel Palmer <daniel@thingy.jp>
>

Thanks for your test.

>I don't think your series contained an update to MAINTAINERS.
>If/when you add this could you add my address above as a reviewer so
>I'm in the loop if anyone makes changes to this going forward?
>

Sure, I will add your address in there. :)
Can I just add a patch in this thread which only contain MAINTAINERS update?
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
