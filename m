Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57517CA0EEB
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Aug 2025 19:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yqEEUlIDSc/+3KFB8fDmfBaOKciQCNwulQzIyyj/3k=; b=CG6ALisLBkhxEYgTQKYC9ExP6K
	x+DoZWarBlu9Cq1cvqlCH9/QRQga5sReKy3GFR/tppvxI99Uc3IfvXxQqUZnWoPJsWHljmamDpPlm
	ecItLWTcy0UW8syHg87RTNmT7+yMbRhjdhSV0qf8uzxk9xdZdpgavw5aQr/N1iB9lfMIOIQATtqT6
	qDzX4ldCi8Qs8EePo9MIb1Q+gLWipMrK2GM2EKQakynsO0MBSHYq3ae0r7R38/Azm8jav7kBbT2LY
	tPWQaKNg3fFk6ZL09PrUWX3A6qhc/tPiLimmif27YFytMwtCjlvAdf5bM00BRO7CnW76ACoXhZa4J
	5bQptzaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqG1S-00000006Tgu-2z2p;
	Sun, 24 Aug 2025 19:04:58 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqG1K-00000006Tef-2SyQ
	for linux-mediatek@lists.infradead.org;
	Sun, 24 Aug 2025 19:04:53 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55ce5095c90so347772e87.0
        for <linux-mediatek@lists.infradead.org>; Sun, 24 Aug 2025 12:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756062288; x=1756667088; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6yqEEUlIDSc/+3KFB8fDmfBaOKciQCNwulQzIyyj/3k=;
        b=sN9NqbPDz9VzRdszVp/gpv3jGWU9Hle/9Gc2cxINzwQ0k1KSi64tSQopUVRVd5sgTC
         nFuuoaWI8HgcZpM+F4JfMk7mOAlL4bbYo6E6iQ406ElxOcyu8lzHEHZKeppkF6o6EVWj
         6Tgiyupg3Ly/ya5MmpLwmUmtKxAereZgF0PyoIEMlag1dr0kEhtHz4QIWfdb+Md6WmF8
         av9kqFzaFfv5qtAkDuHP8bLetkBuncRe5zti6vyTUlabtzMXz8td06c5+TDd+HReEwxZ
         YtOMZNiZEcuRXry87otSW7R8bAxtn6cFwUPv9Zy86RtXcLrnJjww/+X/niNPcALdZa7/
         1/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756062288; x=1756667088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6yqEEUlIDSc/+3KFB8fDmfBaOKciQCNwulQzIyyj/3k=;
        b=JlbGzt2PowM2gEbOJ6gidm1BevzradNIAQz/0bCJWmHUYnqf/SUB7IXQM45s441r4E
         Bf3jxwRnDZ4riV+lEkx/8Svbn+CDcZXV8217vSJJJcGO3WfKMkU0JWyXm8ejTymY/zO8
         LrSyJ6PCEksrh/kLFo+ctfyp4sGBirlPDaCk810s4EFd2DuSUvw25cqefLRWRdzAcnUi
         tfZCjPkDMZkh1ddzrh1GhLppthSR8d/s39kU+cL/vr2rULMTGwVYWEE1DUtlz3J1PZtz
         zkFc2ntCWhmUfTd04XMiopv0mmBNXW1/DxbylhbIpjXG1X7FXKzhP72I4DATxeSX6+a7
         ofzw==
X-Forwarded-Encrypted: i=1; AJvYcCVYNsAxIHc2J2jgmRNIIJnLmuDSoknzlUzU0Lre+kN8TftbyyHpWS64bB0sA1aFRKis81WqzDBtNSN2700FEw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw83XpOrJ7UtQrRWKM+k8Xf9z+jC6KTM5MXb+3qxkD+djyWv25L
	G0S1V6Tkd9IqnZ6UKRYq/7A57SIegY2jXVEp+6WmOLi8hBYatKXdH2oFjsoq5ojV48M=
X-Gm-Gg: ASbGncuF38s+3nArgFvGvCTy0sm3PmCwwCpt3xt3xoiSifmfGLCOmkjVClQJKlVxe8h
	Kj1gX88thaxHf4Pb2nHR4n1Q5qK59/og4/tz+0sXtuu6V8kA2PXgCGJxBIISoSofiDw4sLehJ0P
	lNUfRUlJcRKH9WuTmqamL5/yCGo56boONWxIqZ36OrdyOTrKmHXwfYnkT5dVYLDz07eNNUH39Sk
	xbPwZsJBbuX+Q0+k6MITWUyYIUmrAQVpdWCxsPZYY+hI/AZB8QPmvU6pq4f7YzyHs7/peBMNqf2
	2j9EUQrpVH9Zf0eA5UpIwU0KLBGIygwoL8SYpR2iu9/YejXtAPG0wZTy9V4bMyYtAPdV3/XcI4N
	837Tx7POWVmCwc8qc/utLV9HKVsmWEA3zjtxlv6qgoS6nwjxZQDSWXjLFyCzpy7COr+kVK8oKlQ
	eL
X-Google-Smtp-Source: AGHT+IFyrm2w79r4qu/FnmHu4qBJdoxQ8tpCUb7HA7mtPlKxjeyzi9xJQ9J7AuBmZ4uek0zzq2ON9Q==
X-Received: by 2002:a05:6512:a85:b0:553:24b4:6492 with SMTP id 2adb3069b0e04-55f0cd6ef0bmr1246189e87.5.1756062288277;
        Sun, 24 Aug 2025 12:04:48 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f35c8bb4esm1204996e87.75.2025.08.24.12.04.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Aug 2025 12:04:47 -0700 (PDT)
Message-ID: <fb733991-857c-4a5b-ba20-d8bd557a4339@linaro.org>
Date: Sun, 24 Aug 2025 22:04:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/65] media: camss: Replace .open() file operation with
 v4l2_fh_open()
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Devarsh Thakkar
 <devarsht@ti.com>, Benoit Parrot <bparrot@ti.com>,
 Hans Verkuil <hverkuil@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>,
 Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
 Christian Gromm <christian.gromm@microchip.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andy Walls <awalls@md.metrocast.net>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mirela Rabulea <mirela.rabulea@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Michal Simek <michal.simek@amd.com>, Ming Qian <ming.qian@nxp.com>,
 Zhou Peng <eagle.zhou@nxp.com>, Xavier Roumegue
 <xavier.roumegue@oss.nxp.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
 Jacob Chen <jacob-chen@iotwrt.com>, Heiko Stuebner <heiko@sntech.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 =?UTF-8?Q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
 Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Steve Longerbeam <slongerbeam@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, Paul Kocialkowski <paulk@sys-base.io>,
 =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Corentin Labbe <clabbe@baylibre.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, imx@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-usb@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, mjpeg-users@lists.sourceforge.net
References: <20250802-media-private-data-v1-0-eb140ddd6a9d@ideasonboard.com>
 <20250802-media-private-data-v1-19-eb140ddd6a9d@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250802-media-private-data-v1-19-eb140ddd6a9d@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_120450_678231_85220AE2 
X-CRM114-Status: GOOD (  13.01  )
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

Hi Jacopo, Laurent,

thank you for the nice clean-up.

On 8/2/25 12:22, Jacopo Mondi wrote:
> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> The custom video_open() function in the camss driver open-codes the
> v4l2_fh_open() helper, with an additional mutex that protects the whole
> function. Given that the function does not modify any data guarded by
> the lock, there's no need for using the mutex and the function can be
> replaced by v4l2_fh_open().
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

