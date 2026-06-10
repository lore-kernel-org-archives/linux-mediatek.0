Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB495CD98C7
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 09:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=; b=M8atGTNnlM2OMWljFvtJ5KlPjY
	IIeNtvYP/RBzW7P9D3jJ45CbQJYQ/l2X02iT/1sq7Ru5AJDWO0AhQLC0CtDQ6IhvVzB2Yz2+tk7WS
	64Il/mFYxkLZOM2H6lTg4ZlCxJueDCqymKnQWvtLRkTtTjxR5Jultttn4eMpZrs6JGsGMm7MLvhiB
	urCtSVMULzHr7hgZTT6yaNSN7ZVMC3ujc20yYk2zBQptQtBQJ/nBI3pcLcPfAmGSAM+iV8OdNu824
	TcsBwuAZ5QTD43Vk05GjzgUoDEBHfidrHGxQXNO3rz5IPxyQa4S3k/L+pcqHguusxfMk/5F/fxApo
	00IIngNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEng-00000007APl-3ULM;
	Wed, 10 Jun 2026 09:00:40 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEnd-00000007AO5-32Jg
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 09:00:39 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-7dc73a56b5aso44454467b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 02:00:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781082036; cv=none;
        d=google.com; s=arc-20240605;
        b=jMcoa9ybgXwrVSAtR4U2pvHzraaOR7kVJzevfQO/ObbOP3Tu8zAs5ly71ZP2Z89nsa
         XN44z8Q/B9KezLmkrGqUxyz1dXcF2Zv4BM1M1DbeVzjdLH3OQjqHStp7MygzCE1GLMBL
         fFL2RzSpysPl7VUZta5DUPQhR0e+ccVdclJS8w9lXpAKEgwqa/wvFB2fiI0G7PlfgV5R
         UzoOi1LznedW+RlYn3kd8kDexNKlMvl17bBDzf12+QdLcHutEJeoKUfAjBnk5GEie7r0
         BlGWhVsCtNPOHzxWG3xG0YWgTgrRt1OmVgAAN4oWLaaVDFgT6eP7JPEWyfX72DLYgOND
         PV5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
        fh=RUL/88h7hv/M0sFozwzHiZ7D9XPSwDJ6LKMA2YaxBhs=;
        b=CvCLZ8YOilG+EUAo5qdoMiqLxj9oRNYMtcUiZI9faq5REklBOz1tHhsAu8psXljH91
         NjoPTKRGDwHncXe2ck9mF5zVTjyD1Y0MqbaTKlo9p1aJ+JjKWlCfKBZPFDlc6+w1p2k2
         pXkfORBR8LXvjYm89fqTgLvmgVgdnyNxKQ84CHMc5ztk85QMheOnkdqA75FZEt4rzdS4
         QvCoQrgIiU1vNHxk90zn2uIvxLdXrW42aCs505HnuKz3yk0bae0ZEOGdfrSQEMPClPyM
         mjx8XHfi44m7DhyjAOgRFhL3Wx+OOTiuKguz0xW/t9R3yOtD/dmFyVsgkVhL9C9Qzzp8
         Z3rw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781082036; x=1781686836; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
        b=m11SGb8baYrqLaVzKJPK+1pyaxi2DReHyOS1swQvlXXnwi5cQIP+JrvjHLKd+9xdGi
         P2au1Q+cqVfKgCfvmDC3iwqtgIPolWdUAtArMQ1rbS6Rd/ZH8qGXtog9SJ8Wdy5wTBwo
         M8RAbyypDzKm3GI7tIw9xhMkbBcQBsBKsCgw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781082036; x=1781686836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nrbLcQyisI1OEjYF2JehulwALSIbAajyo9F3M0zxr/E=;
        b=Zz1UTORPBC3YPZ8fefWvAQ6NNtlIglAIfK39tqVD6u+Kn/1D1/fCnlZrOruXQ92Yk3
         /+a+Vg1Vv1LCP6XogK6+l/TWJ36GT5lJfaBT7rHJ4Hxa4gQEW4XiWJMDAxtPdvenasoz
         wGxkMSk7hXDPcdKs1rLJmWlU/M2xnU0OqNV6IlnKc25rKZFRGfyOQkClKSVfSDPPxTH0
         vHoes3278yvcNfGf+WN97LrOnJ94au9VT6bXSP9W3UO2YCB7/AIoaL5dNuPAnOqPmJwf
         MhhtSJJAChetgcfdtScC4T1cskwNmHyndiIdU+KGQjd4Kfegz4I2H2r7wPknHgRMUchP
         vDCQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FkIL75zNk1/iV8Zk65fNb7vX5VXWMI4PJrouPCrDkLoizaoaLUQLs3dwAtDTbz9kHuLR/Sh1DG/V1nxe7+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv+N4vhvrWbIJT/k5VwieQpaZjvelEWvOf+Ciz6mujOOq9XG7g
	FqFo/Q3976zgEvov5ryXLs7kOsMplc1tiPsgyrGGq6JQ/8dj3nFkgbazamkksr2IHlxetdT7OMv
	dfOQMs9vL/0wcmmq1I0ZxsU+/6YyYEVj3MiMOWrdU
X-Gm-Gg: Acq92OF0k8sxC0/KqfHKJLuWOa8U6HOb0vsUwsTdHadJrMRQlHB76UHprTo+LclPX6/
	Teel0/9nynkZcTUhyg2PFT8LzLKQW5iPE9pwqxDO56Ve+J1dfC6lnR0+Zkx3kNXceWTwJWq4YVP
	DJvQBFeMsQuuQclvSnsbA8TrJjnp+pLK9mEvjZ83xooSgQLJZ023mkIv//NUj50mDfCVsrRIekO
	6txzCFXO2t1o8d59l9mR6+aKvwUzt+7zUNYfdGdMohC+rumeEXzxYt+6HdNKU5QbOrgv2pUoqV+
	gkCQVNSo1YkqjSUbNkZvdQyK0QcKxg==
X-Received: by 2002:a05:690c:6c08:b0:7bd:8d1e:39fb with SMTP id
 00721157ae682-7ed0a4ed459mr225795957b3.7.1781082036496; Wed, 10 Jun 2026
 02:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-4-wenst@chromium.org>
In-Reply-To: <20260610084053.2059858-4-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 10 Jun 2026 18:00:24 +0900
X-Gm-Features: AVVi8CflqNzYUTj7jVe9ENVhBouReNOK4zYnRNLDpQhNXfjJp66LGpOOH45Xjpg
Message-ID: <CAGXv+5ENxq3B63M-HnW95we+2r+WLfCLm5TZ820zWiC8FSakSg@mail.gmail.com>
Subject: Re: [PATCH v2 03/16] power: sequencing: Change CONFIG_POWER_SEQUENCING
 to bool
To: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_020037_797611_0E2E90AC 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jun 10, 2026 at 5:41=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> USB support, including the core and hub driver, is bool, no modules. To
> be able to use the power sequencing API in the USB core, the former must
> also be bool to avoid the latter being built as a module.
>
> Change CONFIG_POWER_SEQUENCING to bool.

As Sashiko pointed out, CONFIG_USB is tristate. I was looking at the
wrong symbol. Please ignore this patch.


ChenYu

