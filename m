Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C5BC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2eDgKNb1Y3N/a9EojZpRQ3AHC5ne8EeQmzh03t63NA4=; b=4k7nQbpCfhUA3ngyEZJgx36snQ
	1g50wy2HChOsEc0LgTOPz8LDHPQepJEqptlJKLYsNa/BXfhgq4fhiZ+D6cDg0kW2fLMVLopJY1vic
	Bfc4Gx+gaoneenNW6/TDDs17pc7NWBIWOuuJzf24eCld84rm+H7sG1x7/lOgCLLFSEaiTEr7nQp7N
	HePZ7CQg/zy/W6IrxGb3YRVkPdxsD0ZfsOCH2x2Ge0EIPCwjrpqXvsTYPIjIRuxOsePIwvzZjoRoH
	n9VYNuK3ynMysQA6T2X9sAmPEqDmOsP9GEw4372aDfCfFzvaq3N/APC7RuAyLlOsk2bqMQUgEbhMg
	AXQmcQWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mPv-00CD0c-Pr; Tue, 04 Jan 2022 16:12:07 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4mAB-00C5HM-84; Tue, 04 Jan 2022 15:55:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3F0BA1F43593
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311750;
 bh=xfvIzyJHMkDZP1e9u2yfDSHp2jeB+W9uFbn9UswbT0Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bwlABhPSumyKxseog6CQy9zWKiKTLbBbFVRnwlqfAusVMPEcuOabM19Dm9AD+pqak
 RmrVCYDbJV1zhCBxr/vC6AxIbq8pvQ8JqqO8IWqXpL5Erhsj2NrC3YHkGnluGC35/e
 pJogO5aqPgbSKfFbv+paLvf7FW8k06J6heDnHWJ76gcbgsxfWx7p69ij1vTEoi0H0W
 jg3+C0RxGyfOdSo3B/H2fPk7KFo7WrcOsjvCjW2HH16Tx6vQMAP4tI3coZYCzP08AW
 KKDZ6dZxadOqdy9gBwKII1ZvK5BM4nzUMLxeyJTYJTHQey26U++krzElrqvR/I854c
 g8XjyIWvfNscg==
Subject: Re: [PATCH v3 15/33] iommu/mediatek: Add SUB_COMMON_3BITS flag
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
 <20210923115840.17813-16-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <4a9660ad-032a-5319-de29-d088e607310d@collabora.com>
Date: Tue, 4 Jan 2022 16:55:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-16-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075551_463921_FEECC56A 
X-CRM114-Status: GOOD (  12.06  )
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
> In prevous SoC, the sub common id occupy 2 bits. the mt8195's sub common
> id has 3bits. Add a new flag for this. and rename the prevous flag to
> _2BITS. For readable, I put these two flags together, then move the
> other flags. no functional change.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
