Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56C3EC64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 09:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zb2VgQ0JXXD6I8zTwINpOzsZCR2u6gIR09VSO31PlE=; b=PYtQGArSp2F+ts7J4esAjkBRie
	P8U7EtSwA34Tft1wjllp44Y9FwvPGi+3dcHulTMPj1Uh384nRSsD+6D8ul+2dlwhzjwWxIgbc0kuP
	h5cBNPqERdnPhLRHr4kCWAV+6e1vSK9wFA9w4lmEvAV/FQRCUa1RbDP4bst+kDiUch4TgFh+EMgeU
	QhKLp2o0dyozqkAeJWYm4x1un6ZY3e9Tlfk8wLdmex7Vuml4Ex2cLplXvGfcymUBBw2LrK7RxiRn5
	ghLlR1Q4HKjIPoGljgpsIW0QCyFEv/tDy1VoganYg/wWfROiGNOJGTHLfQgd442SK6eWd/swlg+ob
	56tL7vEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paZ5W-00DvB2-JY; Fri, 10 Mar 2023 09:30:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paZ5F-00Dv2o-OA; Fri, 10 Mar 2023 09:30:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 60F0766015B7;
	Fri, 10 Mar 2023 09:30:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678440640;
	bh=anAnXUH8k8fWDdcQIPAeMoI3QMLGvBbOpupaFI/MzqE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GqsU9O3jYzyR0UnXH1zX990qMWFapbr7UyWGjYB9BvdJMgv6jUHygAMv4WPMhwlGt
	 YTQ245JA38azxW4YoVMcQF5zcznUQWCsibEfirB6eGGzi1RdvWdyYaQwTRP42sYF69
	 OZ8b8Byw1E8sQUlr1XYJPOuep6JmGprz+2erV4aoL8TaoZCZ4OOBP/BZqXZoBDMoMw
	 3qJFE7ZVnYHhOgmgSOWUDTdMlwM8Pr1uPAdSSvPaG97H2oJZLB1x7nlM8uz8gcXv2r
	 Va5RuQSieq1PFHDwbpYdzt9I0CUV/aYu+PLT9hmbAP8qyNRoo+/+x+w5a6vmY+IJUc
	 hSxSqU38EWw5w==
Message-ID: <12e8e7e5-36c9-9eaf-89a7-1913755b8b77@collabora.com>
Date: Fri, 10 Mar 2023 10:30:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 2/3] cpufreq: mediatek: fix KP caused by handler usage
 after regulator_put/clk_put
Content-Language: en-US
To: "jia-wei.chang" <jia-wei.chang@mediatek.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Nick <vincent@systemli.org>, Dan Carpenter <error27@gmail.com>
References: <20230310051750.4745-1-jia-wei.chang@mediatek.com>
 <20230310051750.4745-3-jia-wei.chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230310051750.4745-3-jia-wei.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_013041_945411_9117F22F 
X-CRM114-Status: GOOD (  10.24  )
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

Il 10/03/23 06:17, jia-wei.chang ha scritto:
> From: "Jia-Wei Chang" <jia-wei.chang@mediatek.com>
> 
> Any kind of failure in mtk_cpu_dvfs_info_init() will lead to calling
> regulator_put() or clk_put() and the KP will occur since the regulator/clk
> handlers are used after released in mtk_cpu_dvfs_info_release().
> 
> To prevent the usage after regulator_put()/clk_put(), the regulator/clk
> handlers are reassigned to NULL value for validation check afterwards.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Fixes: 4b9ceb757bbb ("cpufreq: mediatek: Enable clocks and regulators")
> Reported-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Link: https://lore.kernel.org/linux-arm-kernel/20220921071913.p7kwsjnnuad2jgvk@vireshk-i7/T/

Actually, it's not just Reported-by, but also please add:
Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


Anyway, apart from that:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


