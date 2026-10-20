Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6059606A331
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 01:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AKN/9DPj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kJQNv8xS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PkYwyHMfJbGSQ+mbZIjKmmDSlODNjZUoD2Y1WRfOazI=; b=AKN/9DPjhC/96riSjQ3VYVS03z
	fQ6Cha+cGFMoEULI7zj/U8hMRkeCd0mPJlrP55f/lH/Tsu4zWzC76McQYSLddF3ySnUwE1i2O/ghK
	u6xG+6wx99TlANC2P4Q9hJ7nlHKL7Fm3oezgZ1sDbKYibczkfSV9PSXYLqSs8Ex8oNxMieuGscT6k
	PMgqwABU/rMWW9wmbkWVjVCfMIFF7gf+xft3+z+UaJQYK4r3HSY+B2E/L44OrMAEETpZJGPzv+RYq
	FCnP20CDDwPWzY5LariacnoDmjF+hjUSYt8QOGco89HQyQuP/F8zT4WlkFxHBPGVygaKDi8i9VgWb
	+fJZP1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyqS-00000008dRn-0ZiO;
	Tue, 20 Oct 2026 01:40:52 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyqQ-00000008dQn-2har
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Oct 2026 01:40:51 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so5821136eec.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2026 18:40:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460449; x=1793065249; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PkYwyHMfJbGSQ+mbZIjKmmDSlODNjZUoD2Y1WRfOazI=;
        b=kJQNv8xSa3Bo5umAWU6kbMaXFG/QkGWT77bJKZIlY8HWcFT5XseN0pr7j50WRmDOSX
         r5X0y/OlokK99U1P8J11dRzILjBsZNwpCONz0/e/t345e2xuyi+YwdZAKNchEL1GKW1z
         IXOMKDiwTB9plbHAlkPGnjNnBb2fPkzy3RoW7RFFViqcLv7A9IFnYvyDCVnPhaWHPlTD
         CtT+o04k2ZR58FAW///QHwJ4JoIK/x99SNKe2TzrqLbFoaRluEAlCV4iYZMbAJF2LPru
         q2mbistJVpN6PQVJvIJg3OhCjR+OEfnmwa6/zQ76/8n+HLrHhTZCXj9REYXjmzQLecUA
         3tDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460449; x=1793065249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkYwyHMfJbGSQ+mbZIjKmmDSlODNjZUoD2Y1WRfOazI=;
        b=XhkGnC4Y2VUn9fxfvQBqnM14cxN57ol+qnMy/TYHznohIlL6zacrMn7I0lszMh4Z6l
         YdlOeATB1YQ7XLYeeS+V8ggZrLwxZHrBUsAgLnkGPqirj/OwJOoMgBt1cnuvDVhpEv2e
         FkCRg6Y5Q9GG87T/a7pff3Ms7dn2O0rnpGWQ4HyO64lUA/VPAc/DymI8fLO5oICEYZww
         Q7bu/LzVlNiKq9fBfr3bgyppUukiG81vyQHp1PgGPhle/V7WPNTaNuCSZFLoNzyTi8lN
         eT0t45XkQnluO3Ok6dsLiKXdVwsDcWXoBAtmNMMk/dtTW5/WUyrZw9zh0Ba5TC6+YaAp
         yR6g==
X-Forwarded-Encrypted: i=1; AKwUvBxq9CyfwXAuGhaqS1V+sEhuUNKVE4+OwMgXrpgB2ppkjQ6eV6+IqdgkFlcKofEH7kCM+rWPOTnwSM6b17066A==@lists.infradead.org
X-Gm-Message-State: AFq9FYKHMVU4rz3A5AqaTU0WpY3nGuQ6u62+VwBE4xQEwEUXXyd4b/VL
	DojXNsmKBHJ1x84010Y/fKI+BBlYYRlpc3/wqdJ38OTPd2k5QqTXxHR6
X-Gm-Gg: AYBFou3Buf1+u74rnsz8gf2kQYdJCJAjp8yCn0xYMfK8GDsJgOIEkKixImrvSFUEA+w
	i3QU2MCZe3FWtkG8LImviWwFAr+zuYDgRBDgH12vywEyG2PDetghAkukj5S9nZXVTTw8KdkUg87
	Z36GNDqHcFb2elqPFS+tDE2E7rRSLoD6OaLkiMjtWCWKkK7V+WjmMHge25y5eG2owd9LEC8eXlr
	LFgv5s9ZGlxainoA8SorTxD1rx/lZsr3xHkj+oq7IbRdwhdv+pPnaG39sV4SMu3CqU8iKJ+26/u
	z6ufCFTu2Ag9+e9sJUE+Tz6q65kpzjmLIYfiomlmkLdB5GWpp2DC/0i6sX4PvzlOL1DVUmbotxy
	B0PMxRRzWZCfhN2n7q/0J8KLKlYywTKJcOgifhuwoTreaB2vVe5aSYoS8bdnkuaijle+zoNJQM0
	OPptSHhl620QqO6GvyjWw24opAoh0szdPe/qnq0I1+atIdnvh00rxzucYf2hDNX15mDBwlG6TZ6
	gEoNq1FrQKX
X-Received: by 2002:a05:693c:810f:b0:353:7d17:9a86 with SMTP id 5a478bee46e88-361a2549c60mr14463175eec.26.1792460449367;
        Mon, 19 Oct 2026 18:40:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608219f838sm36078733eec.19.2026.10.19.18.40.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:40:48 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:40:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ben Grisdale <bengris32@protonmail.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 5/8] dt-bindings: watchdog: mediatek,mtk-wdt: Add MT8163
Message-ID: <efbbf24a-59ec-44c7-8738-13242c7cd90c@roeck-us.net>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
 <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-5-f2462b2d2437@protonmail.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-5-f2462b2d2437@protonmail.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_184050_674545_410590A0 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.5 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 01:40:01AM +0100, Ben Grisdale wrote:
> From: Ben Grisdale <bengris32@protonmail.ch>
> 
> Add a compatible string for the Top Reset Generation Unit (TOPRGU) and
> watchdog timer on the MediaTek MT8163 SoC, along with a header defining
> the reset IDs it provides.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter

