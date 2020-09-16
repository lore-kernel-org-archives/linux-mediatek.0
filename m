Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566BEC43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 08:37:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02F722080C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 08:37:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZEAnEgS+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="I28rbjWw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02F722080C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tjQjYY50m/DHmk+LZxkIkeUkHJ1XGDEexS9X0MKntMY=; b=ZEAnEgS+rkNahYkDSrPjzleJT
	ooi7x5XAEYMijTaBFt34/W6T5R0JHu5RvlDOkq5RFH67uOAZ/WL1xWz3k5garIsm/nYfruIZRSwf3
	N1IVs3n7m3/Ec1O6fL2d7xgMABY0X8zS7+264FrcxsBcK2KFjcFS0YjY/fE1gnakHa0IduxMrm4/y
	fB+udTjcHXFZNB1Sl6667wTB6TD3f3gHhH2MYpjSEgJiJPc2O7aY93y3gFYnCLdkTeBqwXQor+xf8
	3/kIkfwwywA6ZB3KG52sud7qgbQbNxccCQvvwVnm459IgsnJNfV9S5w4mR2dXijBK1i5fQ7kgw4Th
	EzHtyPTcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kISw9-0002KP-9J; Wed, 16 Sep 2020 08:37:09 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kISw5-0002JX-Qm; Wed, 16 Sep 2020 08:37:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=mxxVoPAow/jDG54ecDzqGJb236Vv64phWowbqqoXZkk=; b=I28rbjWwEwIzJNZC1ubbx6Wr2Q
 K8TZVFXovRpbA3fV+NDfKBwnp4ZGMg54Q0ettaSvqJUt6iApkPM21Yq4AX4D1mZ1+snHKaCEK1Y6p
 qH888a+NPuj0VItwfLsStpg2iSWTerIXOQ17aaU/pslQxMRZ6+j+9LYJcYYECvU1/JI9oXyzl/Ukd
 BZfbeni4LMgkXtpw791xc1nyKGvpbqDdqykmUQkQualG6jxRtIpBjqkRzCiAVZX4L7/Abte44dL7d
 S4+taRlQeftuL05Q9QUfZkTaDzdK6YjtChiEC24bCS5FGvOxcOOlUYsxSaihnZqSiSASiUJRfo894
 qgw3qlXg==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kISw3-0007Zp-2S; Wed, 16 Sep 2020 08:37:03 +0000
Date: Wed, 16 Sep 2020 09:37:03 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Phil Chang <phil.chang@mediatek.com>
Subject: Re: [PATCH] [PATCH] ARM64: Setup DMA32 zone size by bootargs
Message-ID: <20200916083703.GA26411@infradead.org>
References: <20200915150855.24825-1-phil.chang@mediatek.com>
 <20200916072206.27499-1-phil.chang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200916072206.27499-1-phil.chang@mediatek.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Alix Wu <alix.wu@mediatek.com>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, YJ Chiang <yj.chiang@mediatek.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Mike Rapoport <rppt@kernel.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 16, 2020 at 03:22:06PM +0800, Phil Chang wrote:
> this patch allowing the DMA32 zone be configurable in ARM64.

Hell no.  The point of the DMA32 zone is that it is exactly the first
4GiG, and not some random size someone decided without explaining why.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
