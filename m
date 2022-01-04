Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8AAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 15:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6QsJDhHcQe/umXFqE8qBEwhLuH4HE9PeghsZ4gcpvc=; b=tz0/PBpFc4cq4gieU+CImeJrc+
	zjEU2ZbzLw/7sWoNp8/jadF+mNeS8UBazDBLOCpA7lM2r7c/hZE2UIq2uATo8XuSwBMWneZ4tbyu6
	P064XJWzy0/+bPCO5gOtZHbRS7zdjkjhsZ/H7R2x8ugpYmbsV61Ko3Vdv+P2eqFLMHj7e1PZXcrnW
	Szp4TioOK+FrpkazglmY3V1BIP61QXN6NsBts5Etlf1ZrWLbBK/f/Qyny4QPMf6aJwUgSNeUpIyHs
	0kI6IM4tiCFXJ+PhX50C7u/4Tjzk1bNEj/Up7XuE0OsTRTg6FQx2zWzEcEe1KYkKhTXjC6c1bOKOI
	Ii6Bet5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mDK-00C78S-UP; Tue, 04 Jan 2022 15:59:07 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m9D-00C4Px-78; Tue, 04 Jan 2022 15:54:52 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0A9091F43595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311690;
 bh=JixWBKej1ixfPa77aO+5D2vj0ASC2Uq4LukcRKfv9Z0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=VHANxf2zE9WxqtsQfRJKx6SwX2NarUozgVSW91IC5zSVJlMV//NHrw5Gjbdo2Xyi2
 9DmMQx3n0jM0yz4QTW1iAa22La2iPgH41Oo0fb9P48uuMK8iyfkHmtduAZfSjygpJ8
 QtQh5VXKMR5n3hjIzJUL19zvOGdlEyIhAzrosi4iliL4oSfD5WYggfIaPhUDXBxV4r
 hkQOuUIPCNmr+N0L+/afL05OqtMFLTfIEOkVlyB/LshkDv4XhIbOFyVUwOAjd3S2Dv
 NpWxijPDULUl32hztQvwmMYoG15OKIr7zTXoYrNbgjjQ5Jnq+azdKSLfO7iHVRmk4l
 NY95NIhP+gx0A==
Subject: Re: [PATCH v3 08/33] iommu/mediatek: Add a flag NON_STD_AXI
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
 <20210923115840.17813-9-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <c8c44971-482d-6806-8209-e4da6f86551d@collabora.com>
Date: Tue, 4 Jan 2022 16:54:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-9-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075451_476921_A26DFF99 
X-CRM114-Status: GOOD (  10.62  )
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
> Add a new flag NON_STD_AXI, All the previous SoC support this flag.
> Prepare for adding infra and apu iommu which don't support this.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>



Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
