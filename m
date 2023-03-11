Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0CBC74A5B
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 11:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KaOqJwCuCU6eYSkbu7OLJMXK8GkiuwakKSAKukhdDJY=; b=lvSgq9lcGzdoNMUWCp0k3q0nKV
	ipbcDftZLdus7FQ6VI+uE7TbEax6ryNY5cTaMkNC89gNqTKOBHeh/SG4oiFBRkmrqoOtikSym/sSL
	DxHbrF6S+3r4DinxJd4hEuoo3mpGQ28ZoR0qXujoo0/TkA8/8B74Vw04BVGCpTRzoa5Q2oVOFkF9q
	kK/hIjqXwra4+0gGUpeaXSanUajEGDz/Zq7zuDHaME795ipyMbFWe73pHZnU6kmxe0EEGPeZFaaVS
	Pyehx2VTCXQC2rw32l4f+o8OKjsysT0FmPKSFcmLK2wV3xiFGWbmGwzMI2GtGHKxHqlE+5lm+2O1r
	z0M2O4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxfC-000OVw-EF; Sat, 11 Mar 2023 11:45:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paxf1-000OTX-3m; Sat, 11 Mar 2023 11:45:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AC05EB82432;
	Sat, 11 Mar 2023 11:45:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF883C433EF;
	Sat, 11 Mar 2023 11:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678535110;
	bh=75mbQ2zIUa16Px+XAHlCBKsO8iebtVjeSF8AguylJ8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vKcuArUhUvEGj+8PjRsrv9iWFy3ybcuDWmCSvAgrw3VQcr0KCqVMB3Yd+hSUl/rWD
	 LCu8+rzUrXPWC4LCYoUTY2xxqaJI1I1cWg8N8qp1rdNKHSNgDDZgxRZzvPhyoW7LWx
	 cWPIh8k/c6WorLch500+1DFN9R9uHtSVtIbxVzVhhl/EGrk80HN4VeTWkdSZg7T2cY
	 I/lsX4kNDEE+9FWmE5/oHplFO/6HBF3GGkSUuRHlhxTakn/zWpKqq6pOYoXGeLuKAP
	 YqoVWlEGWkGw99B/Rl8mhHUCSuukN6sdHMUKQVz7ZUSBKj+QI18qIPWpeaZMwZ4rSP
	 O64zmpd8v+XCw==
Date: Sat, 11 Mar 2023 12:45:07 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>, Andi Shyti <andi@etezian.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 07/16] spi: s3c64xx: Drop of_match_ptr for ID table
Message-ID: <20230311114507.axtae3j64fbt64t3@intel.intel>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
 <20230310222857.315629-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230310222857.315629-7-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_034515_345610_A3257F43 
X-CRM114-Status: GOOD (  11.58  )
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

Hi Krzysztof,

On Fri, Mar 10, 2023 at 11:28:48PM +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table (all platforms are OF-only)
> so the table should be always used and the of_match_ptr does not have
> any sense (this also allows ACPI matching via PRP0001, even though it is
> not relevant here).
> 
>   drivers/spi/spi-s3c64xx.c:1496:34: error: ‘s3c64xx_spi_dt_match’ defined but not used [-Werror=unused-const-variable=]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
Andi

