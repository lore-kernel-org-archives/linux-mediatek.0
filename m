Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3A89C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 13:03:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90A6122CE3
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 13:03:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b98i+Zxt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Udzag790";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="NvNUEbg1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90A6122CE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C5zDfnX8mfZV8+//bGduhFOvG037VfAV2lfwr4Xi+nY=; b=b98i+Zxt6qlGKKm/lYTZGQUAQ
	nTvPlrTaq0yY2mJysFKUgSgLDtXmDGauQmygzWaE1PZe8EDUptnZBapI5KcPIy8iQXSsLfu6uXFWM
	lRcNNqVNKELlXdSJALcZFApB7aDVNgJTzgBeZEG56c5jt5jMPaTocVP5qFwByKkAkk+OQ0vdnkfJ+
	CXHZZuGzCGPN0yWvI7SzbvOrIe/F7F16mHiPEc9J6P6hrCD90MtC9qujRZaPpUbI09gDWaRk8mYNn
	ykYTp0+clQp6Us4fxqEy9jTfyHx1kw17+JvPw/HUiTc/eoQAOi/5xQba44JAXjmt5lu6aPo0pSX89
	BydOfNSnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3J4f-0001zY-6v; Wed, 05 Aug 2020 13:03:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3J4b-0001y0-5D; Wed, 05 Aug 2020 13:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=2B1nU1he86yO+4/1btIQjiCmEoY6DMth3wUHkH4+Y1k=; b=Udzag790m1ovaGZdsUHyDM+VJf
 iyV85lUHmDFphX+GmnSGjEPNPRypmNWxuO0LfJrD+CB7ZtsD5Oie/n9/Yv0zpQFm0hRKr/A2sTvZY
 dwZKigRghOMigk3hYsfUo/BAHb03H64jRQ4rUdd2HHafH1sABvSIgolvqZGN1+4GFkaNTzgCxcnbR
 2ob6GEBaoC3TM/rUrWV8oe/6bLr4DzAOX3MHxRPgdmkrhBAVkSQW2w6ieGXScpOR6FVjHq0RaliT1
 SYaypGXwbS6cZVDkXV/YJJJQzBmX3sDj4vc3+qJQPC70Ld6GX8tbwitIkfI/oQexZNa8l43L/bOm1
 pmvVjmww==;
Received: from mout.gmx.net ([212.227.17.20])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3J4X-0003fC-11; Wed, 05 Aug 2020 13:03:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1596632512;
 bh=30nFNzwPxZmz9Y2oABIElubYun9r6VlJJIvIzFQZ2Xg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=NvNUEbg1eTjb8vxJMZ0W8xXnbs9/JscXJ3mszIMsD8v9lFpwCVgS5DVp8WSBERSCM
 KGFK7GawcJMt7WSUcLSQG4vMclL0NulaBgvSve8sxjwqV9nIfEirpf19ggzIz1ZoS+
 oUAD6LODuMyoWnSzYRV19IJHRPQpDzIcJizHw1Lg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.208.209.197] ([80.208.209.197]) by web-mail.gmx.net
 (3c-app-gmx-bap13.server.lan [172.19.172.83]) (via HTTP); Wed, 5 Aug 2020
 15:01:52 +0200
MIME-Version: 1.0
Message-ID: <trinity-9f86ac52-5249-44e7-b51d-1ee00850f544-1596632511956@3c-app-gmx-bap13>
From: Frank Wunderlich <frank-w@public-files.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Aw: [PATCH 2/3] arm: dts: mt7623: move MT7623N GPU to separate
 mt7623n.dtsi file
Date: Wed, 5 Aug 2020 15:01:52 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20200805113013.2763510-2-dwmw2@infradead.org>
References: <8ef96e4d02ef82e171409945ee6cc0348c4fe594.camel@infradead.org>
 <20200805113013.2763510-1-dwmw2@infradead.org>
 <20200805113013.2763510-2-dwmw2@infradead.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:G8MRnqoV1D2B0ErxKua+b90DZKS/NUdemUbrgGRwofr3Vs3wa3sLtGJLSaIjAmckjfQuY
 N2q+Z1WAU5keJxhmjgF2SFnKLAx/+ssSg5jG4hUSN4rhMAozwVfyIJHClWHwJMkftrm1YI9Hdl3N
 N2EZp25fXiSYSNd4CgWyeh3C56OTSnt6jPqOH91UQ3q3+VeqQ8/hSKikviDmaPX5zjuc+ZoBk88W
 vF8v75+g6PyEv8XnV1zeMlKR5e7LgiTjKKDbo3QbXbuY0GPdBBboJNcu7cnHK7c5hBWoJyu0lqbH
 o0=
X-UI-Out-Filterresults: notjunk:1;V03:K0:jiGjo3r8E60=:SBV9Be3eLAX/vuefSNp4aT
 LkYXJUqZT8gJj5PqcNiEwuwkS6pryGTowBjPlaoDRcO0PpqHZF3SIL8U6V3RY7Wn7BCn6bj4o
 Etz6RdBQ4pAfWntN20HvWnRT9RwtwiQNOjdcYq2tiY5pZn0vJ0E62+HJ3KfVh2jc4r4NQgGBY
 PLjmlL2O2TeWsHBqCeIfHIT7Oy2889kOIWIJkWb5iWXv3Suw+lHxJSnxEce3WpXNPFu2whau2
 KaAnWxDuLN5H5mXGf6gf2aYTY5vHoUFB0SDZKnHj30EM/AvPXTIuKM/KZrvAT6CkJZASi1RBW
 wAnnWjiv95cUOcwEJ7yq08IterdkJFn++PEtDgeRpnnCmO9++OPT4wUsdb/uXbOcc26zYB+JU
 ajzULtPfh7SjFTOjPLwj0ypXysExotP3Krs1vBFVECARsiPTfeEgw4HGzjlr+h8kP+afXwAEQ
 yprfDYRgMyKmVj96fjfF3rBhHtytYk1o2UU2t/s4hQssUzGOXf9dLl0cVk//6bqMYnwG8H2cY
 DUzmTP0UOx73F4+nwW2EizlJZcZ7HXTAKRg/sKvuTJ5psVDH5Ss4Dm6TtACBHcFHt8YEkxZnS
 eHzfZXNZXe0d/mR7iMqk1jm7yM3ox7eF2Qqnw/IjwY2BEbL2uXKgFUtltb3qGp4uRqnbAcFOy
 dZZmG6aVBAmKCcWwlGYbwZV5vNM8kXO2C5Pyy1RWYWhkGvsOQsMJ1I7MaJrueJZCof9E=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_140309_296339_27A4A2B7 
X-CRM114-Status: GOOD (  13.47  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, chunhui dai <chunhui.dai@mediatek.com>,
 David Airlie <airlied@linux.ie>, Sean Wang <sean.wang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Frank Wunderlich <linux@fw-web.de>, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi David

> Gesendet: Mittwoch, 05. August 2020 um 13:30 Uhr
> Von: "David Woodhouse" <dwmw2@infradead.org>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> The MT7623A doesn't have a GPU; add it only for MT7623N boards.
>
> Fixes: 1f6ed224594 ("arm: dts: mt7623: add Mali-450 device node")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>

> diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
> index 3a6b856e5b74..dcd2f5ba4e20 100644
> --- a/arch/arm/boot/dts/mt7623.dtsi
> +++ b/arch/arm/boot/dts/mt7623.dtsi
> @@ -734,30 +734,6 @@ g3dsys: syscon@13000000 {
>  		#reset-cells = <1>;
>  	};
>
> -	mali: gpu@13040000 {
> -		compatible = "mediatek,mt7623-mali", "arm,mali-450";
...
> -		clocks = <&topckgen CLK_TOP_MMPLL>,
> -			 <&g3dsys CLK_G3DSYS_CORE>;
> -		clock-names = "bus", "core";
> -		power-domains = <&scpsys MT2701_POWER_DOMAIN_MFG>;
> -		resets = <&g3dsys MT2701_G3DSYS_CORE_RST>;
> -	};

i guess you should to move g3dsys too, and maybe the mmsys which is also drm-related?

I can add this to my series, but before i change my series, i need advice from MTK/DT owners whats the preferred way ;)

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
