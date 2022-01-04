Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3974CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 15:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sujFIY0QpgG6vrv3yC8S9DGghoZSgXjMr8vCxmEQfCM=; b=nudJx1QQoG8uPS6v/d/uqPNRr4
	vTGQR8ZEPxEkKiyqsrCzru9dKK48hfIrWTTk3ooTy+DiGOekgGfkdTKu22CV9h8bQ4DxsRd4YyylJ
	k4FPozKIbDwI61ixBS7le43x/K1n2bhbDa1D+9J1jLt+ipXUEwMHwromczebNI/UzbbIH4/KrO7gD
	OxmI+ve3ijWpfRHtZ4ahxWW8iKd/12EYjjViL4Z/CVcLQhor16lPGnicRTb3drCbP0ZAzGM3g/fDu
	4PtEXUgKLc2mKfZMiu0imwRxINGnBy4H73aGkq1kjY3ZuMo21eBh4syJqkMzeeb6IoAyC5x72YIZI
	VDPpuJUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4m9y-00C587-Jr; Tue, 04 Jan 2022 15:55:38 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m8n-00C470-DO; Tue, 04 Jan 2022 15:54:27 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5FF1A1F43593
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311664;
 bh=z8b4JgrEINeDdHaIUQNnWliGF0ifNcQlBrAvNR4lIjA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RIApkZCMkaFcib0aBu9CH9SoagjUf5BxhxJF4rMLq9d8min2nzflzYPa4uPoCn6Bz
 xQtr2frS8nyypu+J5vauINYYcwtNZA3CJ9SzP7gmHS2YTTWR9qyRTyBnl+LojUmG1S
 t6K7SXfjZ1LwtD6QCJPb41VsanF6DZrzmQJB1eIPniiBMHkdLzykaThTLtCd3O6IEY
 WYh2OaowGW6mYrkQmK3qzAfWT6XtHQiHOUrC71BUx4eVdPDo4DMknqv8L5gw31fQgY
 NY9U4jmNYy8qxqW6x1j1/hV25zioi207s+3xItCCFFBRKzBvXByWQnPmp6tDVtskmg
 g0iPgonHSmZuQ==
Subject: Re: [PATCH v3 27/33] iommu/mediatek: Initialise bank HW for each a
 bank
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, chao.hao@mediatek.com,
 yen-chang.chen@mediatek.com
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-28-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <af588804-041c-b382-e5e4-4dfd0506b439@collabora.com>
Date: Tue, 4 Jan 2022 16:54:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-28-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075425_658705_8A9A350E 
X-CRM114-Status: GOOD (  14.04  )
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

Il 23/09/21 13:58, Yong Wu ha scritto:
> The mt8195 IOMMU HW max support 5 banks, and regarding the banks'
> registers, it looks like:
> 
>   ----------------------------------------
>   |bank0  | bank1 | bank2 | bank3 | bank4|
>   ----------------------------------------
>   |global |
>   |control|         null
>   |regs   |
>   -----------------------------------------
>   |bank   |bank   |bank   |bank   |bank   |
>   |regs   |regs   |regs   |regs   |regs   |
>   |       |       |       |       |       |
>   -----------------------------------------
> 
> Each bank has some special bank registers and it share bank0's global
> control registers. this patch initialise the bank hw with the bankid.
> 
> In the hw_init, we always initialise bank0's control register since
> we don't know if the bank0 is initialised.
> 
> Additionally, About each bank's register base, always delta 0x1000.
> like bank[x + 1] = bank[x] + 0x1000.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
