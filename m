Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D70C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 06:12:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD152613B3
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 06:12:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD152613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wbsf/wCSjaAgseXPIgDzr6FcCD0P77hPsp/oEb+jYdU=; b=RfT1m+5+6uNH6W4C9cdX2QcSi
	OpTVbX7vFnc3OUoXi6oeWHRQCm2PYZGQw10pFhGasWB4HcOYy15dH8XdzQ6dzAFo3j8VoatKQqiZl
	NJ6R1llRXM3jcpfxXt8UPXG64lhsLzxW8Kw+eO5GFhGlbQQ0NRvIOBpJz//Pzy5asL9M7JJe1peA5
	yMln1SUhz5RISNBGGvJGABM2LZo6bAWe8f/D4LACBTdFfUGNPSSYiCzmwYN4E3Z6dYRjC4eAtJpkk
	UB6BETvyvGVxCTO8l9ViZSWYqw21K5PUupcR4zLcqnYI6lrEzV/74kwZRQvevsCnLSQTkLvobZ6OJ
	gKxVm+Z3A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbdQt-002tzI-EC; Wed, 28 Apr 2021 06:12:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbdQh-002tyP-Gi; Wed, 28 Apr 2021 06:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:List-Id:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=exIWfyp5DP6MJ8raFiGS6RVBMJA413odfmn/lrQ5Ne0=; b=cnb+EQqPObeLpYCeXDX1omcWA6
 gtjLnVGj3aX+BSHti2Acw+Rh9jP/XjD9NTqSUwF5enaIuT0cX62klVmg+KVbSP/ua8hCl7wBw04KO
 5Ozz8q1L7Gxp3WdSC5f4f9jgwc/ME3rXKXkNcmf/eSYkDmfG6rXRSIp7s4y/MIYe+F3FwC2weoabB
 urK5lNaclhu1g9Fjhqo0wLFtusD3DB6wHGFEYYN1Y3kcitAr5vPOPMp4E3cqMPQNkQdx7QKS4Al1n
 w1oDtn/VmKhqjp2QXiub5TLPOz85T92PaG/QFCYlgZLEhbif7CFm2huyTDKg+M7jww9xtoNveFAet
 cqGFFcEw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbdQe-00HCu9-QX; Wed, 28 Apr 2021 06:12:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8197B613B3;
 Wed, 28 Apr 2021 06:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1619590327;
 bh=dJJ0tvZ5MJ3qeFn4UO9q5Pg1l0TALUdby7ve1eM2grQ=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=FeMJIPqH4b6pi+6ue39y49E6677v535gJxnDBnSZ5VfWYi7BftKP4VUX5fFNlK8wN
 6AxDX48ar/lHxOnMsGAlL5Uv9+Tb/kIbeyCnaLnEGJd1oBb/ar09eo5bhxIQ+BsW0V
 a9CFOL67dDEAQZlsHU1Vkx9YtcE6PqW0+fGM6e4w=
Date: Wed, 28 Apr 2021 08:12:03 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Ryan Wu <Yz.Wu@mediatek.com>, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: nvmem: mediatek: remove duplicate mt8192 line
Message-ID: <YIj8sySF3W0x8E+/@kroah.com>
References: <20210427210121.1080364-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210427210121.1080364-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_231208_904883_9441606C 
X-CRM114-Status: GOOD (  15.80  )
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

On Tue, Apr 27, 2021 at 11:01:08PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The same patch was accidentally merged twice, resulting in a
> duplicate line for the mt8192 SoC.
> 
> Fixes: f2674c0c7488 ("dt-bindings: nvmem: mediatek: add support for MediaTek mt8192 SoC")
> Fixes: 2a1405a14c3a ("dt-bindings: nvmem: mediatek: add support for MediaTek mt8192 SoC")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  Documentation/devicetree/bindings/nvmem/mtk-efuse.txt | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> index d479ad977e24..2f2895b1f06d 100644
> --- a/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> +++ b/Documentation/devicetree/bindings/nvmem/mtk-efuse.txt
> @@ -7,7 +7,6 @@ Required properties:
>  	      "mediatek,mt7622-efuse", "mediatek,efuse": for MT7622
>  	      "mediatek,mt7623-efuse", "mediatek,efuse": for MT7623
>  	      "mediatek,mt8173-efuse" or "mediatek,efuse": for MT8173
> -	      "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192
>  	      "mediatek,mt8516-efuse", "mediatek,efuse": for MT8516
>  	      "mediatek,mt8192-efuse", "mediatek,efuse": for MT8192

Shouldn't you drop the bottom one here to keep this in sorted order?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
