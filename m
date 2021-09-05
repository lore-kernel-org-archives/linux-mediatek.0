Return-Path: <SRS0=a7PR=N3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4821C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Sep 2021 20:44:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F5146054E
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Sep 2021 20:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7F5146054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKVh07nZrzrqssTsJ+iH1FNzUTREuGzxNyH4WdTx2ig=; b=QLAFKRyKlkH3Qf
	nBnd29nuG1mZM/HV5MwcCWqAE2fYzww9chen1zxX8m8bdZc5MZAXl9U3lZuuvHTEJyB8FU/38/np1
	xFDKrMCjkT4VKptb8ljsYYSOE8N+YkUJy8hnA74wO36g+7sJ+pN/3Efnz9XKxEViR3xSDlGxSP3Ff
	10uBkrvAz5zrmyyPOdvwbdSReT4+jnSu0Kn839SqaHUEWjzIeI1iGZtH9jGy4OYUAsFERy5DiMd+Z
	gplgvVY8gxEQ0YPsPCY3K2kKbyNI8aC0uBlwbMKoSFIb3jOBrtthHIUCllwF0aeduikgWRWUGgD3J
	e31NLbGeqbkONB99oL5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMyzz-00GPlv-BY; Sun, 05 Sep 2021 20:44:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMyzn-00GPk2-9E; Sun, 05 Sep 2021 20:44:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BA1D660F8F;
 Sun,  5 Sep 2021 20:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630874646;
 bh=F+XUZwCUG5ClfawV4L75vtZe4n31lBwXwM1crTuhm6g=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=RxJEwPufOmswEfDVEP86h9qnUCB9NBnY6v8lr5thIB/S3EZYc53E5VfEGJHXrAB5e
 E21X4KIse+x7QHuBnudg5in4NwGsk4ckVAYDLAIwDRVSGrtXFLRhPfQU0kfHF33K8W
 K9qDZ9bHMR3KDgkptbAn7Cnezr4H+isPlNUEUDUZdpCtZORU3TTPUV+OABzdVITlVl
 sEKTVzcf/IlM/vtbfBOhirjU0pFHRrgbn061dWVZqHUnvaQknsv8ttWhu7octT9cDO
 SfYh4TfpTgkJNvn5qXcGoTfQei4I6zY+DtITrOs5yBqMx7UpyBfKaIgnQ7Kgz5qUIM
 8VXRWjUXkeVtA==
MIME-Version: 1.0
In-Reply-To: <20210904152856.31946-1-miles.chen@mediatek.com>
References: <20210904152856.31946-1-miles.chen@mediatek.com>
Subject: Re: [PATCH v2] clk: rockchip: use module_platform_driver_probe
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 Miles Chen <miles.chen@mediatek.com>
To: Heiko Stuebner <heiko@sntech.de>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>
Date: Sun, 05 Sep 2021 13:44:05 -0700
Message-ID: <163087464562.405991.6849585594197172835@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210905_134407_381052_B0EFE99E 
X-CRM114-Status: UNSURE (   5.59  )
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

Quoting Miles Chen (2021-09-04 08:28:56)
> Replace builtin_platform_driver_probe with module_platform_driver_probe
> because that rk3399 and rk3568 can be built as kernel modules.
> 
> Fixes: 70d839e2761d ("clk: rockchip: rk3399: Support module build")
> Fixes: cf911d89c4c5 ("clk: rockchip: add clock controller for rk3568")
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> 
> ---

Reviewed-by: Stephen Boyd <sboyd@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
