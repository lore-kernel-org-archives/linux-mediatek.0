Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10775CCFA13
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Nov 2025 11:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l1rfVf8CR6nXwtwA2s4abFfmksXss6f4ONY3gj9LEKk=; b=nKT50J7WigHu8r9eNHRPhxebpe
	4a+XVJDAO52nAOPT9noy8Q1HwqcXKlK+by+MXXltN8I0nBISFCfMISzVlAjVWhRzTF3YI/ld+GWwX
	TYc1tfJsNQazp4Ns6zX/FaBlo7KIoWSdGTvT5dhyoeSjgqL7iNcNd0soM3BU+OvwezmO/EVBTXznZ
	6L0aLPTtAliPTNH7pZIsty84lggW9PEuo+05oB0QGSorELfY6j/o7Es+jI8YRH0uI+dg6AfNnIpT6
	p8ts2Clqs7VFfnoZfBWl/KR5TfJVwOiBu+FMCUaXfCuVUQPqPJ5fNjjgySvnP6fA2/Kl2seq8cFVw
	wQQqyowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPkB-00000005GOv-2cZS;
	Mon, 10 Nov 2025 11:07:31 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIPk9-00000005GNx-1Cz2
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Nov 2025 11:07:30 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-7afc154e411so1642349b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Nov 2025 03:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762772848; x=1763377648; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=l1rfVf8CR6nXwtwA2s4abFfmksXss6f4ONY3gj9LEKk=;
        b=mFcsEQNGaLNFD6AVPADkmXqXXDFl1Sn136+owGpMOxly+kSWs49TN4HcM/KwWFD4FG
         QJbpkoUmqofLn7EjIy5ytVRe9+6MzxZ+ZPCrTGAEjJ+T8E/JVD9OqQyeKT/0H9n+YAq2
         T4oYrOARnMqDDF1MnoWPzBaoC1vRJFGGAyx6YN1hfeJF+i7cMDxyyYDxdzrwpU4WLC1m
         3Vtu/crHGwAxL0TsfCjqfsdNcW2wuBlF7Ek9yvRUn8R0HmqowpjHWj68Zotdi4f/+k2N
         YGNtiPQDA788XrhfK3z61Vb/FDHLIgRb3zLCJptH9/6lrbXWLti85h8G4FWUV/ry9nyA
         usDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762772848; x=1763377648;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l1rfVf8CR6nXwtwA2s4abFfmksXss6f4ONY3gj9LEKk=;
        b=pHaY7YpFGEw93aCzllX9akjM4JM7b/WlnWo8EdWfcyP8SD2eqSdoMSKlnziOrqUA4t
         /SeekIMTrp3oeMJUIUeJRYV41HLBhxKbbnjj1HROXVGHUPBPoopnsXDrAoKk5pgLJpJ6
         WeFSh6got8iFerS4+AnQnQwgKdVKPKA9pepl2oj/am7RYeL0fsZfAtciuajrK23GEB1W
         CSZMh3sBi72dUq6rn/7I4aTDx36sPV18vtLc9momx3FjWJrwohdfA2PNjnRp/fevWyxL
         5tbttYooHGg4lIQOR+ehnscq/eTJvsgRwceRemj2QtREUZILhQHntajKSZ/mCXQNsPPM
         3qjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcmpr3LeWy0+Z1qcwTOl37yUacXoHuqsbr7cwXgX1X2thFVmaNaEP4jx9RdomY6iEL9iw6pdbRQksX2ngNVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNaGzjzlEHtok0kUDu+grC7L0Cn1EZmMam+BObPGOG9L13PucY
	qKejNhPqTPv7tSfuqkiM5nJcZorjQvpJdI7rKnU/IQJGx4ZYdVf1HcHpbyPWSrYbIrk=
X-Gm-Gg: ASbGncv6yIBjXHODygVFLXZ9p4L06hOFZP/F/5ZcW5n3dNQqE6vPsLw28HiEgJICB0m
	M9WBnWzeAaD13yymo6LN31OArd5gp2zhSNN6WGg/P3ob7FjSuBJDGpVMZM9Lztsun0sSPHlZzbi
	NEbCQClY5bWQsx31eLTDCoT2Zg8fOm8QJTG0nfpP+smM63Mj4BOXt/DxHyev7XGMgOcdYJSd84t
	ud8dRur2p2ZCernFc+MJyTlVeV/fUnTyCQKg/lfQNieVxcBpELGlBmFKPcGHcqNOpujFcPMU893
	NIX5cK6GOXIfa7MOCxghNYskGBsLQmnrKPHxpBSGBUbuFSe5p7ZGvTqTsMqTtMhaDY2LKs47PHh
	y/K+QoyJKzIcUgacbgcPFHtjHBeXEDmthwGN6w1jQK+OhXfWJ6WtqYsjJTj70wc0rLqDFA/VUcI
	Pb
X-Google-Smtp-Source: AGHT+IFLmvoREqyCOsxdVYWioPfB8QTyekqamyvK/6SevugbTh8+Sr7Hzt8HMarNXUtUBmALUpoibA==
X-Received: by 2002:a17:903:46c5:b0:295:fbc7:d282 with SMTP id d9443c01a7336-297e566886emr96785235ad.27.1762772847847;
        Mon, 10 Nov 2025 03:07:27 -0800 (PST)
Received: from localhost ([122.172.86.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c8ef47sm143941675ad.74.2025.11.10.03.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 03:07:27 -0800 (PST)
Date: Mon, 10 Nov 2025 16:37:25 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 03/13] cpufreq: mediatek: Simplify with
 of_machine_get_match_data()
Message-ID: <elghyjazfcsbwh4tmyfgfrbstfgpijgmlfu5kytbg7yvjtx2rf@v3riwtqr4itv>
References: <20251106-b4-of-match-matchine-data-v1-0-d780ea1780c2@linaro.org>
 <20251106-b4-of-match-matchine-data-v1-3-d780ea1780c2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106-b4-of-match-matchine-data-v1-3-d780ea1780c2@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_030729_332272_949696E8 
X-CRM114-Status: UNSURE (   8.35  )
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

On 06-11-25, 20:07, Krzysztof Kozlowski wrote:
> Replace open-coded getting root OF node, matching against it and getting
> the match data with new of_machine_get_match_data() helper.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

