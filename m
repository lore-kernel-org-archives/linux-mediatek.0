Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACFFC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:49:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 62C3E613AF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 62C3E613AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tkos.co.il
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:Cc:
	To:From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kR8iu4qh0fEHRvcSTI5ScSfgXXRbkfx/qSOcrbNmU90=; b=SwFXSkSPDgG7ZX6Ivlhpd67sT
	/JdiSsnuO9y9YPILpM84TTp++2N111C+8OKg6z2Amwj/0dfaqakmJn7PYAmGFaah4HJesfqqEN9ap
	D5YRAmyriuZ9z+zoPCqCsSYCtOdM+icKzusFdbkVRA/OXUSxCkmQdt+AS3dw39WxwHEql0bq7twoD
	8SYOzEdwUDuAbHT8RcFZX9ZvmgWuoEh/hITErw/qcXsocGsR4Mkfh9iSYv5ntn/m9J1vyJVGIjElY
	PlOKUcl5KXvbAxDXVjC+s7TMXKs7+MkX+9mivLc/P+P417sLwgINXMZXShxjrT66jYlBjVR3LKPVl
	hRqZCQSIA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgSlA-000Gq7-Fy; Tue, 11 May 2021 13:49:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgSCh-0000yk-14; Tue, 11 May 2021 13:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:In-reply-to:Subject:Cc:To:From:References:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=AypHxjesIi+7DKS2760uWr1BiO/AAiZRumR0du6ToPg=; b=GRyykKCGl8pMeY5dzOyg2nOJOV
 1d3VgEijblWlBBUBglPU8F6Itjn8FWPcd6XWEJCpCj0dKatU9049d4EloYmnXq/9co9xTREoTut/i
 MCEvAMzgj0qZ2zlTbDJj2RvCBFh7fHHKkZu46aKMfoRPErfBZNnBIzCB9ADBSgIMu67Gp9Od9E/Ke
 LvfIo6tqmH+j5azIzGdGCoE62qel/MMPuV58wXDGkBNIyCw8Nfp3OcSrrIBOzhrnJNU7LbJLDcXYR
 YIA5RxBSLGQ+SjeD9bkSvZvJIMMimr7+asYFikuby6h4cTacUYcg+aGhMZxaxnHQ3xq/b1wv5bMIt
 f6yBjbZA==;
Received: from guitar.tcltek.co.il ([192.115.133.116] helo=mx.tkos.co.il)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgSCd-009bgc-EG; Tue, 11 May 2021 13:13:37 +0000
Received: from tarshish (unknown [10.0.8.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.tkos.co.il (Postfix) with ESMTPS id 81A38440033;
 Tue, 11 May 2021 16:13:13 +0300 (IDT)
References: <20210511113200.5439-1-thunder.leizhen@huawei.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Baruch Siach <baruch@tkos.co.il>
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/1] drm/mediatek: Remove redundant error printing in
 mtk_cec_probe()
In-reply-to: <20210511113200.5439-1-thunder.leizhen@huawei.com>
Date: Tue, 11 May 2021 16:13:18 +0300
Message-ID: <87r1idwh01.fsf@tarshish>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_061335_914027_946A1D74 
X-CRM114-Status: GOOD (  17.73  )
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

Hi Zhen Lei,

On Tue, May 11 2021, Zhen Lei wrote:
> When devm_ioremap_resource() fails, a clear enough error message will be
> printed by its subfunction __devm_ioremap_resource(). The error
> information contains the device name, failure cause, and possibly resource
> information.
>
> Therefore, remove the error printing here to simplify code and reduce the
> binary size.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_cec.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
> index e9cef5c0c8f7eff..fd593ff99bfd447 100644
> --- a/drivers/gpu/drm/mediatek/mtk_cec.c
> +++ b/drivers/gpu/drm/mediatek/mtk_cec.c
> @@ -197,7 +197,6 @@ static int mtk_cec_probe(struct platform_device *pdev)
>  	cec->regs = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(cec->regs)) {
>  		ret = PTR_ERR(cec->regs);
> -		dev_err(dev, "Failed to ioremap cec: %d\n", ret);
>  		return ret;

You can just return PTR_ERR() directly. No need to set 'ret'.

baruch

>  	}


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
