Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFF5C7618A
	for <linux-mediatek@archiver.kernel.org>; Sun, 19 Mar 2023 21:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOs/IuIefZYT/INAznMfmHDBwVi/x4kS/LaTiWLBS/U=; b=CBkdgXTohlb0vO2sddCwECFTlk
	lmbb1aLDnO8XS3CP4lfCFvwjcHvvbigr9RNF+/rgIQKa0IpF0jU46bG9ZWWPwIt4jE4LLd2yaXEaW
	tTMWsXuqQIExtPQtVtJtR+R+hksRzz3ksty+q/LRIBioRbYsfaYn08hCB62zUHUPS8DwLd4USb6WY
	Bb+sj5jk5lv+/rHgd9RAxwUxsGXy3L2aqbuVdg6VjO5hzNXKVYWdTJeZS46FyPsIU1fVHuK0LznzW
	k364sgiMfMVcdyaJeIc/qx2QBZaxD+ExJoFWy2O/vhSu8romHrzCcm2s9yRBrR7WCU3v7aM73dr1P
	uTWsLAwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe0hR-007VxS-04;
	Sun, 19 Mar 2023 21:36:21 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pe0hO-007Vvo-0k
	for linux-mediatek@lists.infradead.org;
	Sun, 19 Mar 2023 21:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1679261777; x=1710797777;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=TT1NZFDlglG04lWn8b3D569FNDwhCTSHE8VYkA5Dx+U=;
  b=TuVwP7DGAZbpkXUtHVr/T+L8xJBEiYMoE+u2izu6QJ5Zodj2INTip6tU
   29FAGwzn6tEh+HovuKb6ckM1/PYt+8CVbVwyEK6BSgE2mUjijpVdWzCYJ
   +olodzTset5DukXaSGZGUC2akAPODR+hvrI4Q0NiEQJiMVRmeNjOKyjbE
   QnWZ7GExgkt6D5zpYHQmoq4SmM8vbpRq41gwi6csdxxsYBSzzKIf2cKAY
   8k7K9bNbmOS1RvzE8sfDdKHb6kzZk1plmO5dHSJIPKVjgj54L7wR/fRHq
   XhTTUmIScT7FqI18yrMb7ddJOQLCII5C3dqpq6VY8ESCQRe2ZctSadUhO
   w==;
X-IronPort-AV: E=Sophos;i="5.98,274,1673884800"; 
   d="scan'208";a="225987312"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 20 Mar 2023 05:36:09 +0800
IronPort-SDR: ua7yDx+5YJQrI0hAI6dbathvHpaMKLd4cJhGqhpUMblWdIJO/0ON2Wbr9EjH7r16Hlr735et4q
 xNNGsCdOEg8viLC4UkrlVjS8DSk/Kqn5CYvdpfNNRYEcDaavM1ctpNpYcZDcD1iWwuEQSGljPz
 8zHqDy6MWRz0FcH8cvu3FIQ+4YT4A5eNUdnYvqrvMwOLkBK2HDBasA8QjHxhIpcXOLWon6vXAl
 uhCeC6ao8zuQZTxaDA5sNQnH1tZQUluQPGkrWYTemykoD7qRPnN6e+oi9yDJWs1GFnNvclhR1y
 16E=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2023 13:52:31 -0700
IronPort-SDR: TNYrop3yqf9/GHhqvMtMywgfu4HjvGeXZ3TIWcqzUQmYljbKC0sgusSAxMpsYLncBiBitkpN9o
 lKilpG+/D4gDOJ2KwiGhzP6XwzyGXm2qWlr3n3VTTnUX49yqVX2RYOYF440HlwTfZZxs1SesQ2
 jWZlmepBfVK54Xl1AANPLNjcc/G3twXQsDvBAu1vX5khpC/+YYSB8tEosP/a/P7Nj7NoZoaq0o
 ywfOCZ9ORa3wLrUEKdMk8H9DdCkZhciAxHBxHZSNOQkvM3TZLI39VaqmyrcZRiTIdsIelXMflE
 oK0=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Mar 2023 14:36:10 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4PfrlY47rxz1RtW5
	for <linux-mediatek@lists.infradead.org>; Sun, 19 Mar 2023 14:36:09 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
	reason="pass (just generated, assumed good)"
	header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
	opensource.wdc.com; h=content-transfer-encoding:content-type
	:in-reply-to:organization:from:content-language:references:to
	:subject:user-agent:mime-version:date:message-id; s=dkim; t=
	1679261768; x=1681853769; bh=TT1NZFDlglG04lWn8b3D569FNDwhCTSHE8V
	YkA5Dx+U=; b=S8JspY/jT9HKo9uIoAqdicok3stSmSP3ZC72QphNU7sDF1HRlu5
	WEHlENHnykDAc+PypzLR3AKh+nkdMH083OdE11omsr4lq8r6bvML7GaKsZVKacZc
	MZHz5SQ+ppoKtSaDEwpYgqjDYxa5D+COba0qcQKw+mvAjO/hVOxH2r0a2BiHgjcj
	TDQPTShi6TS6CRaKSdirsSF0+p+Y3zl7lZDKJ7b2fss43cDQVdW/HXyTxJeQfXZ8
	wT8a1dOL4COVNs9eTAD+fnEHjbLliqP/dQCY4TrpRaEg8oDyHXx5471RrqK7Xg4z
	0nN4CP2SYOKmSfVIRogCAC7RqfZYz9N1OXg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
	by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1vIVp3jz0aRN for <linux-mediatek@lists.infradead.org>;
	Sun, 19 Mar 2023 14:36:08 -0700 (PDT)
Received: from [10.225.163.91] (unknown [10.225.163.91])
	by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4PfrlK1xCLz1RtVm;
	Sun, 19 Mar 2023 14:35:57 -0700 (PDT)
Message-ID: <de10b014-1a97-e74a-c7c4-b1004bf4cb60@opensource.wdc.com>
Date: Mon, 20 Mar 2023 06:35:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>, Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Michal Simek <michal.simek@xilinx.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20230317233623.3968172-1-robh@kernel.org>
Content-Language: en-US
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_143618_335309_3A316D45 
X-CRM114-Status: GOOD (  13.03  )
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

On 3/18/23 08:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research


