Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F94C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Feb 2022 08:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w4z2Y7mSebFClw3LKfDmpgnX/CPAwqNJxnAQ8tEDX2w=; b=RkcHWaXDFVb/s9
	gQa7DD1CdxtGX0XsrFwfNCfO53ZPvbttVJxsUV6A42yMl1iAQAXj8URx5p6xi5Ipgbzvj6ObYY6dW
	38UCvB3XzcP/WwxQWOab3I8nC7rjO2+gRY3rUGyOhWgMpm8czpstaMW4VHc13MXDBhZN9JpTxYNN9
	IVJRDhzSAmQyYt76h2Yk5VFz1Yb3CG1K2ajbVLyTdju34dSWBwSJ9znSK1P4rzDDZpGPmsz3euZxy
	bP/IEWcC5E0yN0k+mbavI4xQA+22P73PWoQ0mgTJ/OnKKGme+xMMaJ0+kVQ89ciZQsS6utI0G3ejo
	/mswG34ptja8+C58hVtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nObEA-00B62Y-5a; Mon, 28 Feb 2022 08:17:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nObDn-00B5xU-2z; Mon, 28 Feb 2022 08:17:36 +0000
X-UUID: 49ca711012324df186271f20565d9b27-20220228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OjoHF+1ss9moLBoqg3PRdagQTFqetJOYdRf/E8Njpkk=; 
 b=pDwwWvkLJq6FLvpEWtiI+RJoc9LTuTkfESNowSHv1KtXmVAb3zGp/UsknC/v0/VpryLSwiFpn6Xr1Rbymln3Hc3ARacU9RBqkKNOaARJCpVPuqYUxgrWukJ+jFjjhfmj/RliCx2z8faw+RsYteh+3MOSs2umk4lX3yMzn2B8IBg=;
X-UUID: 49ca711012324df186271f20565d9b27-20220228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1771595540; Mon, 28 Feb 2022 01:17:25 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Feb 2022 00:17:23 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 28 Feb 2022 16:17:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Feb 2022 16:17:21 +0800
Message-ID: <087a41fd768eb9fcac7e475c1e8c84590ad0b6b4.camel@mediatek.com>
Subject: Re: [PATCH] dt-bindings: usb: mtk-xhci: add compatible for mt8186
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Min Guo <Min.Guo@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Hsin-Yi Wang" <hsinyi@google.com>
Date: Mon, 28 Feb 2022 16:17:21 +0800
In-Reply-To: <20220216120025.29860-1-allen-kh.cheng@mediatek.com>
References: <20220216120025.29860-1-allen-kh.cheng@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_001732_571442_ADAEB8E5 
X-CRM114-Status: GOOD (  12.03  )
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

On Wed, 2022-02-16 at 20:00 +0800, Allen-KH Cheng wrote:
> Add compatible for mt8186
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-
> xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-
> xhci.yaml
> index 11f7bacd4e2b..6d9c3bad1d10 100644
> --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> @@ -30,6 +30,7 @@ properties:
>            - mediatek,mt7629-xhci
>            - mediatek,mt8173-xhci
>            - mediatek,mt8183-xhci
> +          - mediatek,mt8186-xhci
>            - mediatek,mt8192-xhci
>            - mediatek,mt8195-xhci
>        - const: mediatek,mtk-xhci

Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
