Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F51C7EE31
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 08:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sH8H3ghvn/KPflTLHbI3pqFQyw59ycGWTqNcNF8+rok=; b=eI0TwN3/InWtEWL7SzUBQKJvVS
	EF2K3OGSoL671B5VE2jCIZwxRvrPg/d0cNUCxvKN1yKr6N2bQaSWZqGYAeM17XcsJbtIkPH9rqX35
	uKr5LQVvxwAlKRJ356OjdVhvJ8td18XBUl9vf+LpoLljhPZQ8juscSEnVZUxyzjeRiD6POzf8mFL+
	o1xYq1EgxygtHD4eK+kVDgDheckBXMCr1sEfCLG5ckY10DC4p/NYT8rhIT9dc6sGd9wYIWKVAeYU2
	YT7woidhrRq86Daebw52NVX28mA4KeysT+XdYv3Y/ScgU35f8J6kr9AU81OJhDSPW7ld0SFE5GA2J
	e/y0UELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6SK7-000rMB-1p;
	Tue, 06 Jun 2023 08:45:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6RKE-000aYb-0O;
	Tue, 06 Jun 2023 07:42:00 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3C1826602242;
	Tue,  6 Jun 2023 08:41:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686037312;
	bh=KA+QU0u/LvX1UydZ6WjqaFEqiIvHKIgAaYfilc7+HXQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=T2hRy8aLOAzXoZn6WTH8mqclRNea0ZG1A//zBARz5NjqpIqmdefUnpnkO1t62ugSd
	 kusaupsDaIGBCo430RFwyJyZmKHPEbdypr4WT4dfbJh7eT+CvbN5dJVxIzs03oxNI9
	 wT3rggsZmGzStDFsRWdVKIutYwETD9Nzabl5TX73ggXuca4jKb4w+mczfVrWJrU4AY
	 Es653YgYU34aywLHnGSH3r3GW9fKpJJTWLQVpEtGAwoDVGemWkhAicdlAQKqJGK6o9
	 a/9jid06gTdOQL7b/kVELenG9edNi+jnDWuvgUCct+68VgUzjJLrB/9NjZ0IhgIDUs
	 8PrlV1qo3ZsZw==
Message-ID: <355198a9-c5f8-3caa-243a-bd0c544caf8d@collabora.com>
Date: Tue, 6 Jun 2023 09:41:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] cpufreq: mediatek: correct voltages for MT7622 and MT7623
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>
References: <9d7e62049e3442582bd64dbc9e4d2a64f1ad0c1a.camel@mediatek.com>
 <ZH3umLU883eGbYBx@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <ZH3umLU883eGbYBx@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_004154_362577_CADCBDC4 
X-CRM114-Status: GOOD (  11.46  )
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

Il 05/06/23 16:18, Daniel Golle ha scritto:
> The MT6380 regulator typically used together with MT7622 does not
> support the current maximum processor and SRAM voltage in the cpufreq
> driver (1360000uV).
> For MT7622 limit processor and SRAM supply voltages to 1350000uV to
> avoid having the tracking algorithm request unsupported voltages from
> the regulator.
> 
> On MT7623 there is no separate SRAM supply and the maximum voltage used
> is 1300000uV. Create dedicated platform data for MT7623 to cover that
> case as well.
> 
> Fixes: 0883426fd07e3 ("cpufreq: mediatek: Raise proc and sram max voltage for MT7622/7623")
> Suggested-by: Jia-wei Chang <Jia-wei.Chang@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



