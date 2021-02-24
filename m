Return-Path: <SRS0=l1Zb=H2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A79C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 14:10:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B55B5601FB
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Feb 2021 14:10:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B55B5601FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oOyZIoyCs3XhgdlCyp8GS/LVHMKGzjpL4Kgj53UhPqY=; b=06J1OXvyiyp4Tww7ovoIvayPa
	C7DsaJIk6hz1xcKGHkUVEMASsBkJ9SmJ3TobRI9cGWOvApzlLjJktCnZl18mhuKGBfA5HTadOPY3W
	ma80z6aKqScTcNOM5cJYj+ZnTc/WqmLDeYQ57h5gALT4vE/JaCvjGXsPivuY1cxhgZwNrcZHH1vXQ
	iZpExuRF3qSN9xj4+ZZeEixJYO9QwI0A+3v/kEdVssutL5MOsU4d0/BCPtPdEeS3ptAwol5mx5RDS
	UeZFnKl5fPu1+BkkKNF7Pcdlo49o8sd+TSg9C/1NZzqZJBUuA5gCGuhgjtpcvcrO2nUbD1eeDl6+a
	6AedxtnaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEurv-0001y2-5D; Wed, 24 Feb 2021 14:10:23 +0000
Received: from mail-lj1-f176.google.com ([209.85.208.176])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEurt-0001xH-7g; Wed, 24 Feb 2021 14:10:22 +0000
Received: by mail-lj1-f176.google.com with SMTP id e8so2538065ljj.5;
 Wed, 24 Feb 2021 06:10:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rp6xFbMVcSNr3U+KePG0/i37RYbSH1lUEiS0Y/RzdOU=;
 b=Sa6ebU8NESFx4yD2JMYZCc4jc5gJUjy4OlyfP9d44oVKtYKMYqCIbN9Ontxn875Gj5
 ezOUNbHI1fUV9phIigLZO0MGJzV5jbn6/5La1osFBf9c9dErWA3ByZV1QjmdkV34wdqB
 b+HWfqYGnGlYpRhftOfFDXP0t6zvSLUKPgjE8ve5Fg+Pojeot3lGsmDIBj5QM9bD8OG1
 J2ZJd8l1dyaQEQE+F+sLbg1aVLXVybD1KqGjBiLCHwbR9Cz6iwjt0DtPrB05MiNsIJ5N
 B4Z2pH3H0rUfy8SkkfTG6+dtuAG/68XwYSTyQKOawQ2FveWzFDzM0fcVJDoIPdIRDYRc
 PPYw==
X-Gm-Message-State: AOAM533iflTYfuv5PX5FiDm/8rAaWbke7Gk04y4GI7WZOCGKRpJsGoRT
 DhrSlt3Au8bA+dFPB4WZH/Y=
X-Google-Smtp-Source: ABdhPJw0MxwBtXUxHE7ZBUDyzNlLM4MxrrjRipAt6fYrgf8jDMdyN1rtiQm3NBCDC0X9YA8LNWW25A==
X-Received: by 2002:a2e:7409:: with SMTP id p9mr19032678ljc.404.1614175815511; 
 Wed, 24 Feb 2021 06:10:15 -0800 (PST)
Received: from rocinante ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id n13sm509705lfu.265.2021.02.24.06.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 06:10:15 -0800 (PST)
Date: Wed, 24 Feb 2021 15:10:13 +0100
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Subject: Re: [v8,6/7] PCI: mediatek-gen3: Add system PM support
Message-ID: <YDZeRc6CHV/WzyCm@rocinante>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-7-jianjun.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210224061132.26526-7-jianjun.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_091021_310580_254A795B 
X-CRM114-Status: GOOD (  14.26  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rex-BC.Chen@mediatek.com,
 qizhong.cheng@mediatek.com, chuanjia.liu@mediatek.com, maz@kernel.org,
 drinkcat@chromium.org, Ryder Lee <ryder.lee@mediatek.com>,
 linux-kernel@vger.kernel.org, sin_jieyang@mediatek.com,
 Sj Huang <sj.huang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, anson.chuang@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jianjun,

> Add suspend_noirq and resume_noirq callback functions to implement
> PM system suspend hooks for MediaTek Gen3 PCIe controller.

So, "systems suspend" and "resume" hooks, correct?

> When system suspend, trigger the PCIe link to L2 state and pull down

It probably would be "the system suspends".

[...]
> When system resum, the PCIe link should be re-established and the
> related control register values should be restored.

Similarly to the above: "the system resumes".

[...]
> +	if (err) {
> +		dev_err(port->dev, "can not enter L2 state\n");
> +		return err;
> +	}

Most likely you want "cannot" or "can't" in the above error message.

> +	/* Pull down the PERST# pin */
> +	val = readl_relaxed(port->base + PCIE_RST_CTRL_REG);
> +	val |= PCIE_PE_RSTB;
> +	writel_relaxed(val, port->base + PCIE_RST_CTRL_REG);
> +
> +	dev_dbg(port->dev, "enter L2 state success");

Just a nitpick.  What about "entered L2 states successfully"?

[...]
> +	if (err) {
> +		dev_err(port->dev, "resume failed\n");
> +		return err;
> +	}

This error message does not quite convey that the mtk_pcie_startup_port()
was the function that failed, which is only a part of what you have to do
to successfully resume.

> +	dev_dbg(port->dev, "resume done\n");

A nitpick.  Probably not needed, as lack of error message would mean
that the device resumed successfully after being suspended.

Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
