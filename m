Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E6B2606A324
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2026 04:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O1iJmA3g;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=JFajXMZH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=; b=O1iJmA3gans6km
	zRymqlpCgvn0Kg2nfPVnccW+JEAALJ/bUFeVxbwseN+FXWi/QujZtbelz7MYgrzeB9iD7TK0w8rWq
	IcngW04bIFQoE34d+9MSxx6vfBF5s18e5etP2gN/Wsa0AKQ30/Cu0eNcoRlz5OYb03v7DeIkm1Cbv
	0GvYJCGT1oBxjRd4QAoMMTLBzN9Thp2E1M5/acJKvsF3YQHICvn9Vv4sEVLIMulRxYRn0Z+Re6YWF
	Vj40boa3+jLhLofZ5WaajfzvlZS3JPhNYLWY4wapNShr7vfebfdBhtbq9Q7UFVaPXbU7cRxv15bMp
	dwCjnf3SkrSRCipxSY8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLv4W-00000006GN2-09d1;
	Wed, 28 Oct 2026 04:15:32 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLv4S-00000006GM1-1Mky
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Oct 2026 04:15:30 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-676804a3a22so539984d50.1
        for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2026 21:15:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793160926; cv=none;
        d=google.com; s=arc-20260327;
        b=NHmuMOcDqdxPHTGNu9W5jVmywmw7aIhRSje6S441HR2qMwzTb0GDjDvBCjDPiLXWdP
         EZcQGW455oVdDvPqs2oaL9o+pnJxpwq4oNjfhOk4cIWaFq02ZjZzleIaFKtd213KCDeX
         ZAVcjXxBb2qXyespcJDFC3cE3FjnShnqXpd9ralz5qN0BHE95wrYKTvOfDuPi5huPBSJ
         2A7Nxu/KsmanAuiui11BvmAtfJXVXBQvL/ybrOK3ME9jgkjYmXVWPcdnrBVYaqj3xW1E
         dzurgCRSj2YRQMVai93iG84J4AlVZyDJjrDO93IDgn4XgUOV5iByFJudBYNt+SChVtTE
         a2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=;
        fh=SlGWMyztGGnp/uW2TXC5NfeBF8DcwqgebYz58BAfLPg=;
        b=aqdOXuLtyRM2Ru3zliyMVjr8JxDckrbsg22Fis7fD6AS0POWj9CxNih8IV4MrKesT/
         ntQ6GkQk1NfVXeTdCCpxFCEPv+cTwkrEtQHvfb8tTYX1jGiRMiXoEUgHgOUZMZbLNbNI
         xVCuS46b55EEJA8zRJqDd5cgm0Mryp2/RAoWRjoUDguSpPDKrjts+gjWAiFXW+bcfN1l
         xM4Xn2YcaM6zxJ0lQi7etT6netZp4vgCn5nXab2kVl/hqE/nk7bvqV+gRM2j7BynnfC0
         dd4YlZghd0rv8oNnv+SUHKS6h9WK9BHOgYUtioUyp0/2SDaaHPq4KnatPB8AQnUvgsGc
         RKWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793160926; x=1793765726; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=;
        b=JFajXMZHtvf1VofMxvZD/uc6sJ7YzAQuOkxmomTmI5j87ek+EROLtRIVIJclWL600p
         dX0NTm9/RXKYh3hiE6+wZaIbVXidcUfcU/JsNS+RnBygI8ve6uB6z4JdCtGq2l3/s1rd
         xjj6U/2G7t3A0h8CDd9sJ0KlCmwxOnqUtAKt4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793160926; x=1793765726;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6dpWoYlTlEAfWqEEan0QByNtEFOBLeZmhb3FVQn0nhI=;
        b=F4sGxqF0poaT769IUEDw11LHqUYifZ5VxTeNhMklHzOcLrbHgQ5X1xSouqa4SYjmL5
         SxlyCHEJ+OF3OwwVNvYyco0o4wjav2UOXzyV2OrmtGZ6S5LgvlMYrnef8Skp0WBusae5
         jRjB93JrCgusFbq2IU7Iyiqid+5tnzv2LEgWEuRkgiUXsVT+BqGV0XtJaQULm4Neyyva
         S8W+QpJzKrQxS8XTmKhevsVdI9vu9kwTVBXrLTynL55y5gH8pRy6k/c81yco9Qar14Br
         tsPzgfeERZ8Eb3FsMkY4vLrurWdQ8WEu989d/Fqys0J+imfWfd/uw82nuKM7g7uVUb7x
         7KLA==
X-Forwarded-Encrypted: i=1; AKwUvBywdW4Us8uxB7Dg4/celo8YFDa5gN8fZLbnqUwtC6l09sOMwKhYvzVezcIS5SRyZEwAny/ZGKAkqF/tWBOcHQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKWpqfPxYstg1HLqe/uD4iYpORt+7WUlhvr1LhChivorP7cPoEs
	YWmeTPdHjeBAQUczoK6gbwhduaDeTtQ2x9p+P0F+J5KMg4rjnPu6ZN5sawJwG/jHSs1sRY9GuHj
	9qtgppgaWSktuFMNCvAowkER/T/bNms4zko14itPc
X-Gm-Gg: AYBFou1QzuiD6O2BE64iPAojZdqDYqxwr0p5l+Pd8SxHh7Y9gde1RgThqEik2LVgyEv
	W8BSdMRTYldJ7FHi1iVus6oejU7kEqyw+OkbyYvnqw1bfcI0jZHzhqt3ZSEkhSLKPBjKD4tr21j
	ZEhPp4kVU5s2xGNIWwpGS3Pd9LDYCwoAOzf9zj4mCy1K9Nptjr62iq/I6nvxym8TsPlSk3r1Tcr
	gglcapAeIrV+2v0Ye0uTbi5ND2FyUVB7TMiwKnmom3ErcnJmsH0cJZejJp+wWuWRZTc4GWW2OTs
	2RwqKT50gW3Vgv77xa1LWqB+MOncDodZeB/qp+PyHEtw4JEY4dtHwW/98KfXGBfyO3XX6NGxpmk
	bAFnqgGpyQGfYGzsSbP482FNhSq46+9F43bM98Fgc4oK1CYj53yjTQyuiSZxvMCByDuY7gzUzNA
	ZAWIm31nFUW4ci
X-Received: by 2002:a05:690e:2047:b0:679:5ae6:b290 with SMTP id
 956f58d0204a3-67a7b9a67d5mr1033094d50.3.1793160926582; Tue, 27 Oct 2026
 21:15:26 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027093306.2812695-1-lee@kernel.org> <20261027093306.2812695-26-lee@kernel.org>
In-Reply-To: <20261027093306.2812695-26-lee@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 28 Oct 2026 12:15:15 +0800
X-Gm-Features: AclHuK-igjxt6NXixiazz6taDDNXzzugHQY9dV8o_clIASacctwSUFB4CoYNooQ
Message-ID: <CAGXv+5F1WthGsE0zFqThBge=quNQ+8_LTtH4Shsh1dpdvGHV2A@mail.gmail.com>
Subject: Re: [PATCH v2 25/27] mfd: mt6397: Unregister PM notifier on probe
 failure and unbind
To: Lee Jones <lee@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_211528_401924_A53D0A80 
X-CRM114-Status: GOOD (  10.22  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 27, 2026 at 6:38=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
>
> mt6397_irq_init() registers a power management notifier block embedded
> in the devres-managed struct mt6397_chip via register_pm_notifier(),
> but never unregisters it if mt6397_probe() later fails or when the
> driver is unbound.  Once devres frees struct mt6397_chip, the dangling
> notifier block corrupts the global PM notifier chain and causes a
> use-after-free on subsequent suspend or resume transitions.
>
> Check the return value of register_pm_notifier() and register a devres
> action to unregister the PM notifier on probe failure or device unbind.
>
> Fixes: 4e2e7cfec13a ("mfd: mt6397: Modify suspend/resume behavior")
> Closes: https://sashiko.dev/#/bug/linux-edb62fbc-213a-49a2-be55-c002e234e=
554
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Though in practice, if one hits this then they have bigger problems.

