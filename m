Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7764AC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 16:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEOSsUi8JIMvoW7QnnkpkkJijxo4IUuMnZ9vv3EjUhQ=; b=Wh0MNA+cmF/aP66h4n96z4B60A
	zn6zFwOrSJ5ac7Jr/J3Kv4FQQahruQ5YD3iA+JUt5v9u1pDJT+RSsK3N56mWW480TjzMjvWFGAbtW
	O90Uz8v0E8wRKg1BM/VKPfSxH25/FSwM3rPF01HxP66uAG6yNQcXY8gbtizx5v1semNvDLtggIIod
	e7hTUFcM3W35SCnHoM1eHilu9yQ49XEUkFem9Ei2uT0HXzICQKpbmquIn9r9eRsRPOPyLTfCDpv4t
	j3L6wnphCrOhkZJOctpa3vusSR0Klv/I9mqm1AEmtv70ApWq/DpGYEQNzQzQQZdA6bFhqleKacpmn
	+IaVPOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk5hH-0054bt-1y;
	Wed, 05 Apr 2023 16:09:19 +0000
Received: from vern.gendns.com ([98.142.107.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk5hD-0054aK-02;
	Wed, 05 Apr 2023 16:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PEOSsUi8JIMvoW7QnnkpkkJijxo4IUuMnZ9vv3EjUhQ=; b=PlcvWllVCZZLIxn7TA0uYZOD2i
	8Timk2idYv+lLO3yZJhWhHPsl92ZREHTEkcZ2uj1e53hz36DkB/efojzcWFV0Na8cR9Qj+10qLhOH
	ta3+36sHegS1o46TQyP99X9cQQUBT/Z1QMqvJ9krER9Ob1/RWq++SuzdzpDHI3Xhy5MHfqna5eIZw
	+3KCwr3As0xZzcRdS0d74nyj+RIivO7MbcvRaGz8ll694eT/OgE8InMgGs8kJwhgkR/6hUQpNlGNz
	Za3hBrO3EltLq0JnttfLThWdO07VZ32OqVzWbWH2mgZNY1LmC2nLtlkLnHo1jx4ghOCQVGFpuJj4L
	hqCUbhxg==;
Received: from ip98-183-112-29.ok.ok.cox.net ([98.183.112.29]:48320 helo=[192.168.0.134])
	by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <david@lechnology.com>)
	id 1pk5gX-00020w-28;
	Wed, 05 Apr 2023 12:08:34 -0400
Message-ID: <9d163cc7-d7ee-55e8-c01d-a1d4b3b19877@lechnology.com>
Date: Wed, 5 Apr 2023 11:07:56 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 54/65] clk: da8xx: clk48: Switch to determine_rate
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, =?UTF-8?Q?Andreas_F=c3=a4rber?=
 <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sekhar Nori <nsekhar@ti.com>,
 Abel Vesa <abelvesa@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Paul Cercueil <paul@crapouillou.net>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-phy@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-sunxi@lists.linux.dev, alsa-devel@alsa-project.org,
 linux-mips@vger.kernel.org
References: <20221018-clk-range-checks-fixes-v3-0-9a1358472d52@cerno.tech>
 <20221018-clk-range-checks-fixes-v3-54-9a1358472d52@cerno.tech>
 <04f5d305-9992-bcdc-cd54-111eb8254155@lechnology.com>
 <3nyoulu5eba6eyo644crhbtog63jh7vockbp7dz6mxquj2omsn@j56kn6vkbktg>
From: David Lechner <david@lechnology.com>
In-Reply-To: <3nyoulu5eba6eyo644crhbtog63jh7vockbp7dz6mxquj2omsn@j56kn6vkbktg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_090915_284759_0A9655CF 
X-CRM114-Status: GOOD (  15.87  )
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

On 4/5/23 10:22 AM, Maxime Ripard wrote:
> Hi David,
> 
> On Wed, Apr 05, 2023 at 10:03:24AM -0500, David Lechner wrote:
>> On 4/4/23 5:11 AM, Maxime Ripard wrote:
>>> The TI DA8xx USB0 clk48 clocks implements a mux with a set_parent
>>> hook, but doesn't provide a determine_rate implementation.
>>>
>>> This is a bit odd, since set_parent() is there to, as its name implies,
>>> change the parent of a clock. However, the most likely candidate to
>>> trigger that parent change is a call to clk_set_rate(), with
>>> determine_rate() figuring out which parent is the best suited for a
>>> given rate.
>>>
>>
>> As mentioned in my previous review, parent is selected by device
>> tree and should never be changed after init.
> 
> Great minds think alike then, because the driver implements exactly
> that, either before or after that patch.
> 
> That patch makes the current behaviour explicit but doesn't change it in
> any way.
> 
> So I guess that means that I can add your Acked-by on the three patches
> you reviewed with the same message?
> 
> Maxime

Yes, preferably with a simplified commit message.

Acked-by: David Lechner <david@lechnology.com>


