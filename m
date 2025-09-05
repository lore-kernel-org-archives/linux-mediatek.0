Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECAC9CA0FED
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Sep 2025 07:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wFJS1RHxYpPdjfElWjyoww5Tm6gmIS00MsIdtooweP0=; b=BRQZn9pcP5A6JXLXlm2Y9aTXiL
	i1iIDbNUGRbOwHoIMB07v3mCH0QKKjKvwC9S2a9jEk8tRhr7QHkIknRw6m91roQ78SMkruGZzIkUf
	KpajpTQT6evH8+HoShclveSptCEHoUgdokm71V3Z8VDUCiJoacSk/9xLLVosvMKD9x9dL9tVrm8m0
	3aZzTtZogatyXpeKxKWiA1K8Y0pxvLYl3GHuVgZ7cmUDCPoC+wcNEIbee6lbdZDnenbNAheO2xpVv
	Jnozagju+wV7faqkWL3iuRhmPbB6YIisZ+G3TaE39BYdNzLf6iPeFxXTnwNWeOuO1vZLzjx/k4n7Z
	zGApawWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQwZ-0000000037O-2I3a;
	Fri, 05 Sep 2025 07:33:11 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQ42-0000000HK06-37Pv
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Sep 2025 06:36:52 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-333f901b2d2so17953821fa.2
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Sep 2025 23:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757054206; x=1757659006; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFJS1RHxYpPdjfElWjyoww5Tm6gmIS00MsIdtooweP0=;
        b=nkS10T9SZDBXutscHni/1/oGzIofds+BZjRoWmPIZbYs+eHFCU14QOUv9MScDbYhIu
         EivVq7zXRFXT3orPusN04jyT5arFNgS/HLPdZytHZzk6Lpa3RomxN8+bsDPiZkVDagTi
         mQd6ce04R+ic5PzbyVtYLcmO8OuDhBunhqhNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757054206; x=1757659006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wFJS1RHxYpPdjfElWjyoww5Tm6gmIS00MsIdtooweP0=;
        b=QmpV6TvxJPYU8UYkGNFVM+EuKqI4Ytu39l71WzEkU4IJ6o27UeE/+aVygSpEBgKgQH
         D+fRGehge8ukDvO5ZSyg1QfZBMOVhIxgmqWum/R3KjV8OFr+qRMi0a+csJTIZrMq3irI
         +6SaAGcBwBiwTnYWzf8cGqmeCSSPMs9SqKnX/MqdFPuPafNf2xCuJyBSJsEfKrpbQr3Z
         NrObTQTLeOvD7rho3HBUUW1yvEr0U07X1CTiq6W5+OcBn4Kh9VWkG6M6+AZMyf51HS2k
         Xmi5zmfsT36UFvQzTWqXpyIZfkJL2knP9iEu0Ko8Fv1bz5fwwpu/EZcQAcxo00tAoxnl
         imQA==
X-Forwarded-Encrypted: i=1; AJvYcCW++jTpQ8wkO/Cb4YE0JGOKCq7j43P1eeDeumgqml8AWCJ8DVG97GwL3JBZ8nT8cgx936Iigq/6y5F1tfbO+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YypYs6EsxuQwFIHumY6pGicKakndGzcb6PC4jYvEZPDxKvDxbvr
	daOuiOsvPwhfzEk587QMqcf9iS31T04kYFLw5Yf4zS2cfbnrgKLTsQaAKXJG7BDL0rqjXtlsF9+
	gv5gRDXCTbUvRTEIsiTF4a4OpHjVMWHwIqEmW+kGs
X-Gm-Gg: ASbGncuVUxtPd52Cxyu/2S/G7aI9FwjXO3yrrQs9/VvE0fUu6FoSRPNVGL6lmTZ/lhR
	IghZfq037UkbA31Z23fOQ5oDnGPuKp4uHwTm1CbuuKutF1NwbIHihpZPf7l27/+ARV43Hfb4yjO
	qqCXED/jfEI1iG2p7WFV94vmFDdW19MGudrO2rWoiUKE/xXUXnn53VgBQxSLNNkjuNjYfSo2FVR
	DGt8O638S4ltXX+4CRyEpChNtzxdb+mZAcJbg==
X-Google-Smtp-Source: AGHT+IEgVbxQy/DxXsDzvdrcOfC49jBWiMtOAGepTowcEVXECREwr9aIaRDx8B4CTbXxL/deN9wUH95NSxy3a5X8TKE=
X-Received: by 2002:a05:651c:20cd:10b0:337:d2e2:d467 with SMTP id
 38308e7fff4ca-337d2e2dcfbmr42859621fa.43.1757054206408; Thu, 04 Sep 2025
 23:36:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-16-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-16-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 14:36:35 +0800
X-Gm-Features: Ac12FXwXWypau4EdANuUrgXmxAn5bymNrHkP7HBNlw9rFp2Nbb7jmA3VYZ8UsYk
Message-ID: <CAGXv+5GjZusKNCe+EshMktmyDcfjm6i5oD+h8LvObymvD9QXqg@mail.gmail.com>
Subject: Re: [PATCH v5 15/27] clk: mediatek: Add MT8196 ufssys clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_233650_875100_3324E186 
X-CRM114-Status: GOOD (  10.10  )
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 ufssys clock controller, which provides clock
> gate control for UFS.
>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Assuming the previous reviews for the bits are correct, the removal
of CLK_OPS_PARENT_ENABLE IMO is the right thing to do.

However if the hardware ends up does having a requirement that _some_
clock be enabled before touching the registers, then I think the
MTK clock library needs to be refactored, so that a register access
clock can be tied to the regmap. That might also require some work
on the syscon API.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

