Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 181D4C25B74
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 May 2024 10:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SjqpeMgnNWzpS1QEhyKPEdfiZAfk0s+YPyTcOM6xKQ=; b=2+UwKhyH32G53F4ebz6EG90hUD
	msE8SvXiALvIHSTttDNT1SHSjBZOaRGCAkn7LPwOvQt0OKMplOLaU/RySdze0rAR0tQlcSq9V9hp1
	bPLNmd6Na8vYA1T7oCGrx9lIYC7NzP3McR4odjnU8GPjF4tIK9jy7Utz9aD3dxBmTjO2/o7THvLKJ
	odJBlTDWK286MDPRAN6KiaS4k9VDKEqfklnzDocT9Vvs+J7UVgUr9dsCD111CQBeMbUeJ4J8FVBHa
	qxiyyQkWP/tWe5On48/JDHRyI0RfK+ONYUCWWRko/gr4blymx1OkcqhhzEjL0NU8h4HC80V7P/3z9
	XBwdW1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5NDt-00000004pNm-2ZMn;
	Fri, 10 May 2024 10:11:29 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5NDq-00000004pMc-0Ott;
	Fri, 10 May 2024 10:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715335884;
	bh=c1waZ+eyh/3LEv2xQyu5LjuVf0SWbog1966q3KjkEqw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=xJk+hOhpaV0T+ju3F8+sGmHBtzFTyVUG4277e8N/HYwbkr3BX3CzBx/+wcN2hgGpe
	 y3AQfCENjfRWsQqdzX9NFQcE6TCs0Uotjwtt9fg9LZId1pbDM11ZYIgJo4uNpzZkdY
	 PnTqo9/+m/7JFxbRrFDEoqFkqIJ0VZ6crTG9McyI4maP8wggHhvKx30Wg8XTzClStG
	 9FwDc0JokaW1oDrkqv4OxNLzVAO+B3GnAKvPKu5ny7tz7dWVkxfryNJjCzGuw1FWRn
	 SruPRMpQcZD28dXZLjtT+UObBpWlZRpJ164RAFgDp6ZALOCqDHsItLhm9U+1Qm20Vt
	 af9aDi8aR6llA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1D92A3782185;
	Fri, 10 May 2024 10:11:22 +0000 (UTC)
Message-ID: <d95cafca-bc4c-4571-a6ed-b66b6f63a579@collabora.com>
Date: Fri, 10 May 2024 12:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] nvmem: Change return type of reg read/write to
 ssize_t
To: Joy Chakraborty <joychakr@google.com>, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rafal Milecki <rafal@milecki.pl>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 manugautam@google.com
References: <20240510082929.3792559-1-joychakr@google.com>
 <20240510082929.3792559-2-joychakr@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240510082929.3792559-2-joychakr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_031126_345785_862BA961 
X-CRM114-Status: UNSURE (   8.96  )
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

Il 10/05/24 10:29, Joy Chakraborty ha scritto:
> Change return type of reg_read() and reg_write() callback to ssize_t for
> nvmem suppliers to return number of bytes read/written to the nvmem core.
> 
> Currently nvmem core assumes the amount of data read/written is equal
> to what it has requested from the supplier, this return code facilitates
> better error handling in the nvmem core.
> 
> Signed-off-by: Joy Chakraborty <joychakr@google.com>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



