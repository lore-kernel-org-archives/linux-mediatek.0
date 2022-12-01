Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0489C4321E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 13:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RP1Bt7I23wnyHevBO/NSu9E6gUAunGoxWgpR/m8zrHY=; b=xUKPw3NV0vFHKHrDFktKDoD/4l
	0Tcp8X01pDos7sZJtqA/l7U9aDYOlotvxYpQd3dnrQkIFqslxLh8EIRE1TcdaLP4KPi5W5uJuOLkZ
	zK8YtisoGq29kh9esz1VMjvVA3PnCFkPWSMquu+akN3cWD+a/x5N4xZ4FGvoeH1P66kch7smJ+Imq
	BMBlmMIjIuZqV5l1TO7GoRiL/IKzlqFZzEdGM+IQqG1rE3Ir4o3RTJ9L1AxnAnA5wwumZlhLJN+b2
	1QQp2wakg1/o5OQLR2UDy0AQVPSllDBzL2VpCbqF0KTw+Lx40/eelTHK4NCRktXe/lwQA2G8gls2A
	rdigDoWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jd1-007hGa-13; Thu, 01 Dec 2022 13:29:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0jcx-007hEc-FN; Thu, 01 Dec 2022 13:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669901363; x=1701437363;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uzYyfpe5ovcmHtziruShrAihFDRO3ojyXNM6UnYgYzM=;
  b=rZxb5+hfjDXxjtZu937XvgDrAjM36daIPnVrCIzmd93mSr2H5Kc5O2mH
   WXY59NT9pt5M8Gv5e0hUGGIYl64nJ48mtaCwYhf6rpwTub4m/nE/gp1YN
   6cl2xVV0NZFsHkAeR4vvkV1j4BJEITOAdu6ozOmOwNRbBjhLx+iCV6os8
   fbbq+86k282FAse3AIBr30+pBsXYRi+rOcbBvQieX+WF0IicJftcDWXNw
   Kyh6TbTtadQI7xwfLZGGP2g5Yo+lqgRsCwKKa34xij9RU/mZkfDk5ejV7
   92/rR3cxTsGxr6Qhyrc068eKcPGra2tB2YdWgOfMCYFauCxZ+xnI5df3+
   A==;
X-IronPort-AV: E=Sophos;i="5.96,209,1665471600"; 
   d="scan'208";a="125998122"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Dec 2022 06:29:21 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 1 Dec 2022 06:29:09 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 1 Dec 2022 06:29:01 -0700
Date: Thu, 1 Dec 2022 13:28:42 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, <dri-devel@lists.freedesktop.org>, "Douglas
 Anderson" <dianders@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
	Satya Priya <quic_c_skakit@quicinc.com>, Pavel Machek <pavel@ucw.cz>,
	"Guenter Roeck" <groeck@chromium.org>, Marijn Suijten
	<marijn.suijten@somainline.org>, Nobuhiro Iwamatsu
	<nobuhiro1.iwamatsu@toshiba.co.jp>, <linux-riscv@lists.infradead.org>,
	<linux-leds@vger.kernel.org>, "Jerome Brunet" <jbrunet@baylibre.com>,
	<chrome-platform@lists.linux.dev>, "Florian Fainelli" <f.fainelli@gmail.com>,
	Samuel Holland <samuel@sholland.org>, "Sean Anderson"
	<sean.anderson@seco.com>, Kevin Hilman <khilman@baylibre.com>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Michal Simek <michal.simek@xilinx.com>,
	<linux-stm32@st-md-mailman.stormreply.com>, Hammer Hsieh
	<hammerh0314@gmail.com>, <linux-rockchip@lists.infradead.org>, Chen-Yu Tsai
	<wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, "Broadcom internal
 kernel review list" <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team
	<linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
	<linux-sunxi@lists.linux.dev>, <linux-pwm@vger.kernel.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Ray Jui <rjui@broadcom.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
	"Stephen Boyd" <swboyd@chromium.org>, <linux-gpio@vger.kernel.org>, Fabrice
 Gasnier <fabrice.gasnier@foss.st.com>, <linux-mediatek@lists.infradead.org>,
	<linux-rpi-kernel@lists.infradead.org>, Baolin Wang
	<baolin.wang@linux.alibaba.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	Scott Branden <sbranden@broadcom.com>, Bjorn Andersson
	<andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, "Michael
 Walle" <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>, "Masami
 Hiramatsu" <mhiramat@kernel.org>, Maxime Coquelin
	<mcoquelin.stm32@gmail.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Shawn Guo
	<shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 00/11] pwm: Allow .get_state to fail
Message-ID: <Y4isCnKP9pTacksl@wendy>
References: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
 <Y4iL9xf5bJM5pyeR@wendy>
 <20221201131907.bmrenldnua7uaeab@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221201131907.bmrenldnua7uaeab@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_052923_604677_ABC41199 
X-CRM114-Status: GOOD (  10.51  )
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

On Thu, Dec 01, 2022 at 02:19:07PM +0100, Uwe Kleine-König wrote:
> Hello Conor,
> 
> On Thu, Dec 01, 2022 at 11:11:51AM +0000, Conor Dooley wrote:
> > TL;DR, I quite like the ability to return an error and not mislead the
> > caller.
> 
> Is this an Ack?

It is if you want it to be! I didn't really feel qualified to do so
which is why I gave some context etc.

I did check out the callsites for the non-void returning op, and it
looked good to me, so sure, why not:

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


