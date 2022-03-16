Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D54EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 10:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7K7osKxvL035iOXe02zH2RbqDMUei6SEA9XSylbOrkg=; b=GZOIG/9lwBe7+t
	I+NlScqhLkFnU0ZSDlcjtZOf7/ugVgQvQKrayAzBrT2JJQ/CH937MVN67nHMzMvzXVYQixvgdrat5
	gWIsc7qJgJj+8G1dHiF9h1SJIjDf8aiX7s8DqQ8aGGRoVmT4Ns9Oe2toJ+85XYZvYQvQmoyf2vGfS
	47twJbA2m13dW0rC7ErGdS2rBgSw/xWotlmuS8x4NcsIc4hWQN7yLSwJvwiZJMQO8dvbYATNSpfDC
	9Lynsup6nJcoXMKOLdgq1AYHncmmhzLvDlUccCEp0Frq4adYJeu5LvVRGSVxS2rKL7UN2XYyvxYNH
	ksgWFq/x82cWeZ0x3zdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUR6i-00CVh3-Kh; Wed, 16 Mar 2022 10:42:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUR6V-00CVdb-En; Wed, 16 Mar 2022 10:42:10 +0000
X-UUID: 369b5faa93634440ab869ded48abae43-20220316
X-UUID: 369b5faa93634440ab869ded48abae43-20220316
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 62668293; Wed, 16 Mar 2022 03:42:01 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Mar 2022 03:41:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 16 Mar 2022 18:41:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Mar 2022 18:41:08 +0800
Message-ID: <9b4deaeb6ab6baaaf771e817f9c2163111796bb9.camel@mediatek.com>
Subject: Re: [V2: 1/1] dt-bindings: media: mtk-vcodec: Adds encoder
 dt-bindings for mt8186
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
Date: Wed, 16 Mar 2022 18:41:09 +0800
In-Reply-To: <1647416417-15176-2-git-send-email-kyrie.wu@mediatek.com>
References: <1647416417-15176-1-git-send-email-kyrie.wu@mediatek.com>
 <1647416417-15176-2-git-send-email-kyrie.wu@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_034207_517167_9ABD1532 
X-CRM114-Status: GOOD (  13.32  )
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

On Wed, 2022-03-16 at 15:40 +0800, kyrie.wu wrote:
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
> index e7b65a91c92c..6d52947f30a5 100644
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
Hello Kyrie,

As metioned in v1, I think it's better to move the 8186 below 8183.

BRs,
Rex
>    reg:
>      maxItems: 1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
