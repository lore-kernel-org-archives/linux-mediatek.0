Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D43C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t5YzRlbP9w/Kk86yYuTSY2YuVAi50TJx1tugTFIufMw=; b=HKQ9Eqtz97TJK+
	vPwDcXFlbg8mra5xjNaPekXWftfzzaqxqrPPHAh6MpTkZgk1zYcRh/OYnz/+6bH0mZafjVWtJHJzL
	wDfIla+MMzAxx0UhJl0nXdTcW7IjWrHuWgT8aQYbOHYKuMC9o8aOumdc47+8t0SfsarqBkzp08tAh
	UQ+KXDhgbss/Lb9y29+WLYr8GSaYFzeznSDHBsg2PHeG0mN95uSlK+A17haseRneo19vh/FPYzxIW
	NXgu1DEI7JU2fs8vIysWhmOkGMDq+IJrxYfWuX9+ssNJotorkbRC8phvHphfD1kb4TcmEsrZmxLG9
	TGpe+sFH/+cr18vfbE9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmX3m-00Emnx-Ne; Thu, 05 May 2022 08:42:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmX3Z-00Emio-86; Thu, 05 May 2022 08:41:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id EA1B11F41053
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651740111;
 bh=/QeZ5vMr5HKTzS4nnc319BmT5r9JF4pfYQjq6kNPoOE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=H7GjKQm0tpa2/3pSsk5EGKWYdgv+In5yZAveILwiE6K5rA4yrAqG9Rj4hIFKuAo6V
 eezcCF+lfVm/9WJak5nUmDJM7ZSbQm9RYLS6CQ/ws1nLk0BJmMinmKpKdkfPMuU2da
 OrTUYRAmF39kan7DMHJbGd9J4yvHaWKfmBKZ0Qo5upAeLI1unSBRY6xS7W74/H+yyV
 uA6npuFaiLvjC9ujvkEWi/FyqcEnN6eNbri3Qgc2UvHSi0r1qVwNngb2yckVCiDBb/
 puY8qRD9oqY3uANsEHzkWuBrZtswj0zjjQDtE9lVWSYyYTwG7dPqyytCIliydTBqOH
 xeNN0y34Gbl2g==
Message-ID: <5d532a9c-8227-610c-d0ae-9352b91b42e5@collabora.com>
Date: Thu, 5 May 2022 10:41:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 1/9] dt-bindings: cpufreq: mediatek: Add MediaTek CCI
 property
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220504130540.5902-1-rex-bc.chen@mediatek.com>
 <20220504130540.5902-2-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220504130540.5902-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_014153_482487_7A96C7B5 
X-CRM114-Status: UNSURE (   9.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 04/05/22 15:05, Rex-BC Chen ha scritto:
> MediaTek Cache Coherent Interconnect (CCI) uses software devfreq module
> for scaling clock frequency and adjust voltage.
> The phandle could be linked between CPU and MediaTek CCI for some
> MediaTek SoCs, like MT8183 and MT8186.
> 
> The reason we need the link status between cpufreq and MediaTek cci is
> cpufreq and mediatek cci could share the same regulator in some MediaTek
> SoCs. Therefore, to prevent the issue of high frequency and low voltage,
> we need to use this to make sure mediatek cci is ready.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
