Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5FFC4BA09
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 02:09:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A8721744
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 02:09:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AAHjyClI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KLZEbI3h"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07A8721744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=da18bc/8jLQCjVq3YhXzbHhhdlkRlv9t5aCOlm2Y48g=; b=AAHjyClIkykLaM
	0WGjXjETh+U75K5Bdn6YIbwAHizAJydHsBsc3fYQ6rQWF2uJyb5RXI4h/dG74nYeCVVlmVq2HqO4v
	iuSXeHAOBprbFl6Z8dfuiUu/jT/yciRA9y/hFbYG9yh0p+PnBSE7y9CFtNskvy8nWK9WMTg/DXQ75
	WfMqo8BphYPrhdETZN/sJa26gBDcVNZc/RVPZMzTuwe/s1hw7rLq8U0cvnpFrJtPt8fPhbuOMxJq4
	CpSp5IR6ka2LNOtoKs0klmvzkfSCciQHz3a0PDkWUlpSunnOLAosE2QuLL8mqrfA3MBXVmDwNQ01z
	hKGPmi9367LMNHhfD9Yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6m8D-0002j3-TQ; Wed, 26 Feb 2020 02:09:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6m82-0002bc-E6; Wed, 26 Feb 2020 02:08:51 +0000
X-UUID: d859f3ea82de4f59bb3fd5b5fd4100d3-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ju7q+m3fC5tzr5BkYbHgGDb6f000b3+zmY3EzNVVdc4=; 
 b=KLZEbI3htPZmO2LXUp0P9nUMInozvbAKjVyDRUOkMT3feU6gNXCwLlZMaQy8+p2G26GFxcNzCCBvdDAY+dzf75oRfLWs8Sn+LQ5gjXaTebhlCixKxpOMg8sLp/O8+yRaa91Qi6pE3FJSRiTMgpIC7GVEydfmNzT9aodFL2UmoG8=;
X-UUID: d859f3ea82de4f59bb3fd5b5fd4100d3-20200225
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1652373791; Tue, 25 Feb 2020 18:08:46 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 17:59:48 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 09:57:45 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 09:58:51 +0800
Message-ID: <1582682322.16944.7.camel@mtksdaap41>
Subject: Re: [PATCH v8 4/7] dt-bindings: display: mediatek: dpi sample data
 in dual edge support
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Wed, 26 Feb 2020 09:58:42 +0800
In-Reply-To: <20200225094057.120144-5-jitao.shi@mediatek.com>
References: <20200225094057.120144-1-jitao.shi@mediatek.com>
 <20200225094057.120144-5-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_180850_482749_13ECD029 
X-CRM114-Status: GOOD (  12.61  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Jitao:

On Tue, 2020-02-25 at 17:40 +0800, Jitao Shi wrote:
> Add property "pclk-sample" to config the dpi sample on falling (0),
> rising (1), both falling and rising (2).
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> index a7b1b8bfb65e..f362fff51437 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
> @@ -20,6 +20,9 @@ Required properties:
>  Optional properties:
>  - pinctrl-names: Contain "gpiomode" and "dpimode".
>    pinctrl-names see Documentation/devicetree/bindings/pinctrlpinctrl-bindings.txt
> +- pclk-sample: 0: sample in falling edge, 1: sample in rising edge, 2: sample
> +  in both falling and rising edge.

The value has been defined in video-interfaces.txt, you need not to
define it again.

Regards,
CK

> +  pclk-sample see Documentation/devicetree/bindings/media/video-interfaces.txt.
>  
>  Example:
>  
> @@ -37,6 +40,7 @@ dpi0: dpi@1401d000 {
>  
>  	port {
>  		dpi0_out: endpoint {
> +			pclk-sample = 0;
>  			remote-endpoint = <&hdmi0_in>;
>  		};
>  	};

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
