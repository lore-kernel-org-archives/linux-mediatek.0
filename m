Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB8DC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 09:07:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E75C3221E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 09:07:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E75C3221E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PQcWHXjZeRrjdFR0wEwRXJqudXFxbF10irHR5hD2bnQ=; b=FG6bQkNkEYv0rM9Mu4YJbIvOe
	wPH3u7jgBIBNbiMwtOVfqEy9vphuoTKwx/nw2aDbxxDdY2gNtm3zKG+Cqt84KDZ0OA7SINtMaK5dq
	iWPONIdsFNzbKhFn6hZIyEfYC9Gw7KNzlikWcorR04j8R6vwrDWKQnKYkYA7UWjFi5jNwn3/DAdwN
	Kn26xM4BgrpwqLQPkohnagg5zfqhdrzKzMIOVQgJA+cZAPUxJadXDQrigwvaXjc/EzAsBhd/yrg9e
	+KL5s2p+YgHnxb1defTVDsIhMJfT34ha+M3PmrnDOMXR/KhxVugo5wGplkMTcDLWia6JY671TMW58
	vBnwlKe8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzybP-0001x2-46; Thu, 14 Jan 2021 09:07:35 +0000
Received: from wnew1-smtp.messagingengine.com ([64.147.123.26])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzybK-0001vn-RM; Thu, 14 Jan 2021 09:07:31 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 224F01404;
 Thu, 14 Jan 2021 04:07:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 14 Jan 2021 04:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=MzQEL5nXPUgFtFul0I81bz1aKr8
 E0pkihlMDkujhjtg=; b=iEIRil5QccyTB2U1KiSTyB9IsBq3GdM4AwzcU1TN63T
 N7QwuI4Xbg3wfEBWYWDDGJribIcnM79kKrtdZAjQ/fdwd7nzrwEhc0h2foJogVpJ
 326FXMJLnYBkycmONREjinhLoTI3MJEFbZQ1oTvtsjgDY0jB7h6aTrAiAXR4X1Gc
 zG+E2KkD1k568dXhRA9xQF14EYdL5tMZ5TVJmzZqI7aI+VhYVn42j6cDPEXKhVKH
 TJUYYRrnNKt6tM/MB4QJVNw3faRhGzKkmFJ7VsWOfOgUD3YCvuE0b8kX+oHwtJYS
 JrVZ88tqjrvPTDDSAC7OGHTFY4ulY7KmBdegl/3FPKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=MzQEL5
 nXPUgFtFul0I81bz1aKr8E0pkihlMDkujhjtg=; b=rpqMXhMGxw6Py1R8f81/ut
 sBc1OsjdMG+huqSrg6NQFKWvPFOUbA82dCsux2X6XNPKFWF7nJY1SLmtM44TDEGU
 WXaWailSY1nOxKQrwYYqkJIGdM36QAVf7FzjKqsYMcsy2SbZVrN4WnZLRXX2POTY
 Kr/CtL+YyWe6hVRQKFLWUH/K9vk8ybeQfAb4R4L+ORvLKsvg3DGX5ZzKX/y/G3+n
 TzLzr0IBsc4aZsV1NhblwAbSrYUXlJZB+WMBhgf2tC2BvLUIWvGESK3MBQyKP9E5
 IEx+fV2BjLsWuOJtpNGUUGc+A82yYcuMEXsYffYCx3H7xkuvSRN3o+qKVXi2ehaA
 ==
X-ME-Sender: <xms:yQkAYP2guwVB_L-aYscfh-MPwPu7bVNilMjWjnVqEXZ4-_mOWiEDDw>
 <xme:yQkAYOH1uBrFvnjbHvLTv5tVwO4Giy8hyV5Vwxgm6L5pJJ3RTrKslA6Ni1J5s8Kd5
 BZfwknDhOAO7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtdeggdduvdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
 fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucfkphepkeef
 rdekiedrjeegrdeigeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrih
 hlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
X-ME-Proxy: <xmx:yQkAYP4udU49hQGNBy8LavGDX7d2QCO-AsZzcPeBVvDMnsmmeW00wA>
 <xmx:yQkAYE2iKIs5UkZer54VwWLaYOyhohCYo10V1vfK5nctLZXjgMDMLQ>
 <xmx:yQkAYCENXmO62xzm0HlBW2_aFl97LrBSD0kgHYA81hbVgDrcJsiweQ>
 <xmx:ywkAYFDwji62qW9MMc2jq5tLkfXQvG2KqkO4lIYB197uDQjCtHtSHQXCDVU>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA id B0A1D1080057;
 Thu, 14 Jan 2021 04:07:20 -0500 (EST)
Date: Thu, 14 Jan 2021 10:08:26 +0100
From: Greg KH <greg@kroah.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 0/3] Fix broken  references at next-20210114 due to yaml
 conversion
Message-ID: <YAAKCjARs6JZrknd@kroah.com>
References: <cover.1610605373.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1610605373.git.mchehab+huawei@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_040730_968656_CD6FD0E7 
X-CRM114-Status: GOOD (  10.14  )
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 14, 2021 at 07:25:57AM +0100, Mauro Carvalho Chehab wrote:
> Three new broken references were added between next-20210113 and
> next-20210114, due to yaml conversion. 
> 
> Address them.
> 
> Please add those patches  at the same tree as the respective
> conversion changesets were added.

I've taken the USB patches here, thanks.

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
