Return-Path: <SRS0=x9ei=ZR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59138C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2019 00:03:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22DBD207FD
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2019 00:03:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e64u0YBl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aj.id.au header.i=@aj.id.au header.b="CpsQQPIh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LGOno1P+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22DBD207FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=aj.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UeHthz7yy9BXH6t7c+3hATqnGryYqbSsE2qBkZTMfW8=; b=e64u0YBlWJ5jbxyT09brbjAWTO
	AgWlj+/CJNMQISO7E8IrW8oSNVWzHfFBY3h64uJ6M3loOZZGumGtps9aV1LfvoG5luYl2awO/kHOC
	3+TMcMlGUwMNRqZ2AI3RUNbq8R6nP4NHS946/I11Yn/aHHUzm9/dCxBfZeNTLqmj2hgVDhSqA9MD5
	fOfTiJ3JAetcBkTbasjIdz+LQOYqnlaz+/C7gQaBMG+VKRFE2P6O4pGwBYzH58MRSg6PQrKSd8u9L
	07nzNxodLlEDDQGg7FLkMPRWXkSF4weMJYO56OhcOaGDLv4NW/Ds4y3FMBbvWy65b5HTcNQYXwhU3
	/DD7pr3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZ1qR-0007AB-8w; Mon, 25 Nov 2019 00:03:11 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZ1qG-0006rA-62; Mon, 25 Nov 2019 00:03:02 +0000
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7CFB15C3D;
 Sun, 24 Nov 2019 19:02:54 -0500 (EST)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 24 Nov 2019 19:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=yAnKxPZbRoo2OEW2NIbW2/4bJIIdzho
 1/YK4gE1VRSI=; b=CpsQQPIhPJ/jYdZjfnThBWlUg781MVJEU4QU+iJ6hrboGoH
 BQsmQIfd8fPnBwmdp36oTQWfl4ne2rOqyYGXRZaxw6DBTW+RxHrpQ4TeqnR7Da04
 lYHKG8nETc29H3Sqbg2tcjWiKXGA6jDKGSEXWYjV+YmwxjXox7FMo0d0K8XFy6/c
 +Tfot/aRG3tRp6M+luzjlzvTyxDTNot77hdK0Idw1dT5yHkLatejQxgeFx44waTX
 2KD2uGu1bpHNyt/0F/BproROs/moImh4jCuyJkC6s2ZqHa+N9VA54Hlv1bOQNcBv
 k5Qzt2H9cRVrCdapq4hTAWkyFOzpjhGSJZXmcpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=yAnKxP
 ZbRoo2OEW2NIbW2/4bJIIdzho1/YK4gE1VRSI=; b=LGOno1P+W3b/rePYylNzoK
 bBxLTrKmyFUTwlm86ughlr1HMuV62A2DQuSVMLFgLMY2SYdzXBepH/jbrB6d+azZ
 9/F7fBp1ZzRQ9uIt1FYUViwoSYRy2ZSsckdengfnTNJWOIDwqesJGXjRgZIRqioU
 +jhN5tHyiFhurj2b2HhHQOiUrR1TNF6Uf3CVXadfrDsMSzz2lVSnA2W/rWiipQmh
 LyLJPjIu9e3sdGFJuMZjIvkJMQnZHooYsJmvt6pG2gCRGZNzi62iD+08Q2m6YOSd
 I/N8c4nSwHGDeJFvbVPeWNJ0/O2nbW+5mM0uWiHys3Alxv8yMyVV0hSlrWVsiEVw
 ==
X-ME-Sender: <xms:LRrbXWUvwxkLfpXcaYQh4THV3cG8v3qN88Yz_EoLsJIK87BcFDVPOg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudehledgudejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvffutgesthdtredtreerjeenucfhrhhomhepfdetnhgu
 rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
 grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
 rhfuihiivgeptd
X-ME-Proxy: <xmx:LRrbXRRKtLxr4ZWaqqIOYvR1Day3I9pQjOgnBMXSL21zCHwcghRwOA>
 <xmx:LRrbXdtkdba12QZVYsGYAO-y3uHHrs5UV3A-z1MfsQoQd34ej5nMRA>
 <xmx:LRrbXaMaSzHburtqGZ2qO0hvR3WyKvrgLNBX-y1tssUWxrmtQ9mJIg>
 <xmx:LhrbXaxeNjVY1OcNxmMWetzIFofI1MOqPtBc_xvODKv-MQJ2oZGIUA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 59B21E00A3; Sun, 24 Nov 2019 19:02:53 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-578-g826f590-fmstable-20191119v1
Mime-Version: 1.0
Message-Id: <ef65b741-baec-484d-a5f4-984452e9d4e5@www.fastmail.com>
In-Reply-To: <20191031014040.12898-1-rentao.bupt@gmail.com>
References: <20191031014040.12898-1-rentao.bupt@gmail.com>
Date: Mon, 25 Nov 2019 10:34:22 +1030
From: "Andrew Jeffery" <andrew@aj.id.au>
To: "Tao Ren" <rentao.bupt@gmail.com>, "Russell King" <linux@armlinux.org.uk>, 
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Arnd Bergmann" <arnd@arndb.de>, 
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Paul Burton" <paulburton@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Mauro Carvalho Chehab" <mchehab+samsung@kernel.org>,
 "Bartosz Golaszewski" <bgolaszewski@baylibre.com>,
 "Mike Rapoport" <rppt@linux.ibm.com>,
 "Doug Anderson" <armlinux@m.disordat.com>,
 "Ard Biesheuvel" <ard.biesheuvel@linaro.org>,
 "Benjamin Gaignard" <benjamin.gaignard@linaro.org>,
 "Joel Stanley" <joel@jms.id.au>, arm@kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 "Tao Ren" <taoren@fb.com>
Subject: =?UTF-8?Q?Re:_[PATCH_v2]_ARM:_ASPEED:_update_default_ARCH=5FNR=5FGPIO_fo?=
 =?UTF-8?Q?r_ARCH=5FASPEED?=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191124_160300_373487_83D5AFF0 
X-CRM114-Status: UNSURE (   4.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On Thu, 31 Oct 2019, at 12:10, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Increase the max number of GPIOs from default 512 to 1024 for ASPEED
> platforms, because Facebook Yamp (AST2500) BMC platform has total 594
> GPIO pins (232 provided by ASPEED SoC, and 362 by I/O Expanders).
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Hopefully userspace is not making assumptions about sysfs gpiochip numbers.

Acked-by: Andrew Jeffery <andrew@aj.id.au>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
