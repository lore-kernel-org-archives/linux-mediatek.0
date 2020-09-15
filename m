Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039D6C433E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 12:42:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F1012068D
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 12:42:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AKqMz50b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F1012068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lA1gPvxe/tN8HvrmY8GdCTq3VuORYb1K0b//jQdPwHM=; b=AKqMz50bKgoipKnxaaHt2Alq0
	5ShsJqRrM3E4sRuVkm0g5QDf4P4D0rVcQ5Sgw8UG17SzSXkrlnlK4xo78khC89Cj0MejzI5Q8Fvwa
	3uMqx47ozAbM3fPfezY8sXyUUlVT+C3AbwpKZgrT19I5XowkzK+d6+N/A3P1NCqmuXziqOx5wWR3x
	RPz3lY1YaWwi4O8Ijziq2aiGb/pJ4lfHqVk5A4tauLIS+DGQjz8T7WlINbzIq8GQvLnYXAvEZIcV6
	glHJCmWllAVEMLbvL4QD/ZN5VPnHnVPEoLQ5MQnkCBlytIG2EiEELd0S0nqtASq0WnoJDqXJr7SNQ
	yQico9W0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIAHa-00025b-LP; Tue, 15 Sep 2020 12:42:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIAHV-00023w-46; Tue, 15 Sep 2020 12:41:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id A7AF729AD31
Subject: Re: [PATCH] arm64: dts: mt8173-elm: Remove ddc property from panel
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
References: <20200826090218.682931-1-enric.balletbo@collabora.com>
Message-ID: <ff5cf4e0-54dc-5e14-d76f-b674f6b0d884@collabora.com>
Date: Tue, 15 Sep 2020 14:41:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200826090218.682931-1-enric.balletbo@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_084157_340815_BB7BD1B8 
X-CRM114-Status: GOOD (  16.37  )
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
Cc: devicetree@vger.kernel.org, drinkcat@chromium.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias,

On 26/8/20 11:02, Enric Balletbo i Serra wrote:
> The elm and hana devices uses an Embedded DisplayPort (eDP) as interface
> for its panel, so the DDC channel specified in the binding is useless.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

A gentle ping on this patch.

Thanks,
  Enric

> ---
> 
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> index a5a12b2599a4..1fe5dac24ba1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -86,7 +86,6 @@ volume_up {
>  	panel: panel {
>  		compatible = "lg,lp120up1";
>  		power-supply = <&panel_fixed_3v3>;
> -		ddc-i2c-bus = <&i2c0>;
>  		backlight = <&backlight>;
>  
>  		port {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
