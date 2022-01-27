Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 316C7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 11:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qL2TohFtcH2f3JVmHlTX205kIc/fkiYW9VkuLW+bHrY=; b=LvtDUVu23xbJ+7QkEb0aZcYvZ7
	NKsboug6/Rpru7YOo7HhR3wTtEwj1SMM9QNBq/GvVgQSMlay55nBZHp0iYAOhj0hhnBUY7mOH+PyW
	8V+bG7ncmtSS1foMN+kgp9o3ZaoJtyqf8rz1C+CjluoQAo1ZmSNvTl1+NQAEs9a63HdHMYnrtuGf2
	6VHNJQjKh42eYbzRNPfj7bffyuofWcPkjxLQPAtY8zmVMuztF8VlaMQiJAjtvuqBd3jIBQyrUCxsS
	4mhHbAqiSVDBrP82hyW0Gz/wqsfmUMIr32Q+Uzi3WG7W8hjvolIK/VbJAowv4pqsMa3ulHsIRvO5V
	5tQ2IayQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2Yk-00FIAl-2y; Thu, 27 Jan 2022 11:03:22 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2YN-00FI2D-WA; Thu, 27 Jan 2022 11:03:01 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B63611F41701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643281378;
 bh=oRWo0Veii/RC5thoeHrP2GZT3yztnRxOcV4vMVuDWrw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=DANWTO2FuWyYw+H4LLdsbFJmnTtEtz5IZacT9Oz68afHtrV7NRm06X0lo3vwg3UJm
 V1LZuevKoqhzsir9cBe8plY1suyuFyV7sLFfOgxuc21r/uzgpd02jWnsCHqmLiHZCP
 uR5XTKgXcOr1TL5PNucboFSqbHcRs9ABkmMQFjs8xQoHYsIPhgzhWT2maVE4l0K9s+
 ef1iScK99eK4ivp0lZGLoB2GEqZXSBcPJV9/Wcf0/Y/reJ5LwpgIMHW0YMqbkj6K4t
 R2mc4XPJiG5KMPSDuycY2bkNil4FYxSbh1VDKJgzorpeZBz3tYMsuAUK4IqQDu4/OY
 u8zz6qVVTth6w==
Subject: Re: [PATCH v4 07/35] iommu/mediatek: Add mutex for data in the
 mtk_iommu_domain
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com, mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
 libo.kang@mediatek.com, chengci.xu@mediatek.com
References: <20220125085634.17972-1-yong.wu@mediatek.com>
 <20220125085634.17972-8-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <8576a0c5-aa69-aaed-be48-125ae2004f47@collabora.com>
Date: Thu, 27 Jan 2022 12:02:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220125085634.17972-8-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_030300_223017_5AD6AE12 
X-CRM114-Status: GOOD (  11.65  )
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

Il 25/01/22 09:56, Yong Wu ha scritto:
> Same with the previous patch, add a mutex for the "data" in the
> mtk_iommu_domain. Just improve the safety for multi devices
> enter attach_device at the same time. We don't get the real issue
> for this.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
