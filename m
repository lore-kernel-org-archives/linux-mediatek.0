Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE1EC432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 05:32:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8235760F90
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 05:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8235760F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8cfQdibPZMhQZzRaASt/Vn6aTKuf22A7K3czy4TwhKs=; b=VANf9IHKKCrc56
	vQnfNsBbO70FetJSWMTMj4b2DP1/zMWD+BSnZGJK7w8vOdXKOXEZ2HqZVKBi68c/eP89LeLc/dAJ5
	+aEC1g1ZwXAnLb3xv5WbkSqGM5kzOEkqW3eFEDQJiuCihWAX29RtXmHPQyApZvaV94Gj/c6pCyK2v
	rGrvdolaEQ59OUJIq177U/dFRmfMV4vVoSiAHO2se7b/INueacJSgE9TKhS0N07BFCPWmY7oXBDxr
	Uxbg2QX7lF3+LO9q99ITF74QtquXqyg7Oh82a8+yNz9X9yQlRMRJZFc4mP5mGq6T4PyCY9NHONkCH
	k55X0SLdTaStLcdbESdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLIrT-003uKK-NP; Wed, 01 Sep 2021 05:32:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLIrG-003uIJ-7F; Wed, 01 Sep 2021 05:32:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCB346101A;
 Wed,  1 Sep 2021 05:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630474341;
 bh=N2WVEhIn7g2xqwLHjd0/oieAY8b22yKtkcYybi7KwlY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=W+VmqvrMQZfk8rutotH03eYCURAchYuizk2DK9nQxPm+pg+z9Kk5zUR6IzSdMHlv2
 XU5A8i272PxI5WC+5fIYqptS9g43rvC52wgkbzF9mDgvV0Pk/5Cluk0QKs0B0fMjIp
 ACcRIncd9SjSso/34CiWix2MnxjY39LB/VZqHhuabJqpQilH0MiQG+nr4RW9Vm8jrP
 do5V5Su8v9Ch8p50pGDf1CLqzcxRE9Zum/fWoo/8IqmlYN2U0WeYjzX+jwvv157vb/
 0GhNNmFkw9KQDYbxMWXKfkrSlbND4atg8V1DdqAaE7AU3mz3VrY0GGNoW3/1PZ2D3C
 T4j6ToIqvt8WQ==
MIME-Version: 1.0
In-Reply-To: <1630348984.24981.2.camel@mtkswgap22>
References: <20210813032429.14715-1-miles.chen@mediatek.com>
 <20210813032429.14715-4-miles.chen@mediatek.com>
 <163021049667.2676726.10138202396240942833@swboyd.mtv.corp.google.com>
 <1630348984.24981.2.camel@mtkswgap22>
Subject: Re: [RESEND PATCH 3/4] clk: mediatek: support COMMON_CLK_MT6779
 module build
From: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Wendell Lin <wendell.lin@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, Lee Jones <lee.jones@linaro.org>
To: Miles Chen <miles.chen@mediatek.com>
Date: Tue, 31 Aug 2021 22:32:20 -0700
Message-ID: <163047434049.42057.5688419707288938766@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_223222_314455_6BF018E8 
X-CRM114-Status: UNSURE (   7.82  )
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

Quoting Miles Chen (2021-08-30 11:43:04)
> 
> sorry for my late response. 
> 
> Thanks for pointing this out. I have the same question when I was
> building this patch. That time I found some examples where
> they are using builtin_platform_driver and can be built as 
> kernel modules:
> 
> config CLK_IMX8QXP (tristate) && drivers/clk/imx/clk-imx8qxp-lpcg.c
> config CLK_RK3399 (tristate) && drivers/clk/rockchip/clk-rk3399.c

We should fix those drivers. Care to send a patch?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
