Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25FBBC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 23:20:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD22D60560
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 23:20:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD22D60560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GT45AUVs4UVp8JeQdyhWpRE53quxzEIZ6LnyD4fq30c=; b=5D1qb73JUdrN6T
	1hpB5fbZriLEdv8njaUQGIzFgG9aqaLC/mC3Hovfyp4lEU7PmFUygA06/4+T5gmMWpGm6Kem3YzoJ
	xRjfL/efrrRBQFV9dWVbq/xetAfrHKSAzXns6lP8bQLsVx9vwmT9rQGXJsE1rxJCJlwJqQkcpVLHc
	XuIOGkDe6T1EOO9uvbI2ix6rSNFurVkJKyIwAu2AFLfL9vOHXcBezuuFDQniT+aJNOYoLe197C8qD
	jxE5ax4RD72qADQ5XXnCoPOdSO4wLQdWdzwgLbLMDaCqLque3EiY1IRVpA+bdac6HXYMYEmJ6b6hw
	J12c7qH5dcX+rJf9/tCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGrL2-009jIq-Ue; Thu, 19 Aug 2021 23:20:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGrKn-009jGn-Fw; Thu, 19 Aug 2021 23:20:33 +0000
X-UUID: 2d75b0caf2cb4164a68ba3d702f8516f-20210819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=QfeDJW3m4L57kRx1ekiwSC66ZVnjMitRsEcL77yqUug=; 
 b=h7lLzP6r8j9QVwh0abLzRZYUGWTNl1b5cM4qRCRgD364hb8GohNxIXYOYsk5tdb0Qeja+dyvrJ474JYdVZ0gMMOYTL1/Ownbt6GFuWGBVdl8pDp8874ArEWWFgoTeo7OazhTiqTQV/LTNgqEatWFGiDAQiZi91Wgi65EN64E7qM=;
X-UUID: 2d75b0caf2cb4164a68ba3d702f8516f-20210819
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <houlong.wei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1263005613; Thu, 19 Aug 2021 16:20:23 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 16:20:21 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 20 Aug 2021 07:20:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Aug 2021 07:20:12 +0800
Message-ID: <6cb09965bce5bffe97fc00faecfffae9d3b38b3d.camel@mediatek.com>
Subject: Re: [PATCH] media: mtk-vpu: Fix a resource leak in the error
 handling path of 'mtk_vpu_probe()'
From: houlong wei <houlong.wei@mediatek.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Minghsiu Tsai
 =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= <Minghsiu.Tsai@mediatek.com>,
 Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?=
 <Andrew-CT.Chen@mediatek.com>, Tiffany Lin
 =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?= <tiffany.lin@mediatek.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>, "matthias.bgg@gmail.com"
 <matthias.bgg@gmail.com>, "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org"
 <kernel-janitors@vger.kernel.org>, <houlong.wei@mediatek.com>
Date: Fri, 20 Aug 2021 07:20:13 +0800
In-Reply-To: <3d4ba5d254044567653a006b18971658ec69560f.1629404378.git.christophe.jaillet@wanadoo.fr>
References: <3d4ba5d254044567653a006b18971658ec69560f.1629404378.git.christophe.jaillet@wanadoo.fr>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 814C1EEA859FBE07EB023142BB288BF8A660564BFC7F2A04322B36A3694EEE642000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_162029_564696_A69F3FF5 
X-CRM114-Status: GOOD (  17.81  )
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

On Fri, 2021-08-20 at 04:21 +0800, Christophe JAILLET wrote:
> A successful 'clk_prepare()' call should be balanced by a
> corresponding
> 'clk_unprepare()' call in the error handling path of the probe, as
> already
> done in the remove function.
> 
> Update the error handling path accordingly.
> 
> Fixes: 3003a180ef6b ("[media] VPU: mediatek: support Mediatek VPU")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> 
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>

>  drivers/media/platform/mtk-vpu/mtk_vpu.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> index ec290dde59cf..7f1647da0ade 100644
> --- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
> +++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
> @@ -848,7 +848,8 @@ static int mtk_vpu_probe(struct platform_device
> *pdev)
>  	vpu->wdt.wq = create_singlethread_workqueue("vpu_wdt");
>  	if (!vpu->wdt.wq) {
>  		dev_err(dev, "initialize wdt workqueue failed\n");
> -		return -ENOMEM;
> +		ret = -ENOMEM;
> +		goto clk_unprepare;
>  	}
>  	INIT_WORK(&vpu->wdt.ws, vpu_wdt_reset_func);
>  	mutex_init(&vpu->vpu_mutex);
> @@ -942,6 +943,8 @@ static int mtk_vpu_probe(struct platform_device
> *pdev)
>  	vpu_clock_disable(vpu);
>  workqueue_destroy:
>  	destroy_workqueue(vpu->wdt.wq);
> +clk_unprepare:
> +	clk_unprepare(vpu->clk);
>  
>  	return ret;
>  }
> -- 
> 2.30.2
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
