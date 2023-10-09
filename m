Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9802CD611D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 18:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KxOk0Qe6UPn44OvxWZwPSW3rRJkqXORiJb9E5OphMiQ=; b=fXew9GOnG3Q86UhQwiXNf+a6VM
	9XrHcupvIHrhzQxFXb4SM3aulQrPpDHhbheUKCGyM1WMjZSGRUQpINyxOQO2O9ZLP08d+KmIjTmsf
	N25R8+pdrXSHH8cSjrgHYLia85rx+91fgW3tRvGyK0Lj0zFL0Nmx1ifXasYVWhD4BQ2lSdVGpvXgr
	2kKUt+O6bQqBmPQn5hA04YOOGGFcfADkFQzaCrgDXTVVSFUuRXOv9dB0EB0+rEtBjGn1Wbxve66WR
	GmsVSTvd6aN3bGmhu7wNaDvFOWepdc7WUmhzOiCjKf67ji7LCFk7yeLX6vm8eBi/muCo2eCPE6Rxq
	CeUUuVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpv2n-00BOT4-1W;
	Mon, 09 Oct 2023 18:31:53 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpv2l-00BOS5-03
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Oct 2023 18:31:52 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-690d8c05784so3647589b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Oct 2023 11:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696876309; x=1697481109; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KxOk0Qe6UPn44OvxWZwPSW3rRJkqXORiJb9E5OphMiQ=;
        b=ciFao5nGKK+C4SnUdhiRtnegzcO0RW4fF2cAzczaItXs/k22KFrPwtstjoG0PLaeJ0
         zc+WEnPoDo6pCgNf3jBhECeIn4hkbnfzu+PafdjJbO6h3Uj2ZMAxQuDMVa/BqV+dQEj8
         t/VuueNEkxwP4auPz3TnoFMUlWbVSe7/XQFOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696876309; x=1697481109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KxOk0Qe6UPn44OvxWZwPSW3rRJkqXORiJb9E5OphMiQ=;
        b=Jv2Znx1Hfq1lUcSGV+REP+UYpGrugMSlWt7f7cChIEjv4iEEuALmCmvoYWnI8SxtYi
         Z6OdlSI5h/FZAd7TGLkpgkZwxCpTqys9xYfdm5nN2e9tWbmHNfte8M/35z54XipoljXC
         8AWVvb900fuenbxukJ+Jb77e537a5QL8irn590QOW5LQdCI0sw++G7E25FuA7kw5AVKI
         aq4bgkJGEvl0k4wIL9IIhF3s5D+sBQ0aB/CvHp1pEv/zm8KlNAWcBCzSBmpnmEC8YLn+
         niI+EeTaEH19wH5iDdGSEcG0NdmhWHGOqg6Zu5qWPCbhbe0ToHR7siHVMd7wyAspRq9G
         ZQ6A==
X-Gm-Message-State: AOJu0YzqfZW2rkz9Nqhhf4gNijh8AInrbb3OZhBVWemlc+XmYfEpP7l/
	k9IGAi2DPtr5T/dUNg+xWIYNSw==
X-Google-Smtp-Source: AGHT+IGMYrmFaqpRwdTAW2MVusib1Bdp/eV2z4yNjbyFulBH77GpTBAsliVbiaNkBmPnFki9DWoAJw==
X-Received: by 2002:a05:6a20:3d29:b0:15d:7e2a:cc77 with SMTP id y41-20020a056a203d2900b0015d7e2acc77mr16427859pzi.48.1696876309199;
        Mon, 09 Oct 2023 11:31:49 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id a25-20020a62e219000000b0068fe7e07190sm6653399pfi.3.2023.10.09.11.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 11:31:48 -0700 (PDT)
Date: Mon, 9 Oct 2023 11:31:46 -0700
From: Kees Cook <keescook@chromium.org>
To: Justin Stitt <justinstitt@google.com>
Cc: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] net: dsa: mt7530: replace deprecated strncpy with
 ethtool_sprintf
Message-ID: <202310091131.550C9CD8@keescook>
References: <20231009-strncpy-drivers-net-dsa-mt7530-c-v1-1-ec6677a6436a@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009-strncpy-drivers-net-dsa-mt7530-c-v1-1-ec6677a6436a@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_113151_050084_829EEF2B 
X-CRM114-Status: GOOD (  18.60  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Oct 09, 2023 at 06:29:19PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings
> [1] and as such we should prefer more robust and less ambiguous string
> interfaces.
> 
> ethtool_sprintf() is designed specifically for get_strings() usage.
> Let's replace strncpy in favor of this more robust and easier to
> understand interface.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://manpages.debian.org/testing/linux-manual-4.8/strscpy.9.en.html [2]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Note: build-tested only.
> ---
>  drivers/net/dsa/mt7530.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 035a34b50f31..e00126af8318 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c
> @@ -836,8 +836,7 @@ mt7530_get_strings(struct dsa_switch *ds, int port, u32 stringset,
>  		return;
>  
>  	for (i = 0; i < ARRAY_SIZE(mt7530_mib); i++)
> -		strncpy(data + i * ETH_GSTRING_LEN, mt7530_mib[i].name,
> -			ETH_GSTRING_LEN);
> +		ethtool_sprintf(&data, "%s", mt7530_mib[i].name);

Err, wait, I spoke too soon. Shouldn't this be "data" and not "&data"?

>  }
>  
>  static void
> 
> ---
> base-commit: cbf3a2cb156a2c911d8f38d8247814b4c07f49a2
> change-id: 20231009-strncpy-drivers-net-dsa-mt7530-c-40cad383654d
> 
> Best regards,
> --
> Justin Stitt <justinstitt@google.com>
> 
> 

-- 
Kees Cook

