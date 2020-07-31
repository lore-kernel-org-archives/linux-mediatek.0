Return-Path: <SRS0=UCxl=BK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A190C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 06:54:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6082C207F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2020 06:54:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qhFnuTYR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="LL4wduW5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6082C207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lvi/D1j4DnAHqm2+xHtG64Pa3RJFdkMKSghMjFHPfv0=; b=qhFnuTYRC3JX+dg8VRvg9/EZ7
	+JD8okYuiy5Mc+qmZqOOOxCyfVuBl1568nW8TZu597gpJ01FpKRmBKR9ilBAuSJsp/dTVT//uEUb8
	PDQamK2EOFrX/g5Ue1gFYmW2u5l+bvgQuEDE4/6EMkz8l5ZBw94v+3diapAS6GKPVREAQdFOwsgVv
	gH9cRnbu4G3YsgDR28nX//dqJnnbx1yxppDmwE1f0DqPbuRjZ4ny5Ir6YK6W2gL7c6PQ5DOi40ypp
	kx0e8z4/ll/6qF6thNeEakDmPBT5f2w4IIQRHnWS7n4mL6QenH58Qwbdt48OI7i6dYyfr6Ox2/CNa
	Bu14UZMDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1OwJ-0000vz-16; Fri, 31 Jul 2020 06:54:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Ow8-0000ry-AE; Fri, 31 Jul 2020 06:54:45 +0000
X-UUID: 162c4e8a4bde470084480a6587890816-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YjhhNpNRDNHhO6Ju5IjvM6o2mcIZbqEWX5yq3bSDKr8=; 
 b=LL4wduW5jxAqJ8cPKW8BJQm4p7ceJ5q+2/GIlxEBThHKUMpDxMTZjlA4A9RdTQC4YUWVXCnpN8KRK51NNDyXHAB9HQEUD94bWy7gx+CaYCmTqEnRhpgtFKS4kCCyPLAHr9Bp4fnZl3ySvqqfvke5RdxcLdCDmm7FvY/SGxKVe1g=;
X-UUID: 162c4e8a4bde470084480a6587890816-20200730
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chun-hung.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 799523278; Thu, 30 Jul 2020 22:54:23 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 23:54:27 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 31 Jul 2020 14:54:23 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 31 Jul 2020 14:54:22 +0800
Message-ID: <1596178463.18010.1.camel@mtkswgap22>
Subject: Re: [PATCH -next] mmc: mediatek: make function msdc_cqe_disable()
 static
From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Date: Fri, 31 Jul 2020 14:54:23 +0800
In-Reply-To: <20200727171129.2945-1-weiyongjun1@huawei.com>
References: <20200727171129.2945-1-weiyongjun1@huawei.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 870AB6426B9AC3E7EF684823B905EE66E93DC7E0E13748ABF5ADA191279DA3742000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_025436_564561_55C573A9 
X-CRM114-Status: GOOD (  19.30  )
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Hulk Robot <hulkci@huawei.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Chaotian Jing =?UTF-8?Q?=28=E4=BA=95=E6=9C=9D=E5=A4=A9=29?=
 <Chaotian.Jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-07-28 at 01:11 +0800, Wei Yongjun wrote:
> The sparse tool complains as follows:
> 
> drivers/mmc/host/mtk-sd.c:2269:6: warning:
>  symbol 'msdc_cqe_disable' was not declared. Should it be static?
> 
> This function is not used outside of mtk-sd.c, so this commit
> marks it static.
> 
> Fixes: 88bd652b3c74 ("mmc: mediatek: command queue support")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 734e403a142e..4e2583f69a63 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -2266,7 +2266,7 @@ static void msdc_cqe_enable(struct mmc_host *mmc)
>  	msdc_set_timeout(host, 1000000000ULL, 0);
>  }
>  
> -void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
> +static void msdc_cqe_disable(struct mmc_host *mmc, bool recovery)
>  {
>  	struct msdc_host *host = mmc_priv(mmc);
>  
> 

Acked-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
