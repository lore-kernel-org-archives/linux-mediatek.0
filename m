Return-Path: <SRS0=S3hZ=PN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F0AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 11:59:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7336061073
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Oct 2021 11:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7336061073
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/EfLu8pyxY6SXQsZ9+v1ph7jNyqVxf8VobljuLlJOU=; b=lpbu16xSzNRV65
	T1UY7jGuDF/O9Rbwbsb88wPDDrFeGe++YPvJHNFQ1K/LsUx7A53KBc6DTgOqzbdLaEBqsbC9U23vI
	QSfO/jIQkqvHgfxFxgeCFE+BB8BGIfYAYzuRaTnuQcjfBX8nFPwCunmCVXM34oOwYpoR3Txz3NQPg
	YfJ1E2DbH14iv5Kdsb5T8ONMXaHW2GqA4jRGTaRygZs2kPBUi7PFf0mK5Z94Jhbv6cx0inGARfWfS
	5kvcDr+Xn1n8P2gR6c0IGrZT2/4XnlwEvFqHhYc3YvkjFn2uLLWhmr4HxVo2Bh7ODhL2tvjj40y1p
	h4QzQMhh7VMUA/1e3xbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meydV-00GLLi-NV; Mon, 25 Oct 2021 11:59:29 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meydS-00GLIL-HD
 for linux-mediatek@lists.infradead.org; Mon, 25 Oct 2021 11:59:28 +0000
Received: from local
 by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.94.2) (envelope-from <daniel@makrotopia.org>)
 id 1meydL-00083V-NU; Mon, 25 Oct 2021 13:59:19 +0200
Date: Mon, 25 Oct 2021 12:59:13 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Alan Swanson <reiver@improbability.net>
Cc: linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: mt7622: fix cpufreq 300MHz node value
Message-ID: <YXacEVg6BNQGIo0l@makrotopia.org>
References: <7e20cf11f400462a4fa72c61e0e3a783198d805e.camel@improbability.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e20cf11f400462a4fa72c61e0e3a783198d805e.camel@improbability.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_045926_619940_09418BB7 
X-CRM114-Status: GOOD (  16.51  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Oct 25, 2021 at 12:07:24PM +0100, Alan Swanson wrote:
> Descriptor is "opp-300000000"=A0but opp-hz value is "30000000"
> missing a zero.
> =

> Fixes: a5a80f78657f ("arm64: dts: mt7622: add cpufreq related device
> nodes")
> Signed-off-by: Alan Swanson <reiver@improbability.net>

This has been reported by users of OpenWrt as well, and it's an obvious
typo.
Some boards hang at reboot in TF-A bl2 when reboot happens @0.95V.
Raising the voltage to 1.00V fixes that, but this should probably be
fixed in TF-A (as Linux itself works fine with 300MHz@0.95V)

Acked-by: Daniel Golle <daniel@makrotopia.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 +-
>  1 file changed, 1 insertions(+), 1 deletions(-)
> =

> diff -u a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
> --- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi	2021-10-25
> 11:30:11.000000000 +0100
> +++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi	2021-10-25
> 11:30:38.638229331 +0100
> @@ -24,7 +24,7 @@
>  		compatible =3D "operating-points-v2";
>  		opp-shared;
>  		opp-300000000 {
> -			opp-hz =3D /bits/ 64 <30000000>;
> +			opp-hz =3D /bits/ 64 <300000000>;
>  			opp-microvolt =3D <950000>;
>  		};
> =

> -- =

> =

> =

> =

> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
