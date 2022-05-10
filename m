Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8773C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 May 2022 08:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I5aJeysnm+FzYm2DGS0lDQaDp4EBtUisD2x2xtrzJc0=; b=Eg33Nc2n6q1cHL
	bJXogG8GhFAxZCuCjGGm6hAtm2siCv8H8G7ofPk9fe1B5Ixz4jbFnCyh0UMq8IQduUsgeM99F36gm
	SlnJZnbTQ1Axt/tQZF7hXzj4WTFwBC99ik7Qo5DrCFTBpkwqxOKOEx3OPJYDit53uya4S7vOY0zcF
	VFrKR0aGapMx05F/0e41+2gdrO9sZEXKxasPye/q1mO+xwC2C9rb8TKaF+Zi//FZdMvj9WK8RJmBT
	zrPS+KIDz4OQz12lL3EFcMa8yVqtBTlymh6+jba7E+u+5HDQ/v9zoIS/rP25XXjDW/b1k+G6TBhRF
	cAVZvulpq1NGxsOitDEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noL2f-000ZKY-Dv; Tue, 10 May 2022 08:16:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noL2T-000ZIc-VM; Tue, 10 May 2022 08:16:15 +0000
X-UUID: 7aa258fc35eb45d8912ba809ea780fc3-20220510
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:334ab75d-aa7c-4568-8cab-02f541f98695, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:e282e016-2e53-443e-b81a-655c13977218,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 7aa258fc35eb45d8912ba809ea780fc3-20220510
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 119926431; Tue, 10 May 2022 01:16:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 May 2022 01:09:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 10 May 2022 16:09:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 May 2022 16:09:23 +0800
Message-ID: <304e7eefbb57e9c938737b64fbb515201c7944b8.camel@mediatek.com>
Subject: Re: [PATCH] cpufreq: mediatek: Fix potential deadlock problem in
 mtk_cpufreq_set_target
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Wan Jiabing <wanjiabing@vivo.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Andrew-sh.Cheng
 <andrew-sh.cheng@mediatek.com>, Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Date: Tue, 10 May 2022 16:09:23 +0800
In-Reply-To: <20220510080136.11950-1-wanjiabing@vivo.com>
References: <20220510080136.11950-1-wanjiabing@vivo.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_011614_065809_B8FA4D21 
X-CRM114-Status: GOOD (  16.99  )
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

On Tue, 2022-05-10 at 16:01 +0800, Wan Jiabing wrote:
> Fix following coccichek error:
> ./drivers/cpufreq/mediatek-cpufreq.c:199:2-8: preceding lock on line
> ./drivers/cpufreq/mediatek-cpufreq.c:208:2-8: preceding lock on line
> 
> mutex_lock is acquired but not released before return.
> Use 'goto out' to help releasing the mutex_lock.
> 
> Fixes: c210063b40ac ("cupful: mediatek: Add opp notification
> support")
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> b/drivers/cpufreq/mediatek-cpufreq.c
> index 75bf21ddf61f..4c6d53c99d79 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -196,7 +196,8 @@ static int mtk_cpufreq_set_target(struct
> cpufreq_policy *policy,
>  
>  	if (pre_vproc < 0) {
>  		dev_err(cpu_dev, "invalid Vproc value: %d\n",
> pre_vproc);
> -		return pre_vproc;
> +		ret = pre_vproc;
> +		goto out;
>  	}
>  
>  	freq_hz = freq_table[index].frequency * 1000;
> @@ -205,7 +206,8 @@ static int mtk_cpufreq_set_target(struct
> cpufreq_policy *policy,
>  	if (IS_ERR(opp)) {
>  		dev_err(cpu_dev, "cpu%d: failed to find OPP for %ld\n",
>  			policy->cpu, freq_hz);
> -		return PTR_ERR(opp);
> +		ret = PTR_ERR(opp);
> +		goto out;
>  	}
>  	vproc = dev_pm_opp_get_voltage(opp);
>  	dev_pm_opp_put(opp);

Hello Wan,

Thanks for checking this issue.
I did not notice this issue when I am asked to move the mutex lock here
in my patch.

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
