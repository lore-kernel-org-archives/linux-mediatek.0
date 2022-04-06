Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA1BC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 10:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WEAKs+5Ce+KkUHsEKvd9e3NIlNoXp45RdEvxduprBbg=; b=blGjQf8kH5IYnn
	zj4yG78PDf54P+mmnfqRYIhSY7I6DxkAGwT013hA+hH9f8UfHLmrM16u39ybEbJG8FhH5ubKfqgKG
	+b1DDfBpsb48pd7BEMxNEEKgdnxjRqynB4G0v+HbI6AZDCEhUFFwFfa8Mp7aI9zZLD4i0VkJYo2cT
	ecFzs4ECFuHcxU4s3ySLM3X2A8dMM2ZV6jmIynD1Xj88nQOEOTh+1CnnnOfMOOXMFxgK94k/LQl6S
	/J7ulIga3R5Wee8Y58NObiqU6lj+fgSphRi6K3qRhQLE8q3fbjPcxF9YRmORKdOMXMoqo6qvAABt1
	xcYqlen+ZLSK8h0PE+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc36J-005TDF-LK; Wed, 06 Apr 2022 10:41:23 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc33o-005RtU-Gz; Wed, 06 Apr 2022 10:38:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C74DE1F40636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649241526;
 bh=5GWmZjBirWLKxTJDH+AOnbEW/7YRX30utZckHcSznsA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=b1yhGPYeG8w7Hp3otl5OwFcOZbuTdGDLENoQCChDRid7NyaHwJgMzTFezCf/36fV2
 fuQOYSawPvsvy2Gil0LJd3sKx2+iNHU5Z4uP1KTdPjDCbN6zti6mJwrFqE/0mULBDa
 MtpEJV+jra0//NFIIRW8QWD0FXJMBPQqRUx5zS7pyhDoIGAMd3uI9rU/mc7OwIX76V
 4CbeW4SEYM6BK09Mdij+l+jwkckSSGuGVOX6qG0lKjWZSGR43dbXQSq+O7AfSps4PQ
 D+HY0d/19iLzO9ZI2pjsLvnk0S8sbVY7t0/n1m8IXHILCglQspsK4DfeKx3NeaVWux
 V7Uhzleh+dAMA==
Message-ID: <19a1af29-19a7-a546-b565-a2cc973a7f28@collabora.com>
Date: Wed, 6 Apr 2022 12:38:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek: Correct disp_aal
 binding for MT8183
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, p.zabel@pengutronix.de, airlied@linux.ie,
 yongqiang.niu@mediatek.com, jason-jh.lin@mediatek.com,
 nancy.lin@mediatek.com, allen-kh.cheng@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220406094654.29722-1-rex-bc.chen@mediatek.com>
 <20220406094654.29722-2-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220406094654.29722-2-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_033848_801308_BA33A018 
X-CRM114-Status: GOOD (  11.21  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 06/04/22 11:46, Rex-BC Chen ha scritto:
> The driver data of MT8183 and MT8173 are different.
> The value of has_gamma for MT8173 is true while the value of MT8183 is
> false. Therefore, the compatible of disp_aal for MT8183 is not suitable
> for the compatible for MT8173.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Hello!
Yes, I definitely agree with this change, it makes no sense to have both
8173 and 8183 compatibles for 8183 (and similar).

Though, please, add a note in this commit message advertising that the
mistake was only in the yaml binding, as the driver doesn't require any
functional changes, so that things are clear for people with less expertise
on MediaTek platforms.

After that:
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
