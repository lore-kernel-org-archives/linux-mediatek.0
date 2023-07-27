Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFF7AC001E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jul 2023 11:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyvszeeNO4LK/MiMXiVxNwSNWDSjPHkwvYBTvkVTILA=; b=tjL0oJTuD5je+rN0zGzga0Ulpb
	JP/3O2ziLCp2gpjns4vMiJIIRZAikUW9Y9zqVk27D0h1cDZ68vmeX0tpRhlhuy6GXJfILI+tvpak6
	G6gdpAwRD1XRFSHxWOGbky/U0ciYKsWeTQ1H30TUJ5oLvk5HR6OdZVfBVNj6tx6LiO6fgea739RAM
	MzhnQ7VM32NGGaxqpt6ObsAqRMqJYdpLPFhMbD9MLUE2Fyr6mq5P/hD03wLUrwlgi0zuo1dsUIA73
	SCSAU8y5HEVXqWs8CPTQNiLE3dflIFCOlweZjuv8h6tslUq0F+INPIoSNKCqqcCn2wZDPcFePyV3f
	/dXTlolg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOzTK-00DVBs-1m;
	Thu, 27 Jul 2023 11:47:58 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOzTF-00DV1O-23;
	Thu, 27 Jul 2023 11:47:56 +0000
Received: from dggpemm500005.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RBTTT4RSGzLnsJ;
	Thu, 27 Jul 2023 19:45:01 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 27 Jul
 2023 19:47:37 +0800
Subject: Re: [PATCH net-next v2] page_pool: split types and declarations from
 page_pool.h
To: Jakub Kicinski <kuba@kernel.org>, Alexander Lobakin
	<aleksander.lobakin@intel.com>
CC: Ilias Apalodimas <ilias.apalodimas@linaro.org>, <davem@davemloft.net>,
	<pabeni@redhat.com>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Eric Dumazet <edumazet@google.com>, Wei Fang
	<wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang
	<xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Sunil Goutham
	<sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, Subbaraya
 Sundeep <sbhatta@marvell.com>, hariprasad <hkelam@marvell.com>, Saeed
 Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jesper
 Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder
 Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux-rdma@vger.kernel.org>,
	<bpf@vger.kernel.org>, <linux-wireless@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20230725131258.31306-1-linyunsheng@huawei.com>
 <ZL/fVF7WetuLgB0l@hera> <20230725141223.19c1c34c@kernel.org>
 <a5d91458-d494-6000-7607-0f17c4461b6e@intel.com>
 <20230726084742.7dc67c79@kernel.org>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <d6dd7cb3-5d06-cc1d-ff0d-6933cb9994b9@huawei.com>
Date: Thu, 27 Jul 2023 19:47:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20230726084742.7dc67c79@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.69.30.204]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500005.china.huawei.com (7.185.36.74)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_044753_881151_952A6610 
X-CRM114-Status: GOOD (  13.32  )
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

On 2023/7/26 23:47, Jakub Kicinski wrote:
> On Wed, 26 Jul 2023 12:48:05 +0200 Alexander Lobakin wrote:
>>> I prefer the more systematic approach of creating a separate types.h
>>> file, so I don't have to keep chasing people or cleaning up the include
>>> hell myself. I think it should be adopted more widely going forward,
>>> it's not just about the page pool.  
>>
>> I have this patch reworked to introduce
>> include/net/page_pool/{types,helpers}.h in my tree, maybe someone could
>> take a quick look[0] and say if this works while I'm preparing the next
>> version for sending? Not the most MLish way, I know :s
>>
>> [0]
>> https://github.com/alobakin/linux/commit/19741ee072c32eb1d30033cd4fcb236d1c00bfbf
> 
> LGTM!

Hi, Alexander
It seems you have taken it and adjust it accordingly, do you mind sending
the next version along with your patchset, so that there is less patch
conflict for both of us:)

> 
> .
> 

