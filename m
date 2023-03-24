Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0219C6FD20
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Mar 2023 13:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cxse8Je0Iux6rzDMJvDCR/mh4N33vzs0OLJUKPswxno=; b=g1Ad+KyC+3tQ1sU9sXCmIDMFpr
	7EpjtP+uRB5oU1fHvIwYfIbmpbBj88M8N8oHnyWuhIwkgh0b6dYILFiCQ5D1CYDIjYK3x9oMStKxy
	n34YAPY7zFceYDLiKeEUlMspoRAAZ8zjeS7ItK/sc0ODodbBSkwCPckaUtPBwamRBODnOimXHM7MT
	TswZIAVs19FNZnNZElcC+ldAvIrbIZoUPYBJoGpH17VqWPesBYpiTYXhubpZtxEfhJe0QKFb8IZSZ
	sp1lYliV96wcysqSZVD9rB4x8P1mypIKWMEpYkzy7S94aenscf2e4dm1b4I5zgDj3ly5K2LUPZD1e
	56Ow6VqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfhCe-004RyA-2f;
	Fri, 24 Mar 2023 13:11:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfhCa-004RxK-1n;
	Fri, 24 Mar 2023 13:11:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4046C6603103;
	Fri, 24 Mar 2023 13:11:26 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679663486;
	bh=cn5ABfRPzRRm47H1QPXFqbLMmYbYM/NLXxj00ObK1K8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g6v/poHYkAdzAmaG326QpOOKx/6qpZzzb+VHepSQD8cWD1Norqrzab8A4ZRoPEmdA
	 uj5ePEa5Z49szVeeAPOeFczAEao3Q3+d6WI6VfVTAjTwv1i2S3n/9OawMl/M79slEU
	 x2tkp+/QhYwEJNEKhZlVCSnt5y5gD8TrVTlESjEjGoKxJyu20YGx6YI8KGpx8/7Fk7
	 8YzxAI2feB0GDT2+77o62U3kd0ZMNcUKgLvw9GjtrvpBUpI7qF9prtm9kpR9Iz7enB
	 kZVXkFW05tszN7d1CxDGYwSQ3IpslaMDPZg65iiKsQBzrpOZOTX62lYbjpJEMWkAtF
	 EupUqywUpCMWQ==
Message-ID: <b21a0a45-f203-249b-6ffd-abd1e27959f4@collabora.com>
Date: Fri, 24 Mar 2023 14:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/4] cpufreq: mediatek: raise proc/sram max voltage for
 MT8516
Content-Language: en-US
To: "jia-wei.chang" <jia-wei.chang@mediatek.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Nick Hainke <vincent@systemli.org>, Dan Carpenter <error27@gmail.com>
References: <20230324101130.14053-1-jia-wei.chang@mediatek.com>
 <20230324101130.14053-4-jia-wei.chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230324101130.14053-4-jia-wei.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_061128_720880_CB622561 
X-CRM114-Status: UNSURE (   9.24  )
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

Il 24/03/23 11:11, jia-wei.chang ha scritto:
> From: "Jia-Wei Chang" <jia-wei.chang@mediatek.com>
> 
> Since the upper boundary of proc/sram voltage of MT8516 is 1300 mV,
> which is greater than the value of MT2701 1150 mV, we fix it by adding
> the corresponding platform data and specify proc/sram_max_volt to
> support MT8516.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Fixes: ead858bd128d ("cpufreq: mediatek: Move voltage limits to platform data")
> Fixes: 6a17b3876bc8 ("cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()")
> Reported-by: Nick Hainke <vincent@systemli.org>
> Link: https://lore.kernel.org/lkml/75216e0c-9d36-7ada-1507-1bb4a91a3326@systemli.org/T/

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



