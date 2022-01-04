Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57040C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3smfqJSTKYaQEUBY3u/EmItPM4SIb3c6SmUhzo5jijA=; b=aHzJH6RsGx2c31+X5eYZgjkBbd
	fKOldXNAKo62LNTNYiiNDId7RMpl1rV3mSVUVsdYxeDMJfqjMRSOu7OybFz+4YjhOpXMEcCdb2poS
	HHj1ZynzheR+6+UE9XM8YAoN4E1Kw13mcrxJ4BPBXyjYmaKRbbiuwwBCS4Eev/gy+t+BrxV7pdIVO
	1DLu2XcZgckKdgsNTM9b6NQJpmSvV7lRmQvz2GUx100bioOcDCZJiLyQ5kL/Tr7NTvaa249ayPMW6
	Y27+oJiG2CrYGarFfsme9ZaGTM8iCapGKjS8AevOSlBp5r8Oq+i22y7bRtG+J7TsrtjucgKRYzbmY
	AYnrPdRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mDP-00C7Av-EI; Tue, 04 Jan 2022 15:59:11 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m9F-00C4SI-Nl; Tue, 04 Jan 2022 15:54:55 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 697211F43596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311692;
 bh=vzayMLDZjmuU/T7YRMHDZIjwrs5CK4WTNFLBnmYiBTM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=mD36jnzaMKvD5o+7fxeQ1bkd+sQm/XLb8FjaIhnKMzkK2CsWfRbrZmigtOFTlt1/K
 sAGzUAavQU3lTvSsdZS4u7UYa2Ik5Cs9xO7IKDfRjCa0TemdEZ2rn4JL7fbHr56a2h
 Q3Mh+MZNkZlQSr7c6qXpeBIp57Qp/NXSgBql5uLQPPEVfqCX3IUxugzBTd1H/z5jIV
 NxfsCqAp3cbZi0eb0jYP989vSqVVG6nelZoL78ISk34B0s8Ijq+EjScT+VfPbUIFWn
 foxdsPlOvKVhui2Tk39F2rFq/5CBySmx5ULpDbH4j5TEyFkalGdxcuro/ws7hUF3O/
 04kY2M0JoWVHQ==
Subject: Re: [PATCH v3 07/33] iommu/mediatek: Add a flag DCM_DISABLE
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
 <20210923115840.17813-8-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <4b48b8ee-422b-b3b1-acdc-4e0c0085a20a@collabora.com>
Date: Tue, 4 Jan 2022 16:54:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-8-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075454_026323_8B2BEB4C 
X-CRM114-Status: GOOD (  10.33  )
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
> In the infra iommu, we should disable DCM. add a new flag for this.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
