Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7B8C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 08:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmYror7X2cuo+wP31gLVv3v67xXSD4f2xZ+MeNuzCqM=; b=wmp71ac+PRdg2FJrbYXDhbRJO6
	yqOSLyuNQ2E0GpoaENCSIvwAOMCZPhivkSBbh2JD+k4bNzJyXvrB830oC+JLFUUJk9Jt9dw9JejVM
	cWN0Ah4OCD/lwg0kOTZkHIspz+Vk98FRgm0MQYWDFzzZW9kOQZiY/szyr02whSmkJOMDGtWqVWFsG
	32D8BQTNMldX71FouP/Ln3yW8WpR8bu38GcCqVR5XMsfB97X760nmfUhUbIgUkNA8+9Zqr+PYN8In
	uKRTDfAVEDJ3LftK+v+LkFA+rjBw1q22ybYPmIQqy0vu9olX/Wya548i1Qtqw8/hiUJ5RKKivxcsQ
	E+G+A8KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6T3U-00AOpa-1A; Wed, 29 Jun 2022 08:28:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6T3Q-00AOo8-RD
	for linux-mediatek@lists.infradead.org; Wed, 29 Jun 2022 08:28:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2647A66018F4;
	Wed, 29 Jun 2022 09:28:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656491287;
	bh=GH2xhOUcGT/R9ajjAeKkq4p/KZEbUFVa0+S35618jKk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U/OmEbF7QyBSwx/kXpjFoy2wtAZBeaJ4c2au+cijnLontCV72yuWA5wqePOVmKgGF
	 UskLPCJMm4ZqpSKcKU7yUPD8XxHeuVlavouqaz9h5Y8FVdRM+qvF8x261HBXfd+tMX
	 geM22IRqA122lCsqtelQyoapKmdNBj32JFAfSkrvwIWA5VCtR5w2nGKZtLkOOawuRs
	 ItxOZM124S3mLGRcg15ToWiosvXXsYlxflD0CiOT1BpnymuTk67SYaGhcBjJM2pfPx
	 MOBraxrTv65M2qSOZRHXLRNhEnjYYrnvXEN+u2NeICNveweSyDug+ev2N7ymqO9YgO
	 blnHIIeCPxrhA==
Message-ID: <dbb7bbad-a088-a4d9-3089-166babf99fc2@collabora.com>
Date: Wed, 29 Jun 2022 10:28:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drivers/soc/mediatek: mark svs_resume and svs_suspend as
 maybe unused
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org
Cc: Roger Lu <roger.lu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org
References: <20220628121326.2097912-1-jcmvbkbc@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220628121326.2097912-1-jcmvbkbc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_012809_061504_889E2D8D 
X-CRM114-Status: UNSURE (   9.49  )
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

Il 28/06/22 14:13, Max Filippov ha scritto:
> This fixes the following build errors on platforms without hibernation
> support in linux-next:
> 
> drivers/soc/mediatek/mtk-svs.c:1515:12: error: ‘svs_resume’ defined but not used [-Werror=unused-function]
> drivers/soc/mediatek/mtk-svs.c:1481:12: error: ‘svs_suspend’ defined but not used [-Werror=unused-function]
> 
> Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Hello Max,

This is not the right solution... and besides, there's something else in the works;
check here:

https://patchwork.kernel.org/project/linux-mediatek/patch/20220623030931.2816013-1-jinxiaoyun2@huawei.com/

Regards,
Angelo

