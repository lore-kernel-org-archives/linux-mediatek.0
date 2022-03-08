Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4243AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 00:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWuNyPBZt2hKRclaPZVmF8KM/9eGLU7O6GsNRhfmzVA=; b=sAYGSTpuvmi/Ql
	p+PMBNj9X8tqlGc85PcigiWSNrO/4p7v6TYqV73tz2tGmX58CTqD6EVerx5p5BU7LFhJuwxch4Mh+
	kCq0Q8amvZBzScOk/xPTL4ygEDn+ETk7WN78eHdUlLehge48Abai6K9gpbDg2jjO+VQYOPC18cr4d
	hA9dgbGpczfZl68qk7I87CW6IpMcAuQErkoQYN69UtmY4lhHIVtQtLBnH7UeEfMu/TVYRiTHxM3dV
	DQC4RiUhLsM4PqGd8oziNQPkIINwcnGVjPoOt3JVLhnonIIrGyJl0O7UUaCbMLSrc1yQM/OcqkshM
	D59yE+wTGmwv9gHrh0UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRO2X-002DYP-Of; Tue, 08 Mar 2022 00:49:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRO2K-002DUR-Ri; Tue, 08 Mar 2022 00:49:14 +0000
X-UUID: 48a55b8e00fe4f37a3a0efd1a67afe2d-20220307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=VcYja5fm478uG3MPEg8pagOMdQq+iTKg8ydzEqafxnM=; 
 b=H9QIyYLyQ5CJ/E3ed+Tntg/nUaFmbZ+chUxK7NybW3vyTDssY1F0VtZWdZLBo0nR6K8k6Gm6AidHAbtAEyoCgBu3wg3zqBYBseqKyqPSW9NcdWvhHj9IEGoVX6BcE0UrUOtrPjIHkwUBSmAhj6EBhNxH9y6hJgIxYCZ4lYYBMO8=;
X-UUID: 48a55b8e00fe4f37a3a0efd1a67afe2d-20220307
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 925448945; Mon, 07 Mar 2022 17:49:06 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Mar 2022 16:48:41 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 8 Mar 2022 08:48:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 8 Mar 2022 08:48:38 +0800
Message-ID: <731cc7131849095bcbe50e7929b1b9d7e76c766e.camel@mediatek.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: update bindings for MT8168 SoC
From: Qii Wang <qii.wang@mediatek.com>
To: Kewei Xu <kewei.xu@mediatek.com>, <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
 <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <liguo.zhang@mediatek.com>,
 <caiyu.chen@mediatek.com>, <housong.zhang@mediatek.com>,
 <yuhan.wei@mediatek.com>
Date: Tue, 8 Mar 2022 08:48:38 +0800
In-Reply-To: <20220307033649.11564-2-kewei.xu@mediatek.com>
References: <20220307033649.11564-1-kewei.xu@mediatek.com>
 <20220307033649.11564-2-kewei.xu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_164912_927735_F0727230 
X-CRM114-Status: GOOD (  11.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2022-03-07 at 11:36 +0800, Kewei Xu wrote:
> Add a DT binding documentation for the MT8168 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

Reviewed-by: Qii Wang <qii.wang@mediatek.com>

> ---
>  Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> index 88f74a3c81ec..026985b8f61a 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> @@ -12,6 +12,7 @@ Required properties:
>        "mediatek,mt7622-i2c": for MediaTek MT7622
>        "mediatek,mt7623-i2c", "mediatek,mt6577-i2c": for MediaTek
> MT7623
>        "mediatek,mt7629-i2c", "mediatek,mt2712-i2c": for MediaTek
> MT7629
> +      "mediatek,mt8168-i2c": for MediaTek MT8168
>        "mediatek,mt8173-i2c": for MediaTek MT8173
>        "mediatek,mt8183-i2c": for MediaTek MT8183
>        "mediatek,mt8186-i2c": for MediaTek MT8186
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
