Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E51C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 11:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L33nXJEqiMXh3y5B1ioivagVx1a/MDoTej9BDYMxxHQ=; b=Wv1kAZMtqIUStadSCfDttNF1JS
	lCpcfmmrOrO5L1EYCvUtlep5lzFPQOwCEty98Bbm5bqk+oypxpDpDZg1Lz4LUhsZ5BVWk/+efQUdS
	FUcgBUMjpWz05CnV0pGGjVRqmKKguNynDDAzfTgsNjJOgT/54YqFSzSjbqJ2uLGF3mphbhkEgYGab
	ozTfx2bBTZnjeplnNtD+vp/GJnBtmIc0pE84LnZEC4gh31CRpP6JFlBFpv5lbX9/GuJQgBCf18B3G
	qAPccYYuxqIw+NrsYQKJu8ZNHiVG4ZF1maUAytPMHY1UMJ5bCk+Ry1E3Wff5bWOG8OABh3zeHlxy/
	NfpYPSEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2eI-00FK3O-Kb; Thu, 27 Jan 2022 11:09:06 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2dW-00FJjq-Vi; Thu, 27 Jan 2022 11:08:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B3DAE1F4508E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643281697;
 bh=pD9noCDXkcqAB6AAEiwPfDWrkWdMpDGOBwLRXgaqv88=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=nnr3GMbFnt1x0OVs6l9kutbE+Fhxml6aliTz565q+5SVqy4sw+hWTa4e4tIJ7s8KK
 7OZQktfsBd+vF8FQWQ387uWoUXxBhkhIU7Xgvp4cd0OR/GNnhR/+Mt77PYInVxSos5
 u8ADJBg9wKFE2heP+yjGZnaaanYyDUvVVHwvkEZvyShsYdGMru/z2Mgavi26kH+2Vv
 O5LAfbiimj56jRKhqv7szsvodmnHcIBpvCrt2A7F6PSbJzKkOvcaLWWnjiRahNbVft
 QJ+mZ0S4t6tlmmF12a4tRo5mZMbG9w3uHFbJNN5VReFFx/V0ty2femMGdtr+6z++kI
 FSUugopXN6eeQ==
Subject: Re: [PATCH v4 08/35] iommu/mediatek: Use kmalloc for protect buffer
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
 <20220125085634.17972-9-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <ca47becf-adc9-f11e-5e59-03f203920344@collabora.com>
Date: Thu, 27 Jan 2022 12:08:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220125085634.17972-9-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_030819_199326_D1CB7FD1 
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
> No need zero for the protect buffer that is only accessed by the IOMMU HW
> translation fault happened.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

I would rather keep this a devm_kzalloc instead... the cost is very minimal and
this will be handy when new hardware will be introduced, as it may require a bigger
buffer: in that case, "older" platforms will use only part of it and we may get
garbage data at the end.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
