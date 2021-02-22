Return-Path: <SRS0=FZAz=HY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,LOTS_OF_MONEY,
	MAILING_LIST_MULTI,MONEY_FREEMAIL_REPTO,MONEY_NOHTML,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A00C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Feb 2021 15:17:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9444E6148E
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Feb 2021 15:17:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9444E6148E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=real-ptt.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:
	Content-Description:MIME-Version:Cc:Content-ID:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lg8IWkiz7ncSkCKt1N5Aa02P8oHpaSQZrW7H4aq1tbo=; b=WR/eLcG8YgHYPy
	HTNguP0ldY3c7YdmIME336UpnxDExxBrI9KTTyB0Ki3f30RZXyhZV5ab0E46hPtfW/kZtdf7y/+Yf
	ArwYhruq8wqScmYNLWU5g6wpynd1GgJqea+3JTREc8bvi8sbSHj2l8Qzy0UHZoarm7WmT+cgVrZhR
	DbPLXj6l0jPY6ydF6CNpR9sAn7Qq+plGpDr7+7OlOJjtLBL8lj4Qpy2wOgQ6pIBibOX7fA1h6lo3X
	wYzXQHIRwEN0W5pI+Ia5C26S8lixlYP9P1HmWtPFIm8eMjIdoVPKb+IHnItzfxK33S5BX/O9FkgWL
	hlQIZknu0BIP769el/Iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lECxC-0001gF-8A; Mon, 22 Feb 2021 15:16:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lECx6-0001dm-3p
 for linux-mediatek@merlin.infradead.org; Mon, 22 Feb 2021 15:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Reply-To:Date:From:To:Subject:
 Content-Description:Content-Transfer-Encoding:MIME-Version:Content-Type:
 Sender:Message-ID:Cc:Content-ID:In-Reply-To:References;
 bh=pXIgOOxyZp4aE+IYJxOfc37kmQfJ+Fic1R3d+i9deOQ=; b=Z4rqZ0u11LhnYvhNwvFpeHfDg4
 5Sdfb9tdTcnkZesGadWWCwvPn2u35DolB4USd6MHtRZqkIjOhjgFx1tCbvChG1MaXDu8slKl/RBjh
 UeVfIRjJBUDzOcq9aheXykq9rm9ZnkGNZhqrs58Qyq4eKPybFnWBWuYsF1VM5xn5yj+Zlai7ZDSlm
 AF/6ovyXH8p5Na4Vuw1r0W8FvNF5FEOyDOTqDuUVtZpK4LSebmeOXhvxOWxmnRvkN4KXYlht542bb
 0jk7aBwpdpB97BuX63WMVT+Qzg2fqetjV93w4lY8HUBhQr7ptKDJ2kcKn3tQr7+riV3voUa7RrVHL
 6RTVkRfA==;
Received: from [8.211.43.121] (helo=mail.real-ptt.net)
 by casper.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lECwv-006jB6-SY
 for linux-mediatek@lists.infradead.org; Mon, 22 Feb 2021 15:16:40 +0000
Received: from [103.99.1.174] (unknown [103.99.1.174])
 by mail.real-ptt.net (Postfix) with ESMTPA id 5B886BBE5F
 for <linux-mediatek@lists.infradead.org>; Mon, 22 Feb 2021 23:16:30 +0800 (CST)
MIME-Version: 1.0
Content-Description: Mail message body
Subject: Low-Cost Loans for SMEs & Investment Funding.
To: linux-mediatek@lists.infradead.org
From: "Nicholas Toms" <service@real-ptt.net>
Date: Mon, 22 Feb 2021 07:16:28 -0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_151640_180416_8F34C8A9 
X-CRM114-Status: SPAM  (  -5.17  )
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
Reply-To: nchlstoms@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Message-ID: <E1lECxC-0001gF-8A@merlin.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

My name is Nicholas Toms, an investment portfolio manage. We offer the right loan Investment funding with low interest to finance your business or project ranging from US$1M to US$2BIllion. Kindly contact me for more details as I am open to questions. 

Sincerely, 
Nicholas Toms

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
