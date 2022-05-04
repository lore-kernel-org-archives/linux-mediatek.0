Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D40C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 12:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Cc:To
	:Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rD9CKQpBOkdqXgMCqe+rs7FOxtzhfRPabvgJbFi3COY=; b=vFXJOxQtkD2L7niRyfBrmTn/Bb
	YqzzcXlCvg+XQbyvw4mCXD0YOz8O91XW3UutkL6g3iT/V6kWKaQPrbtE70lM7GZwbGesc7VtBzb6u
	mbo7/VSc8+Ygn3h7ZE/vRSwpc/5MgImlKR9RpsXa5LHw6/+d/F0K6nzKnvYhdDwm6pZnwvvzRrw2e
	6WZJG2axG6oeG1C9Ol7KPZujhew2egYMgXAQHblNYKrx7u/R7fjCRTVbgHkDFcUHz1jYEwGXj6Dtj
	xegs9jaibHx/B1nVM39J1iYEkuOuJhDRFUbrOpTknsjl4H8lMIxdT9sGSjIlI+1gq2eccRP7GC2PK
	mDxFseAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmEZY-00Astd-4y; Wed, 04 May 2022 12:57:40 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmEZV-00Asrt-AQ; Wed, 04 May 2022 12:57:38 +0000
Received: by mail-wr1-x42e.google.com with SMTP id k2so1905883wrd.5;
 Wed, 04 May 2022 05:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:message-id:in-reply-to:references
 :mime-version; bh=kZZv9mgu5CwmRiMWt33fgzODsP/Bo5LczhPKHEYKI2g=;
 b=P8vaQY9TUngwqCpijFd2d4LAeqJbERfj96ozEtY4mzt2p/c1Ywp7QSOfCTgTq+FJOO
 Gbr4t70Tgv4ll5c1Q9qyQD+7wVYumYk6crLyqkNjC/HrTBPf8y2ybrG0cvsu2Ik5SRN/
 JIP5BUgHCTVfVFcWhysaVBqlUCqdySDe929u/WByEhUtpO4obfaVaYFn3OgPodqJv5M8
 sawCqySWh+/b8sbZwqH1cH7YPpXnGYwTbiE+WimD5cwoH5r5656z1snH0h6R4lvfm5X+
 u/RD95dKWlF3dInYCUqun/LQgeX0c5ledhTrLWy1Wv6DMggWNPELirWNJGplpXEX0imC
 RW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:in-reply-to
 :references:mime-version;
 bh=kZZv9mgu5CwmRiMWt33fgzODsP/Bo5LczhPKHEYKI2g=;
 b=hSA3SjcAoC5sJdwcgWMxAfjIbmaFVWOtGGwi48KGQxZ9eSP0unnDX8AzJjE/9FWVx8
 W5vDawCCgdEkGr+ndu+SAHn6YGKf0NvaMuLPapPMxcu1rxz36TXqjjRFlbUnSc1C0VOk
 p2GpReUHUKD0qm38DoTtAq0+U0xmNEYCjWv/CS6Vkpi5J4w0q3TL8TMLWsjZuE5SLTrC
 /eBu3VDYG2VaUTLPmM9XVV+oaz2RvSrJg0D4ajUygdpUzLxPXTiBMi6M34B/rh0iaCKW
 BV3Fuk8ue1EAJnH+Y4fKCpl0i7kuB7E9MBFVZUB/OYawuS8t6+S0XH7XjY1v8dnYSTi0
 GHOg==
X-Gm-Message-State: AOAM533ELeGvf7YppMF8N736iAiQxGi04L1jk9CpAJpT0gtbdx+A6R8K
 +1nP2EQtpCNRVquHH2Vd5hM=
X-Google-Smtp-Source: ABdhPJyg2nw7z5umMABTaNhWVzD3nqvwRSbwwdit8bqaZZDXTjb6FZqLpoDfrj9rWMr0ZmKS70ECbw==
X-Received: by 2002:a5d:510a:0:b0:20c:4452:3161 with SMTP id
 s10-20020a5d510a000000b0020c44523161mr16584044wrt.31.1651669053295; 
 Wed, 04 May 2022 05:57:33 -0700 (PDT)
Received: from [192.168.98.247] (185-177-124-12.hosted-by-worldstream.net.
 [185.177.124.12]) by smtp.gmail.com with ESMTPSA id
 e13-20020adf9bcd000000b0020c5253d8basm11723098wrc.6.2022.05.04.05.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 05:57:32 -0700 (PDT)
Date: Wed, 04 May 2022 16:55:08 +0400
From: Yassine Oudjana <yassine.oudjana@gmail.com>
Subject: Re: [PATCH 09/13] clk: mediatek: reset: Export
 mtk_register_reset_controller symbols
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Yassine Oudjana
 <y.oudjana@protonmail.com>, Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, Miles Chen
 <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Message-Id: <WVZCBR.JP1KZVF249S43@gmail.com>
In-Reply-To: <fda797664ad3cde1143838bdf63cc587459b2c2f.camel@mediatek.com>
References: <20220504122601.335495-1-y.oudjana@protonmail.com>
 <20220504122601.335495-10-y.oudjana@protonmail.com>
 <fda797664ad3cde1143838bdf63cc587459b2c2f.camel@mediatek.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_055737_394854_D31C9816 
X-CRM114-Status: GOOD (  15.51  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Wed, May 4 2022 at 20:46:22 +0800, Rex-BC Chen 
<rex-bc.chen@mediatek.com> wrote:
> On Wed, 2022-05-04 at 16:25 +0400, Yassine Oudjana wrote:
>>  From: Yassine Oudjana <y.oudjana@protonmail.com>
>> 
>>  Export mtk_register_reset_controller and
>>  mtk_register_reset_controller_set_clr to support building reset
>>  drivers as modules.
>> 
>>  Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>  ---
>>   drivers/clk/mediatek/reset.c | 2 ++
>>   1 file changed, 2 insertions(+)
>> 
>>  diff --git a/drivers/clk/mediatek/reset.c
>>  b/drivers/clk/mediatek/reset.c
>>  index bcec4b89f449..6c2effe6afef 100644
>>  --- a/drivers/clk/mediatek/reset.c
>>  +++ b/drivers/clk/mediatek/reset.c
>>  @@ -129,6 +129,7 @@ void mtk_register_reset_controller(struct
>>  device_node *np,
>>   	mtk_register_reset_controller_common(np, num_regs, regofs,
>>   		&mtk_reset_ops);
>>   }
>>  +EXPORT_SYMBOL_GPL(mtk_register_reset_controller);
>> 
>>   void mtk_register_reset_controller_set_clr(struct device_node *np,
>>   	unsigned int num_regs, int regofs)
>>  @@ -136,5 +137,6 @@ void 
>> mtk_register_reset_controller_set_clr(struct
>>  device_node *np,
>>   	mtk_register_reset_controller_common(np, num_regs, regofs,
>>   		&mtk_reset_ops_set_clr);
>>   }
>>  +EXPORT_SYMBOL_GPL(mtk_register_reset_controller_set_clr);
>> 
>>   MODULE_LICENSE("GPL");
> 
> Hello Yassine,
> 
> Thanks for your patch for mediatek clk reset.
> But I have another series to cleanup mediatek clk reset drivers and
> most of my patches are reviewed.
> Please refer to
> https://patchwork.kernel.org/project/linux-mediatek/list/?series=637849

Great! In that case I'll rebase my patches onto your series and see
if anything is missing.

Thanks,
Yassine



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
