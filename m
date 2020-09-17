Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38408C433E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 11:42:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 976BF21D7F
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 11:42:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bgCbTlSK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="IzrMRhjl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 976BF21D7F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ri8kPVxCkqDEHIPOyhKyYZx2EK3MCxLTvjpzVlz47fQ=; b=bgCbTlSK4Ikvfy9P1Dw/2AQng
	JxdczfKIDPQ9tZY2Iy3nspU/bIgZ0XzrKfxE9Lq+pdP1aFTzMx4Z9JM3vMWrb1/TMcq6ytTEZi7i6
	JYLpkgOu5YrPeoxIb/wUL8j7UjrkcAiT3vOCbeBzAowbwu+eXc1FgfsL+RABD3W4KHPFtgZ4ZVsGI
	YapTSJQAZInal55b30tioNARuwbc6UgP7dwC6edPNllhK0ynk2lvec5z74k/5P64B9cO9FHLEuUnL
	CfMc6aRe5IhdAZxy048CsypMr6LTWCO11D1Fx5rnDerXtSBQJEDwnW9iKZLRxaV64qhl+1VwY8t33
	2/oLWoPOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIsJJ-0005u5-FB; Thu, 17 Sep 2020 11:42:45 +0000
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIsJE-0005sl-Lk; Thu, 17 Sep 2020 11:42:41 +0000
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
 by smtp-cloud8.xs4all.net with ESMTPA
 id IsJ8kMCx8PTBMIsJ9klouK; Thu, 17 Sep 2020 13:42:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1600342956; bh=7dj1q32JDBgy/nh+pm/ikTPB2+8KPJ8Yve3Qciq8Qpw=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=IzrMRhjlHnOYFzhPh1+7thsXuzsW1ts7Cwabv4GDGIARb/X3qhdk1EDtrHi/a+N2L
 lTixRyzEiOo/b+nuzTnzTKCkj/J93AFnsFgeOeSMrdu+x95Vbi1CzbscDGSfAxnoD0
 Ycx2QLRPP5mtfGLyJTpKnzWh7rwh3N+y4Rj4J7gwEJ8i6McJw8mc7rkNtS+84MnNyG
 Svn/16KwUfxRZzVCq0F0vSIahuPwLefz7QJpx/3ghxW3Ggu4KCB8lqeMkdfkXx6xo7
 Uad/+QFp44mWyf8siMLDJ2JuLeaUdLmuGpCIQtaC4x/wjGJPzCDagpXH+ffcX3RgfK
 bwmaaZEYT6rOg==
Subject: Re: [PATCH] media: mtk-jpeg: Fix a reference count leak.
To: wu000273@umn.edu, kjlu@umn.edu
References: <20200613230843.14109-1-wu000273@umn.edu>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <19432e4d-dcc4-5056-17ef-a6d2dd7b6fb4@xs4all.nl>
Date: Thu, 17 Sep 2020 13:42:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200613230843.14109-1-wu000273@umn.edu>
Content-Language: en-US
X-CMAE-Envelope: MS4wfJuL7t1rHdW84tT2i/rcyP37zN46fhUoL058G4mjDiCpc1dzY5lcoTLXx9HusSgsaifwP6PIjBuISaAZ+ojG1FafXGdRtu7I7e4kXACzagTcWXDdJ3TK
 4Tq91XJm52nrrxrUnpYAVmRUuCZy1S7iP4movC8W6Ipv4c4kEcRuwTa0PXuCtogHXkTXjgG+xGbG6aL7fD0BbEFqLtaMn5VnQPipmVRVMCWfrXKAHwEkZQbf
 coOfLDhU5gFmonJgeunqbZV7ufinrjxoal13MNFk1fCcUnA10wk6dBf8tawQCzdipJH8W1yRyvrn8qIxP7ilxVbCtOhDPPhG/DMuvwxEpF5b8Vo8AwUcuZ/e
 sjivz4IRI3G8+uGqxTJYCkoGeJRrr+ZhN+jR7XYGkGGzGr/93Vk2AVmboy/5ewvNFLmTZjjXVSzvoNMRN6N7E5a9B2eIEk3WbfPp41pcag+gAEoUI+6Zo8zW
 NNvvya1RJJj06++rU9b6E4IJbEY8VRjujiT38/P6fRCUlx60reRstYEJm+Xw2JLZbT+yAkiq5G6Jf1HtvhKsTAZQPF1FRLgnaLtneqzda+ib1cYloCIx/IPP
 PFlUpFT+XQIZBOGF7BKxhvELyd1iQU+XlIOfhNaIvTfh9cv73O2l0fpIccMaXKkKoVsVvLLU4EeYfA4IP7mE88MntmYLZIaW6ignJfhmOy1uzPPOz+txIT8n
 ltk8AlI7JtQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_074240_919883_9CB60764 
X-CRM114-Status: GOOD (  17.21  )
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
Cc: Bin Liu <bin.liu@mediatek.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Rick Chang <rick.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 Ricky Liang <jcliang@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 14/06/2020 01:08, wu000273@umn.edu wrote:
> From: Qiushi Wu <wu000273@umn.edu>
> 
> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus call pm_runtime_put_noidle()
> if pm_runtime_get_sync() fails.
> 
> Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decoder Driver")
> Signed-off-by: Qiushi Wu <wu000273@umn.edu>
> ---
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index f82a81a3bdee..097f0b050f67 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -710,8 +710,10 @@ static int mtk_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
>  	int ret = 0;
>  
>  	ret = pm_runtime_get_sync(ctx->jpeg->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(ctx->jpeg->dev);
>  		goto err;
> +	}
>  
>  	return 0;
>  err:
> 

This patch no longer applies, can you rebase this?

Regards,

	Hans

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
