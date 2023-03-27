Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8A40C761AF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 07:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nZ3JPx89Puhq8Lj0NnsgaQqb5P9c24gnAiuVWjy2kS8=; b=DSENw9YHn2fqwv25FNJUDLlqf1
	MOW+vwaa3B7eCLvCqkiXtC7zU2FGT2PTbn8g2jvBsLQQlLYmOkBQfQ0cwrry2DLnmXmDMHZ2zT138
	V+6QXf/8EEYcCoXdXdtd7+XxJk9HzpOMm7VBvkFP1N3cBYpeDbKyC8HCOlAI9C6Lr+QmZM130iiTU
	Jo/PbF4yuwr5r28HRBw2YqF0dKZl67BDAQnRdFbkfeyI5c4yWy98Y0ZcUqBkaWQhqLpcg0UWsiJJY
	gCMSlUowvaNWfgJ3EbfM3WuUPbUM3kwLGNWmPWqsL6kOS9wsujQXjy15ai3iztTJ+psKcFcN5iUA5
	ugEHTlEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pghbx-00A6q9-2o;
	Mon, 27 Mar 2023 07:49:49 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pghbv-00A6oa-0W
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Mar 2023 07:49:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 093496603082;
	Mon, 27 Mar 2023 08:49:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679903383;
	bh=Wigh5ZkT6PUuW6n+/iXN9rF147ZZhApXRlVFqVwLC+c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SMdmt5Cw1Lb0mW0Kv0Sqi3TEb5dSZ2fc8It4iiI8AFGy5/ZG85rnJmxXpAAardCBz
	 yDWyYzLoX0zjh45pFeH8RgMc0tIg7HnPKhhTLxWkwBwvAmZGaqg+he+8/tPW3kb9Ec
	 NTE9n05G6G7ivAa21j5vEaqh6faJCNeBpmdMyCic5v3q6xwTXegiENtLPwSDE4t/AE
	 DBYrS8vgTiAUZTWEUTqT4jYA8VPIvdN4i/Hp38Zo+RxibSTOe5Mcha6U700m98WAd5
	 8Oez93U/UlZxQY3vkwSsF/Ey+EjnVtJCcq45MQ6gbiLywAY1u4leiSvaeLQYV6+Dv7
	 6hcQFgz3Kuuyg==
Message-ID: <c2410688-8343-9c29-a7a3-9e30b6696449@collabora.com>
Date: Mon, 27 Mar 2023 09:49:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] iommu/mediatek: fix a reversed test in probe
To: Dan Carpenter <error27@gmail.com>, Yong Wu <yong.wu@mediatek.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Chengci.Xu" <chengci.xu@mediatek.com>, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <88c83ce7-5d1a-44a8-b9bf-0d01cfea24db@kili.mountain>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <88c83ce7-5d1a-44a8-b9bf-0d01cfea24db@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_004947_415693_A0B05375 
X-CRM114-Status: UNSURE (   7.29  )
X-CRM114-Notice: Please train this message.
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

Il 25/03/23 12:07, Dan Carpenter ha scritto:
> The dma_set_mask() function returns negative error codes on failure but
> this code is testing for zero instead.
> 
> Fixes: f4b49c7c5e67 ("iommu/mediatek: Set dma_mask for PGTABLE_PA_35_EN")
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



