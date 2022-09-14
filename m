Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5E50ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 07:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHIPkhw689GQVN9H2RWrVQVHLwK+Dix2WoCeayNZHHA=; b=38gv7n67mhMnxrOjuGJDH2XZ02
	2kEVn8iScGgb6ghQELhn5DuS6ISS3ByV+QBeew6ryjJOWo4H9+EkXYrUe6mAvD0tsgGp067MKJoW6
	rnB9SbVrrpjlElV41bwTozizOZBLYleo/H70YQjCNQ/p/N/qL9G2++sy/y84loj06lWMCAIoM2oZb
	vAEiCz1EE6Q8DbgkFr0Zn7uuEbbBMclfvBPIT+8AzntcwUudkuLcZIQr7Nxe/QkG+1/Ngq7k0idjy
	yxXt3YZBGlxMz4NYQ4XaphH8VVYpo6xACUd4qRQkQwC/v5ijJufksfeuDT4e6hwxcwPll4kRVuxpc
	kchs3AjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYNBa-00BqYQ-Lh; Wed, 14 Sep 2022 07:51:54 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYNAp-00Bk4Z-49; Wed, 14 Sep 2022 07:51:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D1D3660201C;
	Wed, 14 Sep 2022 08:51:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663141863;
	bh=BZ3bTim8z4XcxaNDPjTy0uVbUWkSCmK5PftKdZOvCpg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=G0SHx2R9GZNuQvlDGwSq4QsrEeyoydvoRrJGnvMNiWtxZpoYnOpPzJzBZZLeMlkyl
	 Ad1C8lwEeWsymjNn/lwdH/yQviqQZbAKUmygxW7Y/+chmXRfD69deHmUjciIzkWOpM
	 4hP3/f34STMmFAE/HRDe9K8J8w5/VCy1TO+86BEJRUZSLSkjjtuV5uFdjX/b3L1ozK
	 wIh7svgYcU6f8neoCGko9i4+x26xay22NDQB8+o01j600at+5jflR0hiZJzB12N3sL
	 esvDWUfSmR0687VR7lH7Z1NwLbfGM+iTBbJcW62H5KWJ/t8T68tyzMrrwgywUTB5UF
	 dic9YkzDb3E7Q==
Message-ID: <b8f71935-bde0-ed2d-049e-cb64f8f0da6a@collabora.com>
Date: Wed, 14 Sep 2022 09:50:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 5/7] phy: phy-mtk-tphy: disable gpio mode for all usb2
 phys
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>
References: <20220914060746.10004-1-chunfeng.yun@mediatek.com>
 <20220914060746.10004-5-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220914060746.10004-5-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_005107_407919_229B9258 
X-CRM114-Status: UNSURE (   6.75  )
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

Il 14/09/22 08:07, Chunfeng Yun ha scritto:
> Disable DP/DM's GPIO mode for all usb2 phy, not only for the first
> usb2 phy which usually supports dual-role mode.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



