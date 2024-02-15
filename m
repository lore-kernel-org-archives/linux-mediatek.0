Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F71C48BEB
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 08:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AxjqWXulooP/yBCCN/u2rd5N8mmqvX6xRerM6I0LwoU=; b=LlTnso2mb9meYfx/S9pC2uSZDy
	OQ8iIcpEeV3Mjp6VvhB+r3JycuB6yDPk7SY5rWqy89SFz/ATJqLgFjyRD+knTVSr8l+6z4KXD/G6f
	u0dep8XJDqTO0ao3v0dUrsN5x8vmsQqDEQraamVaFDkBpZhVCXyQigq/hGcTOvOSu87/CWrgAgXz2
	v6GTY5s3uMKi9GaWyHb8YOdKLt7GfWqOJQHl9atYeSUZqE15D2pXVnXp4cwPGzNKSNIoe0NH26v0C
	B8+5j+zFMIoosnMrltbXt7tPmmUkjW8XfkkIsLSJmRv6Bw4lD9Mnp52dfsgsx1OD4DGnDbaoAmx58
	hMrf+JNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXXK-0000000FQUq-1sNJ;
	Thu, 15 Feb 2024 08:56:06 +0000
Received: from lgeamrelo13.lge.com ([156.147.23.53] helo=lgeamrelo11.lge.com)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raXX8-0000000FQHk-1PVX
	for linux-mediatek@lists.infradead.org;
	Thu, 15 Feb 2024 08:55:56 +0000
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.53 with ESMTP; 15 Feb 2024 17:55:46 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO ?10.178.36.63?) (10.178.36.63)
	by 156.147.1.121 with ESMTP; 15 Feb 2024 17:55:46 +0900
X-Original-SENDERIP: 10.178.36.63
X-Original-MAILFROM: chanho.min@lge.com
Subject: Re: [PATCH 3/6] arm64: dts: Fix dtc interrupt_provider warnings
To: Rob Herring <robh@kernel.org>, soc@kernel.org,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 Antoine Tenart <atenart@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Stefan Agner <stefan@agner.ch>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
 Tony Lindgren <tony@atomide.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lee Gunho <gunho.lee@lge.com>
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
 <20240213-arm-dt-cleanups-v1-3-f2dee1292525@kernel.org>
From: Chanho Min <chanho.min@lge.com>
Message-ID: <f5aeffed-9365-b1db-4c32-4ed6da208ea0@lge.com>
Date: Thu, 15 Feb 2024 17:55:46 +0900
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20240213-arm-dt-cleanups-v1-3-f2dee1292525@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_005554_766993_A5C8EFBE 
X-CRM114-Status: UNSURE (   9.45  )
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

On 24. 2. 14. 4:34 Rob Herring wrote:
> The dtc interrupt_provider warning is off by default. Fix all the warnings
> so it can be enabled.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

>   arch/arm64/boot/dts/lg/lg1312.dtsi                  | 1 -
>   arch/arm64/boot/dts/lg/lg1313.dtsi                  | 1 -
Acked-by: Chanho Min <chanho.min@lge.com>


