Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CFDC38145
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 17:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXL3pPyjuWI1jDNyeLfUhP7R3Uv2eUsXrNGlSxUOfEg=; b=ddg70Zw1A9aDgv8NfoTMjZgjew
	aiUH5A1z8sGhynB/OSaIL92hiM15hg2rlcPenIi30qxmQizp5DQztooAcxqA/+FSx/AvJsxZiqAcG
	Be7we13WoVfHhsDQgkm3SFLg5YmKYkerg+S7bGu6JUGOjGuNwO/W/ropZmVfdarx+OpaI/GaY2apu
	mBZt692utgb6NdeTdOjS37PTDHIxbyzI7Civlbch7PmXpYvslRc6SCe+DBXxmhi47ThqXgbcJs37C
	zVCoAeVugxx9VkKmy7pZcaRTEv2AnsIAKOuPGkvkRuAaJD+WYY5yJ3gC4nQUQcSHhhaveNDtVUEJk
	aY7qiUNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKz6-0065QZ-LB; Thu, 08 Sep 2022 17:06:36 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWKyv-0065Gd-KE; Thu, 08 Sep 2022 17:06:26 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 48A7332001FF;
	Thu,  8 Sep 2022 13:06:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 08 Sep 2022 13:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1662656775; x=
	1662743175; bh=FXL3pPyjuWI1jDNyeLfUhP7R3Uv2eUsXrNGlSxUOfEg=; b=f
	+DrZheqsx4aGENRJNHVffoTTBX1YCoh7ayZB1OhXDzlJc3MVqnbO3lbU5r1qjTsr
	W2r+5FNb2woedZnpXlp9pmlj29RxJoWsZ+tbBjCEFifw5MUo7SUzgjqHYyBYktY+
	ULft9Ph4CLexPW5lhFDO4K2V0oLDFQk8AO1ZjGniUQjqxINviF0o3LO2+1lFW9dK
	omIOTVHFL2+MnjdKJ+PXh67Pzyy/eD3V6/IOE3kxiCwnweI5Cl9ZJf0jQEG7jmrF
	quXOzscwoEzQeKNiyEE1CmlkmjtQscVWSjBcoUp8b2RdF5eGPvhTnyj0mIHpBY1J
	86yhvHPuKj5KtZHxAw4fQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1662656775; x=
	1662743175; bh=FXL3pPyjuWI1jDNyeLfUhP7R3Uv2eUsXrNGlSxUOfEg=; b=m
	EN28rDXL4pwoJPe94OUjke2E42tHKWN5+j639VBlQ4oFDwvFa1ztDu3OJ9NMS6Lr
	EuazSLBUoes4llUQf/XfOQtMZx39xTZ/gJ/5LNZOSrPrjPXqesOhc4ro02MymffP
	2tsUPvwGT0R4po0BxfL7PKbB063/cyjYXErkC8pHb59Di4LrsLmqbqtXVjsV4N8z
	aFj7pOsMDieczYNZideeGfGH/cQaF6B2Gi2D7erhz0i9bf2c1C6rhf6RW9eFRN4b
	7ygnI7NqOvDOj7VG2/vIKUidcDXsHF4xhegd2fSX98b9drxsUGef9po/grUf/Qf8
	Qwn1QuAtBTtdLpWB4hjXA==
X-ME-Sender: <xms:ByEaY7FzMubpfojgQTqMsy7c0NG-N4mWVjSA1Hs-XyVlcjeFfKv1ZQ>
    <xme:ByEaY4VkjsQTMHPX_LKWlZwQkimoFIYr5lNCyx-wdLgY_q4jdmsrCGIhIFWnp_E9g
    x8GlMeKD6OB0w>
X-ME-Received: <xmr:ByEaY9Ki7Jaki5IBy1lMXNUQVyjzx1_aZoAHnv-Nbc1uQo4OL6qBNdRn3yQj>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedtfedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpefgke
    ffieefieevkeelteejvdetvddtledugfdvhfetjeejieduledtfefffedvieenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhroh
    grhhdrtghomh
X-ME-Proxy: <xmx:ByEaY5FrhVe6DDr9ovMVmXkHVhm3aiwJ9-G7Ut870moqkTe0cjvPtQ>
    <xmx:ByEaYxXXYka9kpKWASVHUojdUxxKppV_HV40wnlNQJ_zko_WNphiFw>
    <xmx:ByEaY0MOlcOmbwpL7tYu5bxN-HXq-jG4DyVUiPwNWxdrw6qM5VfCmQ>
    <xmx:ByEaY4ObPXSe5sPP2O8TRhrkN0EOjG8yYJQIrf8ZHMX-YT5xHLogFg>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Sep 2022 13:06:14 -0400 (EDT)
Date: Thu, 8 Sep 2022 19:06:36 +0200
From: Greg KH <greg@kroah.com>
To: Yee Lee =?utf-8?B?KOadjuW7uuiqvCk=?= <Yee.Lee@mediatek.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"patrick.wang.shcn@gmail.com" <patrick.wang.shcn@gmail.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 5.15.y] Revert "mm: kmemleak: take a full lowmem check in
 kmemleak_*_phys()"
Message-ID: <YxohHANX6omfC27d@kroah.com>
References: <20220906070309.18809-1-yee.lee@mediatek.com>
 <Yxc4U/8zzfkHHv+W@kroah.com>
 <SI2PR03MB57538512401A213D21B7882C90419@SI2PR03MB5753.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SI2PR03MB57538512401A213D21B7882C90419@SI2PR03MB5753.apcprd03.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_100625_733187_2D60A032 
X-CRM114-Status: UNSURE (   5.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 07, 2022 at 08:37:56AM +0000, Yee Lee (李建誼) wrote:
> The commit ids are listed.
> 
> Linus tree:    23c2d497de21f25898fbea70aeb292ab8acc8c94
> Linux-5.19.y:  23c2d497de21f25898fbea70aeb292ab8acc8c94
> Linux-5.18.y:  23c2d497de21f25898fbea70aeb292ab8acc8c94
> 
> (backported)
> Linux-5.17.y:  0d2e07c04c7f7d83c75c56da3e2f970c5653ade0
> Linux-5.15.y:  70ea5e7b38c30b60821e432abde6f3c359224139
> Linux-5.10.y:  06c348fde545ec90e25de3e5bc4b814bff70ae9f
> Linux-5.4.y:   534d0aebe164fe9afff2a58fb1d5fb458d8a036b
> Linux-4.19.y:  7f4f020286e0bd4aaf40512c80c63a5e5bd629bc
> Linux-4.14.y:  07f108f15fd75a9bff704eed718cc12f91b080dc
> Linux-4.9.y:   96eb48099a7e740768d215a989b26e0af7381371

Thanks, now queued up everywhere.

greg k-h

