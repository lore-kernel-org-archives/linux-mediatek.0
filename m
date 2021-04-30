Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E712C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 16:32:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90C2861420
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 16:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90C2861420
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=Huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1SR0C6bW+QE944zzEwEox2MsSPUzr3aloRYmkhcwp9w=; b=Kt5ABJ2whzP0MUm7cg1Cl5oyu
	wZpvdj2FChXOylAXu+voiOmrEYfAu68J6955b6C5tUFaCC77UAaOSHW/EkHkNcg+GFmPu1ZXQNcaD
	qnOII3CuI5Y5dPsdkWmu4pJxHpitsHh+DzE8YCegEoIKpTaO3XqUntnhER5w+90J2OjFLNoY70GZX
	DXq0SZRdtPm6xbekPOmRwQSO/yJXl4eqX281i7GTY2v14U8fttIGPJ6v/9xKnD6NjE44sVxuGCB/i
	3JRJ83FCQr/CVhAVKpP0KSCZ0fIe7XG4cR9HkAHOczNgCvJSdaB7c+cWVvYMZEP2ioBge9plzY4gI
	DeOkP0fhA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcW3x-008CFd-6K; Fri, 30 Apr 2021 16:32:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcW3k-008CEF-GV; Fri, 30 Apr 2021 16:32:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=JQcxj4GynvqeoJpe7R2GVLuKVd8q1bkj7NjpnJNolfY=; b=psB6KEjRz1/yov7SCZUBsicqCq
 4lwHHTJ4vT9ece9iMVZyg+AvjBGEd+V/euT09EnWcMluVWw0fnLcsMC6iQpaSyu1YljQIaKGcBfci
 ApzdwziauXHjFygHODN0AmDx8/q2s4QrKYpAtjk0DV1exfrpy8OpiCfghYCi3uo4b5YuMzuLRSuiJ
 5f/5Xlh3a4kYjVDxupACg+BeK64K8pPdRqoEGUI+jz6TQMtSOWe1ZhJDK+EKtoWg5IiXHqYXKGZEi
 gvzMp7S3WN57aO/rFFT9GFNto/RvEn2K4lSrVeBYKSaZOPDiXXgcbFAd0U6uY/+PM1OVO82qSrf6O
 9GKwXv4w==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcW3h-001WFa-Fm; Fri, 30 Apr 2021 16:32:07 +0000
Received: from fraeml736-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FWyKq10zzz70gGK;
 Sat,  1 May 2021 00:21:19 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml736-chm.china.huawei.com (10.206.15.217) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 18:32:01 +0200
Received: from localhost (10.52.124.90) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 17:32:00 +0100
Date: Fri, 30 Apr 2021 17:30:25 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: <linuxarm@huawei.com>, <mauro.chehab@huawei.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v4 10/79] media: mdk-mdp: fix pm_runtime_get_sync()
 usage count
Message-ID: <20210430173025.0000359f@Huawei.com>
In-Reply-To: <39851c54046fa0d63f34549803df3388361828b7.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
 <39851c54046fa0d63f34549803df3388361828b7.1619621413.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.124.90]
X-ClientProxiedBy: lhreml719-chm.china.huawei.com (10.201.108.70) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_093205_710874_867BD835 
X-CRM114-Status: GOOD (  17.64  )
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

On Wed, 28 Apr 2021 16:51:31 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter and avoid memory
> leaks.
> 
> While here, fix the return contition of mtk_mdp_m2m_start_streaming(),
> as it doesn't make any sense to return 0 if the PM runtime failed
> to resume.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> index ace4528cdc5e..f14779e7596e 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
> @@ -391,12 +391,12 @@ static int mtk_mdp_m2m_start_streaming(struct vb2_queue *q, unsigned int count)
>  	struct mtk_mdp_ctx *ctx = q->drv_priv;
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(&ctx->mdp_dev->pdev->dev);
> +	ret = pm_runtime_resume_and_get(&ctx->mdp_dev->pdev->dev);
>  	if (ret < 0)
> -		mtk_mdp_dbg(1, "[%d] pm_runtime_get_sync failed:%d",
> +		mtk_mdp_dbg(1, "[%d] pm_runtime_resume_and_get failed:%d",
>  			    ctx->id, ret);
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static void *mtk_mdp_m2m_buf_remove(struct mtk_mdp_ctx *ctx,


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
