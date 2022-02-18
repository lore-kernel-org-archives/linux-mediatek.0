Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6E4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HLt3Vv50iMldhozRPKsfHky/lWrLG2HNTiF3GD886w=; b=O8IE9yN3tmYtkp
	Y+1UREx9vqkXglqrrLQ/rverNYq/0/Tzh9SkjFXFTlupgQfD9lj0gmbVMulqMU624cktwrd1nvm2M
	yk+TYnnOZB5GzZflh4+/0D9N/CK8GxoiFqzqn+roGz7As5VoxLM1ghy0tIqxMYgGxHlnEFEYxEBQC
	1rQbAYMxwzGCXGlg3WMV2q0NiuEF4htBM6fWOa8q1GTnW3gYh53capr0AhaAqs1nRWB8yZLpXPi8G
	mGlapQt3d1L6XRukREjvODxZyJ5PM+I1ONJhJ7j6dqk7cGIArw5g1eW4UzAnc0y9TypQGqYRJxWDG
	SgMBKbTI11+HStPBG9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL37J-00EUOY-2T; Fri, 18 Feb 2022 13:16:09 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2kS-00EKCl-Tx; Fri, 18 Feb 2022 12:52:35 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 284BB1F469B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188751;
 bh=yHDbz65IOr6g3ppelLD5Jk+jL9V5d6x0E66r5ToMDm0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=k08DZUBBKIVt/8PeW/wF/8J22fbzm3781RPF5QTXz8x3CXocP5/mXRKIzO4QnW5B2
 S4NmCmD7rbrNkwFQfWBmZS0y3PVU14zr9OEy6XVok0x8GGwGxS5wa45X3uqcVdPSaV
 ODPoqGXYiGjccJ0BhbpqB8fhxQNKjMh1qsWeLnn+GwaET4hLQGucbOb/NjNofqMobG
 xXARnFdQ1Zo1qeg3EUqyzUVau4fJcw7TifDm2A4FjacZ2eCOv/l31E6Qtoc/M7s61f
 KNlDmFx1BJdfV+/nvOof1oaNJa5z3+6mecEMB/5crGF2vTuCGAEVFRJKCE5Rls2/Tt
 Yn2KpWDJJfldw==
Message-ID: <b0099ae4-922d-8096-0b6a-ec3595c65b7a@collabora.com>
Date: Fri, 18 Feb 2022 13:52:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 25/34] iommu/mediatek: Separate mtk_iommu_data for v1
 and v2
Content-Language: en-US
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
References: <20220217113453.13658-1-yong.wu@mediatek.com>
 <20220217113453.13658-26-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220217113453.13658-26-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045233_193964_6F1A9856 
X-CRM114-Status: GOOD (  12.72  )
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

Il 17/02/22 12:34, Yong Wu ha scritto:
> Prepare for adding the structure "mtk_iommu_bank_data". No functional
> change. The mtk_iommu_domain in v1 and v2 are different, we could not add
> current data as bank[0] in v1 simplistically.
> 
> Currently we have no plan to add new SoC for v1, in order to avoid affect
> v1 when we add many new features for v2, I totally separate v1 and v2 in
> this patch, there are many structures only for v2.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/iommu/mtk_iommu.c    | 82 +++++++++++++++++++++++++++++++++---
>   drivers/iommu/mtk_iommu.h    | 81 -----------------------------------
>   drivers/iommu/mtk_iommu_v1.c | 29 +++++++++++++
>   3 files changed, 106 insertions(+), 86 deletions(-)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
