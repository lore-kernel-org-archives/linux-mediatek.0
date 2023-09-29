Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78A6CE7AF7
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Sep 2023 08:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsBQLJ6Ogoic+1/xmfT0u8ONBi3qeWxubxgbbL3TF8o=; b=Ag8KTzCrVqWVGwcQZ/DprQvHUl
	G58owFR8m/RI7IQZFcQFvgJWx2g1cKy1fHNxE4MiGaofIKopd6+qSL1V6iNbLfO1RWxUPe/mC3bys
	rphouYYZxmgE8S0k0LH7ps34K7gnj9aXr2KqhkaPFRfsA8iQmS1TpAXj7k8OendHNmFGH6N/xq38D
	dQswLMaX3/5gbP+6jAjz4lT8SAd+CXh1+WASewqMd7Rf/93tohMOeQPwQ+YfvebLVuSZRLaPY8Dux
	DY8o1JvAqZ9ef///y7TTQDuyc7pBK2Ym+jhfsqjR+rf/brVXg7UtA5SJnEzbyi9uUgD0tmOEErSq6
	0Qgu2ExA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm9Js-007QIu-1r;
	Fri, 29 Sep 2023 08:57:56 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm9Jm-007QEv-2b
	for linux-mediatek@lists.infradead.org;
	Fri, 29 Sep 2023 08:57:53 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso1850076066b.2
        for <linux-mediatek@lists.infradead.org>; Fri, 29 Sep 2023 01:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695977866; x=1696582666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nsBQLJ6Ogoic+1/xmfT0u8ONBi3qeWxubxgbbL3TF8o=;
        b=AeqaMFkiDHXOP2hAgSpk1f7k9d+jk9qtWTlqlL1REBRGzIuzfgnaWqD6lGNlOv09Rt
         f+9h4TMT7j277vTuB+qQLafIc034IuUzhR81CkJZJkaw//YbXogsBGFPFoiepI6lgHnp
         MEwkfRrcExn+f5PKDfTAKooB8iL7T8A4S9ExPFf1jwmfp4PwFrw/x9ipL8JFuVA1B6bJ
         u28Zt5l/pNiRTyiTz52c4ktrCbetJm0WSUb1++AAvUhPU9i7/DSeuB2ucvyBQELl8xYv
         IjoqRf3zaxvVFqyJCsyHGJhypyZtLk5V7AN7k9DrhLLtZNfSjjD3OBqORRDpOv+kWUvl
         Jhvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695977866; x=1696582666;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nsBQLJ6Ogoic+1/xmfT0u8ONBi3qeWxubxgbbL3TF8o=;
        b=SlIFAlF9rnHiwIs0myuTF1YhLS0KgPKHQo1X/7g8uMEuikGBPzTOh/1gKmumCLnP/p
         7FsTICOo7uQ4x4pTOoZQGfh1b1nUjtH7l3od/iP6pfPoBwmpAtgoJGiG5QmFf0ACw/ve
         3KgrRvglOotqaYRjFVdgPXzUqAbIQUXwnJGLLSi0+DfXzlT54wuIaO6j/6iZlUkXbf39
         zeQrNyDmrxieNE3ZYUfDqqOTUhciUbwEE+dWtCnRx3gpm4UD5OqOH2+cBnHmT5ZbldfZ
         HfhRsQ0rIBx7aHISKIe2xl//LoWwf6eIQZ02CLo2VXdQZSSj10F5uQv0Fowpw0w8Fhe9
         xL0A==
X-Gm-Message-State: AOJu0YxkW75dk4TwzTk5oitWENoQzP9xwXw1pY7c/mv4CYhcpcW0gVEi
	CWZLLbzZq+5834cUU6oFhAeTeg==
X-Google-Smtp-Source: AGHT+IEsrmtSBffKc4/0WejFkmq1arFW3oxGMi3C1GOThUgoHMTSmFySeXvpixD0/kTwmWhaMqbTUQ==
X-Received: by 2002:a17:906:28e:b0:9b2:b749:ff93 with SMTP id 14-20020a170906028e00b009b2b749ff93mr2957352ejf.24.1695977866113;
        Fri, 29 Sep 2023 01:57:46 -0700 (PDT)
Received: from srini-hackbase.lan ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id w27-20020a17090633db00b009a2235ed496sm12339806eja.141.2023.09.29.01.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 01:57:45 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vincent Shih <vincent.sunplus@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Alessandro Zummo <a.zummo@towertech.it>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Evgeniy Polyakov <zbr@ioremap.net>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-rtc@vger.kernel.org, Michael Walle <michael@walle.cc>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Michal Simek <michal.simek@amd.com>
In-Reply-To: <20230927204446.4231-1-zajec5@gmail.com>
References: <20230927204446.4231-1-zajec5@gmail.com>
Subject: Re: [PATCH V5] nvmem: add explicit config option to read old
 syntax fixed OF cells
Message-Id: <169597786418.99756.8731565742524355843.b4-ty@linaro.org>
Date: Fri, 29 Sep 2023 09:57:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_015750_858233_AFDC4CAE 
X-CRM114-Status: UNSURE (   9.89  )
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


On Wed, 27 Sep 2023 22:44:46 +0200, Rafał Miłecki wrote:
> Binding for fixed NVMEM cells defined directly as NVMEM device subnodes
> has been deprecated. It has been replaced by the "fixed-layout" NVMEM
> layout binding.
> 
> New syntax is meant to be clearer and should help avoiding imprecise
> bindings.
> 
> [...]

Applied, thanks!

[1/1] nvmem: add explicit config option to read old syntax fixed OF cells
      commit: ee73a9fae540adbb432bd2854a82409515c7c892

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


