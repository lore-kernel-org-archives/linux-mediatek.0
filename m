Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E60C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 17:15:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F44661250
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 17:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0F44661250
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uQFg3qu96KMbbRTzxq3wQfFwhqRhg3zvKO1BtMIpsyc=; b=O89/juO+rlqJDBYlz2WlrTu7we
	LbkvX+2i1FKKK0yCug6C0BC/zdwapO/aj+tVDn+054l2fPT/QhmcYB4/f2xRT6TAa7vyafWKRHtJd
	6/klAyNq/RVXlSDJG5AKXpctkGvd1NvrAblR4CRTbMpseaobjlNTQUgKE/+fAdnPtIR9ml0uu6+mv
	OvElTuqRrOrv7+/ynkfoBl/YntCjGjEjBh9remjxYYUunelHfBGehZ7HKs32nSyvaUswCZmOd8dco
	2eH13ewuqz7mSsFMm1X5wZJgFAfmMREIXLylLre663kczEGiqIgrCp+LDb8UF0m9gsl5n3FQS/d5a
	GGziLqdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTomu-00FDd5-Cv; Fri, 24 Sep 2021 17:15:04 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTomo-00FDaZ-GY
 for linux-mediatek@lists.infradead.org; Fri, 24 Sep 2021 17:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5ruyZhY+uNqQtF8QASCLFU3+MFMaR3UtIQqWOeM4Yos=; b=t9Zdmp3xAYoNU5cHTE5ni3/dG6
 YsCG07Nce54lV3wKGf/NRHBz43tJsIYm+0d61quRVfSU+Gaaw7QL0/g+rNW4zcd6DY0nAdSiurP6d
 9lMTtmfN4V3PEdPu5zZ3ykspxqFdUgMt4rtsqKTkoVFRAVvozOXATlMTikFlp2fmbnM4=;
Received: from p57a6fa93.dip0.t-ipconnect.de ([87.166.250.147] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mTomd-0003r9-Sa; Fri, 24 Sep 2021 19:14:47 +0200
Subject: Re: [PATCH 2/2] dt: bindings: net: mt76: add eeprom-data property
To: Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org, 
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org
Cc: Ryder Lee <ryder.lee@mediatek.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
References: <YSWdv7ZKz7SBtF+v@makrotopia.org>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <de40bcd3-d730-4d6b-27d0-50492fe18404@nbd.name>
Date: Fri, 24 Sep 2021 19:14:47 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YSWdv7ZKz7SBtF+v@makrotopia.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_101458_807969_B4E47F74 
X-CRM114-Status: GOOD (  12.04  )
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


On 2021-08-25 03:33, Daniel Golle wrote:
> EEPROM data for mt76 can be embedded into device-tree as an array.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../devicetree/bindings/net/wireless/mediatek,mt76.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> index 3e2c2e43175e5..1489d3c1cd6ec 100644
> --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
> @@ -47,6 +47,11 @@ properties:
>  
>    ieee80211-freq-limit: true
>  
> +  mediatek,eeprom-data:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
Given that the driver patch simply uses memcpy on the data, shouldn't we
use an uint8-array here?

- Felix

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
