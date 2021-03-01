Return-Path: <SRS0=HsXE=H7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF84C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 01:53:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85F6364DD2
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Mar 2021 01:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85F6364DD2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j7s6WuMnie9RQsHrx3GnXUniBAzhE9bEDQlJorD80oo=; b=xCpXPmIbuDDEJANMGZEV/qe+m
	Ymo8EMuPnIwBAREOBRpnYQWVKiroEcveEyRTZ6dmrJGDOGKmbab6kZE+75ezFzDcQ143HCbwRmYjf
	grwdEG1twkcDFEOxKGfSx8ig677TMtYtJzFC7xQ2sPOJws6qRZBs10LMOOYKpJI6lJ4PXNJ+ZEBw1
	S6yfsHlTh0YfbYgB+0K8qrZSnAiHNhaYxUJreJWb4kUgvhrryrt5L9Yb0Te822aEIRPW9xM8gHC+S
	0VFqJNS9yvM2GuqrjVJbXI4+8aqxQaJrMinWjX9D52DnOrDujjXkIW8qlau7r0lUHCg025cBQaxP1
	JQ1n4izSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGXkI-0003vt-QT; Mon, 01 Mar 2021 01:53:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGXkC-0003ut-CZ; Mon, 01 Mar 2021 01:53:10 +0000
X-UUID: 4f2cf0f2f16049a3b6997c8026c32393-20210228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lZn0loMDBlLQ+v3do751492I2dJdgs8xXjuL08g8siA=; 
 b=gq6r6V10aCF68AJenigWvFpZWPqzWNI94P+VCm9IH8Tm9VUZuXMp7869ymZ0QgXORF8RwPD2N4knVhGCh+71xOVxvDIGNaHp/DH1rcEJQb0aEnXNQ1PyC50LAbp6kS+eqrWe7exq58BrmA54zsUlhVXHW3SgubqJfJtewslQP7c=;
X-UUID: 4f2cf0f2f16049a3b6997c8026c32393-20210228
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <mason.zhang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 140058012; Sun, 28 Feb 2021 17:52:59 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Feb 2021 17:52:58 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Mar 2021 09:52:56 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Mar 2021 09:52:55 +0800
Message-ID: <1614563278.1578.6.camel@mbjsdccf07>
Subject: Re: [PATCH 2/2] dt-binding: mediatek: mt6779: update spi document
From: Mason Zhang <mason.zhang@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 1 Mar 2021 09:47:58 +0800
In-Reply-To: <20210226170705.GB4518@sirena.org.uk>
References: <20210226110109.30500-1-Mason.Zhang@mediatek.com>
 <20210226170705.GB4518@sirena.org.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210228_205309_207220_6AD74AA0 
X-CRM114-Status: GOOD (  11.54  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 hanks.chen@mediatek.com, linux-kernel@vger.kernel.org,
 "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Mark:

	Patch 1/2 is in this link:
	lkml.org/lkml/2021/2/26/325
	I will email you later about patch 1/2.
	
	Thank you for your suggestion!

Thanks
Mason
-----------------
On Fri, 2021-02-26 at 17:07 +0000, Mark Brown wrote:
> On Fri, Feb 26, 2021 at 07:01:10PM +0800, Mason Zhang wrote:
> > this patch update spi document for MT6779 SOC.
> 
> I'm missing patch 1/2 here, what's the story with dependencies?
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem, this makes it easier for people to identify relevant patches.
> Look at what existing commits in the area you're changing are doing and
> make sure your subject lines visually resemble what they're doing.
> There's no need to resubmit to fix this alone.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
