Return-Path: <SRS0=Fc+n=ES=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 651DBC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 09:02:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE2F3206FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2020 09:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rxp2kpct";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PHPA9cF1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE2F3206FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zY9w5K/Her/gsXKz7PQL/QPZdayWnxKKS7lSmN69vlg=; b=Rxp2kpct7Gx9oA/TG3RjEPoSO
	QFCgVOUvuX+uMojBJgznuPXcqAkylawseI9sDfwVv+rBSO+N4oIXB4Cq2WtqkFVNUTCcAQ75O019a
	PBTRFjVYKx3tRkihJxpqcS8VPH/SJeeDzxfZuVrq2syToKx/mBjfQcZigthpZcnxrIRKeNWtmvvYk
	iyz6k2avZuxZxV5aF9+Qho+uHuskR0u7GkWPd0Rk9r8jI2hv32z2m2nneG4yrsvpf4SgT5SlWrunh
	8cq7tMyqg4L7Y+xuzYmiC4CpfSodbifTXOW0HnmPy0XszWlH+XLUMQuQhw2Jlvv+MUoG4p3Zt8kIh
	eIpXP8yrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kd8Up-0001C9-PE; Thu, 12 Nov 2020 09:02:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kd8Um-0001Ab-A5; Thu, 12 Nov 2020 09:02:21 +0000
X-UUID: 7863727bf0c643f780a530386e194545-20201112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=EL2xgh+f2w+QkXQYUlt8Af4ocrMSb0AMQTg9c+lCuOI=; 
 b=PHPA9cF1R/mwkmJYM09S4BrdyJlyEGQxujpqCRCIRkPxOOlKTheg0re+G4Z4fo/sLgIazlthjry120SOHUCSRzIQqMH8ThrLhCd77i0n3xjTZcIU+D4wrlJNu26b3r7IEF+iPhT/TfwKQcpXkGRV3a+CtlswHMFkLILA7T838xc=;
X-UUID: 7863727bf0c643f780a530386e194545-20201112
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chaotian.jing@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2036410627; Thu, 12 Nov 2020 01:01:52 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Nov 2020 00:52:02 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 12 Nov 2020 16:52:00 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 12 Nov 2020 16:51:59 +0800
Message-ID: <1605171119.29266.1.camel@mhfsdcap03>
Subject: Re: [PATCH] mmc: mediatek: fix mem leak in msdc_drv_probe
From: Chaotian Jing <chaotian.jing@mediatek.com>
To: Zheng Liang <zhengliang6@huawei.com>
Date: Thu, 12 Nov 2020 16:51:59 +0800
In-Reply-To: <20201112092530.32446-1-zhengliang6@huawei.com>
References: <20201112092530.32446-1-zhengliang6@huawei.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E42657F8F3062DD55A3CBA017D1041D894DA704C08F11EE61CD92F0F513239312000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_040220_671311_5FBE35E3 
X-CRM114-Status: GOOD (  15.61  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: ulf.hansson@linaro.org, wenbin.mei@mediatek.com, linux-mmc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, fangwei1@huawei.com,
 matthias.bgg@gmail.com, wangli74@huawei.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-11-12 at 17:25 +0800, Zheng Liang wrote:
> It should use mmc_free_host to free mem in error patch of
> msdc_drv_probe.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zheng Liang <zhengliang6@huawei.com>
Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index fc5ee5df91ad..eac7838e2dac 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2504,8 +2504,10 @@ static int msdc_drv_probe(struct platform_device *pdev)
>  
>  	host->reset = devm_reset_control_get_optional_exclusive(&pdev->dev,
>  								"hrst");
> -	if (IS_ERR(host->reset))
> -		return PTR_ERR(host->reset);
> +	if (IS_ERR(host->reset)) {
> +		ret = PTR_ERR(host->reset);
> +		goto host_free;
> +	}
>  
>  	host->irq = platform_get_irq(pdev, 0);
>  	if (host->irq < 0) {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
