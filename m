Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0403DEA4FAE
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Feb 2026 13:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u47cn9soFrW8BHoPy5Odl1FEs5rvVnzdpDoreo2Nl90=; b=muBFqOv4bxJVvebJNSQtJoilib
	uoxX4FrkHfFpJSpbk/TeNtsWEZQO/KZNxoEKHA+QsVn5KUniWbqAcNV8BNEhIxF8wAWbOZSLMUzGe
	ch/dIZ9pKHhtVoUUBcocDx5qiGbQxRx/8AJZcjv0WBfgczr0WlrHLdj+SkekHlh85zlcrPfG1TzFn
	vvx51h4HozLVyY8VcJyfsWVsHtKsHNk9NiuccS7BBPf0grth+d0BZgFEQSocQPzND6/dFQY88fn2n
	TSSf9WCQBUyNnfIF9oL/44H/Lw3uA0WSDQ7kmWFXvvNWEjNMCav4Bzd/rpv4LGlC5vBKahK9tvP2B
	OyJhyeAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVqE-00000000Lbj-2giJ;
	Mon, 23 Feb 2026 13:19:14 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVqC-00000000Las-09Yj
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Feb 2026 13:19:13 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-38709888abeso36347051fa.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Feb 2026 05:19:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771852749; cv=none;
        d=google.com; s=arc-20240605;
        b=D88f9UuD9rGFX82+Qal7CVyLBtOwiFLWjZ/PAFQq4Z18d4Kiv8Ic2OfyBxC27LGvZi
         4WGYPkPzmyChfQ+87HCD2GMaV4h6G0DP4mRET1hqpBQ5yJdZYiZu6vUKVMPbyHziT3Us
         GmBdHC0F9koM3GnwOnUTMq6DNrueZvDn7OVu2jEXJlz46AsTUo8wWL1fOBpPWrR2I1oD
         xDtN753tfANtVTjRzGEGwOGIEP1EFnLVksgT9Iw1BOfM0u8Y3R660yXXhmnAB6R5WSod
         J+oqlIhvzoCN4vUBe/LAt63wzaa1fSSoRtk+6DtGE9Ur/5FnQa7nVMMQWNrkW8t5G4wN
         r3pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u47cn9soFrW8BHoPy5Odl1FEs5rvVnzdpDoreo2Nl90=;
        fh=XNMNMz7VBcglR2/ctZOQ2tHxN7q7gSth3IQWEKssXJY=;
        b=IiEA1WOxQxPLyjJIgcd5aks4rTQB69snLpQO3ghQL5h3yPcnwAH2d5aOf/idxPSq06
         410GpPzkRq3GYLPDxNbx3L6+OnmfzHXx+8DDGNnAa2GQ3KzymLOOEdspX5J/899mMSes
         iO4mNHSez/J/FuBWBRiVl2yKfNMHQGLHAdWeKpxz47Lg/Fc6SkJ0YQm7S3i+h4PFl8Yf
         +wkPBVRgrF6gyMFDx7hYMs1Wr7YtSDfamDsl+cG3OQ+Nb1Pe/7KgEnFKVRysRU7MXWlP
         Tf2wiTAwnMS+6UBf7aozt174+djtUrgJPA/MrJ69yrBld/qbUwfc+hHgybuyjpWQTz/q
         Gn9A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771852749; x=1772457549; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u47cn9soFrW8BHoPy5Odl1FEs5rvVnzdpDoreo2Nl90=;
        b=XRihpXbfG/uBQxaqCF7mFJbb3sPy2rG8glt+lAlPWOvuuio2uVI3/6q3vEiVqhhkEN
         JLeFODZDozXwnkv/w1W5YbLvVG5Jk6O0dGw03ySsMOWyQWZHKZzcFE6iDOKgO1MOV+9F
         YWnQJZe5k0BMtWwuf7xhof+69Dyg7B4UqvUrJq4d55bBNlNGBccjpK3CvJGIVRa58a3+
         fBTNV/pi1ST/3g4cv7lGkUaEdwWmug4KG6S30oJm5xlYchsGXnN8553BZB4cGga7Lzux
         NYFXmAqs9mGlhNyGp/K1j5c/m/Tn2Kp/9lKtR/S8MJGH+BxZbagRfHCyonmI7Noi0bqD
         +nyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771852749; x=1772457549;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u47cn9soFrW8BHoPy5Odl1FEs5rvVnzdpDoreo2Nl90=;
        b=sbaYmgDXJy48zPyTLIw9Q5k1foJ3xShtnlBLFS/8mADPlJe6aWo1SlvHaz+J3WTxdN
         ymxe4COzEyI0s79gSqW4C8Mb9UBm38+Pugh91knHjnzBhbU2p2HanN4ouuM2zoR4nu1/
         7e3YRIgU7DXVFtf2jfqwcicc8pFH7aUHzZHfbTkw6oz9Q0r0mTMzXdeHPC61+nN1RWqF
         n4/6k4Ira3u0tPXHzQHVpZFWMovUyL5X8+TeLsFwzNuGdMs/ytKf6o4fkwALgRw0jchR
         LjwtoYtvuf5xcy6OQnWOFAvDS/9Y+5lE4VC3Yv6uxa4euUv23kf1fbtAEz8Mgve1GCyM
         6EWg==
X-Forwarded-Encrypted: i=1; AJvYcCWtWUSFqVhPCgELDfJCjBFN0egS9Ibjj9KxDpsZum4Gr8Hp6NV449SlV22E5V2Cm7/4k7SZ3e+4WB9DU5N9Hw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyXBcssJxfYU6+Bf2Ay3hVaN0lnrghT/24X7mg8T5xKBZE+uQU
	StY2VPsUCUkwzK26DYsayyZrxrIoyL20mX1Wc6muDKeQv/K6qpdcxMlhbOuWO5fkm6tWKsSH2k5
	3DTLkf03hUbN30oPOCkBCwIMX65RbqoUy1xV9vkJifLPI23xzO/qMcl0=
X-Gm-Gg: AZuq6aLHrpZ5BDO93sKYqtXPahGJSZpa+VhrJVzLD8MQ+LyL9NQtin2H17fQb3S3f8q
	rZols+R3KOPlrkNn9h1kh/eqjDY20vyNhy/e6AEsScK+WN4dUXb45oSeOIT5hsloYrLSAP4WFJc
	g9yWy/D4vCMyYjoDaOGW3iv0+lrUXi8xvo5sc08002uo5Z+a0I9RwMkoy6h4n+pa3WrVDaxT/7f
	VVspkPnDKZk9Qe2vrSpvCQo/2PRSiFeRzkGI1GBHHcDMduI6weKQpSYfqHSIQumnOFH0AHAXmX0
	JmxUNwoc
X-Received: by 2002:ac2:4bc1:0:b0:59d:e9df:6dcd with SMTP id
 2adb3069b0e04-5a0ed87df97mr2593500e87.15.1771852749330; Mon, 23 Feb 2026
 05:19:09 -0800 (PST)
MIME-Version: 1.0
References: <20260219231624.8226-1-sean.wang@kernel.org>
In-Reply-To: <20260219231624.8226-1-sean.wang@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 23 Feb 2026 14:18:33 +0100
X-Gm-Features: AaiRm53UIVVBouS8ori9IKqoVA3ZwCaDsyl3whmD_0t9aHnCuwJJwIQxLct_CEw
Message-ID: <CAPDyKFoiqit-_PWQ3SitGD2YV=J3ZcD97T4p-+MwYXjLVe6fdA@mail.gmail.com>
Subject: Re: [PATCH 1/4] mmc: sdio: add MediaTek MT7902 SDIO device ID
To: Sean Wang <sean.wang@kernel.org>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, linux-bluetooth@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Sean Wang <sean.wang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_051912_110077_83B46E40 
X-CRM114-Status: GOOD (  11.78  )
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

On Fri, 20 Feb 2026 at 00:16, Sean Wang <sean.wang@kernel.org> wrote:
>
> From: Sean Wang <sean.wang@mediatek.com>
>
> Add SDIO device ID (0x790a) for MediaTek MT7902 to sdio_ids.h.
>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

This should go along with the other patches, so I am not picking this
via my mmc tree.

With the sorting (pointed out by other reviewers) fixed, please add:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  include/linux/mmc/sdio_ids.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/linux/mmc/sdio_ids.h b/include/linux/mmc/sdio_ids.h
> index 673cbdf43453..97cc834fb3d5 100644
> --- a/include/linux/mmc/sdio_ids.h
> +++ b/include/linux/mmc/sdio_ids.h
> @@ -112,6 +112,7 @@
>  #define SDIO_DEVICE_ID_MEDIATEK_MT7663         0x7663
>  #define SDIO_DEVICE_ID_MEDIATEK_MT7668         0x7668
>  #define SDIO_DEVICE_ID_MEDIATEK_MT7961         0x7961
> +#define SDIO_DEVICE_ID_MEDIATEK_MT7902         0x790a
>
>  #define SDIO_VENDOR_ID_MICROCHIP_WILC          0x0296
>  #define SDIO_DEVICE_ID_MICROCHIP_WILC1000      0x5347
> --
> 2.43.0
>

