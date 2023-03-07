Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32844C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 11:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Gw+hMjGj1I9H2fg3ljNbnH8D9RaMuxw0VHL6fBZJv4=; b=YPv2ZJt2iuUkY/SlNzJx2XnLox
	GumkXJ7W2OJAwarIebniqG7tIhFLQ5GO9o1BtHHTpsl6Fzz9MjPshXqynKg7ks/8FHCH/sVeg6i47
	CMThjyVGU17Mz7E0siXQhKejldfIYT0aTEXh1dnLN7tHqCGQQa5jaKeF00y6EjIt3Lg6MMl/9kjxq
	pK52Tp5yA5YCnkTN9fZ5XCeLy/aYVp7r6JW9UzHkRiCrZua2OBTplDZILHuHancsgYc9jH3jYRU1G
	8zFzsuZXdG5E9rg1uPDocK3mFv1xoZ2hSC/Z4XJM+I7GYM54PRW32ugVX32iLro5pjWU2aNxdD0sF
	O4RHTamw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVWk-00HTcJ-Tn; Tue, 07 Mar 2023 11:30:42 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZVWi-00HTbc-Qw; Tue, 07 Mar 2023 11:30:42 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3277tv94022730;
	Tue, 7 Mar 2023 05:30:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=8Gw+hMjGj1I9H2fg3ljNbnH8D9RaMuxw0VHL6fBZJv4=;
 b=RLWayBHYAC3WRv9HPpNTERg+r3oTqRoc1PhTaiH7YBIi+g27pmBKE71aOiAvS27S3N07
 +QHcy5hOfjEbFGHVcXXvt9qIN3WGOS3Bqlri7NiCAQhOhMOgUcVD/jtynzPS4OAO8V4x
 y0soTVGFyQ8h0rjtQN8pahOoaJaEwQF+b1XRYG7PlC2fH/BI33BVKPohDXEuq+sfwinQ
 st9ocuKEdqcae/7gnnLT1gkEC3NHxNf2+QnaoIAl+yku5tDVskg+wvMD2woy7I197Y8b
 atlA+qMh5usVUKVHiqBqRp3egA8oAV2JdrRPRQRVEwGGY4zU2uz2Qv/12AeFgHJufFHL 1A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3p4497427y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Mar 2023 05:30:19 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Tue, 7 Mar
 2023 05:30:16 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 7 Mar 2023 05:30:16 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C72ED11D3;
	Tue,  7 Mar 2023 11:30:16 +0000 (UTC)
Date: Tue, 7 Mar 2023 11:30:16 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
CC: <perex@perex.cz>, <tiwai@suse.com>, <lgirdwood@gmail.com>,
        <broonie@kernel.org>, <james.schulman@cirrus.com>,
        <david.rhodes@cirrus.com>, <tanureal@opensource.cirrus.com>,
        <rf@opensource.cirrus.com>, <oder_chiou@realtek.com>,
        <shengjiu.wang@gmail.com>, <Xiubo.Lee@gmail.com>, <festevam@gmail.com>,
        <nicoleotsuka@gmail.com>, <shawnguo@kernel.org>,
        <s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <linux-imx@nxp.com>,
        <cezary.rojewski@intel.com>, <pierre-louis.bossart@linux.intel.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <ranjani.sridharan@linux.intel.com>, <kai.vehmanen@linux.intel.com>,
        <matthias.bgg@gmail.com>, <srinivas.kandagatla@linaro.org>,
        <bgoswami@quicinc.com>, <vkoul@kernel.org>, <daniel.baluta@nxp.com>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <jarkko.nikula@bitmer.com>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <linuxppc-dev@lists.ozlabs.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <sound-open-firmware@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <linux-omap@vger.kernel.org>
Subject: Re: [PATCH] ASoC: do not include pm_runtime.h if not used
Message-ID: <20230307113016.GS68926@ediswmail.ad.cirrus.com>
References: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 8AhJH_Etb0kWl8-U4QDOKiyr044l28y7
X-Proofpoint-ORIG-GUID: 8AhJH_Etb0kWl8-U4QDOKiyr044l28y7
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_033040_916840_8F4D098D 
X-CRM114-Status: GOOD (  16.76  )
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

On Tue, Mar 07, 2023 at 12:30:22PM +0200, Claudiu Beznea wrote:
> Do not include pm_runtime.h header in files where runtime PM support is
> not implemented.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  sound/soc/codecs/cs35l45.h                                | 1 -
> diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
> index 53fe9d2b7b15..0555702eac03 100644
> --- a/sound/soc/codecs/cs35l45.h
> +++ b/sound/soc/codecs/cs35l45.h
> @@ -11,7 +11,6 @@
>  #ifndef CS35L45_H
>  #define CS35L45_H
>  
> -#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  

cs35l45 does already make use of some functions from that header,
and more support is in the process of being upstreamed. So this
part should be dropped.

Thanks,
Charles

