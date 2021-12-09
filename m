Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFCBC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 22:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MrvSCJRcfqD1UhKL8I9IQFp8mvkJxKXo6YbvsTx2gKQ=; b=B7DjKL28T5IY3k
	GLzBWD4Uu6Hg6EmMOITBIbrGJSkvNQnbceZyhVnADsiVYCTFXOnW6XJCrzRLEOdaAbsEj+0t0jM6k
	Q0H7A3/zH5LBp1egKUodNHAcoRBa5Rb6EOjWVFRE29Ofwb2Gp9sHQCVMw4B2pybe2xlRJUDKHLKre
	BNArtcxpvKJBKyLJUnYHAmXPFAIqP9fq76a8ck9u/IPhnN0rsMUXWtbjCFxPyCTAPsWBuXst3Ghsn
	3BsGzH82fDR50FzbTZ3bSGUY/kVc49f7LJSGwijrLFoJLxXzNKXPPmvoQqyUiMX5ckFAsLhtcJfgB
	8RNHQmULnrpu+r97OoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvSFX-000K0I-8G; Thu, 09 Dec 2021 22:50:51 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvSFL-000Jvm-2Z
 for linux-mediatek@lists.infradead.org; Thu, 09 Dec 2021 22:50:40 +0000
Received: by mail-io1-xd33.google.com with SMTP id x10so8461945ioj.9
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Dec 2021 14:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5ZRTQ7ooDwQfy9oZzqo/a73+qfonk8DtEs8N0Hj+xpQ=;
 b=IfQw828Gqg7Q/QWyzsyal4ehf1T+TN1ceMlijrcYOhf+6xYqnwQr/h17IkRy/UdzkJ
 pMZjTcvxss568kEP5fNMBEWMjVT7q7tjVocOc3fZNhq1F59gCtz3zs7Igh4rWNH9j3cX
 aUFb1PNEfIRjmbkHE2pvSn6IOgatp1argEpZY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5ZRTQ7ooDwQfy9oZzqo/a73+qfonk8DtEs8N0Hj+xpQ=;
 b=6rr9ZMub3oLCSxrG3tsESd6JOLxyAI6u6zByC8UEf03dVomgjfMALvA7wLmHf2Pw6b
 a+M8T0ZaW3Dw9C9A/RQl8IRJdi2mzABE5PQaqOfu8OPjiN3Cp/ZUMlJjHN4ae9ADfrGl
 +DkFhK5piRQmJ9B+r/2HQZm23UQtxhQd0AGOg/enk5U409MBWXaHI7anTkOYNapU+F9f
 yiLU9bfr4Vz1GQe30IyRArzFyPWaSToZHCnegCiRm9tFIbjorenJiUWTqBqQYtP0r+yX
 hwcf5IsoJmRIuKaq9r3/KHBk1RsFzoyCdRYV9TqBMY+ppRAjQ/wCvrk3eO1FxO16sh8L
 IPZA==
X-Gm-Message-State: AOAM530Upg+X24+j9IUdRqMWdAlp0N1ollRgRNbdeACg+mb4werORsHP
 CCSXIl8h39M5GpcAnKced31IqGzvVTTzEw==
X-Google-Smtp-Source: ABdhPJwF9txE++1EHNfmVMUCS61MhaIj1zXe7/GpbxPvJejJ32lb3XI0/jhr9W+sNXZ1VxOA5/2Vpg==
X-Received: by 2002:a05:6638:1445:: with SMTP id
 l5mr13374724jad.36.1639090237115; 
 Thu, 09 Dec 2021 14:50:37 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id h13sm622665ilj.39.2021.12.09.14.50.35
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 14:50:35 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id k21so8475939ioh.4
 for <linux-mediatek@lists.infradead.org>; Thu, 09 Dec 2021 14:50:35 -0800 (PST)
X-Received: by 2002:a05:6602:26d3:: with SMTP id
 g19mr16449520ioo.100.1639090234684; 
 Thu, 09 Dec 2021 14:50:34 -0800 (PST)
MIME-Version: 1.0
References: <20211209195112.366176-1-pmalani@chromium.org>
In-Reply-To: <20211209195112.366176-1-pmalani@chromium.org>
From: Alexandru M Stan <amstan@chromium.org>
Date: Thu, 9 Dec 2021 14:49:57 -0800
X-Gmail-Original-Message-ID: <CAHNYxRxKzxxx2qTjvNGXc=L6Mx3J777P=H8uJEtbuUHfrNW4mg@mail.gmail.com>
Message-ID: <CAHNYxRxKzxxx2qTjvNGXc=L6Mx3J777P=H8uJEtbuUHfrNW4mg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mt8183: kukui: Add Type C node
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Benson Leung <bleung@chromium.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_145039_133528_C1B90616 
X-CRM114-Status: GOOD (  16.31  )
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

On Thu, Dec 9, 2021 at 11:51 AM Prashant Malani <pmalani@chromium.org> wrote:
>
> Add a node describing the USB Type C connector, in order to utilize the
> Chromium OS USB Type-C driver that enumerates Type-C ports and connected
> cables/peripherals and makes them visible to userspace.
>
> Cc: Alexandru M Stan <amstan@chromium.org>
> Cc: Benson Leung <bleung@chromium.org>
> Signed-off-by: Prashant Malani <pmalani@chromium.org>
> ---
>
> Changes in v2:
> - Alexandru mentioned that HW specs suggest preferred power role for
>   devices like kukui to be sink, so changed try-power-role to "sink".
>
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 94c13c459194..0f9480f91261 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -886,6 +886,20 @@ usbc_extcon: extcon0 {
>                 cbas {
>                         compatible = "google,cros-cbas";
>                 };
> +
> +               typec {
> +                       compatible = "google,cros-ec-typec";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +
> +                       usb_c0: connector@0 {
> +                               compatible = "usb-c-connector";
> +                               reg = <0>;
> +                               power-role = "dual";
> +                               data-role = "host";
> +                               try-power-role = "sink";
> +                       };
> +               };
>         };
>  };
>
> --
> 2.34.1.173.g76aa8bc2d0-goog
>

Thanks!

Reviewed-by: Alexandru M Stan <amstan@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
