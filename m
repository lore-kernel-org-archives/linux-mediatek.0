Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06420C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 01:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1qC4MwagFenH91oEOF/LLcRwbrLiOIGTJ03KF/4pf6o=; b=vVU3ILHtzwmM+g
	qTTfJpNef2d9YPZ4bVyZT8d1/rSe6rTHi7vgh0tXn3Dydonq95nhX0xplwxMI+lRnqtCpzT487oh6
	otfyBSJ6iT4xJ+pcmfZABQJmEwB2p+aReJ8OSi8E/1fvZmfZKLDTJEpkZL/y9jE0FCw2MfeMJKhMF
	9ehjEVOkJ7QEGMSBD0a7F7UDui8TAGsLMbgCH/Uc7ZOBfl8CwGe8dwiPacGuyB9e5q8ubJuS3FbBC
	R8F5jb68n5sYkLFlLEMEg/UBIDvwQ8Fk+sh9ZKCO0UjeLw1LtC6/6x/a84kWtWSyrpJ3Wv3WzOu57
	XZqL3by77d5b+2mWDdrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nr8cF-00GbLl-VK; Wed, 18 May 2022 01:36:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nr8c4-00GbKZ-WB; Wed, 18 May 2022 01:36:34 +0000
X-UUID: 508e7a8435fe4ff7834898ac1331466f-20220517
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:f8fc1360-df1e-49b4-8228-63f6d4b9707e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:03b69d79-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 508e7a8435fe4ff7834898ac1331466f-20220517
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 48121969; Tue, 17 May 2022 18:36:29 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 May 2022 18:36:27 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 May 2022 09:36:26 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 18 May 2022 09:36:26 +0800
Message-ID: <2b46032a99e6f8994d402ebbf34d9174135993c4.camel@mediatek.com>
Subject: Re: [PATCH -next] cpufreq: mediatek: fix error return code in
 mtk_cpu_dvfs_info_init()
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Yang Yingliang <yangyingliang@huawei.com>, <linux-kernel@vger.kernel.org>, 
 <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>
CC: <jia-wei.chang@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <khilman@baylibre.com>, <viresh.kumar@linaro.org>
Date: Wed, 18 May 2022 09:36:26 +0800
In-Reply-To: <20220517133450.2266243-1-yangyingliang@huawei.com>
References: <20220517133450.2266243-1-yangyingliang@huawei.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_183633_087520_28D89359 
X-CRM114-Status: GOOD (  15.97  )
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

On Tue, 2022-05-17 at 21:34 +0800, Yang Yingliang wrote:
> If regulator_get_voltage() fails, it should return the error code in
> mtk_cpu_dvfs_info_init().
> 
> Fixes: 0daa47325bae ("cpufreq: mediatek: Link CCI device to CPU")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c
> b/drivers/cpufreq/mediatek-cpufreq.c
> index 37a1eb20f5ba..3a2be4552020 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -474,6 +474,7 @@ static int mtk_cpu_dvfs_info_init(struct
> mtk_cpu_dvfs_info *info, int cpu)
>  	if (info->soc_data->ccifreq_supported) {
>  		info->vproc_on_boot = regulator_get_voltage(info-
> >proc_reg);
>  		if (info->vproc_on_boot < 0) {
> +			ret = info->vproc_on_boot;
>  			dev_err(info->cpu_dev,
>  				"invalid Vproc value: %d\n", info-
> >vproc_on_boot);
>  			goto out_disable_inter_clock;

Thanks for fix this!

Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
