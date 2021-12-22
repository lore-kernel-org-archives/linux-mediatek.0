Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85120C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Dec 2021 17:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCDnG9UuNPP7i7Vhw8Xd4FD6JkXbpCAXHdrrPh8fWUI=; b=hxTUvUaJCSGWfi
	CY4uw3oVnByRZf9F52g6SyLotMdLzt5oNfPe3U58Lfy1Gi8HF3pZwjaZMURMkxCQUYNf5EbKyVScl
	mYes/Ekks4QoBmdTCaOnfFFsJ/0n3yJr9Un5jKo4a3DYHTkn7pQWWgMCoyYbikhVLrroajDSz3Nbc
	euzad6qzQ1sZv110kM0Lo7x/BAK5P4gDJPVvWdGskKJ9ADLGz8nn3esHfG4127ILuiYnNwhsV8eY+
	9iuJqvrznE3mz5KwOzAb1Cg793Q+WJnyV+WAcwfiv0Wp66SmHdZiQVPd+EZBT5zxwNaZldQJBnsDZ
	SFz3GWtSNk2o37ix3BxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n05ks-00B0YL-6U; Wed, 22 Dec 2021 17:50:22 +0000
Received: from mail-qk1-f182.google.com ([209.85.222.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n05kp-00B0Xs-B5; Wed, 22 Dec 2021 17:50:20 +0000
Received: by mail-qk1-f182.google.com with SMTP id p4so3040164qkm.7;
 Wed, 22 Dec 2021 09:50:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G0Bo2xi487zsjbvsxUHGM60Jt3WTXGtaD5AP/5FQrYU=;
 b=goXG4aW4ahP8PZ/67n5QR0l9qcX47i64LL7tBJ7uDFoeS3D4uBm8csIoaJjEMpH63E
 NHVbqycGVw/h7W08NfQeQZSEa5lv0LKVZTX8tkg9Njk/LwqPsQeyynbIZ43s+qb5H4ZY
 cbSDX9WOJuEbis5IAcMDMUGdTHZisqf2JeKVFm5hTBufDhyOxepVDxAAi6BR4bfNw942
 dHJAVJbC4ZWL+KaQHcHp3msTF7mhhkWbDKKaU/Q4dvyOP4HpjT5wfL8PduAIMnEnLEI3
 vrq0rfAnazfVJuzP23/PzfrncN9BAImMu5hyL53hWdap/WutrR+JKkHMSOGlk1LgwiGX
 gwEg==
X-Gm-Message-State: AOAM531pn3ZmIILd83b36OhcktPddGRsCd8YCODBk0YVhd84oZlG4jdp
 3y22cku1Do0gH4XvsM9yzw==
X-Google-Smtp-Source: ABdhPJyvAAEpmHO21h+BgfeOi40PfsFEpHcNduiO7Js5mzx8z/J1daeSExKuDA/ssJQ+ZFmLU9Ujqg==
X-Received: by 2002:a05:620a:15cb:: with SMTP id
 o11mr2820061qkm.371.1640195417674; 
 Wed, 22 Dec 2021 09:50:17 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id f18sm2518981qko.34.2021.12.22.09.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 09:50:16 -0800 (PST)
Received: (nullmailer pid 2400088 invoked by uid 1000);
 Wed, 22 Dec 2021 17:50:15 -0000
Date: Wed, 22 Dec 2021 13:50:15 -0400
From: Rob Herring <robh@kernel.org>
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: broonie@kernel.org, sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, matthias.bgg@gmail.com, devicetree@vger.kernel.org,
 bgolaszewski@baylibre.com, linux-mediatek@lists.infradead.org,
 bayi.cheng@mediatek.com, linux-arm-kernel@lists.infradead.org,
 linus.walleij@linaro.org, gch981213@gmail.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, robh+dt@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] dt-bindings: pinctrl: mt8195: add wrapping node
 of pin configurations
Message-ID: <YcNlVzSZAWCM9eKO@robh.at.kernel.org>
References: <20211220121825.6446-1-tinghan.shen@mediatek.com>
 <20211220121825.6446-4-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211220121825.6446-4-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_095019_422867_EE2975B3 
X-CRM114-Status: GOOD (  11.28  )
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

On Mon, 20 Dec 2021 20:18:24 +0800, Tinghan Shen wrote:
> On mt8195, the pinctrl node has pinctrl groups to group pin
> configurations by users' need. In each pinctrl group, it has
> subnode(s) to list pins needed and pin configurations. By supporting
> multiple subnodes, we can configure different pin characteristics
> (driving/pull-up/pull-down/etc.) in a pinctrl group.
> 
> Update pinctrl-mt8195.yaml to add subnode in pinctrl groups and an
> example to illustrate the usage.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 338 ++++++++++--------
>  1 file changed, 188 insertions(+), 150 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
