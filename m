Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7CADC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 10:18:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76F5D2065D
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 10:18:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RbcSzwWA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZoCYwPuK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76F5D2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m1VeoTLA0srkBOU/nM1XPg6Ad7De9fVOzcgpZ1m4qLY=; b=RbcSzwWAvg8Ros
	z7Q7iNTBQeduYToV1mqdtgiVP5a3XOFkq0GGTXFWmOPTvAreNPDW0Pqf058BJ3T9jwayYM3Gj3G0r
	fSk8zaFh3OYoS38y0NowHJX5HLZbCp4im6FcgAG1ZGKzXwc+i9nJwctoUwoI6HiELzNDbXY718pev
	VX1Q7U2ffqKMpKkFKTIeajqppKlxzEkyo2+AVbXo2dWmccZxRpIhUz4/FcR2ITocXk3osmc7BrIYh
	u3DYYCgAigRmnWS6cl++VLZx6f1YDfuBY4tZaQZzf7FZi92KoHp2nX9G3GGMGZbdiHs2j0OSJczL5
	xV+8Jt2NuCMt8Rpgz0SA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZAwd-0000kG-I8; Thu, 14 May 2020 10:18:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZAwa-0000jG-Bk; Thu, 14 May 2020 10:18:26 +0000
X-UUID: 0022b20896a64158afdd87c4e1a7ddf7-20200514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZbYU37rZb9gDHueAY0VNcPPMOrExOy8uaF8KayG70pE=; 
 b=ZoCYwPuK1C8e1QD8AiOA8wnAf7SqWCSYGquSwe9toJj8xFkqosCfhW3+Y6XdLITH5unhxQVV63XGSOjU2LF6Xa/UK9Bqn6NulHAQQJ5Q+VP7pTUT4pOX9jzfPS/Mk+j4eQPb8ex0k7J90HnimIu1NswbUVGlfchuBjFhjDcpU0c=;
X-UUID: 0022b20896a64158afdd87c4e1a7ddf7-20200514
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 26409725; Thu, 14 May 2020 02:18:19 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 May 2020 03:18:15 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n2.mediatek.inc
 (172.21.101.141) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 14 May 2020 18:18:13 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 14 May 2020 18:18:11 +0800
Message-ID: <1589451415.25512.14.camel@mhfsdcap03>
Subject: Re: [PATCH] i2c: mediatek: Add i2c ac-timing adjust support
From: Qii Wang <qii.wang@mediatek.com>
To: Wolfram Sang <wsa@the-dreams.de>
Date: Thu, 14 May 2020 18:16:55 +0800
In-Reply-To: <20200514062951.GA1145@kunai>
References: <1585223676-30809-1-git-send-email-qii.wang@mediatek.com>
 <20200512133852.GE13516@ninjato> <1589418905.25512.10.camel@mhfsdcap03>
 <20200514062951.GA1145@kunai>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_031824_409778_FDFB2B08 
X-CRM114-Status: GOOD (  10.17  )
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
Cc: srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-05-14 at 08:29 +0200, Wolfram Sang wrote:
> > > Last question: You seem to be the one doing major updates to this
> > > driver. Thanks for that! Are you maybe interested in becoming the
> > > maintainer for this driver? I think there won't be much patches to
> > > review and reports to handle but it will speed up processing for me.
> > 
> > Yes, It is my honor to be the maintainer for this driver.
> 
> Awesome! :) Can you prepare a patch for MAINTAINERS or shall I?
> 

ok, I will send with this patch.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
