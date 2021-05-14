Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65DEEC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 13:24:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24C4561442
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 13:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24C4561442
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4bfvGesBXmveBsPOGHr8adU7Vi/Mm9SmgOiC0jNGjmw=; b=SX50w02jt9re5RA3fqHudgo5J
	4AduVf1XDwzw/yIz1gGWM18IYcg23EM3DuRoZyUN875vHu8EtexCwgxi/t5mTNjzFSIFEaUThZt/c
	1njuUMAB7aHvEsNt6BG+mdpCOGJOWU/Od+2c1Z5lvsRMjDHhMHPcgxF5NE4NZPhaNNAvemC/kduEA
	J1nZQQdbPV09fhxD6xTGW+mR6jae2bJzbip4A2mJN9h1ZAx+CgftAb9E4kHpNaP8hrfZiaH9AQ9tw
	6B060AcvX831J3A4MWfNiqNa5Sjo0QpcEOEG35f0hW0EJ3RexExYwkc1xxezuCFyRrp77XkOyBFBi
	bQTZZPFvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhXnM-0087t2-Ry; Fri, 14 May 2021 13:24:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhXnC-0087sG-S9; Fri, 14 May 2021 13:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=MJSIp09ECV8rL9J6NF35Vv/0TJVA/r7GX9NFshXJLRU=; b=p9ITKcfxfFqFKyL8rZ7PlgpPXT
 wtutsCZbawysokmE9Mx9J1yiYxfhKL6LZyl16MPC4ab4PqL/KTKBj1UcWREfd9XDnEWPikpgPrBtu
 m49DINw4ujK627/qQZuA4AI2b8RBu4Jy3UlD4UWkDnuDEL+7AXIQp51RiY5j7IXC/vblbcagNm2h9
 fc9URsa+kxNmEkB59VZOmZ4DBGljaO1TR0GDCk+tXxVZAs6ziI4xPN5xn4fbfdaD5+Mee+k2IZNhz
 Xijeg6d4DMbQBcCA5AVcY25vpX/dsyjL9dEga7ZkuPdawwinfx9klL49OHCkKxfCAOn5ByVYfytKH
 CpBKXfRg==;
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhXnA-00C078-4L; Fri, 14 May 2021 13:23:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 39A851F432DE
Subject: Re: [RESEND PATCH v7 2/2] arm64: dts: mt8183: add cbas node under
 cros_ec
To: Ikjoon Jang <ikjn@chromium.org>, devicetree@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Guenter Roeck <groeck@chromium.org>,
 Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Jiri Kosina <jikos@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>
References: <20210514122051.266169-1-ikjn@chromium.org>
 <20210514122051.266169-3-ikjn@chromium.org>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <2a216922-c93b-0e1b-0dee-add6cdc9a3c9@collabora.com>
Date: Fri, 14 May 2021 15:23:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210514122051.266169-3-ikjn@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_062348_336462_38E75EA6 
X-CRM114-Status: GOOD (  18.55  )
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

Hi Ikjoon,

Thank you for the patch.

On 14/5/21 14:20, Ikjoon Jang wrote:
> Add a 'cbas' device node for supporting tablet mode switch in
> kukui devices.
> 
> Kukui platforms with detacheable base have an additional input
> device under cros-ec, which reports SW_TABLET_MODE regarding
> its base state (e.g. base flipped or detached).
> 
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
> 

Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

> ---
> 
> Changes in v7:
> - remove a label in cbas node
> - fix an erratum in commit message (table --> tablet)
> - dt-binding patchess merged altogether with mt8183 dts
> 
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index ff56bcfa3370..1512605a438e 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -816,6 +816,10 @@ usbc_extcon: extcon0 {
>  			compatible = "google,extcon-usbc-cros-ec";
>  			google,usb-port-id = <0>;
>  		};
> +
> +		cbas {
> +			compatible = "google,cros-cbas";
> +		};
>  	};
>  };
>  
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
