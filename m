Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F620C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 11:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLPVTfkvxVE3NOGNLVSxAyjTN6zGiwTk6j2M6eMRjkw=; b=yjT14N5YCrxV2bExM6rtc/QKsJ
	uqn65+MoaPQ5K1yw27w0xdm+SO4ZylLwtets1anjq4LJp3SmRrQPoOuM/kJR0dltEWTo8AfKindKu
	rjEhURSC9lnGkP7KEj6uA30g/WmWP6t/hlY0gsJ0+r/Z6vKl4XJrA/eGvocZWtdbwZ12kmKP18miF
	7SLPEYbNet7sjlt0sUneouJa6Ye4//F03UQYhZ91uw47yFtSRrWNvt3yJNcXsJ7wYSULbIYRtzWM6
	fwBWnP729+RieutQ6y6L9q2FaVHpEt+i/HnzgUr8MxRn5XeHfNyj3GtcuEIr4bXNBK8xgYeia/8lP
	CM4NR9lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5LK-007Bpw-0Z;
	Wed, 19 Jul 2023 11:27:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5LH-007BlJ-1o;
	Wed, 19 Jul 2023 11:27:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 21A2B6607072;
	Wed, 19 Jul 2023 12:27:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689766054;
	bh=9qfxcH3j/f1CvIfaXnqo7k8AyMuw1imrFFbrAy1NN+Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GNpDP7Q0uS/pd0YDhXY/68aBQJHQuMCg1qdYuhwFUkj/97xlrHPc35Tk9ag6atbKw
	 8brHWC+4X3p4P8/v5BU1DCm2Im55xWAUdFFo2bzrOvZM7JGLH3bngz9oSLAHDQMYhG
	 U7IB5eY+2lUx8Lvlm8TJiUFd6TeLW68PF0m0mVQx3w8qK/dOFg44N7IwqVKomytO29
	 R/Zo1tVFu3p3o35ajnNwWG+U4zj6ONhzEVmGGZeNv13ppTYNglQXkQZT9eWpeFjjF6
	 hJPo4Blo4oKAvOgzi4K8Mf0wet52LwbKp/6sXXIIcezPXu2dNPQG2EOFm13ANCsm6g
	 phbqFUB7LtD9g==
Message-ID: <c32d744a-c711-fdd9-0601-0ec27a0af733@collabora.com>
Date: Wed, 19 Jul 2023 13:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] media: mdp3: Fix resource leak in a
 for_each_child_of_node() loop
Content-Language: en-US
To: =?UTF-8?B?6Lev57qi6aOe?= <luhongfei@vivo.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Moudy Ho <moudy.ho@mediatek.com>,
 Ping-Hsun Wu <ping-hsun.wu@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Deepak R Varma <drv@mailo.com>, Sun Ke <sunke32@huawei.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Cc: "opensource.kernel" <opensource.kernel@vivo.com>
References: <20230719100137.41161-1-luhongfei@vivo.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230719100137.41161-1-luhongfei@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_042739_728162_BA06F7FC 
X-CRM114-Status: GOOD (  17.24  )
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

Il 19/07/23 12:01, 路红飞 ha scritto:
> for_each_child_of_node should have of_node_put()
> in error path avoid resource leaks.
> 
> Signed-off-by: Lu Hongfei <luhongfei@vivo.com>

That's still HTML; please avoid Cc'ing a bunch of people if you're testing
your email sendout.

Please test internally and once working send it again.

Btw, the code looks good... but I can't give you a R-b because of HTML format.

Thanks,
Angelo

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



