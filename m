Return-Path: <SRS0=cOAS=65=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C01DC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 16:20:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A4EB206D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2020 16:20:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eG14pSvK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="gnu6BnKS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A4EB206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TyMD/8XN3ZqSrVfZexu4ORJH35Ky7kbwMBtdSxUQPWg=; b=eG14pSvKgTdmcL
	HM1rUHdqg1TpB8y9WIZmuc/BKkP9XqvEv9I3Nut/SrzRCgGes6W2m941dZsI2BVcyFDq2+FO9A+rq
	KbTlM5gDU+jCb7LF1AzlezSJFZj0/rHBopN7nP03glvHKsEgnyVjjV/Zpecu5pieIg2Kx1RWTS7qj
	JjdKwTDhjs3k8giKL8PSg70IRl0Etleqw874/bghAwFfeKyWHLkhThDunxPkvtnqmFO3nCSB4m0j0
	8LOlEwLh47MaHENfaIiAVVWGChieyAtLhjh6o7HdJzxdg7ousGEqpM2dUf86I/mTTCUWn2w066z2v
	cq7W3y14pC9E997LxBVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZd4N-0000Rs-6i; Fri, 15 May 2020 16:20:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZd4H-0006Xj-Gx; Fri, 15 May 2020 16:20:17 +0000
X-UUID: 4597d2909441446fbd672b14d3cc48de-20200515
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=daT5vIjMMWKHxeEq35Hg3A5bQddsffUWP1nkfOQhP6s=; 
 b=gnu6BnKSdmTStfX/P09VcThW+EUE3y4Z1paN2zromqco3UYPQuJtgzn0olhgqNNqQBIN4gUl02xHN+H9SQdZHW5wy4/DwSHjsGvRs+eraYt8dKHfbncVCNdJqfkytYgjSKXflUAQt6pjl/tlauw0qQHuWYwVtRPNImfMhnX/ZcU=;
X-UUID: 4597d2909441446fbd672b14d3cc48de-20200515
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1109447986; Fri, 15 May 2020 08:19:45 -0800
Received: from MTKMBS32N2.mediatek.inc (172.27.4.72) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 May 2020 09:19:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS32N2.mediatek.inc (172.27.4.72) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 May 2020 00:19:54 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 16 May 2020 00:19:43 +0800
Message-ID: <1589559587.28571.0.camel@mtksdaap41>
Subject: Re: [PATCH v8 2/3] drivers: input: keyboard: Add mtk keypad driver
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Sat, 16 May 2020 00:19:47 +0800
In-Reply-To: <20200515114044.GR185537@smile.fi.intel.com>
References: <20200515062007.28346-1-fengping.yu@mediatek.com>
 <20200515062007.28346-3-fengping.yu@mediatek.com>
 <20200515093016.rw5bmvoumgzvkqrc@pengutronix.de>
 <20200515114044.GR185537@smile.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 504A2C560B75F9C0E94BF133E726E79914057E37B5687E4BA8C310B10E096B912000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_092013_579249_12015736 
X-CRM114-Status: UNSURE (   7.48  )
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
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Marco Felsch <m.felsch@pengutronix.de>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Fengping Yu <fengping.yu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-05-15 at 14:40 +0300, Andy Shevchenko wrote:
> On Fri, May 15, 2020 at 11:30:16AM +0200, Marco Felsch wrote:
> > On 20-05-15 14:20, Fengping Yu wrote:
> 
> ...
> 
> > > +	depends on OF && HAVE_CLK
> > 
> > Please drop those deps and instead use:
> 
> +1
> 
> > depends on ARCH_MEDIATEK && ARM64
> 
> I would go even further
> 	depends on (ARCH_MEDIATEK && ARM64) || COMPILE_TEST

Please drop ARM64. This works for 32bits SoC as well.

Joe.C


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
