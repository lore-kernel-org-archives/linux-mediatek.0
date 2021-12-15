Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2A2C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Dec 2021 20:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rdHavKlB/1/VliGN5iKls3iX0jwq176oDWHq7l74dwQ=; b=iYfublRZMN6Zs9
	oqhvEh4BxH/7V7Zw+aXPCrlOfoK4337s9qMcJgqgWxlVj2i0Db6TLjJvz3JBHhY6IB9sVRUkCRFWs
	3ldQns45CzyAu6nY3tZU7lV7Ay/YJOvycpkBf87/BUJlyd3Gqg5PG6KkHEQJztq68BL3SEcNOOVP7
	81y37xYzOv2SIqqFsaBSVKoeOVHYNhG24EUuxCrU2PaVpLQdEMDQ1NRpUGl2qmaabSYYGCLdI5BuH
	xHW8tJVxcsPFuBNSkN84JDAjC/keybpZyucRQyZKAKzZXJL0Fg89h8asPVnwdk4Dg3Ps75/V+Q63S
	rUYdZSg05snMuQqwaCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxaUQ-002W0q-MZ; Wed, 15 Dec 2021 20:03:02 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxaUN-002Vzi-Og; Wed, 15 Dec 2021 20:03:01 +0000
Received: by mail-wr1-x435.google.com with SMTP id u17so40167468wrt.3;
 Wed, 15 Dec 2021 12:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=15UlF7+uGjlTkwwX8mzVxbyazaBqLGc99zLGZEkto+M=;
 b=FP5GAk7B3qaNAoTR7zqIg100qjBKtzlqO3dniSqTNKaZfITZd+7c8DpWl/nGUEstuT
 SwJNkaBZydGstSCMXWyt+dAr8msoDsN7Fn7PFlQBZl6SfAR6NOOwiamNQVI9ndeMpHQs
 gP3T4MRQ4dHCodOVia4WNHbbLhn0WY13zBVY0agt51Ln4WCZmDuwnw1qTXPgHJ0nevPj
 Wzc4Aoxj2z01arRxqLpbFjrnz4TOxpzcBDPiAggSpQoDTINT4CYwpTJdeK7sEvoUQgYV
 153+zJ8p9XO2xUpgZai+6Ta5rZUlXYVwevN7yKfzbbx6xxmlclmc0aLfqM7NHA7Yivcn
 tapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=15UlF7+uGjlTkwwX8mzVxbyazaBqLGc99zLGZEkto+M=;
 b=hdkop/RPOa/JdZ9eQ6LGmLEb8jz8r9R+AQP8915nVOZrPD9VVk7Glnk6ArhnVNqvTw
 AUCqfjXU2oLcknBqjy7C8sCa0vxlfHDy/pQyXk7LBrARD5sHs7R6EM8pEa02N3QjUl5M
 hMArYcJYRk4IGkJXcTXak+ZTLAsbZDdJZv8QvIVxyqElc5+AFO7E7u8h2bucJdiKJAoq
 K6KsEFrJz31GQJWHWKKmxWmWGO33xrvhK07SNgwzDGFn1EsGbNNNZh7GhrBo5AJQ2COW
 CODhBredaEcPfN6qo1p8UVzq6ni4C/7WDY+AXiacbFVEkMgCDNqS9ok9CESBojyxCe9S
 LW/g==
X-Gm-Message-State: AOAM530Lfc23A3YDxY6KZs1xO1pwOXdpdTOC1ljRVOfw5kpUcf/O1Zvl
 JrTd/ApHLKB7jjPH+LpDX/U+CU93aJI=
X-Google-Smtp-Source: ABdhPJz0rKBo+MEebuAgAGMFyRMLsT9h33P48BbZMO47N1W8KxnvFvS5O7uqrk3ujwiK88+V8BDUjg==
X-Received: by 2002:a5d:6ac2:: with SMTP id u2mr5912265wrw.486.1639598578493; 
 Wed, 15 Dec 2021 12:02:58 -0800 (PST)
Received: from [192.168.0.18] (81.172.62.207.dyn.user.ono.com. [81.172.62.207])
 by smtp.gmail.com with ESMTPSA id b10sm3362890wri.78.2021.12.15.12.02.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Dec 2021 12:02:58 -0800 (PST)
Message-ID: <c62f562f-c446-4986-2915-00c01a2aff1a@gmail.com>
Date: Wed, 15 Dec 2021 21:02:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] arm64: dts: mt8183: kukui: Add Type C node
Content-Language: en-US
To: Prashant Malani <pmalani@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Cc: Alexandru M Stan <amstan@chromium.org>, Benson Leung <bleung@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Rob Herring <robh+dt@kernel.org>
References: <20211209195112.366176-1-pmalani@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211209195112.366176-1-pmalani@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211215_120259_854388_62E8F5C0 
X-CRM114-Status: GOOD (  15.76  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 09/12/2021 20:51, Prashant Malani wrote:
> Add a node describing the USB Type C connector, in order to utilize the
> Chromium OS USB Type-C driver that enumerates Type-C ports and connected
> cables/peripherals and makes them visible to userspace.
> 
> Cc: Alexandru M Stan <amstan@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Applied to v5.16-next/dts64

Thanks

> ---
> 
> Changes in v2:
> - Alexandru mentioned that HW specs suggest preferred power role for
>    devices like kukui to be sink, so changed try-power-role to "sink".
> 
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 94c13c459194..0f9480f91261 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -886,6 +886,20 @@ usbc_extcon: extcon0 {
>   		cbas {
>   			compatible = "google,cros-cbas";
>   		};
> +
> +		typec {
> +			compatible = "google,cros-ec-typec";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			usb_c0: connector@0 {
> +				compatible = "usb-c-connector";
> +				reg = <0>;
> +				power-role = "dual";
> +				data-role = "host";
> +				try-power-role = "sink";
> +			};
> +		};
>   	};
>   };
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
