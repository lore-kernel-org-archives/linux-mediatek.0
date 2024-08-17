Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20CCC52D7D
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Aug 2024 08:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pJ0y+Bx0FfYzJuV9mHkWycb1W7eNsjmgnYDcCobrBgQ=; b=EvOZnvY2L9oDlsVsgqTuyLsKj2
	Mbzor7thgWeERlcPq6/3CY92cojw8125YHY+JR1ssY0KDYk5BYk2AGeKhiT6u5wzc20Y4c2H8VOxS
	fJssjmsJQw9Ailm8Ii/9zu171ZsndhgVZZ8soraeMT+46d0+B1rLvrSS5bmnlh8n/upj8f3rJTB/6
	DZrICn0jI3PwbRdhcjLU1UOxX1dHupkGlkfMGVVYJIp3XdYgRWzS6bnBsAnSclkTa/acANoZy9RdU
	NDeuY0PYGO6Qv3PhFN8rQVOKh7GenuXxpknXbJ2kDqoNkFHUsT+rw8bsljLGAh5V0f4wEgc6/3wid
	GxMrgtqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfEkt-0000000EuYO-1Geb;
	Sat, 17 Aug 2024 08:25:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sfEkp-0000000EuXO-2jnz
	for linux-mediatek@lists.infradead.org;
	Sat, 17 Aug 2024 08:25:45 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-428163f7635so21680415e9.2
        for <linux-mediatek@lists.infradead.org>; Sat, 17 Aug 2024 01:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723883141; x=1724487941; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pJ0y+Bx0FfYzJuV9mHkWycb1W7eNsjmgnYDcCobrBgQ=;
        b=vI+pyu0z/1+bls1HbTZqFzex0iP8TCjT7Bl7nB4F6ax2fBLiO9lUs6hV0KPRivM6yw
         tJqdBwLZraL9/Wk4JqDTuzxWN9mrp7iHbO1Et2ySlOVn9VlPd296VhMyR2S9z60OLVv7
         pKdFRTXuFyHWSVIvYAwIjgZc//eF0nN5t3uzUqFvDhuYl26FTJozATiFbAnZax1QZM4i
         Y29rnD8LodmXyRslTnsVDXWEU6b3eir/I/15p0tXMl+jSUgyoTMX7e5XCdpi+isPvk4Q
         l42Kv02Im9dA2rNr6nla587y7OnEz4XiI4TAX8ZhG4mkdN1DYkuffxL2YHoTVHEpr464
         2yOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723883141; x=1724487941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJ0y+Bx0FfYzJuV9mHkWycb1W7eNsjmgnYDcCobrBgQ=;
        b=lR7XA4aZONScjt3YB22K5Y2tPw6wXVfmVCe7HMQ/dJ+Iilv9gnlVFGHFrNVaoTjop8
         d4qX7zm3SyybgphWbxKdhXybCdbxMevQ6P8XIi9d9cya1rsRkVdhvdGowWB2maeKztKj
         Qd6pmg6TMkp5Ebr2Wgu5+fQ+H8BkrE8bHKFKVksr3xbbmTMulSwbMHvDf/oUKWAAIg4j
         HIL0xg8vPZ8u9gfLNFzFoqXpRDrsqWHlL+ucLmRxDDrKP4V87ZJdVPsSImSOBeD/pFwN
         lEXZ8S7p0Iqo0wVB+7TWyT6S8dysW5ek7q2UiFhTBjy6grZoYTwGHBu3zCbGisjyEgSJ
         4hJg==
X-Forwarded-Encrypted: i=1; AJvYcCXbeuPemzTr8xbJ7O5hflW9ddcmXRksdjzE7prJuc+cfNWYNZIKoq/MwkDYrIMwa8RnMkhGkOa7wWOVhvD2NA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBwHn04t5+wWVdFl43aONRQ+h2renolHbXmq2CtglaKpnGM3My
	xmRwTrFJaHKOoPe2AwGfNzAlTkVDIr9GjNBwnyQ3HeHWeuGwn3sBopstyOTFzrc=
X-Google-Smtp-Source: AGHT+IFJ12nDtVRGYsYXFLwDyDsgUaCOjGBYJyBY4Zbk3GuRikGwJdu2MeEqx46imh4mG3NDHfzGgw==
X-Received: by 2002:a05:600c:3ba5:b0:426:6667:5c42 with SMTP id 5b1f17b1804b1-429ed7856camr34069445e9.4.1723883140978;
        Sat, 17 Aug 2024 01:25:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded364fesm96109695e9.27.2024.08.17.01.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Aug 2024 01:25:40 -0700 (PDT)
Date: Sat, 17 Aug 2024 11:25:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amit Vadhavana <av2082000@gmail.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	ricardo@marliere.net, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org, vkoul@kernel.org,
	olivierdautricourt@gmail.com, sr@denx.de,
	ludovic.desroches@microchip.com, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, wangzhou1@hisilicon.com, haijie1@huawei.com,
	fenghua.yu@intel.com, dave.jiang@intel.com, zhoubinbin@loongson.cn,
	sean.wang@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, afaerber@suse.de,
	manivannan.sadhasivam@linaro.org, Basavaraj.Natikar@amd.com,
	linus.walleij@linaro.org, ldewangan@nvidia.com,
	jonathanh@nvidia.com, thierry.reding@gmail.com,
	laurent.pinchart@ideasonboard.com, michal.simek@amd.com,
	Frank.Li@nxp.com, n.shubin@yadro.com, yajun.deng@linux.dev,
	quic_jjohnson@quicinc.com, lizetao1@huawei.com, pliem@maxlinear.com,
	konrad.dybcio@linaro.org, kees@kernel.org, gustavoars@kernel.org,
	bryan.odonoghue@linaro.org, linux@treblig.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2] dmaengine: Fix spelling mistakes
Message-ID: <b155a6e9-9fe1-4990-8ba7-e1ff24cca041@stanley.mountain>
References: <20240817080408.8010-1-av2082000@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240817080408.8010-1-av2082000@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240817_012543_903723_43D5B453 
X-CRM114-Status: UNSURE (   7.35  )
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

On Sat, Aug 17, 2024 at 01:34:08PM +0530, Amit Vadhavana wrote:
> Correct spelling mistakes in the DMA engine to improve readability
> and clarity without altering functionality.
> 
> Signed-off-by: Amit Vadhavana <av2082000@gmail.com>
> Reviewed-by: Kees Cook <kees@kernel.org>
> ---
> V1: https://lore.kernel.org/all/20240810184333.34859-1-av2082000@gmail.com 
> V1 -> V2:
> - Write the commit description in imperative mode.

Why?  Did someone ask for that?

regards,
dan carpenter


