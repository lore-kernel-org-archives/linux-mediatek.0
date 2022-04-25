Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E0AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 09:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VMAyUFeqejR0L/IMx6U06sCctO+Z9nbQaBvnbVxuZQY=; b=G4mLdZNExgZfrU
	y/nDNV76r+4L3Pe6jTFkXyJSM9EG6V9ygZL/2wrNyg039CFmAi10Bc1C7gI9rMXQBt1jGvpdXskGI
	zoAYKn7KHhM+Ayz2ut2m84GEBGRbYwrreH2EyLVNF6btjh6dEdrxCkfSCJ1tSM2Z8OvXkyKvk3bjM
	fq+Q7kEDw1gyu7uOT390TJqH42vUIYVNSKtF3OGvcOmcitztYIf6d2y54lU5GjvY5Lw3CXmZjVncz
	Ibb2dpdVvAow1gXc8SMbi+B+YrO0se5unzpglC1kth6epXl7TDw0ApX63FODEiiLoQ0UZAHn7opTI
	e9UuQ7mcm54QbycyRYYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niudK-008qYj-Mr; Mon, 25 Apr 2022 09:03:50 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niudG-008qXv-MW
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 09:03:49 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 m22-20020a05600c3b1600b00393ed50777aso811039wms.3
 for <linux-mediatek@lists.infradead.org>; Mon, 25 Apr 2022 02:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=jug/8OpXFDkTxUKywL6vHGEFgX9c5JLBUJ6VTO9tAvU=;
 b=AuaNnnovMVQoPw+JEXQgdTDv0aWz3z1naSE9MADi02hw0meYMhy+V8+mHd5cGTQly/
 rAayEXMfUvwIF3wINEmqP9tGRiYcqn1/fU9J4rygwBSSiZIx64hOTgKpOSy6Vhyig9nq
 XxQ44vLxd+IIJxQm04fo15/fNII9Xt7uH2YHfiCnA2H7ekxrSSkLljW+7lrSko3Nhq1L
 efOjG4ZCF+J5wK/aCS/VYByF/BNC3QJfSrVZL8Z/EpDl5ZSSHg5Bs4Vz8eV/QAAiRxdD
 qZqEGdjn2G6hK1i374Xu8ZBI3EOjlZPa5KgQQPb1Izn9mO88BWBYPpvI8JyvUogKDQSC
 KOEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=jug/8OpXFDkTxUKywL6vHGEFgX9c5JLBUJ6VTO9tAvU=;
 b=weAuVCkZHhGUs5wTTarLPP2sEfGlXKkKQeq8Mi9mMCB9Xnzh/A1CrDSvajWA7Iv//D
 lvlDTRjH8LWNGqLHX30evbkGBBRLdWUm/KF2Yu6HM5M6g1EKhGSKBNewTWc5z3FY3Nuk
 suFLrmsa4BnxtLhwbzEoEVK2rL/KCty7Isg53DTTlL5uKH+JYwamDDO79HaygwcWF7zo
 +Zi/vjZOAG1VDaJE1je1rjcIUvYi07muz2W2Ow3aWDyvU/AS7WfQ8ftnhdTtgkU3uC0a
 TS2iRaNnJkcFtaV+rv1oki5WdZl/EZt+uGOR6EMyFulZ7cfjoRB75EPTHl/1ogmswBRG
 GtaQ==
X-Gm-Message-State: AOAM531Fl9JPRccAkzRf5SWBY6Zpj1C81QnQBlr1kq+1Dq9d/Z+ky4Pc
 pq5UH4hid5RW4LyvngykRUv8oA==
X-Google-Smtp-Source: ABdhPJzcnhc5LcepFB4EyQ4oJ1jx/PdiGxt7o18Br4Wx6z05JWcQAnDIdJIVic89TBi9DG3Mg7J25A==
X-Received: by 2002:a05:600c:1e89:b0:390:ba57:81c6 with SMTP id
 be9-20020a05600c1e8900b00390ba5781c6mr16057691wmb.29.1650877424536; 
 Mon, 25 Apr 2022 02:03:44 -0700 (PDT)
Received: from localhost ([2a01:cb19:85e6:1900:b365:80a1:ee3:312f])
 by smtp.gmail.com with ESMTPSA id
 f66-20020a1c3845000000b00393e84ea043sm3821672wma.44.2022.04.25.02.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 02:03:44 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Dang Huynh <danct12@riseup.net>, Dang Huynh <danct12@riseup.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: mediatek: pumpkin: Remove input-name property
In-Reply-To: <20220425064850.246228-1-danct12@riseup.net>
References: <20220425064850.246228-1-danct12@riseup.net>
Date: Mon, 25 Apr 2022 11:03:43 +0200
Message-ID: <87tuah7cwg.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_020346_966240_834D9DD4 
X-CRM114-Status: GOOD (  18.28  )
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

On lun., avril 25, 2022 at 13:48, Dang Huynh <danct12@riseup.net> wrote:

> This property doesn't seem to exist in the documentation nor
> in source code, but for some reason it is defined in a bunch
> of device trees.
>
> Signed-off-by: Dang Huynh <danct12@riseup.net>

Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

> ---
> This patch is a split of this treewide patch [1] to ease the 
> maintainers. 
>
> [1]: https://patchwork.kernel.org/patch/12633497/
>
>  arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> index fcddec14738d..7a717f926929 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -25,7 +25,6 @@ optee: optee@4fd00000 {
>  
>  	gpio-keys {
>  		compatible = "gpio-keys";
> -		input-name = "gpio-keys";
>  		pinctrl-names = "default";
>  		pinctrl-0 = <&gpio_keys_default>;
>  
> -- 
> 2.36.0
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
