Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BE1C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 12:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqpV8YoKT8AErzR7i9Wuro16G2Qq8lnddTqrvbURv5w=; b=OFg8GvvdYHUcmb
	ZbWMFg/uQ9kpSVJmoLYAb5S7oa75LaAq9LNAGd22cO+dm2Rd3k7aOsYxsK6b8JtITj8sWo0BRdpDD
	Mmtpyv9N/7U9pWHRFbPNfPDnUMXEa3vk+d824dBjRI/g+FrKLdqA/VyjNyBnYvloL1NgnsUhUCfsF
	frdy+QRggzg4OdT5wP1Fb01vJS9HDxVXVvLRGwxdbhBMG9LiRhB3KHNN6+hErbbZXb9ey1JVluMkj
	l4IZ/v45cMJSKawithrhT+MpwxbJ7Cw/6OrIcEk4j+9d6CuIaA7Ks8sGTka6VUxKejgso6oTWrhfn
	UcsSUkm4XD9aNJSdnUoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGxX-001auY-G2; Thu, 09 Jun 2022 12:08:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzGbU-001Ru4-Ov; Thu, 09 Jun 2022 11:45:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 68302B82D36;
	Thu,  9 Jun 2022 11:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D99C34114;
	Thu,  9 Jun 2022 11:45:27 +0000 (UTC)
Message-ID: <67af0e81-3cd1-d606-9165-ddbaa237a642@xs4all.nl>
Date: Thu, 9 Jun 2022 13:45:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [RESEND,V2,0/2] Enable hardware jpeg encoder for MT8186
Content-Language: en-US
To: Irui Wang <irui.wang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tomasz Figa <tfiga@chromium.org>,
 xia.jiang@mediatek.com, maoguang.meng@mediatek.com,
 kyrie wu <kyrie.wu@mediatek.com>, srv_heupstream@mediatek.com
References: <20220609114151.19509-1-irui.wang@mediatek.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220609114151.19509-1-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_044533_021883_45C5429C 
X-CRM114-Status: GOOD (  16.15  )
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

Hi Irui,

On 6/9/22 13:41, Irui Wang wrote:
> From: kyrie wu <kyrie.wu@mediatek.com>
> 
> This series adds support for MT8186 hardware jpeg encoding.
> 
> This series has been tested with both MT8186.
> Encoding worked for this chip.
> 
> Patches 1 Adds jpeg encoder dt-bindings for mt8186
> 
> Patches 2 set bit mask for jpegenc to support 34bits iova space,
> 	which means iova rangement from 0 to 16GB.

I already made a pull request using the previous v2, and added Rob's
Reviewed-by tag manually. So I'll mark this RESEND v2 series as Superseded in
patchwork.

Regards,

	Hans

> 
> Changes compared with v1:
> --rebase on latest media_stage tree
> 
> kyrie wu (2):
>   media: media: jpegenc: add mediatek,mt8186-jpgenc compatible
>   media: media: jpegenc: set bit mask for jpegenc
> 
>  .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml    | 6 ++++++
>  drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c        | 3 +++
>  2 files changed, 9 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
