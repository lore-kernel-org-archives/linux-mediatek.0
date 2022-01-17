Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4592EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jan 2022 17:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRleGMUkjUqj4YzTKJmcVGrteLghW/HhZZHNhtFP0lo=; b=uA/JgN0lOPNnxw
	+N2uyejqmZyYSBlAb3se7treZzPGD50mWCA7s4WFbCyJ+uK2+CROZZnobEuN186wjxKqr1fT19l5G
	KYkEr/jvK9oa32Nz6zJiwRSwf08Y9wa/Tt+YnKeN/R/gaww2JbV2yhRLA0fYrzDeU7W5bPWPP6hqi
	HrThkwzZ3tTqdnzYhh5pFoFQ9Vz1Y9UyMd7b0cPCrDKadXgI9lzVHZ2gY3IeiYtjq2Y1GeH2qX+Bl
	FcgvSE+aka6e85ObD0DW3LNiN/oJXptKoQi0uC+yFK7v+qhS+4IwH0P8vtP5ZHbRid9fzagASqvmS
	vTE2qG6ekDSDTDI6yXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9Vne-00FuHR-FS; Mon, 17 Jan 2022 17:28:10 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9VXV-00Fm0c-Ar
 for linux-mediatek@lists.infradead.org; Mon, 17 Jan 2022 17:11:32 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D8C2140515
 for <linux-mediatek@lists.infradead.org>; Mon, 17 Jan 2022 17:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1642439478;
 bh=rYVFCe9pl7AFup8bHTYfW3/P3SXGC/+nyEtQsAxutfY=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=Oac+hn9eUEvafikHjXR4nfWdTPZdIab1KyPdEB2QFpwtztZoIG/giJc6lXC2AJjsU
 Ktqz/LAqJyLgDCdL83SEend9MBm16b49OoN01EYRTRW2VlCQ6eXdVpMDrvMx2A4ikL
 0TI1nyzxC12/bgqXDuT7Lhg/bqAfl1I/S7VERyFM9iwpmbsX/U2MLqshK0QcNF6ybl
 Kf2qTrI/fkPWsXlpRzuK6lg9j7Sk+LD7rVhe8M41xkApcac74af0K0EbCpCcacs+B7
 ocqVWCl0+8E+dho1gKsALjBVEIQOitXwueJSK8kjtQN8JopStSX8ir8eE0O0vEWwTx
 FIB9qiVgyqgZA==
Received: by mail-ed1-f71.google.com with SMTP id
 t11-20020aa7d70b000000b004017521782dso7130144edq.19
 for <linux-mediatek@lists.infradead.org>; Mon, 17 Jan 2022 09:11:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rYVFCe9pl7AFup8bHTYfW3/P3SXGC/+nyEtQsAxutfY=;
 b=lQhb9wvAZDydZGG4C1iaZak+/vqm+72KUUmjgN4Qes60uVulO08GLIf49DCktHG5+w
 cdsVrR2q8Mr7Df1u+aKApHgQ7QUzyD2eh299K7TtC8/t3BXisnrkQycWwkyveldyEOWD
 XKcvgL0+iSQzpG4zphtWSbUxNmRewWFMQ+1BtUspn44A0LTFcyrE05GswgbwTSmiIQyE
 cmKY1CZG0Y+pVnMvj7WhHfqwyk6KPEhuE9M1A/AFNxlhWn03/4XFZ4x4OEy/47z2t4Y5
 F8aKG2N8oZJOCEEuzWU8SWTUsPNgbFwe2Zvs1dQEtEbeLPgqMEXIJYxaTJrXw7f5adRI
 aKdw==
X-Gm-Message-State: AOAM5311Yl6jX2NVdn5rz5xF9UdHPIpHGsLQj6fE6DRCtyNHWzhD6vTm
 vsu6QNqoXJLSzdfi4GFEQLOPG8o9hQBBkfCuv2ZN8MjJ6U66l1eA4GiOTD3oCc2Sn5+Ltuah/ax
 rw3y+y5TWkt/9oesRtscMIlBBhhsOLWNEbL1CEGSqrfXi7wJGMA==
X-Received: by 2002:a17:907:16a9:: with SMTP id
 hc41mr17077006ejc.706.1642439478437; 
 Mon, 17 Jan 2022 09:11:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdCubmpUIIeWiYR7npGWGTb6d6igWjY9M7lKb/sdt4nQUU2xIQTqvtVmX1TQrgDksa1opr+A==
X-Received: by 2002:a17:907:16a9:: with SMTP id
 hc41mr17076989ejc.706.1642439478199; 
 Mon, 17 Jan 2022 09:11:18 -0800 (PST)
Received: from [192.168.0.40] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id i16sm6191119edu.29.2022.01.17.09.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jan 2022 09:11:17 -0800 (PST)
Message-ID: <b75a0bc9-0423-83cc-11e1-d5e08952cc93@canonical.com>
Date: Mon, 17 Jan 2022 18:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH AUTOSEL 5.16 02/52] clk: samsung: exynos850: Register
 clocks early
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
 matthias.bgg@gmail.com, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220117165853.1470420-1-sashal@kernel.org>
 <20220117165853.1470420-2-sashal@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220117165853.1470420-2-sashal@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_091129_741964_1DBE395B 
X-CRM114-Status: GOOD (  19.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 17/01/2022 17:58, Sasha Levin wrote:
> From: Sam Protsenko <semen.protsenko@linaro.org>
> 
> [ Upstream commit bcda841f9bf2cddcf2f000cba96f2e27f6f2bdbf ]
> 
> Some clocks must be registered before init calls. For example MCT clock
> (from CMU_PERI) is needed for MCT timer driver, which is registered
> with TIMER_OF_DECLARE(). By the time we get to core_initcall() used for
> clk-exynos850 platform driver init, it's already too late. Inability to
> get "mct" clock in MCT driver leads to kernel panic, as functions
> registered with *_OF_DECLARE() can't do deferred calls. MCT timer driver
> can't be fixed either, as it's acting as a clock source and it's
> essential to register it in start_kernel() -> time_init().
> 
> Let's register CMU_PERI clocks early, using CLK_OF_DECLARE(). CMU_TOP
> generates clocks needed for CMU_PERI, but it's already registered early.
> 
> While at it, let's cleanup the code a bit, by extracting everything
> related to CMU initialization and registration to the separate function.
> 
> Similar issue was discussed at [1] and addressed in commit 1f7db7bbf031
> ("clk: renesas: cpg-mssr: Add early clock support"), as well as in
> drivers/clk/mediatek/clk-mt2712.c.
> 
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20180829132954.64862-2-chris.brandt@renesas.com/
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Link: https://lore.kernel.org/r/20211122144206.23134-1-semen.protsenko@linaro.org
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/clk/samsung/clk-exynos850.c | 70 ++++++++++++++++++++---------
>  1 file changed, 49 insertions(+), 21 deletions(-)
> 

I propose to skip this one.

Backporting it to v5.16 does not hurt but also does not bring any
benefits for the upstream kernel users. There is no support for
mentioned Exynos850 in v5.16.

It could have only meaning for some downstream, out-of-tree kernels
which apply Exynos850 support on top of v5.16, but then they can just
take this patch as well.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
