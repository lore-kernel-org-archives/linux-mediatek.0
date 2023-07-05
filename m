Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B7B1EB64DA
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Jul 2023 08:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uvJc8aht5SJCqjxVH0S3g8bSxlFjIgwWgZXp3lkltDs=; b=cjsRkCoosHQ1Tx558KPhvj+Bps
	17gtWkDOt8RmAao465MsWHB7QWgfFI1onuIeV1FbcO43l1BvvnKYSp12ztj4n++8agkPoB1MfnzJX
	55TRQ8jbcQN3R5RzRMgzZH6tKBzxzcTKjLn5evu7k3NZ766CI2Zc0ZsorFctMBAhC8lmm/Tkvtoub
	5zYC+XmWUii5IS9MIq5AI/qV0LUXGQ3rPffHWbBJeTFNuWJMl+vApZg8wbLgo8b7793pKZ97amPyB
	FLAoKdBekutljHQB8e/GE+rQDPB6SF/Ng8DvaW/3jPj5ysJQLu3cqQWWSmiNq9AoEgUt/+NiQJoTl
	7DcNKTFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxVt-00F8vg-0o;
	Wed, 05 Jul 2023 08:05:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxVq-00F8ui-2m;
	Wed, 05 Jul 2023 08:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uvJc8aht5SJCqjxVH0S3g8bSxlFjIgwWgZXp3lkltDs=; b=XBN8I+N3wKi6yPGLnVzRg3y7Jb
	KSuIsgQ9wMf/4CM4MPwA8l/ZFlHhdn+OIzcCS7MycCLoyKGUGiTHLuRm/b5sUcq+EBS8mgXHF3/Eb
	hSaZBN8DhR6j0VqPPVeD5caCWBOEw5lmUjoEtXY87QsC2nGw0sIenhJpcsf/lT1vsEET2DsLw7K1J
	TXJhQVOAYM1ZW7VPM2eP7Y3CUB6b6ZtEYp3m6Svsl3zMd8wEkUhGM+ac1d6TusKglNgWaNDmGjaUS
	/NGRaoln2q114xjs6LwZKdQaO1/Txfa7A3u9dxLhoZgwU4PpmLCj0RJxexCr/NlrVPhYpToOGWsLm
	hpWMBrvw==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGxVh-00C1cW-14;
	Wed, 05 Jul 2023 08:05:21 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 942A86606FAA;
	Wed,  5 Jul 2023 09:05:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688544310;
	bh=12ymBKZuS/CqDJF1sxy54hGb5fCQHfQJmXELi+Q8iHQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V9jKSGUf71gSX6E543luyL/EgENHci9yi9XHkWYbcu6iwhua1NdlCFWrPPCDuP7nG
	 gZWoXVmSbrGGriFnHQrH9CY8kuKmzcVrXgsfyWTb+3RuNx8TYcuw4PAv6XaikZKXXl
	 Ar1RVfD4BH4OYC5tflOpU2cx7557J9/xSRszg4oz4FKHcXWGpuKrequhI0eXJyTIzt
	 GwZpNohXcEXeiDW9F6xA0boVF+pCOy3yqlRsSpaXJPiIlsbDCURCPwZDl6pqUEc3Mc
	 nBrABBthAx+UbxBgPg51bCYiDbLu+u3Dee9h9SEb89yS0C/RLS4a0xdHQWCTcO80DQ
	 Gwbss2qR8yCZA==
Message-ID: <82bdb2cb-e31d-1265-47ea-56fad4fc2d40@collabora.com>
Date: Wed, 5 Jul 2023 10:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] media: mediatek: vcodec: Return NULL if no vdec_fb is
 found
To: Irui Wang <irui.wang@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230703035905.28247-1-irui.wang@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230703035905.28247-1-irui.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_090513_792543_87387BAD 
X-CRM114-Status: GOOD (  17.04  )
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

Il 03/07/23 05:59, Irui Wang ha scritto:
> "fb_use_list" is used to store used or referenced frame buffers for
> vp9 stateful decoder. "NULL" should be returned when getting target
> frame buffer failed from "fb_use_list", not a random unexpected one.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

This commit needs a Fixes tag. Please add the relevant one and resend.

Regards,
Angelo

> ---
> changed with v1:
> - remove the added flag variable.
> - update commit message.
> ---
>   drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
> index 70b8383f7c8e..a27a109d8d14 100644
> --- a/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/vdec/vdec_vp9_if.c
> @@ -226,10 +226,11 @@ static struct vdec_fb *vp9_rm_from_fb_use_list(struct vdec_vp9_inst
>   		if (fb->base_y.va == addr) {
>   			list_move_tail(&node->list,
>   				       &inst->available_fb_node_list);
> -			break;
> +			return fb;
>   		}
>   	}
> -	return fb;
> +
> +	return NULL;
>   }
>   
>   static void vp9_add_to_fb_free_list(struct vdec_vp9_inst *inst,
> 


