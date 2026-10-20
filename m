Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52657606A321
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2026 01:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lf/0etan;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LY+C6XtG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fr0TV53Zh4gczCXYrk8qJ7Y+cVmeHFe014wAKV8qTsI=; b=Lf/0etanSt8aVT+xjaVW3d7LBZ
	5YfXP0ihE828dIKeM0VuV6Pr15iqaWRYbAqUdISkct38ggaWIUT7yiB8X2fw0TGIhiEhsRyw8ZlvK
	rIzQ6cPgkUJJPTixn2wCHFKdA98fesEV8kTkPXvvhjVVTtx2eT+/k0GvkGVk57KZocwlbrZ9b2qur
	xhXdqUumdu5yV8j0du6XAHSAI2+YIIOaG2bvtKFHjFUCgJegPVJY3KYvKUctTdsBhpyL2mb0AxLCO
	dAlwXP4n+7g4vsWcdZkgYm1SzSlN/T5tDowCMar7yIU2DlppJqGTT0sQUPzhLrVNjnaGKLJvaM2LN
	r3prkhlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyqz-00000008dZ2-1Q2C;
	Tue, 20 Oct 2026 01:41:25 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIyqx-00000008dXm-0GDx
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Oct 2026 01:41:24 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-15ea896ddc8so3340224c88.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Oct 2026 18:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792460482; x=1793065282; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fr0TV53Zh4gczCXYrk8qJ7Y+cVmeHFe014wAKV8qTsI=;
        b=LY+C6XtGyegXdUBcqHYz26hdUDAbqI0dMoB9fxE4SDsbrBOvsGEKKZagncewDmkySp
         evMgQte4CSUirPB5VO1kGVr8Ku8ReJfB8J3ow+/haYED8A8sOnr04NDfSbTtY/791x2v
         +1OnRS+hLZsbRGtVY137genFNBdwUHjkVE5gavi1jz/x4bprsFBHr+4QITiqQt8V+c40
         w0wcydu9JZYkT68FKKXJNuU7ryzqYy4ZSyocIAzYxI3gEHG3S4P2dp6L3eqsMHxQCC7I
         OcIbhUTIGR3gBkT+YSY549qvWOKFklwVg9XkuyWLzHvwYd33rbNKIrX1rcr13xRr0+Kc
         SHOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792460482; x=1793065282;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fr0TV53Zh4gczCXYrk8qJ7Y+cVmeHFe014wAKV8qTsI=;
        b=SUPE2nLQNdPvvnPNW7zhcWVgcS7N0IZ/2MZyHPqO0VNzIl/BR/225+R8sSyLzOFzEz
         T727jVPRF6qENOPgaWWYx2TiZosS0d1vrXM298jVbqTyjhHuQbB+QyRQJLgNOLWvrytS
         okmXmWGtRBdLM7upwqZ5N3jIkI3U23FWEmMyTl165VpVw8+MZKWaK5jd4kq6FV+D7mJC
         DUCUkXiDmPl/OZ1zAGyffYOcJPoeechRuNd43BEfQCSJzwrdTJrKw7I655ZJNEmbzj8M
         eRMz3kbhTDLX041oiPY+RcnXCTdkHjK4oK7JtvZAKh7SuJwlMO2q5VEb2c5NVilGDHkx
         tVsQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCNEfAfuc27tfaZAnqHd31E7l0L9m0nJHvs9R4TV6ZC7KUioK8//UwhRKFobr/9XuweCLeDVzZ4icxBXtbAA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKZTjiUX4CQ9gqWO3WiHheyBeDhM8kKbSVHmuP2tjuou51m7v92
	HTPsKIqfFjsexk1rNBfEqZ9AeRADtSxKo1/oFdZOzSlFRvQQwgYAR3Et
X-Gm-Gg: AYBFou1NbXr55ILMATIQ19JDSRpboLTekZyCuQ4ztfcsSBc3H0PBtRsmxagNQC2FFIC
	vRd7ONw7Ry1MXsb5xjlW1oeqQ2gez/DmIfTEotXiygGuPIaGXILFcZ0WtlyhdDHPNAfcRTTvZn0
	X7CN9hMIhfMRLizBeElqsmn5shyowX/QsA4XRbRBbBXgcVP8jvBAtPRO7BZrX0kLKkZxQjXJLV6
	LP6coOhYbq7W76B5Tvg7/X9vk3TRAuWnHRJRD2avWuh98Y+aENAaG5Gz9OpSlDdVcUwJnLsHfs+
	YAfx0tPW0fiIl74jFRWPLTjC4nVidWzhRTrmMLEzgzbiChq2AJQY63kl0dfBgKcMrLx6f4nMKt5
	NUDGXxCCS06DA77C+1nxZ5xJQqIh3lTbh7ObXqFBNBmurei+akUfX5sfvASAzQenulUbZ9imFqk
	BJnkM8WzMRbkW9guH1SSlMghulDLFwNaWhPuwmdL/ERP+nWA/E6J+/qSAhGHMWsGMzHQGFFbMRa
	Rd4BknumW+tIQs+6ubFZHSNcCxjqmVFuspZlEqiYeuCuAXK71YeWigkOjwrYlZlarlxcA==
X-Received: by 2002:a05:7022:ea50:b0:143:2968:564c with SMTP id a92af1059eb24-18512f1e993mr12640931c88.26.1792460482105;
        Mon, 19 Oct 2026 18:41:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c2e7bf4sm28816461c88.20.2026.10.19.18.41.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:41:21 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:41:21 -0700
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
Subject: Re: [PATCH 6/8] watchdog: mediatek: Add support for MT8163 TOPRGU/WDT
Message-ID: <589d0ab4-46cf-4b8d-b4b3-5519dbf030ea@roeck-us.net>
References: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-0-f2462b2d2437@protonmail.ch>
 <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-6-f2462b2d2437@protonmail.ch>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-arm64-initial-support-for-mediatek-mt8163-soc-v1-6-f2462b2d2437@protonmail.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_184123_890074_FFC5FF03 
X-CRM114-Status: UNSURE (   9.50  )
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

On Mon, Oct 19, 2026 at 01:40:02AM +0100, Ben Grisdale wrote:
> From: Ben Grisdale <bengris32@protonmail.ch>
> 
> Add support for the Top Reset Generation Unit (TOPRGU) and watchdog
> timer on the MediaTek MT8163 SoC, which provides 15 software resets.
> 
> Signed-off-by: Ben Grisdale <bengris32@protonmail.ch>

Applied.

Thanks,
Guenter

