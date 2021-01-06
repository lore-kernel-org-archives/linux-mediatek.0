Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 066CBC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:48:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A425723102
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 10:48:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A425723102
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RbdLsppXLY4gq4yFx0fgRZkIav8nTcyYP0Qoe5FPri4=; b=Q1LV93kqrTCcRMkrqFo9dWVwD
	D+zUASyb5frB/L+ihPYiwDoanGacL2VbZ4EEVr69aCCLyT80oV0tyJRaQgv6rQb4+U7z4fsJeM/Ch
	IkXwjCLBg+BzFV4KDfq4oy2jmd++3zzVaDDPkqgWC8vs2nRXU9W/EKXUKZvtv2Ts292H99fcs1JTf
	otu2DNStKh539eAdZWgwE5LEPgrULAtJdM94dryTtN5F0+QNfoRxcqbdEc9h0DlKGFqZqeQ1LOYW9
	S2LS38a5kGAUSNxKgsQ1H+0VKc/l2wc6U15xMMEC8Wig5wLJpm4C8GHD+eHItv68ouwn533idWHKZ
	KAJEV2kjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx6MI-0004FB-7i; Wed, 06 Jan 2021 10:48:06 +0000
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx6MD-0004EF-Lo
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 10:48:02 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id s13so672107vkb.11
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 02:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QhxW/qWUK1qHu3S5dKAsL/bE2CX9Mjir76mO+yFF09s=;
 b=CNtpzWHcVIutiMTLVCAVjQF6s8sXiFJfl+fPbNc8rpoExJe+4TByxzq/8dv6vqvsUl
 ZqBm9GRH+1lYMdc3Zm6sxtEjlcUNwUf76BSbbIz07pOhCbMHdeJyKjp0k19MyPeScAoX
 vi3gk6Ai9pAgR6lQSLEoA7bjw+COUAdNgarFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QhxW/qWUK1qHu3S5dKAsL/bE2CX9Mjir76mO+yFF09s=;
 b=kb+eehQolOs/cSs78ru7BQZhcYDl+gxuRxH1WAmboeDqFJthfJOiTxs6M/OasfsIWl
 50jJ4ZbcQtVh1h3O48j2hyYyVUlEe/QK6IHjYCBoMPxulSvm+9a6RzejEOP3zzSWyOV3
 7E2//2kPhpweE1sVX9BO7kU0MmggMkzymhRHPVx9zo5wTGQmy/WoNbf5+XAbO5Mmpgkb
 Z8iKiSeCgt+NZVfQfvBvcAU4/m3keYxqsWt5iOoosWNNM2Lwg064A7OxZng/m/bfUsJ9
 mVQLmsNy12vQVYo7EITQiZXMIS7WIuhJae4A4g5Fu++4FmLTce2kfyyYdbiFCUGCMN7t
 ZJQw==
X-Gm-Message-State: AOAM532FsIicrbSaByexjxnCXBY/0sa7dRe9S3CUOGCTbhv052yrd17k
 R3Cw9+V0hT09kyODbgMg2m6TLUbZ6UUsQsIr4GKQrQ==
X-Google-Smtp-Source: ABdhPJy0jjS8DnZo6n0jcWiNil0zF7Su8pV8YGWDFMNynC2TIWBinJzDX9ZG164nRYdyQ+nmGzyP55SCRpsBsYZk8DQ=
X-Received: by 2002:a1f:a78c:: with SMTP id q134mr2864312vke.17.1609930079603; 
 Wed, 06 Jan 2021 02:47:59 -0800 (PST)
MIME-Version: 1.0
References: <20210106084626.2181286-1-hsinyi@chromium.org>
In-Reply-To: <20210106084626.2181286-1-hsinyi@chromium.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 6 Jan 2021 18:47:48 +0800
Message-ID: <CANMq1KAoboK45uOhKMYZ-=TvBBQRZhEeij=ha6MqSKZiYx64eQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mt8183: config dsi node
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_054801_811991_F9DA675C 
X-CRM114-Status: GOOD (  17.87  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 6, 2021 at 4:46 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Config dsi node for mt8183 kukui. Set panel and ports.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index bf2ad1294dd30..4cfb3560e5d11 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -249,6 +249,36 @@ &cpu7 {
>         proc-supply = <&mt6358_vproc11_reg>;
>  };
>
> +&dsi0 {
> +       status = "okay";
> +       #address-cells = <1>;
> +       #size-cells = <0>;
> +       panel: panel@0 {
> +               compatible = "boe,tv101wum-nl6";

We're going to have many panels in the kukui family, so I think I'd
prefer it if you moved the compatible string to krane-sku0 dts: it
makes it easier to figure out what's different with sku0.

Then maybe leave all the other properties in this file, as it seems
like all MIPI panels use the exact same pin/supplies?

(And add a comment here saying that the compatible needs to be set in
board dts?)

> +               reg = <0>;
> +               enable-gpios = <&pio 45 0>;
> +               pinctrl-names = "default";
> +               pinctrl-0 = <&panel_pins_default>;
> +               avdd-supply = <&ppvarn_lcd>;
> +               avee-supply = <&ppvarp_lcd>;
> +               pp1800-supply = <&pp1800_lcd>;
> +               status = "okay";
> +               port {
> +                       panel_in: endpoint {
> +                               remote-endpoint = <&dsi_out>;
> +                       };
> +               };
> +       };
> +
> +       ports {
> +               port {
> +                       dsi_out: endpoint {
> +                               remote-endpoint = <&panel_in>;
> +                       };
> +               };
> +       };
> +};
> +
>  &i2c0 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&i2c0_pins>;
> @@ -547,6 +577,14 @@ pins_clk {
>                 };
>         };
>
> +       panel_pins_default: panel_pins_default {
> +               panel_reset {
> +                       pinmux = <PINMUX_GPIO45__FUNC_GPIO45>;
> +                       output-low;
> +                       bias-pull-up;
> +               };
> +       };
> +
>         pwm0_pin_default: pwm0_pin_default {
>                 pins1 {
>                         pinmux = <PINMUX_GPIO176__FUNC_GPIO176>;
> --
> 2.29.2.729.g45daf8777d-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
