Return-Path: <SRS0=jvDT=AA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D23AC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 01:48:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E68320888
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jun 2020 01:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a9da3x/F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nPYs9bQS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E68320888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=je6vFiHnnRUGUZZUQd3uXl4AeQjKK+qXpPg+17/yat0=; b=a9da3x/Fo2dG+5
	OeyFlSWmktXU3ttykYNZdkEdZ9130b1cmCPJRfFG03oLNDVVS2kt+vwz2Gspc0tjXoLRvgWVABYIm
	KDqWWKBaFp/Dk36yld3wMDSu3WJpDlUMOYQ1xTOVCAQsq0K9eRGm/NArhtmlq9WLoOxRB5QEWiCLK
	vLbNvhx1vVyiZUzxXwqS7w4xSNlxROdQOboIFUjSAESUrtQ8Wcll0CSiXugpzaDGCptp0wacwgPX5
	0PMCZUCGQCIpwpzi+NYgML27YwH7LlrY4hYgknVcKZLZv3fn/rRRXu0emVCSCOmpcTcbVVyHUlpPs
	BWmmXTpxZ1M+DhnJtE1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jm68L-00016S-5S; Fri, 19 Jun 2020 01:47:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jm68J-00015V-45; Fri, 19 Jun 2020 01:47:56 +0000
X-UUID: 70a54a09e5934659829bcf1d3912993c-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=DE1s9SBibd4ThP5Mt1aI+rVY3mxb520JHblT3mUqGaQ=; 
 b=nPYs9bQSvMx758JJes/N3Y8rvqsdPvHmviSI1TY6cSoPhSkjVX3Bmzk7BUDczhxNNAtPCh9+pATpCY2K/6fX/he20/r8cXVlnMmHS159p+QMO59fvhnPatJVJ2ctHETzepaZc5tN9PDF8fNQHm/KIHoRrmGU6+bGJUj3uO84ge8=;
X-UUID: 70a54a09e5934659829bcf1d3912993c-20200618
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1401431628; Thu, 18 Jun 2020 17:47:49 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 18:47:42 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 19 Jun 2020 09:47:39 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Jun 2020 09:47:44 +0800
Message-ID: <1592531264.19628.2.camel@mtkswgap22>
Subject: Re: Security Random Number Generator support
From: Neal Liu <neal.liu@mediatek.com>
To: Marc Zyngier <maz@kernel.org>
Date: Fri, 19 Jun 2020 09:47:44 +0800
In-Reply-To: <c3d5d4a79c7fe158cae117ff79ab332b@kernel.org>
References: <1591085678-22764-1-git-send-email-neal.liu@mediatek.com>
 <CAMj1kXHjAdk5=-uSh_=S9j5cz42zr3h6t+YYGy+obevuQDp0fg@mail.gmail.com>
 <85dfc0142d3879d50c0ba18bcc71e199@misterjones.org>
 <1591169342.4878.9.camel@mtkswgap22>
 <fcbe37f6f9cbcde24f9c28bc504f1f0e@kernel.org>
 <1591170857.19414.5.camel@mtkswgap22>
 <c3d5d4a79c7fe158cae117ff79ab332b@kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DFDBAF610BC86DD2371E32B64FAA3749787DA7AB10884CFFC46B8422DC8468052000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_184755_170496_2015A8BF 
X-CRM114-Status: GOOD (  11.38  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE
 TREE BINDINGS" <devicetree@vger.kernel.org>, Julius Werner <jwerner@google.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jose.Marinho@arm.com,
 Sean Wang <sean.wang@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Crystal Guo =?UTF-8?Q?=28=E9=83=AD=E6=99=B6=29?= <Crystal.Guo@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Neal Liu <neal.liu@mediatek.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Matt Mackall <mpm@selenic.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Ard
 Biesheuvel <ardb@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Marc,

On Thu, 2020-06-18 at 10:50 +0100, Marc Zyngier wrote:
> On 2020-06-03 08:54, Neal Liu wrote:
> 
> Hi Neal,
> 
> > Do you know which ARM expert could edict this standard?
> > Or is there any chance that we can make one? And be reviewed by
> > maintainers?
> 
> It appears that ARM just released a beta version of the spec at [1].
> 
> I'd encourage you (and anyone else) to have a look at it and provide 
> feedback to ARM.
> 
> Thanks,
> 
>          M.
> 
> [1] 
> https://developer.arm.com/-/media/Files/pdf/DEN0098-True_Random_Number_Generator_Firmware_Interface-1.0BET2.pdf

I also received this spec from ARM. I'll take a look and see if it meets
our needs.
Thanks for your sharing.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
