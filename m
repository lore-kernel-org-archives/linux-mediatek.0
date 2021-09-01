Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BE62C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 05:42:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 033E9610A2
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 05:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 033E9610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGIInP5HHA7t8tSNxui2mk/73aaeIJqEyA0iA3OMSu8=; b=EsEc9JzmUcfa9c
	2XEF/zaud0QQGXji+U8cyyLQFYhMTG0PKK8v2v/ovIOaDddxd8oYXYWGZrOzjYZrERv7Xv23PR9Kt
	DrHmUIl2DE84SAdoRs3qCeJBpceqJiKTTjME90uLfEzkGOAhy/iyZOP5tzvVan/4plAe6pZXhdeKl
	4QmlfdqVg8QD8sphhcfXBo5U6YUJmygq1HF74rAgWirPzE4VRIwDuUw6p2CmLhrdhqTaIdm1ppd46
	UHPjwJLQos4Jqnw5WeTFqRVrBsjvcJEbz88fuxHRl7B5WQQcZK+szcWyN+26CRwozgBTijF3j8n5t
	tkojid4d5QzQ/w1xluQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLJ0s-003vup-5f; Wed, 01 Sep 2021 05:42:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLIz1-003vG3-1N; Wed, 01 Sep 2021 05:40:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8DD1361090;
 Wed,  1 Sep 2021 05:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630474822;
 bh=IvDkmizg58kyeyzMs8vObMqP+kT/IvEFz24k7Ro5FkY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=HE5A0kG1VeoXaAd/L4M1SlrkspDgLL1dqgcKugepYq0CLSQSqGp0CykXBPRezqCb+
 7QlWciZRqaLM0ikXufDRIhPqMfH4XPxoUagSJ0+Gg4IPlAVQWES9uEQCq3NpJkbbs1
 P94NSKZ3r3JrTVGKrKKyyyMJZEtozpzXvHsCSGsri9M04tIxs+3RIlyvnHeNimmbQf
 2iMZoFwK75fIlluYTGK5sN7CW+eROyTUOOL4xy9sdm/nTo8YxwRMsQcwSttj1TAyt8
 fwot77ER6tzXa+/MSWOXuO36mKLRHp8FM2yydBOEMPBPSpWypDSv1LihvICRiFDkd/
 +/dz0+9xdOkCw==
MIME-Version: 1.0
In-Reply-To: <20210831164210.15455-5-miles.chen@mediatek.com>
References: <20210831164210.15455-1-miles.chen@mediatek.com>
 <20210831164210.15455-5-miles.chen@mediatek.com>
Subject: Re: [PATCH v2 4/4] clk: mediatek: use tristate for
 COMMON_CLK_MEDAITEK and COMMON_CLK_MT6779
From: Stephen Boyd <sboyd@kernel.org>
Cc: Wendell Lin <wendell.lin@mediatek.com>,
 Hanks Chen <hanks.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Miles Chen <miles.chen@mediatek.com>, Lee Jones <lee.jones@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>
Date: Tue, 31 Aug 2021 22:40:21 -0700
Message-ID: <163047482135.42057.4815394359554916322@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_224023_145479_0CCB5683 
X-CRM114-Status: UNSURE (   7.99  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Miles Chen (2021-08-31 09:42:10)
> Now we have all necessary exported symbols, change
> COMMON_CLK_MEDAITEK and COMMON_CLK_MT6779* to tristate.
> 

Please squash this with the patch that makes them into modular drivers.

> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Hanks Chen <hanks.chen@mediatek.com>
> Cc: Wendell Lin <wendell.lin@mediatek.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
