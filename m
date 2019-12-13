Return-Path: <SRS0=P2Dl=2D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC74BC43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 08:06:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F6C4206B7
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 08:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ICa0MIV1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F6C4206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H8N0jea/cHAx8ccO89FWHYpHKoY7RBmeZRSE0KslmY4=; b=ICa0MIV1R6jh90
	ockH4+xTwivdwrLXKRETnhmrIdzben2XN/KezenhBFMMIDX1WPov44ZL+eWh0Y0nvL8pd3C1ajFws
	UT8LIFiULHx5lIoJL9d/BIoT5iroH+hDb/V6twyKVlpk+5S5T8vk6oZxniPX0lL7vPn8FicVkWgeb
	Vj84gjAFHP0aEclef8lZaEhBfQAmQT/eEuYXUA6ZuGISKKxc/6eak0OIjXwtOWrMhMletGheQIniU
	fnpSUIyqq+zVOj3yZaklSwgQLB14NnaBVLV3pjSEnwKRRXCGcsY7wtHbJj+gEG+6pS5umsIbMPEg2
	PCs8VVDw+5umzTXOxgJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iffxd-0005z2-MR; Fri, 13 Dec 2019 08:06:05 +0000
Received: from mail-ed1-f65.google.com ([209.85.208.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iffxZ-0005xp-Jj; Fri, 13 Dec 2019 08:06:03 +0000
Received: by mail-ed1-f65.google.com with SMTP id r21so1343700edq.0;
 Fri, 13 Dec 2019 00:06:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=29BUxaBVpPVtFW2X5I44ySfdglfYVS6Fv4e7LeJkUIc=;
 b=W4YEyK4JSkOUAFcRdtSptRlrNqI8LvvA0qGNtnOMsHSj2QGcpYxmT7HsyxqS74muzm
 w/Z5G/V13CzN4z/pLUsJN9CytREPqH6LoeV18JKBHofkzPmytwzWXgKYW/kwXE2fMR2g
 xGTMvUkTmHc/vC7nLn4oZrzYp+wrY00DuJ99y7ZvLIz3SJSEDz51Cg2PipwRzmqk4yDc
 91l7CgomjUYagC7lRmDSkI6KpQl/xCtkav4U7fxOC59AenGwRJUl3uGJ4oHa9FQyqVGq
 MNX9CC2W3/eLq1mw33Urf7oFQGtIAgpU3wVFXCgLO8CQUFhurWc6+b2QMn1T+6ssiRCO
 SYPQ==
X-Gm-Message-State: APjAAAXYSr1+2ghCaCiJ8aqjjRxcGfeScNxz1EZH+253XNjhAyx2cbbv
 ADdGETyWu3I1/U8/g4et6vyRXQzH451WGg==
X-Google-Smtp-Source: APXvYqx10/kxLz+lWEBciifPa1pqNjyeGOrdi9fGP7VcgmeVSdaj1Bp02F1AdOpuDGtHgtwXyX9inA==
X-Received: by 2002:a17:906:2344:: with SMTP id
 m4mr14709496eja.110.1576224359195; 
 Fri, 13 Dec 2019 00:05:59 -0800 (PST)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com.
 [209.85.128.50])
 by smtp.gmail.com with ESMTPSA id c2sm343253ejk.74.2019.12.13.00.05.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Dec 2019 00:05:58 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id u2so518353wmc.3;
 Fri, 13 Dec 2019 00:05:55 -0800 (PST)
X-Received: by 2002:a1c:9e0d:: with SMTP id h13mr11801179wme.110.1576224354577; 
 Fri, 13 Dec 2019 00:05:54 -0800 (PST)
MIME-Version: 1.0
References: <20191209195749.868-1-tiny.windzz@gmail.com>
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 13 Dec 2019 16:05:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v67Ec3KPZZqAWHwx00ii1L+va-QTa78mj=4pFFCBVtwscw@mail.gmail.com>
Message-ID: <CAGb2v67Ec3KPZZqAWHwx00ii1L+va-QTa78mj=4pFFCBVtwscw@mail.gmail.com>
Subject: Re: [PATCH 01/17] clk: sunxi: sunxi-ng: convert to
 devm_platform_ioremap_resource
To: Yangtao Li <tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_000601_648029_5FBB4055 
X-CRM114-Status: GOOD (  10.00  )
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
Cc: kstewart@linuxfoundation.org, pgaikwad@nvidia.com,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, geert+renesas@glider.be,
 chunhui.dai@mediatek.com, Mike Turquette <mturquette@baylibre.com>,
 palmer@sifive.com, nsekhar@ti.com, Tomasz Figa <tomasz.figa@gmail.com>,
 rfontana@redhat.com, Thierry Reding <thierry.reding@gmail.com>,
 weiyongjun1@huawei.com, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org,
 Fabio Estevam <festevam@gmail.com>, linux-clk <linux-clk@vger.kernel.org>,
 Rob Herring <robh@kernel.org>,
 "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>,
 Emilio Lopez <emilio@elopez.com.ar>, Krzysztof Kozlowski <krzk@kernel.org>,
 jonathanh@nvidia.com, Chanwoo Choi <cw00.choi@samsung.com>,
 John Crispin <john@phrozen.org>, agross@kernel.org, linux-imx@nxp.com,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-tegra@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Maxime Ripard <mripard@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 swinslow@gmail.com, paul.walmsley@sifive.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, daniel.baluta@nxp.com,
 allison@lohutok.net, aisheng.dong@nxp.com, Max Filippov <jcmvbkbc@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, t-kristo@ti.com,
 Dinh Nguyen <dinguyen@kernel.org>, Kukjin Kim <kgene@kernel.org>,
 Sascha Hauer <kernel@pengutronix.de>, wangyan.wang@mediatek.com,
 Shawn Guo <shawnguo@kernel.org>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Dec 10, 2019 at 3:58 AM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify code.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c    | 4 +---
>  drivers/clk/sunxi-ng/ccu-sun50i-h6.c     | 4 +---
>  drivers/clk/sunxi-ng/ccu-sun8i-a83t.c    | 4 +---
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c     | 4 +---
>  drivers/clk/sunxi-ng/ccu-sun8i-r40.c     | 4 +---
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-de.c  | 4 +---
>  drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.c | 4 +---
>  drivers/clk/sunxi-ng/ccu-sun9i-a80.c     | 4 +---
>  drivers/clk/sunxi/clk-mod0.c             | 4 +---
>  drivers/clk/sunxi/clk-sun6i-apb0-gates.c | 4 +---
>  drivers/clk/sunxi/clk-sun6i-apb0.c       | 4 +---
>  drivers/clk/sunxi/clk-sun6i-ar100.c      | 4 +---
>  drivers/clk/sunxi/clk-sun8i-apb0.c       | 4 +---
>  13 files changed, 13 insertions(+), 39 deletions(-)

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
