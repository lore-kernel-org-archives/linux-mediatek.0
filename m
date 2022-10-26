Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A04BC38A2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 08:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5oKWfOcAf7R+mPETqabiyguWMlfSODEXFn8Cl9Rxgo=; b=JY3qnFll4uSEmh48bwrFq9fJwi
	bUjAZxqPfrOJv4XigoQ/ZiR4w3VV3/ZCKuRbX/OQKBvO4Kh5Blx3jwRgwKCZGuO4W5twANaRROQ99
	QSR0SRvhH6l8qTHKM178gZ8S96x1Z7sAnLuu+WWmFr9j+nbeRBNwmf3q8sJjKWWHO8QfO26M7v3+2
	CcSEODNDDQZR6QcIf5HJaUpbrF6bJXqjrQto/wibwpEmdM0WwJGrGqACd2MsqQQhr1DtF3kxdKwaQ
	G9WxQaht9//n/Vn73Qge0/4w8Tu6kZfc6r9hm+FDAgnpTy9zH0fcsvWn8VjK4iYf8nORopjYm7odJ
	uO/nfeog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onc06-008cEY-Sc; Wed, 26 Oct 2022 08:43:02 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onc04-008cDZ-MJ
	for linux-mediatek@lists.infradead.org; Wed, 26 Oct 2022 08:43:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3D545660283E;
	Wed, 26 Oct 2022 09:42:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666773778;
	bh=w31odjVcfeb6QfjPWe48PCOVArAFaXH4iLmTYIV0E5I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U1kt1+HlZCH2AipQyeOkQ0qfqxX/uIphQ0w8EmLcLbSo4SfVpUta+rtG5HnsTVPso
	 N1a+4RjXqunUnq8eaKuAQcwQjhFS1nUnDvKcycI8uwWjbIBuYNPodI1S8nwYHBkhZT
	 0qFM6C9fNHdTzLiMVRvqm9PFxJZGJRJa+o+19T4NC/w8qrjOcd9XQ2N85BCG3eUgAQ
	 ql3cjjph63Kmz9FNhTLgnZFIXcXrIK2F77KdBy3gFi0kIV1zymyq6/JQ+olcz/axa/
	 be/PreqzGqfn2gE6Y0w3Xrac1bADowt+zE4xaQStpP5Jo12RaBsMON4bCCvcAPNy7c
	 dUiSUOasd/6sw==
Message-ID: <b22b6d17-98d6-782c-af5e-8e3d46a0277e@collabora.com>
Date: Wed, 26 Oct 2022 10:42:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 2/2] ufs: mtk-host: Add MCQ feature
Content-Language: en-US
To: Eddie Huang <eddie.huang@mediatek.com>,
 Asutosh Das <quic_asutoshd@quicinc.com>, martin.petersen@oracle.com,
 stanley.chu@mediatek.com, bvanassche@acm.org, linux-scsi@vger.kernel.org
Cc: avri.altman@wdc.com, liang-yen.wang@mediatek.com,
 linux-mediatek@lists.infradead.org, cc.chou@mediatek.com,
 powen.kao@mediatek.com
References: <20221026073943.22111-1-eddie.huang@mediatek.com>
 <20221026073943.22111-3-eddie.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221026073943.22111-3-eddie.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_014300_890398_677688BA 
X-CRM114-Status: GOOD (  13.94  )
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

Il 26/10/22 09:39, Eddie Huang ha scritto:
> Add Mediatek mcq resource and runtime configuration function
> to support MCQ capability
> 
> Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
> ---
>   drivers/ufs/host/ufs-mediatek.c | 37 +++++++++++++++++++++++++++++++++++++
>   drivers/ufs/host/ufs-mediatek.h |  7 +++++++
>   2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
> index c958279..3f5fc05 100644
> --- a/drivers/ufs/host/ufs-mediatek.c
> +++ b/drivers/ufs/host/ufs-mediatek.c

..snip..

> +
> +static int ufs_mtk_config_mcq_resource(struct ufs_hba *hba)
> +{
> +	hba->mcq_base = hba->mmio_base +
> +					MCQ_QUEUE_OFFSET(hba->mcq_capabilities);

This seems to either be an additional usecase that should be implemented into the
API and not in MediaTek drivers, (as in that case I believe MediaTek won't be the
only user of such usecase)... or just a way to avoid adding the MCQ iospace to the
UFS devicetree node.

Please clarify.

Thanks,
Angelo


