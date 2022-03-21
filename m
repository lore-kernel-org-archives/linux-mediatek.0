Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED95C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 23:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uM965ZY0leJ8BIsyx2r+bXDZV38FFDU/CEVqrh/GX0Q=; b=G9HMoHXAU92K5j
	ytulgHkK2QfsHEODt+mk8pGZUYQ/N36NMFYJpgcuhorTs+sNyVwGICTiu4/dJoBMh4tBJhg5ijyVl
	y83wQ2y6lLYMLJG/wy4DlD1gzmlgTVKrU+zsrg6MUVzself5utqK1sar05SLlft+AXIkOj2fWKriF
	qWmlGQe5pHNen9E90AKC9LTWZAPr9DEsJhxWroOIDpiTaLs3lOkipBMaXyiIkf2PF0/eJLIK0RdAp
	CCSghwGzepadjlgtwyXIbrXrwwpwnBhTTjb2yJ/dyYBIWNnOD7O/V4Lf6AZ7WBzq+0KdhFh5yhs/g
	LsJS5WX5aMHjOWeowQ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWRfV-009Ruj-8N; Mon, 21 Mar 2022 23:42:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWRfR-009Ru5-Jd; Mon, 21 Mar 2022 23:42:31 +0000
X-UUID: 9b05282119a04f9991d9d3e810cc099a-20220321
X-UUID: 9b05282119a04f9991d9d3e810cc099a-20220321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 487124177; Mon, 21 Mar 2022 16:40:48 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 16:30:46 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 07:30:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 22 Mar 2022 07:30:45 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <trevor.wu@mediatek.com>
CC: <aaronyu@google.com>, <alsa-devel@alsa-project.org>,
 <angelogioacchino.delregno@collabora.com>, <broonie@kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <tiwai@suse.com>,
 <tzungbi@google.com>, <yc.hung@mediatek.com>
Subject: Re: [PATCH v3 3/6] ASoC: dt-bindings: mediatek: mt8195: merge mt8195
 machine yaml
Date: Tue, 22 Mar 2022 07:30:45 +0800
Message-ID: <20220321233045.22156-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220321072312.14972-4-trevor.wu@mediatek.com>
References: <20220321072312.14972-4-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_164229_662959_C8D9E3BA 
X-CRM114-Status: UNSURE (   6.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Trevor,

>  
> -title: Mediatek MT8195 with MT6359, RT1019 and RT5682 ASoC sound card driver
> +title: Mediatek MT8195 ASoC sound card driver

s/Mediatek/MediaTek/

Thanks,
Miles
>  
>  maintainers:
>    - Trevor Wu <trevor.wu@mediatek.com>
> @@ -14,7 +14,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt8195_mt6359_rt1019_rt5682
> +    enum:
> +      - mediatek,mt8195_mt6359_rt1019_rt5682
> +      - mediatek,mt8195_mt6359_rt1011_rt5682
>  
>    model:
>      $ref: /schemas/types.yaml#/definitions/string

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
