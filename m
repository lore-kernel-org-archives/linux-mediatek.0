Return-Path: <SRS0=w0xa=BA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF5AC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 12:33:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1C472080D
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Jul 2020 12:33:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eG91G/bC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oOkEf3hA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1C472080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8cgNGu8nhoSiD85dvA3hiYJa4Uwng6rxMbMhZc3LxGE=; b=eG91G/bCmKLYzShdl1UXuJfWl
	1JHlPcAGgJ6p01eIdvqDh4hgrbzCRTGyuD0kAzpiKR5ae54WLIBl8jLfjmqO3xWkjwkf75y21bSVS
	OK3bFPWkly6okT4O4jJ3Z5ouN7SYPwF8Lp//nXIBsax0BpS5yqGLZ5eZZOZdeuk0+bUiN/8zLHPlq
	ZZj6hSPjMKaIC7rSCgLTKkeuVr2wB+ghJky5AmQnbe9UlPbsuht7YVAAkXmGrZuL+HjtUW5FbWIpx
	xjiENgSnZrOXh/cNeRonnBmDZ1dmgt/K9ycSglP5NeSVzk/7O0WQ+9heHo3OsdcVL0hCFq4Xo2pZy
	VPDeSWAsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxrSp-00053D-F8; Tue, 21 Jul 2020 12:33:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxrSk-00051g-Tu; Tue, 21 Jul 2020 12:33:39 +0000
X-UUID: 9f410a7ed9524431be2772d16d24346e-20200721
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fjg7nMNQVLp7jHAziQfjeWpWwhYiATooWUXF/1IXayU=; 
 b=oOkEf3hAxACP+8aU9ajnmJQ3VHqbsBO0NGaLnQXHUcXsipANTE7t6Zl92VIp4XVBFsWPOtxlwGX5YBrbiIzo5InMM5k5MLVQTIX2a2aFosDIlmAHMcXWl67glxeoOo0uL62kqy+FFqw7V5z7om5RdZamuS8xFg6gxweBzsFtQxU=;
X-UUID: 9f410a7ed9524431be2772d16d24346e-20200721
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1459752961; Tue, 21 Jul 2020 04:33:22 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jul 2020 05:23:30 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 21 Jul 2020 20:23:28 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 21 Jul 2020 20:23:26 +0800
Message-ID: <1595334144.31408.0.camel@mhfsdcap03>
Subject: Re: [PATCH] dt-bindings: spi: update bindings for MT8192 SoC
From: lei liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 21 Jul 2020 20:22:24 +0800
In-Reply-To: <20200721094859.GB4845@sirena.org.uk>
References: <20200721024819.7150-1-leilk.liu@mediatek.com>
 <20200721094859.GB4845@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 68EB313837D36780FC0EDA997D82074C7AB48D5FE3646CEC1E13DEF30727FA492000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_083339_177773_555F1875 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-07-21 at 10:48 +0100, Mark Brown wrote:
> On Tue, Jul 21, 2020 at 10:48:19AM +0800, Leilk Liu wrote:
> > From: "leilk.liu" <leilk.liu@mediatek.com>
> > 
> > Add a DT binding documentation for the MT8192 soc.
> 
> I'd expect to see a matching driver patch.

OK,I'll send patch v2. Thanks.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
