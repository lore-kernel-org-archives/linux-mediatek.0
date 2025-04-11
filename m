Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09CF6C369A2
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Apr 2025 00:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKjBnAI0llRD88HQinqqWPzae0oerPBARTmSqosHWIk=; b=l3r2iCpjj5KC56B5HW2ywWl88n
	vwnPRKfJj3eqowPlzdVeNBL+F8ndLrmcB5jQ3T5w4UYZftmmzzG98egnl15R01UPfaT0eM863AG2P
	psJ8fGDkTeJACb4YbrhjBYre9G/settBcKmL5fVSIDClX3ZoSrzqvTd00BnRaB86zwRWSHcKIUqPw
	RNZWjQKv5zXHBfibHFXr6wUEwXJEjgpnIsl+IjqFpKxREvwsDBvU27blRBQACDr5waYxcye8lP6h2
	zPjLE9TyPkErGtdPvyBVEeodU6Vy7jdJpvRJGAoY2/Dwehtx8KYIvp74ghBRlkR7+UvL+vPGfNLFD
	GC61xbXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Oxr-0000000FBxO-0vQa;
	Sat, 12 Apr 2025 00:43:19 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Nvr-0000000F6Hr-2JdJ;
	Fri, 11 Apr 2025 23:37:12 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-72c1425fbfcso1540629a34.3;
        Fri, 11 Apr 2025 16:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744414630; x=1745019430; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TKjBnAI0llRD88HQinqqWPzae0oerPBARTmSqosHWIk=;
        b=mLf9wWEY+dPczezsH13A5AmoaX2Q9hZsRurPaUF49QqNlihi9xKKTmvGUmmf2H65Ze
         OXXi8Wm4ykI/xUrCecOMnKOIVZQ+QHR3v6L8E4tq9PfaQfNLUup4jYKncitDALRHydLs
         h2HgjjYB4FLptgTQ8OaaDglT7OLcwIOMYPHeamW2eVSbBbzNvbof5RptYFZIU8kpT25h
         mW87EvZxoJSccCryDa4ZOhzZUXyBFe2DTf0vT3XxEH/HgTZEFnm2kzxBEjzehLbd+Jnz
         OUPIaBzuGLvepKX3/mK3mf9GsTHQbw862cg3ybVVp171YuUG3xRTMYeLcXdfMuLzPIy+
         JRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744414630; x=1745019430;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKjBnAI0llRD88HQinqqWPzae0oerPBARTmSqosHWIk=;
        b=O7bTj+Z1WWQNnyTaMvTWPU1GExb32H9b7IMdF9VwWVVDqokE1QNyDePqeYk5n1e3w7
         HuVJGBImJYloh9pdZEnvJSnCpnF7P2dPcXfaiUQQQwggz7Sikn0yd0DyEDHHg1SJ75LA
         ajLn3a0KHrg1XV+2wAEAeMcYafLCfalmvhF0P4zuQx8NcW8x26gsDki0nL0PdQ0J1zhR
         bYZByK2zWzplnD8mz8d5T4F/uFtWpAxBTaglhp+qSINHSsmkMmWCJbXplNKjgzP3rK5B
         6dfHwRinTWRGSZqY6gWOBQDcnf8jzOhWQZhXVC4W42aI+AklZ6AKq+HshbOIVa0cdRpm
         iE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/iUVo/tbWdQzfJbbf6FZu418vt6v7ePgGspJqBO7In6zp4gfS/P7lab8EhIOwsebtkUEVerremC6JnTyTLx4=@lists.infradead.org, AJvYcCXAgua2whjxoxE5Gf4G01lRFyGo0E76Yh7EpeqzBcEgOPITF39+/FXEfn058onI9zkFi0UuOG935jNrgk77a0g=@lists.infradead.org, AJvYcCXcr7YSCW7j/TGb6+0ZIjPqnYQVddiSUVsgJ7vxQqZTT786Pce3iwja43eL7h57D+CAUBFAlUd15E4yaW2Q@lists.infradead.org, AJvYcCXxhU2N+JNiAZuA/ubDZVesb8hSHRgeVkeaI/TbmXWR3m/SbFgOAso8A+Ac52PPnZMezeqqIhqg7WG7uX+zTBw3Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxK38BDEWnXgOV81gRm/Yl2Qe3oskpSbMAXL4KfEF2FBwp40qBU
	RsSBAk71vU5wjJ6Nr9srzdi5YUsg7lOY4rjUHNSWyP2BkoNFFsDP
X-Gm-Gg: ASbGncsKgoOBRgvI+6daPyMWKdBqmThSNRinZ3sZbRXwbqzw5ZUsDeDQ70/LKYdtG92
	4u6kCQISmih4WY7MzT8iA3t+QOthohlwlhD7BUb3rPY86hWTPtjHZ267xTgFgrUnh9He03dIzlU
	IFYk1QOf1uRLELh4Jmx/2a70S+U+dSYl8f9WSwfwMe3Nej+zKwigO4zqYpQK8kUQinIuQFdCi4X
	s5txEsg87GU9MM7DUFNTgfCNj30J82RQ4mQe3ekzuHvrhQwxNrPouHcz21fvAENZz5ENJX82ziT
	hFm4xrQtxY6rHAfvCsiLXg5om1MSDSWmSj/qeKhvOsH/1ztm9b9nBq8PdAzMVM1/8fzi
X-Google-Smtp-Source: AGHT+IFJfzFy8MikJxGoTFLuN6tcrmJtPOA/qBHSB3opFc0xc5RXfyX0+z3ecAr5bH4Qt7gKQzRQRg==
X-Received: by 2002:a05:6830:d1a:b0:72c:4032:76f with SMTP id 46e09a7af769-72e86304edfmr3726235a34.12.1744414630055;
        Fri, 11 Apr 2025 16:37:10 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-72e73d7140esm1131783a34.22.2025.04.11.16.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 16:37:08 -0700 (PDT)
Message-ID: <0ce8559d-5c7d-43a0-8177-7704969fd334@gmail.com>
Date: Fri, 11 Apr 2025 16:37:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/17] arm64: dts: broadcom: bcm2712: Use "l2-cache"
 for L2 cache node names
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Conor Dooley <conor@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Steen Hegelund <Steen.Hegelund@microchip.com>,
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Andy Gross <agross@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
 <20250410-dt-cpu-schema-v2-2-63d7dc9ddd0a@kernel.org>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 WlfRzlpjIPmdjgoicA==
In-Reply-To: <20250410-dt-cpu-schema-v2-2-63d7dc9ddd0a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_163711_589925_3C58EB02 
X-CRM114-Status: UNSURE (   8.60  )
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

On 4/10/25 08:47, Rob Herring (Arm) wrote:
> There's no need include the CPU number in the L2 cache node names as
> the names are local to the CPU nodes. The documented node name is
> also just "l2-cache".
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Not sure how you had intended for me to pick up that patch without 
copying the maintainers.

Applied nonetheless, thanks!
-- 
Florian

