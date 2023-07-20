Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF214EB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 07:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1G0vEnieqY0k/JpGElVXA5vRcfg+enhJjypmRHxO7XM=; b=lQEXN5FviCaFYHqGWirgyvjT3i
	eT27qaW7nrUlRR3FNWJeoyHY8krjfXe3tcMq5oGAyJqQnEdf3XQTWAxBkn7l0eKmUOZDffkk6L1gb
	1ARkONK4f5Yj7Is6P/jcLusxFnsTcaGrVLoccH41wKVCvO8ADp1CuzUTJmkz3Q/vHeA32E9AHsDcG
	mf/Qm5fpCMKaDdqTmqIBmijn7qT5du/2fKRkt8PAPjMRFD0usr3yIEil7DQAH5p9cD1h+wgmvgSlZ
	jvzBE/3amKIKOY/WmDm5uPYt+M5pkoEjTIDUZaNUt1Aci+5ilIE/yOd9iXk3sn0sSakB8jzDiFWWs
	x9YuRadw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMORy-00AB05-2g;
	Thu, 20 Jul 2023 07:51:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMORv-00AAyO-1j;
	Thu, 20 Jul 2023 07:51:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F275660707F;
	Thu, 20 Jul 2023 08:51:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689839506;
	bh=jIJuDdBqpd9dYlzqbxXjWksr5/fpNfwC3vh0Df86hSA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EL6Ox+4ZM/rOi9BxMX+3fzD7YFCPDYUIq8nAOqLAksUJWrXi/UZk1mZ5a/8dB5JH5
	 GsAiXRpSjA4qgNdEmczDV5UHgOC10lPTa/FxhnOkt+7vR8Xb0pC8L81bPMVOtbbz3t
	 LK+na0uWDZrkaMZQaBm1hCC0+KiwPEa1bxIllpfRcYtUcy64NCHRyXWQ3jEW5mQliB
	 nkfZbgYxajjmbRMu2kI9hzmv2/5zDIsqUBVbhqaM4CCLtXHSAjois5vNpQKvBxrl6m
	 xOFbXf4Jc4pU5TcBjgD3ixHcIFw46qTmJ+udO++oq1J2lcJqKbCqwW3tvBdhsOVWJr
	 8JJTIyb8Icxlg==
Message-ID: <32ae3716-672f-cdc2-f246-d8336ed44a68@collabora.com>
Date: Thu, 20 Jul 2023 09:51:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] media: mdp3: Fix resource leak in a
 for_each_child_of_node() loop
Content-Language: en-US
To: Lu Hongfei <luhongfei@vivo.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Moudy Ho <moudy.ho@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Sun Ke <sunke32@huawei.com>,
 Deepak R Varma <drv@mailo.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Cc: "opensource.kernel" <opensource.kernel@vivo.com>
References: <20230720062248.37906-1-luhongfei@vivo.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230720062248.37906-1-luhongfei@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_005147_705702_01E9794F 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 20/07/23 08:23, Lu Hongfei ha scritto:
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
>   drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> index a605e80c7dc3..40c4b79a5090 100644
> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
> @@ -1135,6 +1135,7 @@ int mdp_comp_config(struct mdp_dev *mdp)
>   		comp = mdp_comp_create(mdp, node, id);
>   		if (IS_ERR(comp)) {
>   			ret = PTR_ERR(comp);
> +			of_node_put(node);
>   			goto err_init_comps;
>   		}
>   

In case mdp_comp_sub_create() fails, we still want to decrease the refcount
of `node`....

...so, just call of_node_put(node) just once, at the err_init_comps label.

err_init_comps:
	mdp_comp_destroy(mdp);
	of_node_put(node);
	return ret;

Regards,
Angelo

