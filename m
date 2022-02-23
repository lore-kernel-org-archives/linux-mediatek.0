Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED94C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Feb 2022 13:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c4ch6n23prJAUS0HUNiQq61feaM/Uz0lYkCpW5oZRWo=; b=4IvY3+zV25s2Bv
	H1y5XUezyUnW7BXo1R11T6XV9DX6litgD6yZ9PTaYJ8ByJlzcZG2jQrOstRFysOgRaQ/+XNPBW0w1
	4FZHxCSkVl5/8eNfQFImPyp/TVMoQA4LDKHa5eC8m1YC6bt4LvRLPYv5T/24lFdKk/JIHSfRJMJeV
	I+ZPzoOLdTqzkwsHkbaHKZDRaFjsgsCYh+2RsKn8bBpaW/rd9dNFVWmdRaJsa1EaGmubrejcq6kaO
	i0tsk44vrgZ0Xkv8nU+RhdlsQvVMxOj+dHoQXKD7oKqX4kUVMjOyUCqjbd96eypO4Xc5V4fh4NNg/
	G8Wd492ohDowv0dS2y+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMrHh-00EKWX-MY; Wed, 23 Feb 2022 13:02:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMqtd-00ECdG-T3; Wed, 23 Feb 2022 12:37:31 +0000
X-UUID: 4c9e31cd193740ee8ec3f2580f7533e5-20220223
X-UUID: 4c9e31cd193740ee8ec3f2580f7533e5-20220223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1752519353; Wed, 23 Feb 2022 05:37:22 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 04:37:20 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 23 Feb 2022 20:37:19 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Feb 2022 20:37:19 +0800
Message-ID: <af9e763d302ae08e1da42c1e91fa8b5519db5c9d.camel@mediatek.com>
Subject: Re: [1/2] dt-bindings: media: mtk-vcodec: Adds encoder dt-bindings
 for mt8186
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: kyrie.wu <kyrie.wu@mediatek.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tzung-Bi Shih
 <tzungbi@chromium.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, Tomasz Figa <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <maoguang.meng@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Wed, 23 Feb 2022 20:37:19 +0800
In-Reply-To: <1645617086-18841-2-git-send-email-kyrie.wu@mediatek.com>
References: <1645617086-18841-1-git-send-email-kyrie.wu@mediatek.com>
 <1645617086-18841-2-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_043730_003093_CB9D451C 
X-CRM114-Status: GOOD (  14.08  )
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

Hello Kyrie,

Could you move the 8186 below 8183?
I think it's better to match alphabetical order.

BRs,
Rex

On Wed, 2022-02-23 at 19:51 +0800, kyrie.wu wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> Adds encoder dt-bindings for mt8186.
> 
> Signed-off-by: kyrie wu <kyrie.wu@mediatek.com>
> ---
>  .../devicetree/bindings/media/mediatek,vcodec-encoder.yaml       | 1
> +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> encoder.yaml
> b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> encoder.yaml
> index b72c1a50e89e..1fb9908b7454 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,vcodec-
> encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-
> encoder.yaml
> @@ -22,6 +22,7 @@ properties:
>        - mediatek,mt8183-vcodec-enc
>        - mediatek,mt8192-vcodec-enc
>        - mediatek,mt8195-vcodec-enc
> +      - mediatek,mt8186-vcodec-enc
>  
>    reg:
>      maxItems: 1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
