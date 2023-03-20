Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F8DFC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 23:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yNR8X23A98sblDxbw5Poz4eMrkTW4BedLygWYr/QqY=; b=0RQdYbefJNCw+rEt0ItSGKbFpi
	Et32uqxxxMwuPpLBy3/QrOJhZYAeTbq+RQqXDYLvkLQOfAxjw+4RRTPkgdpXO0mO6S5ZNYnTAZiFA
	2XoxBqcw4AV7BUfbypeIkwymejvnib3odtQ022k56lYV0Fak1GE9xl2cvoKlBW4orQ6y7zpT7RX03
	vCEcE6FuiD34oL+vD19/VdSmZdBMCttPgQ6AdT4Xlo3VS2d7prE9JuCqkz0062Xos2quGdaK+w7q7
	ZM0+jl2HbsQmgtpWxeHxRyJNjEaD16RUp/82QW8Yut1/nJXg5ZkbmdrMgat5A6tubFP6zm/sHSOlf
	drs8wO8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pePBv-00Aoqi-2j;
	Mon, 20 Mar 2023 23:45:27 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pePBs-00Aopd-2y
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Mar 2023 23:45:26 +0000
Received: by mail-lf1-x12f.google.com with SMTP id br6so17007756lfb.11
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Mar 2023 16:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679355920;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6yNR8X23A98sblDxbw5Poz4eMrkTW4BedLygWYr/QqY=;
        b=zhreF+PljbDmKvP/Iu8G+igR5OmJ+q+rU5tYXa5BiCuhvU2aEL0hqMDkE1X3CBtvYq
         rlQPLKAkZkvoOyAUg86pz6otZJz5A+fLwDHzGsPp0EN1g2hTEr0CxiZsbIBPIXLFqYkx
         p5t4JPKg2aLkVadeG6d5hFz+pAxd8i2q1/LXw0qlUc9oEwZwdETPzo4JL5CNSZy4exeh
         BfO6Dwx8A1EhpO1q5OrU+lJK1EMc4iCXNaJbfQKqMxzE89PBrzPpgzrsP01BQoSrmwhX
         ANIU33RxUUEZa1DLvHUgf0Z4WQzagFOZzgzzicvpUYefiWMpiTzbnCwwQGs8mXHzYfyJ
         JGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679355920;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6yNR8X23A98sblDxbw5Poz4eMrkTW4BedLygWYr/QqY=;
        b=0oIz31sS4yMcWwE/nQJr77ecIl7mHdgWV3JfTYshrW/w/qtmdyjWv9KGoVpymMA0A5
         VAQkix2duS9VMfY63bXenIeWDhcvcQ3gVN7HlUXEftIum9GXbwjggApjVmCFY4JdPGQh
         6zHwd3XMsnCjNKjEeBfXycnoQqypZAyzBoFEci5WAg8ZI4qyZ0kYGYMZImwsfnwDNDPn
         SgG184GQ+nZ4JpsIhmurIOzpOi/RmGZRzhELKiQCeMOJqyxjCGNRO6kMdpXvR74fJZVi
         fWSm/Pqgp8Xz0X9UHvexrVngzhWSf8OpLfgGgSupEvbG/2iRM2iFQV8ag80Kxm3kqjkL
         AXHA==
X-Gm-Message-State: AO0yUKUdo3vzNuLntdAJn++pWlM0xCRzFfroXUdCzns9xh9qptg2wLKr
	fTnzHead4H2aaTzkHZ/iUd2tQA==
X-Google-Smtp-Source: AK7set8MGVhASxzEwrHlVBfW2UlJo/rZ2P+TFZs8vUWIrx9O7hrMJAGVckUytY/qAEStsErgqHNslw==
X-Received: by 2002:ac2:4310:0:b0:4dd:af76:d3c with SMTP id l16-20020ac24310000000b004ddaf760d3cmr170842lfh.48.1679355920301;
        Mon, 20 Mar 2023 16:45:20 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s9-20020a2e98c9000000b00293534d9757sm1982264ljj.81.2023.03.20.16.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 16:45:19 -0700 (PDT)
Message-ID: <2e352a73-181e-7539-7932-f753b29ee967@linaro.org>
Date: Tue, 21 Mar 2023 01:45:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] dt-bindings: display: Drop unneeded quotes
Content-Language: en-GB
To: Rob Herring <robh@kernel.org>, Robin van der Gracht <robin@protonic.nl>,
 Miguel Ojeda <ojeda@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomba@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230320233823.2919475-1-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230320233823.2919475-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_164524_971784_26E842A1 
X-CRM114-Status: GOOD (  11.83  )
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

On 21/03/2023 01:38, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>   - Also drop quotes on URLs
> ---
>   .../bindings/auxdisplay/holtek,ht16k33.yaml   |  2 +-
>   .../display/amlogic,meson-dw-hdmi.yaml        |  4 ++--
>   .../bindings/display/amlogic,meson-vpu.yaml   |  4 ++--
>   .../display/bridge/analogix,anx7625.yaml      |  4 ++--
>   .../display/bridge/cdns,mhdp8546.yaml         |  4 ++--
>   .../bindings/display/bridge/nxp,ptn3460.yaml  |  2 +-
>   .../display/bridge/toshiba,tc358767.yaml      |  2 +-
>   .../bindings/display/dp-aux-bus.yaml          |  2 +-
>   .../bindings/display/imx/nxp,imx8mq-dcss.yaml |  4 ++--
>   .../display/mediatek/mediatek,hdmi.yaml       |  2 +-
>   .../display/msm/dsi-controller-main.yaml      |  8 +++----
>   .../bindings/display/msm/dsi-phy-10nm.yaml    |  2 +-
>   .../devicetree/bindings/display/msm/gmu.yaml  |  4 ++--
>   .../devicetree/bindings/display/msm/gpu.yaml  |  4 ++--
>   .../devicetree/bindings/display/msm/mdp4.yaml |  4 ++--

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #display/msm

>   .../display/panel/ronbo,rb070d30.yaml         |  2 +-
>   .../bindings/display/renesas,du.yaml          |  4 ++--
>   .../display/tegra/nvidia,tegra114-mipi.yaml   |  2 +-
>   .../display/tegra/nvidia,tegra124-sor.yaml    | 12 +++++-----
>   .../display/tegra/nvidia,tegra186-dc.yaml     |  4 ++--
>   .../tegra/nvidia,tegra186-dsi-padctl.yaml     |  2 +-
>   .../display/tegra/nvidia,tegra20-dsi.yaml     | 12 +++++-----
>   .../display/tegra/nvidia,tegra20-hdmi.yaml    |  6 ++---
>   .../bindings/display/ti/ti,am65x-dss.yaml     |  6 ++---
>   .../bindings/display/ti/ti,j721e-dss.yaml     |  4 ++--
>   .../bindings/display/ti/ti,k2g-dss.yaml       |  4 ++--
>   .../display/xylon,logicvc-display.yaml        | 22 +++++++++----------
>   27 files changed, 66 insertions(+), 66 deletions(-)


-- 
With best wishes
Dmitry


