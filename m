Return-Path: <SRS0=ht0X=4O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46D9C4BA06
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 01:52:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B4F4420732
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Feb 2020 01:52:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZUf8elB3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ePc0xyAX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B4F4420732
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PSZ4k9vcKE9S3KJwT/8RzH51zyO5BoedADAzO0voYdA=; b=ZUf8elB3MMkqfi
	Hyk8ap+kg0jfDNT3fdYAmlbFNg9paf79vOEUAvGjBw7hpEVA4J7DF0ED9SH2a5KbetWlPlUaOtRJh
	BiZkLOvyD3Ju1X9lb7raCN+o5prpMp/4x8mfJaTm93sDEJndheyflqTikc0YdrzEFG6xRdeAqoIrl
	uD7Y2t/1OgByql1x2jWJWOLEfXa4fa5MeS4ChFS0QlXhHTwdQxm6gzH4Eo2+3It9hYgeUzlGcgf2Q
	zTU/9qX/f6Drn3T7le15ElSgEN9vWC/aBYmACVczkC/bVKnlJ1V1tSuBLSevFJasMjdT+/7X1tOYz
	HnG+VvxYd+DYsCmOSfdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6lsL-0005PM-O1; Wed, 26 Feb 2020 01:52:37 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6lsB-0005Fs-MW; Wed, 26 Feb 2020 01:52:29 +0000
X-UUID: 5dae918d64664bd3bb3bd22449050494-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=U5dy4O9U1YCjMd3HfOjbAbPOYUVKV3VTQCaAPmr7dCw=; 
 b=ePc0xyAXZnVrqibKNf4RZHSMGGRdn3Xdc5kY6BOrdY9gvxftmUulSAII38L6w1ezwq+jm6iPlc1i996Nsgo1oN2Oop0Bmk6DXw/q7hcg3anMxUzUBdo9KexkKm9AwCNezj27haHts3vArf5LN0Y4Km9aD/YTn5nqjJZf3snbSWA=;
X-UUID: 5dae918d64664bd3bb3bd22449050494-20200225
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 228932966; Tue, 25 Feb 2020 17:52:23 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 17:52:59 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 09:51:31 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 26 Feb 2020 09:52:29 +0800
Message-ID: <1582681939.16944.4.camel@mtksdaap41>
Subject: Re: [PATCH v8 1/7] dt-bindings: media: add pclk-sample dual edge
 property
From: CK Hu <ck.hu@mediatek.com>
To: Jitao Shi <jitao.shi@mediatek.com>
Date: Wed, 26 Feb 2020 09:52:19 +0800
In-Reply-To: <20200225094057.120144-2-jitao.shi@mediatek.com>
References: <20200225094057.120144-1-jitao.shi@mediatek.com>
 <20200225094057.120144-2-jitao.shi@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_175227_749619_EDF6F9CD 
X-CRM114-Status: GOOD (  13.22  )
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

On Tue, 2020-02-25 at 17:40 +0800, Jitao Shi wrote:
> Some chips's sample mode are rising, falling and dual edge (both
> falling and rising edge).
> Extern the pclk-sample property to support dual edge.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/video-interfaces.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interfaces.txt b/Documentation/devicetree/bindings/media/video-interfaces.txt
> index f884ada0bffc..da9ad24935db 100644
> --- a/Documentation/devicetree/bindings/media/video-interfaces.txt
> +++ b/Documentation/devicetree/bindings/media/video-interfaces.txt
> @@ -118,8 +118,8 @@ Optional endpoint properties
>  - data-enable-active: similar to HSYNC and VSYNC, specifies the data enable
>    signal polarity.
>  - field-even-active: field signal level during the even field data transmission.
> -- pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
> -  signal.
> +- pclk-sample: sample data on rising (1), falling (0) or both rising and
> +  falling (2) edge of the pixel clock signal.
>  - sync-on-green-active: active state of Sync-on-green (SoG) signal, 0/1 for
>    LOW/HIGH respectively.
>  - data-lanes: an array of physical data lane indexes. Position of an entry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
