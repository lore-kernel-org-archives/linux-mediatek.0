Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA309CCF9EE
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Oct 2025 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N8+rq+xZPmi2I8g0y9aIjmTjbWxMyaupeqzQVgZxcEI=; b=iqJlf7SwnjQjDs60fM3++v2WFQ
	nN1fPB8NjQRO/Gb9BclsxRjzaYm7ALtkxvTdqHtsQ7UTwPLdLdMYucw9n+zTdsQXszioF54TP4KFP
	RoD1n43rHYJmuZ26LtgL2xWdMIk7nki7hDfl6UAeraEX2ZFOz+0uezrpsQ7YcOJdvTgMWSengVttv
	cXW3F3ziJukzi7JbVMaJv+W6EbsubxxQI3HBvmXH/7VFfTHFhitltbgg5ZziADds3b5x4w5n6RzhX
	exb19Rq1oM7jVLpk8HhNXAikTPrQL7bI7IXOI9g+ERuTvyZR/8Vzjdw5QdL9txEc0cXX/4ElOxrdZ
	nYOS0pcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1KJ-00000000F1I-11fX;
	Wed, 29 Oct 2025 08:14:39 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE1KF-00000000Ezs-1Qo8
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Oct 2025 08:14:37 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3ece0e4c5faso6188548f8f.1
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Oct 2025 01:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1761725673; x=1762330473; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=N8+rq+xZPmi2I8g0y9aIjmTjbWxMyaupeqzQVgZxcEI=;
        b=PnpunHPJVta/GdI9fEX9w6+29Nx+L0vXRlynw9qXn7swR/zgbofu3w8SWn60hqkBz9
         P2a8VZJ5Y5c/sR+FezJOmi/TPg5gFJ71V1bACOXovcB23YHuZEkOOLtMWFUf/bSTrtBG
         6Vw4GeghZc68OLu7NnLwkNOT4dbyCx2kj6ALIYHQjikxtSlgCmFZnP46K1l5+QP3Nakj
         GCi2rvAYavLFdyxsvM17X/wZ/L4n6mVLxZngH+TILYnMVgo+8HnlznRKC4q2Gf9U2p9x
         GjAx6de+G524MuZPmx0J/AIVNnomoDACb81cSH6TPrAHONc1I8n64jr+ij3jtBcGVM46
         HIbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725673; x=1762330473;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N8+rq+xZPmi2I8g0y9aIjmTjbWxMyaupeqzQVgZxcEI=;
        b=jUEqWnGtjQJHWPPsH0KeiubFbyqNNqZK1qODF+GiPBU6ms9tTCEJKfDKWuX07oexJs
         umu1f8PDmoKvznh53A+VL17d7vXrOEpvZ2Igf+Zmv5VsTsdyE5Qqt9rO5SKvjkren/rw
         H+uMv5l9pxd6lBBTkpFdecx3MpsoTdkhv/gjh04OWIm441Xv9A3vRLHadNBbPv99yY9T
         VakM4aOCHd0vi7Hz3ShJG9tCwbWGsidWztskej5Y6Rnsh/MKa4mt/HbYdIdLoAt5e7Sd
         b96zB0/zh4yrs7jjWQdfSjWZzkVXWeYyhrnUTK7Y3+RZDiaCLQhtQtF/vXmbIACa6ZBy
         LOpg==
X-Forwarded-Encrypted: i=1; AJvYcCXoa0AurHP4AWW0lJddNAR4fJv1DMrNy77VRJms3wzjZVRUkoYgl3mouVvPfep93pnBayxed1hoXLnikn5UfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnSa78P6yz/lBltmlGe/gG8c9m6bFWZaN4ujdZPR00cV/1B2sD
	aCD5Ya69qvmqOlfibwe3KYUA1Zk5idxogbId0RFFWPoeCBWpYMFnEyQW5xPM67wqpZ4=
X-Gm-Gg: ASbGnctkkzN5Y7nifFIyGjsDhhw/ScN2vAMNOBppm6xA44DSlxx792m2LxPcx9hiVfQ
	czbWzpKhqgnRPJt02fy6i3Ay4K8bP+a0aFdPJ8gsfx8kle+QKHNErXkg9RrJwEmxLDqnlRmsC4D
	lZRB241Hdx5VjFpcSMcWzPnIEq0897SQMhKxGys78TBMEJiIwB1esPt/Idt7hzKHntQ3fwQvUQt
	CTQlTalktNGjSAKtHT01QN6XlSYISyKJn7aHze1VcW0+XxrMcjiifeywXROL8KqR11avTxpLNTE
	qSf4Tlsrlrryx/6fP+BkRySGq0qh8JAZjDuOJj8mfTDN45+0Lo7HMHE5gmBSlAlRxFiR/42kxm6
	5cnrZu69JNbDTRj8H/3ZQY1U/5OHh2DKy6cNKOXDox14M/A+SPS4kMR3nsQEvvRASu+vasiRgF/
	+XI5w=
X-Google-Smtp-Source: AGHT+IEwzzvxzDwy2hXfDTMyKk2u3q3b4WDeoC3Cd1r42aF64N8QkWqyq5rTqATRPlQPagJ+AbKIrw==
X-Received: by 2002:a05:6000:240f:b0:428:52d1:73ab with SMTP id ffacd0b85a97d-429aefcd0f0mr1311537f8f.58.1761725672718;
        Wed, 29 Oct 2025 01:14:32 -0700 (PDT)
Received: from localhost ([195.52.63.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df6b9sm25774340f8f.44.2025.10.29.01.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:14:31 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=47d5f61bca1ab14c9eafcd8930ddd77eb5a3992e8bb0bd44140ee03f8bb9;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 29 Oct 2025 09:14:23 +0100
Message-Id: <DDUNMKXD4HRX.DXUT67S354TJ@baylibre.com>
To: "Miaoqian Lin" <linmq006@gmail.com>, "Chun-Kuang Hu"
 <chunkuang.hu@kernel.org>, "Philipp Zabel" <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Markus Schneider-Pargmann"
 <msp@baylibre.com>, "CK Hu" <ck.hu@mediatek.com>, "Dmitry Osipenko"
 <dmitry.osipenko@collabora.com>, "Guillaume Ranquet"
 <granquet@baylibre.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Cc: <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/mediatek: Fix device node reference leak in
 mtk_dp_dt_parse()
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
X-Mailer: aerc 0.21.0
References: <20251029072307.10955-1-linmq006@gmail.com>
In-Reply-To: <20251029072307.10955-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_011435_613725_86AAB8FB 
X-CRM114-Status: GOOD (  11.11  )
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

--47d5f61bca1ab14c9eafcd8930ddd77eb5a3992e8bb0bd44140ee03f8bb9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Oct 29, 2025 at 8:23 AM CET, Miaoqian Lin wrote:
> The function mtk_dp_dt_parse() calls of_graph_get_endpoint_by_regs()
> to get the endpoint device node, but fails to call of_node_put() to relea=
se
> the reference when the function returns. This results in a device node
> reference leak.
>
> Fix this by adding the missing of_node_put() call before returning from
> the function.
>
> Found via static analysis and code review.
>
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort drive=
r")
> Cc: stable@vger.kernel.org
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Markus Schneider-Pargmann <msp@baylibre.com>

Best
Markus

--47d5f61bca1ab14c9eafcd8930ddd77eb5a3992e8bb0bd44140ee03f8bb9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaQHM3xsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMSwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlMY
BQEAuHoHmQztjd0qDVochaQgMwU/UDAYYFg9Pt2qLtKUZoIA/RVh2U8TuEbNs/4U
K3J+cqEkOl1LVK9aUjFYUv90UyQJ
=nF+A
-----END PGP SIGNATURE-----

--47d5f61bca1ab14c9eafcd8930ddd77eb5a3992e8bb0bd44140ee03f8bb9--

