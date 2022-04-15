Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F76AC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 12:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9gM8dKuiNJKxg3+4cRR+HmbWWzfMQLkIo7pTNPcOF1Y=; b=4gnlln/LPk8vF4
	sc7vtQZ/RAGZ7PAujHKM5bO6piAbL2bahFYhaUjgvoybVigQfn/woJI5wYUIbvkJgk2RYg0hWkHGT
	9fbDgO+nzAAqss7jUlFI3QV4oRh+N6ymqZKkzAnh7mEF9lnjwBpNPalugsZra+ytI8CkDQQCfd0BQ
	G+CLJakjgWFrvuXvQTSnGt4QbeZ20cpCvNuI2bLGsPhBtm4IqwlM6lqtQlEHiEVZyrZ/sVOuzbUDE
	y6/0l6W0otNvSHig0g11Km7mqr+ta9JwgORe7xkqaC3/7O0/gQPJf6Serx288ual5sf2JPr1kDN7n
	likOX2I6eDCQhaLmCheg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfKzv-009wNB-UI; Fri, 15 Apr 2022 12:24:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfKza-009wGG-DW; Fri, 15 Apr 2022 12:24:04 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6F5351F47DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650025438;
 bh=itV/ofv5GyzWPNIsHn2aKs68BsnJtivzIu7E9FMxVkg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hS8T92QRj2ggd/DPuao7ldfTgyBmYM4szDtaIMpOvwBXIMLD4NSfsnu7JAaw8OWQ0
 zSHP0Orzg55sZJN5oxnpvq4rpUg0sU3P0Yb3I7AUAk0kovzrUs3wrQhov7Uy7M4XC4
 R59eGpZIjCl6DCfiM6WbNGchejxUeVY6AOyWES/T7InveyfmTzotg8TygYFaMhd41p
 q32uWPZVm9xA2Vpdrqb8EU9Qg/CKNsIPkroo4PLt8Xa3eSu6bpfza+VpzWNBM8O467
 LUTOsZTxCtjXXKSBD2WPrB3dwrjE2/gXpbX9lvHmch44HK6uShmdgemsA1rQGOjd1f
 CwAWuc0ND5Zsg==
Message-ID: <2cd548f4-be64-6762-d326-40ff91d35d52@collabora.com>
Date: Fri, 15 Apr 2022 14:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 15/15] arm64: dts: mediatek: Add mediatek, cci property
 for MT8183 cpufreq
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-16-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415055916.28350-16-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_052402_690914_60D85534 
X-CRM114-Status: UNSURE (   5.43  )
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

Il 15/04/22 07:59, Rex-BC Chen ha scritto:
> Add mediatek,cci property to support MediaTek CCI feature.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
