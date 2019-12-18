Return-Path: <SRS0=QBl7=2I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D299CC43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 05:51:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99551206EC
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Dec 2019 05:51:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QciT6Tb4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="twhGNb1s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99551206EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LZZyK6uRFfF4gnWgP73BkDDgRamlPPHZAuCMEIY7ka8=; b=QciT6Tb4Y5EhP2
	BzmFQVI7UoC7YOK5GbqWR8yo2xb2AAxf4A6Tnvjd++fR2Hd0oT+uXMh2FPTVOJJzXBCtMe2GiLoMy
	FjfsHT/5a9qHA9eoM9vmnKyQyQmfk7GCe4hQ1AFfggmdH4nUZl+chao4LlAKR2sMwjBYzDcjUHaXv
	PJwe/nE1ulX2YWwzmMnVqR+fsCdwHFLSKKqFustu1amusXebcZnG3uBUaYDIATCTeH0vJyyo5O4GT
	KDqiYQSc/63pe2DfvM9tcSdG3iz6biWiMGp3/DgX6nowRUTbVtb9lEHVQo8eMz2/rIN9C6WmPLl2F
	AWApjH7l0sB6nBPJr6gQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihSFP-0006pq-9b; Wed, 18 Dec 2019 05:51:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihSFL-0006ow-Ol
 for linux-mediatek@lists.infradead.org; Wed, 18 Dec 2019 05:51:45 +0000
X-UUID: fcd3a00c417b464abe30323522bd4e52-20191217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kekEdDqgpJakyxhI05Eo5niVp+Cj3bY7GT/GLsY78ko=; 
 b=twhGNb1sxlKvoEm59N9ojZB5ckhYNTdiM14CQJ3u2WENm8P0yzrVLnt3nc9KLCqDzOmGBOSqIESHIJ1qpsnpKzi3+jgIu3ShWDYUUssmwuTwMfJq6E7uuNB364uAhKqwmv688LLvIUjEOHDbWFYzxiNG4aMzE+2D15dvZAt2NSY=;
X-UUID: fcd3a00c417b464abe30323522bd4e52-20191217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 375550637; Tue, 17 Dec 2019 21:51:37 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 17 Dec 2019 21:41:48 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 18 Dec 2019 13:41:00 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 18 Dec 2019 13:40:39 +0800
Message-ID: <1576647693.15003.11.camel@mtksdaap41>
Subject: Re: [PATCH 1/4] dt-binds: display: mediatek: add property to
 control mipi tx drive current
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Wed, 18 Dec 2019 13:41:33 +0800
In-Reply-To: <20191216082937.119164-2-jitao.shi@mediatek.com>
References: <20191216082937.119164-1-jitao.shi@mediatek.com>
 <20191216082937.119164-2-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1DA0C317F4B4323403052D3798DC4C90F37261A92771694E211F6DEDF72998F82000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_215143_816691_CD94EBD8 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: bibby.hsieh@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, stonea168@163.com, cawa.cheng@mediatek.com,
 dri-devel@lists.freedesktop.org, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Jitao:

On Mon, 2019-12-16 at 16:29 +0800, Jitao Shi wrote:
> Add a property to control mipi tx drive current:
> "mipitx-current-drive"
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dsi.txt     | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> index a19a6cc375ed..780201ddcd5c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.txt
> @@ -33,6 +33,9 @@ Required properties:
>  - #clock-cells: must be <0>;
>  - #phy-cells: must be <0>.
>  
> +Optional properties:
> +- mipitx-current-drive: adjust driving current, should be 1 ~ 0xF
> +

In "[PATCH 3/4] drm/mediatek: add the mipitx driving control" [1], I see
that you actually control a register its name is MIPITX_VOLTAGE_SEL, so
I guess this control the voltage. If mipi_tx has the ability to control
the voltage, could we just treat mipi_tx as a regulator? For a
regulator, regulator-min-microvolt and regulator-max-microvolt would
limit the volt range and you could get it by
of_get_regulator_init_data(). If it actually control the current,
regulator-min-microamp and regulator-max-microamp could be used. I'm not
expert on this, so please give me more information on this.

[1]
http://lists.infradead.org/pipermail/linux-mediatek/2019-December/025638.html

Regards,
CK

>  Example:
>  
>  mipi_tx0: mipi-dphy@10215000 {
> @@ -42,6 +45,7 @@ mipi_tx0: mipi-dphy@10215000 {
>  	clock-output-names = "mipi_tx0_pll";
>  	#clock-cells = <0>;
>  	#phy-cells = <0>;
> +	mipitx-current-drive = <0x8>;
>  };
>  
>  dsi0: dsi@1401b000 {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
