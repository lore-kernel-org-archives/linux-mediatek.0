Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DADCC001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 07:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c00oKqBto6DPWd2lo8s2HrcOnHxuVN8dGhbqZfUYyrU=; b=G7UK7/vVpbSNuhOyKinzUN9Rqc
	6mD+uJDgPHS4J+RPzdjpJuIRpQF9VpAh7XEXN5yLyhLNvLW7YqHpQziqbFxQlMAV2zmJ81+RmvlQ6
	UrTNJVf54ATuKQohwFZ6LxMCxxmVLVmWm2jQ2oUz/p502gY2mz49j2bPQdxSGieKZQjc7eDjm3TDq
	5qggVVBk66SPB8S/a8WRWf7fh9clqCd9LkEd7RsIHlmSOQyjwmPWYYIymy+u0XZNVcMpbMuCvzoa7
	528Wa/pztSD1qtn0WHm2KNujoP3x14EpCXmlkAGK1LECZkx/9wp8dtZu8Zd4k48I5iPxWAfmWLXX3
	AYCzpxoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1ov-0067WX-13;
	Wed, 19 Jul 2023 07:42:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM1os-0067Ux-1O;
	Wed, 19 Jul 2023 07:41:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 68444612F0;
	Wed, 19 Jul 2023 07:41:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70B9EC433C7;
	Wed, 19 Jul 2023 07:41:54 +0000 (UTC)
Message-ID: <1dfd0643-bec6-5360-bbd1-968848b760f9@xs4all.nl>
Date: Wed, 19 Jul 2023 09:41:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] media: Fix resource leaks in for_each_child_of_node()
 loops
Content-Language: en-US
To: Lu Hongfei <luhongfei@vivo.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Sun Ke <sunke32@huawei.com>,
 "open list:MEDIA INPUT INFRASTRUCTURE (V4L/DVB)"
 <linux-media@vger.kernel.org>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
Cc: opensource.kernel@vivo.com
References: <20230530094541.23396-1-luhongfei@vivo.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230530094541.23396-1-luhongfei@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_004158_513522_49D946A5 
X-CRM114-Status: GOOD (  16.23  )
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

Hi Lu Hongfei,

Please add the driver name to the subject line: 'media: mdp3:'!

On 30/05/2023 11:45, Lu Hongfei wrote:
> for_each_child_of_node should have of_node_put() avoid resource leaks.
> 
> Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
> ---
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 3 +++
>  1 file changed, 3 insertions(+)
>  mode change 100644 => 100755 drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> index 19a4a085f73a..5a6a61d68cba
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> @@ -1128,6 +1128,7 @@ int mdp_comp_config(struct mdp_dev *mdp)
>  		comp = mdp_comp_create(mdp, node, id);
>  		if (IS_ERR(comp)) {
>  			ret = PTR_ERR(comp);
> +			of_node_put(node);

This is needed,

>  			goto err_init_comps;
>  		}
>  
> @@ -1137,6 +1138,8 @@ int mdp_comp_config(struct mdp_dev *mdp)
>  		pm_runtime_enable(comp->comp_dev);
>  	}
>  
> +	of_node_put(node);
> +

but not this one. The for_each_child_of_node loop ended, so node == NULL and
there is nothing to put.

Regards,

	Hans

>  	ret = mdp_comp_sub_create(mdp);
>  	if (ret)
>  		goto err_init_comps;


