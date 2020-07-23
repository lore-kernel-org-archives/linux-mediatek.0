Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD9AC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 01:34:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57F7F20792
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 01:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eLJvwyuk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Tst37tB1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57F7F20792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PlUIBjc1ktN7V25L7OvIJpGRlZwpPNfrS432g/J9NfU=; b=eLJvwyuk9FVqvGzlU43+TK6mv
	LWIdVKTffnh0asn47o9iDXJYs7dyQKjeOQZnQNnvXTA0BKPaEANUDP1HXAWTpjqtCz4KqgEfu7iNA
	LLtsX73CyRC9FjYqkim41QHiqoyEyKh5tAEqq3LYzksHoCHENDBE2ZnKyzIQWsdf4otl6YfeBC3nl
	GrYQXJaerKZ11t75HGyHXIXiFh6GXYdXiP9QDwIXMj2Ucn6ntIi/qlvT2rLtOEzSBiBVuz2rOMeml
	ZwP3kqssr3itYK3gf/v8MT3muUwv0mwqaCVWsRv3FQc5ymiRLskKBy5ZPt6644zI2vnEHuX2ROXNI
	dwi7EnBBQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyQ7U-0001Lj-Me; Thu, 23 Jul 2020 01:34:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyQ7S-0001LF-I3; Thu, 23 Jul 2020 01:33:59 +0000
X-UUID: 883edb37068f4ef5b5db559589028b4a-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=bbgQJNRcgmdZNRjAfyTf3xC6QTg1bKjqlo6CpIRT/nU=; 
 b=Tst37tB1yF+kEBSzXJq7Xt8nlzX0veU2Auiqo7v1e5I+hPuMR+AytQ7+Cn52kwvwyfDqSTU0dIlQNlMsKoGkzAHhn9U2GJ/ajbzBEZAh2mleOQl2ZNGayh5HQb+D9mkbvC5aK4k7wp4fU6zSw2VVb/MdUSYwBTeOK/kzarpzxHY=;
X-UUID: 883edb37068f4ef5b5db559589028b4a-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yingjoe.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 895592729; Wed, 22 Jul 2020 17:33:55 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 18:24:22 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 09:24:21 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 09:24:17 +0800
Message-ID: <1595467461.7332.3.camel@mtksdaap41>
Subject: Re: [PATCH 2/4] i2c: mediatek: Support DMA mask range over 33-bits
From: Yingjoe Chen <yingjoe.chen@mediatek.com>
To: Qii Wang <qii.wang@mediatek.com>
Date: Thu, 23 Jul 2020 09:24:21 +0800
In-Reply-To: <1595421106-10017-3-git-send-email-qii.wang@mediatek.com>
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
 <1595421106-10017-3-git-send-email-qii.wang@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_213358_750840_82BA4275 
X-CRM114-Status: GOOD (  12.66  )
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
Cc: qiangming.xia@mediatek.com, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, wsa@the-dreams.de, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-22 at 20:31 +0800, Qii Wang wrote:
> Replace 'support_33bits with 'dma_max_support' for DMA mask
> operation, and replace 'mtk_i2c_set_4g_mode' with 'upper_32_bits'.

This doesn't explain why we need this patch. How about:

Newer MTK chip support more than 8GB of dram. Replace support_33bits
with more general dma_max_support.


> 
> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> ---
>  drivers/i2c/busses/i2c-mt65xx.c | 37 +++++++++++++++++--------------------
>  1 file changed, 17 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index e6b984a..e475877 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -209,6 +209,7 @@ struct mtk_i2c_compatible {
>  	unsigned char dma_sync: 1;
>  	unsigned char ltiming_adjust: 1;
>  	unsigned char apdma_sync: 1;
> +	unsigned char max_dma_support;

support_33bits is no longer used. Please remove it.

Joe.C

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
