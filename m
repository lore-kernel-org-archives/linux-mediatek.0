Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA910C05052
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Aug 2023 10:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pb0pctZb8QtUfFQr+rA7AG4CHO5Qtd4k3pKgwlh5qck=; b=fldZk1TaDOfrlCL3JAnf7Szv43
	c/3qLT2SOW9i5GjiN0lmHGDakYrYCkBtwYhyuTkc9Sv6i81dZtIFGExHxm/aFxgoEJGEmPgElOd6F
	VpmHPIPfwMlV2JfROo/K2ndBLu6FzVITZLOC+jv7BsSL5Jr+bBW9wxaQ3b3rHF5DNoMfPo4jIbBLh
	9roncJdaf4j5bXfk3WuWwOkcqeISmJF1bW+qcHJfkY6nxZy+qj7s0cHX/29Zl76KJPXftU9ybxlAB
	ACTByFju1lYN1dPq1VZzq5Cye/WMWzbvQHXXQFrYbJZ4d/b9wH0Yutyqn1ow3KNEb40p8Rkswjfe/
	2RcqlWHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWwaI-008Cbk-1R;
	Fri, 18 Aug 2023 10:20:02 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWwaF-008CaR-0B
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Aug 2023 10:20:00 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4ff9b389677so1042024e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Aug 2023 03:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692353996; x=1692958796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pb0pctZb8QtUfFQr+rA7AG4CHO5Qtd4k3pKgwlh5qck=;
        b=Pa05IZmzxUof/JTX5sYgmbso85hDS8hYULdKoqRJ9pa7oEJj3KKPJvlp8aKsu7BkWe
         7LZCZAAJkdeFzE8FevvQGusqrJtgmxn63kAVxmqmD8CfifcwAxo4VH35MPrbg9GbhWMM
         4Pw0oOpcSQ1TqydswzrxSNGG6n0QblyYXklq1LMn07Tim5a8r7oIQu4TBSHlU18VTiTy
         sBll8RKZRHt1X3nHO72Gp4owtRF1Gac+qGE0ZG+H+wdJvjIc12gGSim0WTlF1kEbpD4M
         /2t9f30R9G0Ku/t4SGWRcIvvtXOz0qNl7O68eEhByuz5Q9l7b+4Asm6TdNGwsKlLpIQ7
         EULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692353996; x=1692958796;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pb0pctZb8QtUfFQr+rA7AG4CHO5Qtd4k3pKgwlh5qck=;
        b=OOYMu9hnaaw1rJGKVVTSDDRT5Ma3rlBNUfSixH9nsY3jITvLqmhM+8TtIS9RCEnfGz
         nEUdLz7D5AywraEcHXUufGpi96YJbQg/h+V8IvShrk0lqbwqWBrE8b4xnY690LKVfXvZ
         PwGLz+163QbAC0Y61nd/ZYWFcbDnVmOvrF2By4rD03rkyjz4+Fqx7rWT373oeywzwO2b
         bHFNXlkcN99COUUrfA+BPZ7SwNy/bSsrUr2R+z9/BWFT1hnXfJb/kxuuzfS8d9wBS5Xd
         ZjRw89/Oy5yN8LUa8U11nGNLSl7E3aMJ7ERXhgTy4OQJwEKPIZTHGfYAfcVrLxAJxH8V
         EMgw==
X-Gm-Message-State: AOJu0YxTGBcTax6BZr5YHQBCte0b9Fjy2uxC2/rXdDFmSLMhsnk/pWNn
	n/UaSVJLq6wprBZmN2c0QYEYvw==
X-Google-Smtp-Source: AGHT+IGRjpQiG6m5okW2Rjffn2dFFyB2X81OzXUKgZV+AmI+W2jGdx/QNJfEpqKmEPeD398d/xB9VQ==
X-Received: by 2002:a05:6512:3d08:b0:4ff:727e:9e67 with SMTP id d8-20020a0565123d0800b004ff727e9e67mr2032630lfv.40.1692353995812;
        Fri, 18 Aug 2023 03:19:55 -0700 (PDT)
Received: from [192.168.0.173] ([79.115.63.195])
        by smtp.gmail.com with ESMTPSA id k12-20020adfe3cc000000b0031ad5470f89sm2306468wrm.18.2023.08.18.03.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Aug 2023 03:19:55 -0700 (PDT)
Message-ID: <04f7f779-e92e-ec7a-994d-19e555e5c460@linaro.org>
Date: Fri, 18 Aug 2023 13:19:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next v2 11/12] mtd: spi-nor: nxp-spifi: Use helper
 function devm_clk_get_enabled()
Content-Language: en-US
To: Li Zetao <lizetao1@huawei.com>
Cc: alexandre.torgue@foss.st.com, angelogioacchino.delregno@collabora.com,
 christophe.kerello@foss.st.com, christophe.leroy@csgroup.eu,
 dmitry.torokhov@gmail.com, frank.li@vivo.com, geert+renesas@glider.be,
 heiko@sntech.de, jernej.skrabec@gmail.com, jinpu.wang@ionos.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, martin.blumenstingl@googlemail.com,
 matthias.bgg@gmail.com, mcoquelin.stm32@gmail.com, michael@walle.cc,
 michal.simek@amd.com, miquel.raynal@bootlin.com,
 nicolas.ferre@microchip.com, paul@crapouillou.net, philmd@linaro.org,
 pratyush@kernel.org, richard@nod.at, robh@kernel.org, rogerq@kernel.org,
 samuel@sholland.org, stefan@agner.ch, u.kleine-koenig@pengutronix.de,
 vigneshr@ti.com, vz@mleia.com, wens@csie.org, yangyingliang@huawei.com
References: <20230817024509.3951629-1-lizetao1@huawei.com>
 <20230818074642.308166-1-lizetao1@huawei.com>
 <20230818074642.308166-12-lizetao1@huawei.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20230818074642.308166-12-lizetao1@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_031959_125937_EB3DE889 
X-CRM114-Status: UNSURE (   6.96  )
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

Just a reminder that for the owners of the driver that we'd like to move
all the SPI NOR controller drivers to drivers/spi and that until then
we'll no longer queue features for the controllers, but just fixes or
cosmetics patches like this one.

Cheers,
ta

