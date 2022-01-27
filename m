Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A8CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 11:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8s39kNXyamvFMCGUcnx+2zX1EqTAekuC4SnxJCSX/5M=; b=zHYUrCzbfQE0ymLCDu/6OE+u3A
	/08qHlOuewmg/3ilvTtUfy3PBFLtmzDfDl82WTOO812HIktBr//aAnz133eJtkow22hLIup6Xy3o6
	p0L1Nz8SD0AWxxuRhvv/mh61lE6f9Fd/zv6Fb35qH/ZUhHFOheELxZBZwyrG3ruIuRQR+ELcai2Ub
	7Ss8GmO2bPdxdmZfVBsPCSu6Ppf/s5n3VGT2fdFZDDiH/MYXR8peHyApieH9Rjep9zDEfcCTrkKtY
	Xh4iOcsvOMYs9qSkoflkQgAq9jlXGZSY5B8+wyroYeu20mbFrnJbMCI0lRQxpTKhZavgFpWs3mInB
	yYXuaL2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2Vr-00FH3p-3M; Thu, 27 Jan 2022 11:00:23 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2Vb-00FGyk-26; Thu, 27 Jan 2022 11:00:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A55B71F45069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643281205;
 bh=ANnHQ3AW7cDcFPINFPyo+6Bw6O0a8MPJooTmRyKn1hE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Caw17/VTX8SU25VO7GP+5IiEs1dWo3oL/oYurRO63dZMfiD658/+0GTHMpC+GisE1
 lWS7UzOfaW8MWrVl7WYfDzdSQMNihCeu4FGO71j/YRQ/27J2ALxag45996kyXvtbSH
 QJJVIzvmiXDpWGMbTtKF5pWTD2V2fSI8LjekX7tdGRbgac5fjfWx9SgJCkNQnzF/vT
 NAgc1ZxUvsccvUC5S3aUN/TU8jU+o37BlVLMwllnO5CGAUXFoL1FIJ/Y410Cm1SZas
 9u5WQxsoYUbcohM2ohbOBvPOtb5G7Hn1UEhFk4tRNJwv2Ib6Zixedmhj7Jd5uM4lHE
 of0t90CtngClw==
Subject: Re: [PATCH v4 03/35] iommu/mediatek: Fix 2 HW sharing pgtable issue
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
 <20220125085634.17972-4-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <fc505da2-809c-c466-2256-b5293f242128@collabora.com>
Date: Thu, 27 Jan 2022 11:59:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220125085634.17972-4-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_030007_276454_61928BC0 
X-CRM114-Status: GOOD (  10.38  )
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
> In the commit 4f956c97d26b ("iommu/mediatek: Move domain_finalise into
> attach_device"), I overlooked the sharing pgtable case.
> After that commit, the "data" in the mtk_iommu_domain_finalise always is
> the data of the current IOMMU HW. Fix this for the sharing pgtable case.
> 
> Only affect mt2712 which is the only SoC that share pgtable currently.
> 
> Fixes: 4f956c97d26b ("iommu/mediatek: Move domain_finalise into attach_device")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
