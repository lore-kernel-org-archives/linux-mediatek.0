Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D38C3600C
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Apr 2025 05:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=; b=BGmmvAyZtpy5QG0tyDPfVaDFAw
	hmFmr+KpqkUPLyu/buu/OztbHKI5nc3Owgp6dQhW/MIKLcDcFSIq+Be03twyDAa3G+IKSgJilfBKz
	EvoYBJotFd4A1T/6LGTUoLaft2nc7qFioOBzkWJDnSLw+Z/uqowej0YgMPpBuM3eBeV2twpM7DsgK
	2J1COldofWHuYLaDZFYgchCqJuOqySQ82tT4khYwrDfTNBMyRWn7poxSPkKtjC8c6lgGfBZA5r8j6
	jnVSK1/u196i8G4qKFOWZTWbAtRmmNfoRMh4JXxtim8FWwfNdC2ioyy91oHhzZDAszVdJmCga9z5q
	KTZEtIEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u21zM-00000002pT8-1Uqx;
	Tue, 08 Apr 2025 05:59:12 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u21xZ-00000002pCz-2Tye
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Apr 2025 05:57:24 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-af9925bbeb7so3852447a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Apr 2025 22:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744091841; x=1744696641; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=vnl9bLzttUyq4vUKC12DPjrZN9M3f2YwuTNQhCKsrASenvp4GM8O+Nm72lrm7uhekZ
         N1KgR8e2sT5FQY998Y2DG6Wm/+DsQdffFuhJmxq43iyDct/kDkL7R9vJKxLe+VXtE5Pv
         wEDQp1Q1YFxzPnBrtMbDbxFQGQQrRRHTLKUZY8I2De/1HP8DBtGTNj3CKy9j/1Sndv2b
         V0d3N6IiVkYaB5Zr+V1HJz9QKDPLYdSny8uwr1T7lH8EiSWr+gKPkPDYB7gTtEPkkZF/
         iowyA/M8pRwsuNQIfJ85dKIWn1mMSLllmM2JvmknfpsWsLBQVUqTbniwEYO6UIeWEjLI
         kohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091841; x=1744696641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=Mj1A+Ti7Vlj1Elf2DCEZtCFiYk6PAeq4VyMSuNbM6ZiGBCbaLd3UhRTUEqgYisK/nT
         MMwbiKEsBOUWVU/plvnOqUUptPZkRt36hOJtm7KyDeiDswX/hF/xL1DFQyw9u29QPR3c
         NMaBDt5DwqX7hopKvJckoUh0bVfcS3zDcOvdXIeVcf4XfUT2CU70NFFBR7abomT16Np8
         upykj4sY7QYpvZNyFdi7hqwcxB7uno9c74GxJwoQjZt0w/57ImKtKw+Fl+Jxn6OeqIcM
         L1LRLxzTU2Bnhczm5k1yCUs1l6+isuPKH99tBbCnBWBexxZSLrGpU1Xcq9SP9tMirngo
         OjSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyJi1VkgEAcDlO8+HPmcFxyJs82Xh0Q+CKTlQ0lDzorPnWbtDmh34wnk988bAM+GZwNZJtSxmv/PiOJDes3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBiEYjwURJK8ERSVnK2/ovvby4PuI6cxklaxNEl49Jlz1gHDgn
	zM9zoqBKnvMipKaihqdi30zVTa5TVb/Ez0cGx0NtIBlJ3IkPFCUVV8G0t5f4XTk=
X-Gm-Gg: ASbGnct5TvMx9XzrQ7CrC0q343tdCLyA363Ir/qR3hRCIpnd+HDI1GwPeCBQX0ohbBQ
	8X6q9rukbJ512nEDiv2Fr6siETCCg9cmgfTQkXB8vFZJrz/3TAW91U15EMI8dDOuqFAX6SxmapA
	AzzE3xLfmsxiABot7dxohRVDGqkBFQSSZ7oVzgBoDCmELMYJSIjBxufNCwhi3LewFUSRvAEdODy
	hDgpl8m6zbTxMJOUIgrmlxavzv3Sr78EHwguA+qHdYcP90u+SL4BFT1GIgvcFH15yMKo/m4aBKM
	gngLxZHlCepAeLEaJyyVExzIu49qfDVrJswaKsupHuYwtw==
X-Google-Smtp-Source: AGHT+IHa7mNtQoh2kE0P3zD2ru6aZMt+A87LdNqpNKujZXMzxAW0s8D/vDJRFgVZKF/JyFi3WYplYw==
X-Received: by 2002:a17:90b:2d08:b0:2ee:9b09:7d3d with SMTP id 98e67ed59e1d1-306a4894cd0mr18110280a91.19.1744091840732;
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a3140asm10075622a91.29.2025.04.07.22.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:27:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
	Conor Dooley <conor@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/19] Arm cpu schema clean-ups
Message-ID: <20250408055718.4azlqljvo4qxhnu5@vireshk-i7>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_225721_631641_9A167114 
X-CRM114-Status: UNSURE (   7.13  )
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

On 03-04-25, 21:59, Rob Herring (Arm) wrote:
>  .../bindings/cpufreq/cpufreq-mediatek.txt          | 250 ---------------------
>  Documentation/devicetree/bindings/opp/opp-v1.yaml  |  18 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

