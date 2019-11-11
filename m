Return-Path: <SRS0=Eirx=ZD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2B76C43331
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 19:55:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3A212067B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2019 19:55:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uPcfMDqt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3A212067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJVeXoQBd+5OTzz8ZAin/2hANitSjxK+GfKzXt1jibY=; b=uPcfMDqtJ/jbdD
	IZ8RY9Q13XzR6UU07Fz+RlSM58xv2tuS15w3Dy2HtHwseTrZ476icUSBZO4pAtYY0xx1JNIlABE3j
	m05VhypCkM49X0v/KL+87AuD5/ZtKkDDXbUGX9BQ0OVtCRtkxm9OIimUU0wGv7wKeRsDBLRc8XHQj
	Arul7lalRNPXnzzRJHF7SKRP86z/W/40vtQ7c2OMyMK4sbKqr6JlN6nYnfTx9LOFAYPnpMpmWnSjF
	aqYQl7P2+PZRHHp0lJ2wDOUyqQJ6J6CGOu34/Pu1LuaZKicFb80IS97Yzip5/BjPHVIDboLkiqbEj
	VjrYl43NOofNcD0tEwuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iUFm4-0004D4-CN; Mon, 11 Nov 2019 19:54:56 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iUFlr-00042a-6Z; Mon, 11 Nov 2019 19:54:44 +0000
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id D77878119;
 Mon, 11 Nov 2019 19:55:14 +0000 (UTC)
Date: Mon, 11 Nov 2019 11:54:35 -0800
From: Tony Lindgren <tony@atomide.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: Applied "spi: add power control when set_cs" to the spi tree
Message-ID: <20191111195435.GW5610@atomide.com>
References: <1572426234-30019-1-git-send-email-luhua.xu@mediatek.com>
 <20191031132342.100F1D020AA@fitzroy.sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191031132342.100F1D020AA@fitzroy.sirena.org.uk>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_115443_277674_ED829835 
X-CRM114-Status: UNSURE (   6.88  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Luhua Xu <luhua.xu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

* Mark Brown <broonie@kernel.org> [191031 13:24]:
> The patch
> 
>    spi: add power control when set_cs
> 
> has been applied to the spi tree at
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.5

This patch causes a regression for many SPI devices as they
assume spi_setup() return 0 on success and not a positive value.

I've sent a fix for this as:

spi: Fix regression to return zero on success instead of positive value

Regards,

Tony

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
