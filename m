Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A52C27C79
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 12:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YF4nZM3lonrBQ/1Um3/o2Oe8OEDraVniga3/lSDMEu4=; b=EalavrqfFo6jUivOPKUa4RU/G0
	6dNMMTE6jjZIaduSccJTIo0u5OmQ3zYRUDIBQFxJy07sAoOj8vcaWjrxTedDImsTRvwIP1c6bf3He
	Pq0t5DVZKuIUYjRqFiaGmbF8pAgsfOHYFLFE+YXZP4YU4WHnfkujjB7WN5gZR5YAGgR9cqQS/jagl
	yl/nC23YupzHgXOFaWAsKE4igUtqNXO8izoN7zsEJIJpyYZeVprbsQCUFZVnsNPQJSBG/YTEs7vyY
	5PnBCzzp0Iv6pfOyH1+AlSnSqOmtU7s2+Rli6dQJ6oD4LNCQCRjaKcZN3lc+8ytdcFTa6qw9Wxi2p
	ocYA3Pxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIoz9-00000007VYP-1ONt;
	Sun, 16 Jun 2024 12:27:51 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIoyc-00000007VOO-39Vm;
	Sun, 16 Jun 2024 12:27:20 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-371cc143f6aso18046295ab.3;
        Sun, 16 Jun 2024 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718540835; x=1719145635; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YF4nZM3lonrBQ/1Um3/o2Oe8OEDraVniga3/lSDMEu4=;
        b=V0O2KunDmiTj7zuRipUF/K8BIi12TQpXv9I8ODq+9drq7TcMnXXRkji45BFvHgUkWc
         TJ+XwY7fStPxM5aVslLkHm19JoAY/3Eev2reUqnmB1WNPm6o+jSKOWCQ6ujctI+r4yUZ
         jamO7y3P3x7n7GhkqC/t32rB5eiOLCIPS2nYI6FQYrlJvMsB06IyO2RC9Yr4vZ88QoiQ
         4kP3IwwQS+4uyuASdNXDiAq+/hj/q3osQiqGuIkehGMDKoebrW/2h0OEhrCYZOW0Rnxz
         QlvBi1FsCvmqiK2Oo5lG18cJmEkD70W/2pxZ9HlXzDB3nodsEwTodeaOji/MpXWkIRXW
         8SWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718540835; x=1719145635;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YF4nZM3lonrBQ/1Um3/o2Oe8OEDraVniga3/lSDMEu4=;
        b=SYGE0E9e953/pbjTszogjMyWOpEfncyCur6kuJRktfzgGKfkOJoe84yhgBzTL76mew
         Fo/j1gXI79KLdMN5MCR4JWCR5V9kN/s/VdGCufC/OZ81N1JEZ9meHfi3ePw8ZzYYdJ6S
         06MUMy85vIDHV70gur1RunShkI6NxcrKhnVB3BpKL23XSPK0842NTsgk3zV2eTKouZZ6
         6xA5HueAeJ9/vvvQ/1es5zOupYC1Fl7fKiiKXg/P/2WQbMwoxrCvfwF5x4GQGAV8FbYz
         9vOSpcWUbbpKUxgWV1uK/7SSRq9TOKtdRO5uBIME3YeJGt0vkYGxWxlIzIaXAc/M1GPI
         +Fkg==
X-Forwarded-Encrypted: i=1; AJvYcCWks1S7fmYqWwUc+zRgC+GOyYA5bvp1RJZh8J5lVdKoTDjG2UxRoixgaeNoetM1/t5orzFuAyX234G/iaUvRLGkwyx9O3QGaeCqyIol6FpTgLl728WHy8EBoDt+K6O4yQ3Q3fknjfGuv9nj22zAUbHjcSMd/iPDux06vYY8+ItSCgLGh5WffXB8/ivkr9+DSTBKP9r/BcLn3/pkTZl55xhShnfXfuKJWq7g2HWvILLTDRhEfrJDueOtmaIc1AHdS71lJJ9YjjyJmn+zSzVoaPa5+xV4Kn9GCAi+Fy/53lk2YP+uO1sf
X-Gm-Message-State: AOJu0Yx8vvBpPLkN8DjvCfZcd73VDVorVpqj607CohRCX/rIUHkKFj7H
	0z4L8o9XkMn7KK3QiiC0Cwb5N0qXB9vVLO1KmwXvdnZhxLzNdkHL
X-Google-Smtp-Source: AGHT+IH6NX0wZI/VAxPWkEemxzlcqScgPs48/oEvyI4bBXx7KgcXwmtBC8Br+BRvW22CWn8JH7bH8A==
X-Received: by 2002:a05:6e02:1fca:b0:375:b381:9ad1 with SMTP id e9e14a558f8ab-375e0e14a0bmr81855415ab.6.1718540835274;
        Sun, 16 Jun 2024 05:27:15 -0700 (PDT)
Received: from [192.168.1.114] ([196.64.245.53])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fee3ba442csm4488618a12.85.2024.06.16.05.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 05:27:12 -0700 (PDT)
Message-ID: <aefb86ad-9547-4981-856d-de595da7ca7a@gmail.com>
Date: Sun, 16 Jun 2024 13:26:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/22] dt-bindings: thermal: brcm,avs-ro: reference
 thermal-sensor schema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Guillaume La Roque <glaroque@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Amit Kucheria <amitk@kernel.org>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 zhanghongchen <zhanghongchen@loongson.cn>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
 <20240614-dt-bindings-thermal-allof-v1-4-30b25a6ae24e@linaro.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-4-30b25a6ae24e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_052718_929362_0EE857EA 
X-CRM114-Status: UNSURE (   8.38  )
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



On 6/14/2024 10:46 AM, Krzysztof Kozlowski wrote:
> Device is a thermal sensor and it requires '#thermal-sensor-cells', so
> reference the thermal-sensor.yaml to simplify it and bring the
> common definition of '#thermal-sensor-cells' property.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

