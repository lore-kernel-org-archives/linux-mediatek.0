Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97705C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2MLXQJnOuIPYoGy0yr0oQ3vnc0NmhQBx51cl0I1Cjo=; b=ndNO041i1MzeTy+nD6OPjSswLb
	3EO7t+WpDei1Ljz4h2Nl3iLQf93LHKbxZp1DqBOFfSLV6w59R2/DywMLNt4v9sTsc084cVmCRHdXC
	2mzJi+Tntnz5+Hbw6ZC9K1NpzrE/aMY1s0o9fSxIsxK1YzLWt0prH1aquJaPpnw0MMktEhh8++sWn
	Z9s91rVfsxB0xGZSRx2kgr+fKBKHZVBxdDpL7jGgOX2f0cy5vdqeSVEp3ILzGnN72SXOC+VQ9nT68
	XoOHapXgwqv2XScRHCcFbPJXRr57qKRBiIziZHPPeWd4nt1igqudWqjCc/fNMWZeAJC92UTeC1/K0
	PBKuThgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mF6-00C7xu-QQ; Tue, 04 Jan 2022 16:00:56 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m9L-00C4Xh-Dj; Tue, 04 Jan 2022 15:55:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 02C4E1F43595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311698;
 bh=chdnCOkGZy0A9uOFAgo19cZHBIHzLzuSg8BWqq7GwWY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=P2YkueBJHCs9rKKoRIim2/R1yHyL8imeEhKrUankAp6kj9RYiCeuE5gxKvGv3lYcx
 7Eul/z3XnMZ1CAHN//bkD2TCEIDmF5XA+ssEQv7fUXjgp6NsK03Lvwu+HSX+4WMfCF
 4PbDGDegE14F7sKZkllpx7/WGhCurmyrfO7bEinIYWi6/QAQuK98DAp+g8n3bNQ+U2
 yNO/FZt4moMj2ObV+NQk3iPDciJyu5OpcJhw9sLGG5iA9uze+iSwEs308VlshEYCgC
 w2VBOcSHwX0YSctDUsWKTDSBa10kT3no0O90L7CpCH/vVMueyS1nKDvU3uxeQ8tGo1
 h6az5qV6qDLqw==
Subject: Re: [PATCH v3 20/33] iommu/mediatek: Allow IOMMU_DOMAIN_UNMANAGED for
 PCIe VFIO
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
 <20210923115840.17813-21-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <d10be4b8-c095-7a20-c6b5-c3b63dfd31e6@collabora.com>
Date: Tue, 4 Jan 2022 16:54:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-21-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075459_665807_77F822F3 
X-CRM114-Status: UNSURE (   9.99  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/09/21 13:58, Yong Wu ha scritto:
> Allow the type IOMMU_DOMAIN_UNMANAGED since vfio_iommu_type1.c always call
> iommu_domain_alloc. The PCIe EP works ok when going through vfio.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>



Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
