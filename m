Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16ECAC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jan 2022 15:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmjGrSRZ9rBrK2lBJkQHXEMogLu5VnsC22ID1BLdgP0=; b=Y82tXaeWFrSVO149dTaq2fgkUG
	+sdICo97kKnZmUsz2K7Y8QV+OJvKdN2z9GFvOrZdbqxSJpIXu7D+iSAtZIid+lobq+XtFnZcjEUcG
	tcReK+VwkJDbZ+NoyF7AusiqRyXTEzjZ0qDRmBs4N3NSh4aPjqjfrHoYvZwJpz0I6WLw+AI3Tzxp8
	yQJUYu5/QK88zDyttTbrCO2PkW8jSDaYYAYUGseSUjbiEKBH01XHNy3V2jpNlWLCkNhwqmm9c4Buv
	ez1gKx6PUGmX+t9q5n0R50uIEztvwBW1h/ysyyniAbam2fUR3rldIc/eGf490l4ieWE/QqNk08KKW
	NQo9Ou1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n82H6-006PCP-4B; Thu, 13 Jan 2022 15:44:28 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n82Gm-006P4h-VU; Thu, 13 Jan 2022 15:44:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CE6311F45F52
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642088647;
 bh=6/+dlfLNM3D+Hszt2Kwf7aTx6h2TAzm3RNgnr8cTYlc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jlRat1S8v7MXsUqwaDakFYZpb9nfOUeFwnRiVgojVB2kaP54DY/TDPrzBxZGiHBzR
 vmP/zuu2O2UrtAuYIY2k9rfhFYmIp1IXctc8f63ULezIfKZGD6EZwJE50dvhcuyVsX
 1dnZ2iE/CypEUn/mRu+oAoe1UFvO4vul0R9QZEoiNPQ1I8o0ZcnajKtj8TQOfLVpIg
 rlr34Wv92+UL6Knd68KrQUsloADAPSqIrA2aUg5SZX/8EwOtRLp5Z1/xYlSLZupE6M
 ZCoRJrIuOn5lsNbdgfiN30FTlk4moPwVCuCvKL2jpfuTNPeQjN2Tx1g145hf9Wax/r
 M35/ausu2Ha0Q==
Subject: Re: [PATCH v3 4/7] dt-bindings: memory: mediatek: Add mt8186 support
To: Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>, Tomasz Figa <tfiga@chromium.org>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, lc.kan@mediatek.com,
 yi.kuo@mediatek.com, anthony.huang@mediatek.com
References: <20220113111057.29918-1-yong.wu@mediatek.com>
 <20220113111057.29918-5-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <153264b6-1cdb-c130-d72e-6dc29bb1afd9@collabora.com>
Date: Thu, 13 Jan 2022 16:44:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220113111057.29918-5-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_074409_181053_B5A08786 
X-CRM114-Status: UNSURE (   8.89  )
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

Il 13/01/22 12:10, Yong Wu ha scritto:
> Add mt8186 smi support in the bindings.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
