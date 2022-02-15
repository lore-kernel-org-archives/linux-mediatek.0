Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73256C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 09:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CjNBGIpjxLPAPZJki1Q94GC7DgxYMQGuVGNk6O/LBN4=; b=dOqiNsh5yAMDEG
	bkVCPGefljgbGtaXeD0qZ0/0GmnTl9mp+sbtD3mcw7idu8sz7+57lMgTx8aS2BGY1G11ski4hcaJB
	3U9IbsbKozRdeWDdXv1yCkfYn9Vl2qQM6OZAl2IQCmceuYNJuM4eJudtUmO1872BrE2TqqFHEhhej
	3FJV0vd0wguJ6FOjVx77NMw3AvP65rtS/46ifIE5hztb+3LP9SmQv6CtMf/d+0JKWbS/F8lS4vfF7
	VCeNV4yxWklyE1fweMW+xLjWGVCU7+uCMNluJPTQ8iYsHrHxzKA1q3vvNRposvZq1+cZMNta7GePR
	HGyh+AOR2l4AOqHqBuCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtnD-001uPn-0s; Tue, 15 Feb 2022 09:06:39 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtmv-001uKo-UX; Tue, 15 Feb 2022 09:06:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 618881F43CBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1644915980;
 bh=KT3ZzPL5bMaQsMc6VIAvOaWmPqUEHPijK80eTrRqlyU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jVL9UMVhkEC02XIfCXepsseP84rrZ37lMw+YnM3XbD0hVbwPUVUkDd+dXEgai7UbE
 y2fBhkPw+u/DpNe3Ym0VMOMiL5NmM9GL/pit0vOPwk4N1xBsCHhFpWwCjZyaIXnzMy
 +uhN+4CooMPCBzQlnpyXYsoPEUop6EhPnK2uca6jcbdEhzjlgxceMi2T270017ub2x
 485O6jZHlxN14XmDqI/JcaATm8E5zFOAaSj27/n7F+OnqZmS3aB8+d9TtGzsMDXWlx
 Vc5F3ssQqtT6M9CnULDLKxgU4vkDQhLB4+qBYyXTD9f1tlmzJooxiAzDhq8cO038bz
 raylOxkRSmoRw==
Message-ID: <319d7236-292c-787f-4578-bffe75e33ba1@collabora.com>
Date: Tue, 15 Feb 2022 10:06:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [v7 0/5] Mediatek MT8195 power domain support
Content-Language: en-US
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220130012104.5292-1-chun-jie.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220130012104.5292-1-chun-jie.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_010622_207387_0E29A587 
X-CRM114-Status: GOOD (  15.91  )
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

Il 30/01/22 02:20, Chun-Jie Chen ha scritto:
> This patch series adds power domain support for MT8195
> and is based on 5.17-rc1.

Hello Matthias,

this series has been tested for a while on multiple MediaTek platforms, hence
new versions will not be necessary.

Can you please pick it for v5.18?

Thank you,
Angelo

> 
> change since v6:
> - rebase to 5.17-rc1
> 
> change since v5:
> - rebase to 5.16-rc1
> - add domain capacity in mfg power domain
> 
> change since v4:
> - rebase to 5.15-rc1 (fix conflict at patch 4 in this series)
> - change license
> 
> change since v3:
> - remove redundant bus protection steps
> - remove unused power domain
> 
> change since v2:
> - move modification of wakeup capacity to single patch
> 
> reason for resend v2:
> - miss patch version in series
> 
> changes since v1:
> - fix signed-off name
> - describe more detail in patch 3
> - move modification of removing redundant macro to single patch
> 
> Chun-Jie Chen (5):
>    dt-bindings: power: Add MT8195 power domains
>    soc: mediatek: pm-domains: Add wakeup capacity support in power domain
>    soc: mediatek: pm-domains: Remove unused macro
>    soc: mediatek: pm-domains: Move power status offset to power domain
>      data
>    soc: mediatek: pm-domains: Add support for mt8195
> 
>   .../power/mediatek,power-controller.yaml      |   2 +
>   drivers/soc/mediatek/mt8167-pm-domains.h      |  16 +-
>   drivers/soc/mediatek/mt8173-pm-domains.h      |  22 +-
>   drivers/soc/mediatek/mt8183-pm-domains.h      |  32 +-
>   drivers/soc/mediatek/mt8192-pm-domains.h      |  44 +-
>   drivers/soc/mediatek/mt8195-pm-domains.h      | 613 ++++++++++++++++++
>   drivers/soc/mediatek/mtk-pm-domains.c         |  12 +-
>   drivers/soc/mediatek/mtk-pm-domains.h         |   8 +-
>   include/dt-bindings/power/mt8195-power.h      |  46 ++
>   include/linux/soc/mediatek/infracfg.h         |  82 +++
>   10 files changed, 862 insertions(+), 15 deletions(-)
>   create mode 100644 drivers/soc/mediatek/mt8195-pm-domains.h
>   create mode 100644 include/dt-bindings/power/mt8195-power.h
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
