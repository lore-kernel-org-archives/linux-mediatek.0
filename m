Return-Path: <SRS0=9ZOH=45=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222BFC10DCE
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 19:06:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECDB8206EB
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2020 19:06:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JT9RODLX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECDB8206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWN5mNkYcSEqKnnpqlARtC3xk92g15LG1h3BKBr12GA=; b=JT9RODLXN73F4f
	K6blhKIMr9fP7oF8czQLKCAtymm8jUG/yTxOoubkSO4sRJ8/9+Erxq9jexEj0oPU9WDb04/bIZqWf
	V09pYpV7ZojY4wOq50MDUCz/r3eNlRwqyo2+T0qWf0Fv1Tn4TH8W6nuh7MVrAQjSRHau8/5/ierb6
	Fh5vew3t0I6fGx9R9OHF5vlLoVlM8g7d3kU7Ys40foz7qKYZpBjk4cjuEWBTLcLgHRdnTtp/aSUkY
	t7gmV0vCPiZCmRV0D9qFR76eFLmkJkNNfzYsu2e4lKs6O2FCHTvFtvO6g659XY3+Ob/aOamz3OAfS
	ZQF3qq0ZAJtGALkTA9IQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCT9b-0008Im-0O; Thu, 12 Mar 2020 19:05:59 +0000
Received: from mail-ot1-f65.google.com ([209.85.210.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCT9Y-0008I5-E4
 for linux-mediatek@lists.infradead.org; Thu, 12 Mar 2020 19:05:57 +0000
Received: by mail-ot1-f65.google.com with SMTP id h17so7453395otn.7
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2020 12:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=MobSju737te+JzYsenr0FH2yt0dGhamzIqGShRXIww0=;
 b=WFV9VixuiT0lLVXBgyFhN+704PiGZkiQgCxOH6kL2+MazHW124GpvrGXcjbohUghe5
 Jt8ilxSrMQ0zCRElOviGBnY4MN2mwR5F1OSAcJhI38t0ZCfU78hb/MC+OxU6b0fdGKNS
 A9tZvTQJ8sQcKKKmtwMi0AkFJZHq1zC8mpm/rRO1DdDD5F7kKje857L8dd+Ku6Tdghrt
 N7m/2zjaahMVN10MINVZ/u5UJ3/V2rF18m2k96/SASz8qxtMLMqPkjhxnwYj2jsoXocU
 aUVrvfmGrKdFMYnP+Cr5Hl+m9EgiVH2BeGskDpB6/CRqFxogOd2/ET+jbNEkhz68Rs9h
 Q/5Q==
X-Gm-Message-State: ANhLgQ00pTEZJ5u4/VhSbFqfEIzW0UUKfDbEmjaIhWMw8oYwWV/3IYU2
 w//cvlXQ+HcWXjli/1Vtzg==
X-Google-Smtp-Source: ADFU+vtq2J5SulXMF97WnPUs+sTCKOEXlKI1n5cCcASwRTD3mYvpkHVbjij/yfwU4dUaGCxhLoVyiQ==
X-Received: by 2002:a9d:19c8:: with SMTP id k66mr7205481otk.43.1584039954027; 
 Thu, 12 Mar 2020 12:05:54 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t21sm15631904otk.13.2020.03.12.12.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 12:05:53 -0700 (PDT)
Received: (nullmailer pid 31500 invoked by uid 1000);
 Thu, 12 Mar 2020 19:05:52 -0000
Date: Thu, 12 Mar 2020 14:05:52 -0500
From: Rob Herring <robh@kernel.org>
To: Eason Yen <eason.yen@mediatek.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: mt6359: add codec document
Message-ID: <20200312190552.GA27630@bogus>
References: <1583465622-16628-1-git-send-email-eason.yen@mediatek.com>
 <1583465622-16628-2-git-send-email-eason.yen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1583465622-16628-2-git-send-email-eason.yen@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_120556_472729_95D7DBF2 
X-CRM114-Status: GOOD (  12.04  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 linux-kernel@vger.kernel.org, jiaxin.yu@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 06, 2020 at 11:33:41AM +0800, Eason Yen wrote:
> Add mt6359 codec document
> 
> Signed-off-by: Eason Yen <eason.yen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/sound/mt6359.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/mt6359.txt

Please convert to a DT schema.

> 
> diff --git a/Documentation/devicetree/bindings/sound/mt6359.txt b/Documentation/devicetree/bindings/sound/mt6359.txt
> new file mode 100644
> index 0000000..77864e0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mt6359.txt
> @@ -0,0 +1,16 @@
> +Mediatek MT6359 Audio Codec
> +
> +The communication between MT6358 and SoC is through Mediatek PMIC wrapper.
> +For more detail, please visit Mediatek PMIC wrapper documentation.
> +
> +Must be a child node of PMIC wrapper.
> +
> +Required properties:
> +
> +- compatible : "mediatek,mt6359-sound".

A compatible with no other properties is generally suspect. Don't you 
have clocks, connection to I2S or something, etc.

> +
> +Example:
> +
> +mt6359_snd {

audio-codec {

> +	compatible = "mediatek,mt6359-sound";
> +};
> -- 
> 1.9.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
