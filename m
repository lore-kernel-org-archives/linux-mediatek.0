Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C11FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 08:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s27R29yUER20SqDnCAf9GSpnWMdZHPpc9No6hcqRUn8=; b=j4lK66QbBossEu
	5HxBlXInuBnGrA0udpr0+FPw26x6uOzBeiW5DrhZDfz9ZZwK34jRNVHIT3V91SYOymjQzD0sojW8u
	MObk8Dk/P8NwIgMCrMlBoEvHmJZ6Uu3l/IGeJD3k//twbkw5xTrW7M9RugDLb30f2CyHNPi1LiqON
	Y8li9DduFGepgCLu4t3QDfAR1mZpPXTFKzvbI7q2j3dSpmR7FT27UMgYkpJHWZATv+hgZnJb0qhsb
	YYXhTwHV3AUKgNPNMMjDL0mDPzClXVguG+bWflZKSRGQgl9G+nQ/HPBIPP3b6jCV4NMWlc4scce+U
	VL5JWygZzVJ+tEo3sduQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhoXi-00HDIb-5e; Fri, 22 Apr 2022 08:21:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhoXF-00HD4m-Re; Fri, 22 Apr 2022 08:21:03 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6F5FE1F46407
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650615660;
 bh=4ryxE2grXNDQxyBkghcQhW6+HdJdRAPqXcGrba7PMns=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YJx8Jq44JrSHL3i6P6Sc23HtfEme3lFv9sVkoansgK7HUTAjydO1yjUObsBu/eqSc
 Zb/3Pa9V/oSPweeuM+lCNUvDE8oEmv+49umjd5t/eDjcf+0br31Ujm8HXJCGT9yn8c
 dMqkI8OwPGvLjNixqk9N0c7j+VnWU7epmstbkuRK0ut3qiSeszPdWiI6tG8Yu/i+2m
 HMf2NawmPN0dxjQVh5OCvg9/u7uNnL9dr3GoOV6dJLOJvlkr0COK6mach3iEAccfev
 XJaAF4eo19EFTPsp7ZHErsfUlVdu6nco9l7XWWnxKZsZ0CUHDb1DNdMO3cP1GjPWoD
 JV76lU14PH0kg==
Message-ID: <f0837023-64ce-7a3b-d3c7-e713f48b2c6e@collabora.com>
Date: Fri, 22 Apr 2022 10:20:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V4 09/14] cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-10-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220422075239.16437-10-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_012102_079534_03854687 
X-CRM114-Status: GOOD (  10.92  )
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

Il 22/04/22 09:52, Rex-BC Chen ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> Because the difference of sram and proc should in a range of min_volt_shift
> and max_volt_shift. We need to adjust the sram and proc step by step.
> 
> We replace VOLT_TOL (voltage tolerance) with the platform data and update the
> logic to determine the voltage boundary and invoking regulator_set_voltage.
> 
> - Use 'sram_min_volt' and 'sram_max_volt' to determine the voltage boundary
>    of sram regulator.
> - Use (sram_min_volt - min_volt_shift) and 'proc_max_volt' to determine the
>    voltage boundary of vproc regulator.
> 
> Moreover, to prevent infinite loop when tracking voltage, we calculate the
> maximum value for each platform data.
> We assume min voltage is 0 and tracking target voltage using
> min_volt_shift for each iteration.
> The retry_max is 3 times of expeted iteration count.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
