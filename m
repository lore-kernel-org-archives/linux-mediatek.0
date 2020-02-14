Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14567C3B18F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 05:11:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E039E2082F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 05:11:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BariBO3S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tY83siKs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E039E2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8HR0dRKBXwaOLxsXUgHUkT1LC0nOrV2LeB6qNKbDTns=; b=BariBO3SZKmwOr
	RLSfeXLAoTWBGFSv9MauU8Zfy26G5YIBt90QEgB34LKCIXC/wGAt/9ND03tduhBlyNyyrysNQLOVd
	O8+8LlrWNT1UBVbO9+FBZ+O9et1ipRdTk/xuzEwkp8jnbeOEeSuVxep6yH3setlMA8Ws+evflgjNZ
	yr4TSm9ykQjnOmNFedNXWXu5lMOq8VuBZfkRkhS4rwoS3lo4uHRXt5g6LcvRS/kmcKa+pX1XY6ZV1
	A1oEwRbQJwlBJEkoDt7oXnD/KHoRfjB5jjjcynmYM1B2h13rFPGvKkkojrGNDT+Id8F4wSWOTNnsx
	3fvewwyEZYxOy5YAxzgA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2TFx-00026s-Ad; Fri, 14 Feb 2020 05:11:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2TFu-00026N-Kn; Fri, 14 Feb 2020 05:11:12 +0000
X-UUID: 82b12ea381a44a71bb98198cda3a2122-20200213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Nk30hZyMmCTsGuoRVVxRW3RnPZuvr/Vyq/uf64SMG/w=; 
 b=tY83siKs+zarzkOB5JykZEfAHsvV5RJJu1MFJiPLBH2DV8w0NSB2VIvtuObOXuTV8eUfDz0psN7N+s+BhRK5av/BAfHm0QTRwiHsIaMwsdOCirRLenDvyJM7ljsdiM87W47U3Z+n8M29RiND0XAXmYvWVH5Bn400+KaBPphfAhI=;
X-UUID: 82b12ea381a44a71bb98198cda3a2122-20200213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 751781098; Thu, 13 Feb 2020 21:11:05 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 21:06:05 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 14 Feb 2020 13:05:00 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 14 Feb 2020 13:05:50 +0800
Message-ID: <1581656751.9307.0.camel@mtksdaap41>
Subject: Re: [PATCH 3/3] dt-binding: gce: remove atomic_exec in mboxes property
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Fri, 14 Feb 2020 13:05:51 +0800
In-Reply-To: <20200214043325.16618-4-bibby.hsieh@mediatek.com>
References: <20200214043325.16618-1-bibby.hsieh@mediatek.com>
 <20200214043325.16618-4-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200213_211110_691660_38ED2691 
X-CRM114-Status: GOOD (  14.42  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Bibby:

On Fri, 2020-02-14 at 12:33 +0800, Bibby Hsieh wrote:
> There is not any client driver using this feature now,
> so remove it from binding.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mailbox/mtk-gce.txt | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> index 7b13787ab13d..0b5b2a6bcc48 100644
> --- a/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> +++ b/Documentation/devicetree/bindings/mailbox/mtk-gce.txt
> @@ -14,13 +14,11 @@ Required properties:
>  - interrupts: The interrupt signal from the GCE block
>  - clock: Clocks according to the common clock binding
>  - clock-names: Must be "gce" to stand for GCE clock
> -- #mbox-cells: Should be 3.
> -	<&phandle channel priority atomic_exec>
> +- #mbox-cells: Should be 2.
> +	<&phandle channel priority>
>  	phandle: Label name of a gce node.
>  	channel: Channel of mailbox. Be equal to the thread id of GCE.
>  	priority: Priority of GCE thread.
> -	atomic_exec: GCE processing continuous packets of commands in atomic
> -		way.
>  
>  Required properties for a client device:
>  - mboxes: Client use mailbox to communicate with GCE, it should have this
> @@ -54,8 +52,8 @@ Example for a client device:
>  
>  	mmsys: clock-controller@14000000 {
>  		compatible = "mediatek,mt8173-mmsys";
> -		mboxes = <&gce 0 CMDQ_THR_PRIO_LOWEST 1>,
> -			 <&gce 1 CMDQ_THR_PRIO_LOWEST 1>;
> +		mboxes = <&gce 0 CMDQ_THR_PRIO_LOWEST>,
> +			 <&gce 1 CMDQ_THR_PRIO_LOWEST>;
>  		mutex-event-eof = <CMDQ_EVENT_MUTEX0_STREAM_EOF
>  				CMDQ_EVENT_MUTEX1_STREAM_EOF>;
>  		mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0x3000 0x1000>,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
