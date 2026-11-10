Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51B0606A331
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 18:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kpK+BOoy;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jSAsQhPh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FdrF6gRb5kv3fMUiNm0TDXE3caMdIIRZAt7cwY9vsd4=; b=kpK+BOoySX57bK
	ENtB5XcxbA0c1QAeIIBGjpnNnLvtecqobNVLX7W85GZq6OjAUyhaLP7tha4RS6A4QxrVn5nsSfG7C
	swQB5mGhkioYkEWMFnEfllG2saxZfKiEIILLo2vkQ4Ba5m3J0P09v+IvVeL53EjKRttwdebPGaeNZ
	+1X1lVbS+Kq2Moh+LuFBZrLps4z2malbVJpLYR0Km8LAIGsMBCijPHGfR7PrVvHfygIsh2/taFUjD
	H5gmWTJ7BuitNO/MST/5WSGIbgjqInR6zaSip7II+vyVI04XoRkpr+cahk4XEsKoztK2QxaOezZtl
	BEvEju4kpm49L06ExowQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqBX-00000004koB-1SKy;
	Tue, 10 Nov 2026 18:03:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQqBV-00000004knX-0T7V;
	Tue, 10 Nov 2026 18:03:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C04163AB6;
	Tue, 10 Nov 2026 18:03:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A951F0089F;
	Tue, 10 Nov 2026 18:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794333784;
	bh=FdrF6gRb5kv3fMUiNm0TDXE3caMdIIRZAt7cwY9vsd4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=jSAsQhPhEtYDWxk+k5+6vO77EtudHG8+iEH9B0buqfrNjXVMxVLfQsNPDwtUq2eUK
	 qU3lPFBFSS+yE31p3iKnd0KnjL9BBZLGSKRq/94JeqZe+Y6g64037JUVfEVY+YpZ5M
	 v0JzJDbfjQ6Q4l7qSztpmSJveIynKXFhU8q36PSlXz15xYc0ca7wVO04Ey9gJN6zmN
	 yF9Y7P6zzWfXzraT6rgB4djo8CT+vQygMl9zNGSsKU6UHltVNeQQx/2CX3+7hXUMZG
	 XV1zSdAO05mmG3GGyjO1/Jl9AiOjc10fGtx7HvRQZvocOsFetSW60XzEKupfIc760R
	 Md1aMV5233kgw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 12A223167791;
	Tue, 10 Nov 2026 18:03:02 +0000 (GMT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] regulator: mt6363: Serialize BUCK_TOP key access
From: Mark Brown <broonie@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20261109-rgp-91-mt6363-key-lock-v1-1-ea3b03a76997@baylibre.com>
References: <20261109-rgp-91-mt6363-key-lock-v1-1-ea3b03a76997@baylibre.com>
Date: Tue, 10 Nov 2026 18:03:01 +0000
Message-Id: <179433378119.125181.9313475186309265540.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1182; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pptdLPFeSS4LxiB7AY1YPgt3NQJtNKvPqiI9Z4P4EtQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+x4S+reWY2RJfd+Z3s1B+p4EVx4NtOVyb/mmwzxCJc
 AmUUnnRUcrCIMbFICumyBKXxf2yvuT1Gr6DC9tg5rAygQxh4OIUgIkY6zAybOqan7S/70AEv/Oz
 d80LLAqfmMvHKu8WeWH0W/0Ex6bE8wz/9LdN2V1oWzt36dsYph9vOzwm5qqZXUxW0PLOsni2beM
 MVgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The bits that select the FAST mode of the bucks only accept writes
> while the BUCK_TOP key is unlocked. mt6363_regulator_set_mode() unlocks
> the key, updates the bit and locks the key again, but the regulator
> core only locks the buck being changed. When two bucks change mode at
> the same time, one of them can lock the key between the unlock and
> the mode write of the other. The PMIC then ignores that write, and
> regulator_set_mode() returns 0 while the buck stays in its previous
> mode. mt6363_va15_set_voltage_sel() unlocks and locks the same key,
> so it can also lock it during a buck mode change.
> 
> Hold a mutex from each unlock of the key to its relock, in the FAST bit
> writes and in the VA15 voltage setter.

> @@ -508,6 +519,8 @@ static int mt6363_va15_set_voltage_sel(struct regulator_dev *rdev, unsigned int
>  	struct regmap *regmap = rdev->regmap;
>  	int ret;
>  
> +	guard(mutex)(&mt6363_buck_top_lock);

This function uses goto for error handling, as documented in cleanup.h
you shouldn't mix the two styles since it tends to break often in ways
that the compiler notices and errors on.

-- 
Mark Brown <broonie@kernel.org>

