Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04216EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xQDjZGRqtVYtiJ5lU3PLCt3KUWjC3qiUX8oBY3Fr0fA=; b=g2jznDLQA4z2rt2MRzOQ/N5G7W
	bTF8jZ36TSrfI/mjRnVjdLk0hFGHhbMmyh7mmGmjFReyROktWKoQHRHb1yzJG6daWYtqFRuahJK4d
	xE//QR6oTDCYoUImPCyVDVIjO0JmfBDzfSpIA1kPh1gFiZOd1rzqoJ8XVn/QGE26thITaorp5dZCh
	/9Gam8A+CzN7TBje6EKoeDUx/xg9CIsj9YN8XsnNocxjixGMcR8R+ZNKjWDM/fAl3ZKUvWe8IpaoQ
	nL5MOyKpdaes479QDWxZquzFxYiv/W4CBx75kHRCMXl6NFekdKjmW3NjzUDUqSveICDSFpYT327Do
	SB1lNk3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Qz-006J9n-2m;
	Wed, 19 Jul 2023 08:21:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Qt-006J5e-23;
	Wed, 19 Jul 2023 08:21:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 28A7A60DC7;
	Wed, 19 Jul 2023 08:21:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF22C433C9;
	Wed, 19 Jul 2023 08:21:12 +0000 (UTC)
Message-ID: <00a48d8b-2bc7-6848-886d-e09478cc0469@xs4all.nl>
Date: Wed, 19 Jul 2023 10:21:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] media: mdp3: Fix resource leak in
 for_each_child_of_node() loop
Content-Language: en-US
To: =?UTF-8?B?6Lev57qi6aOe?= <luhongfei@vivo.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Moudy Ho <moudy.ho@mediatek.com>, Sun Ke <sunke32@huawei.com>,
 Deepak R Varma <drv@mailo.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Cc: "opensource.kernel" <opensource.kernel@vivo.com>
References: <20230719080632.13357-1-luhongfei@vivo.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20230719080632.13357-1-luhongfei@vivo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_012115_722152_0DD04A6B 
X-CRM114-Status: GOOD (  16.45  )
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

You mailed this as an HTML email instead of ASCII. HTML emails are silently rejected by
the mailinglist, so please repost as an ASCII email, as you did before.

Thank you!

    Hans

On 19/07/2023 10:06, 路红飞 wrote:
> for_each_child_of_node should have of_node_put()
> in error path avoid resource leaks.
>
> Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
> ---
> Changelog:
> v1->v2:
> 1. Change the subject line of this patch to include driver name.
> 2. Remove the unneeded of_node_put.
>
>  drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> index a605e80c7dc3..40c4b79a5090 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> @@ -1135,6 +1135,7 @@ int mdp_comp_config(struct mdp_dev *mdp)
>  		comp = mdp_comp_create(mdp, node, id);
>  		if (IS_ERR(comp)) {
>  			ret = PTR_ERR(comp);
> +			of_node_put(node);
>  			goto err_init_comps;
>  		}
>  



