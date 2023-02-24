Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EDCFC61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hy9qFm6Se/EXdsfdDRuKKStMA9t1Y7+V3hdvzyTdE1k=; b=ncsx7h71G+klYBsYiONLIPHGjP
	WhC7AKLQuKcLcieMNJRwaF+R88WPVq6sCqEJJm3RzxuAoRbA49CNgT3mWQ26gM4CDcZTKe8qUbaCD
	8hB7SIgFvLA0E9dWMLuPQHEY5rzoyI6ea5XLZb9GSBMrJwuJO+OVcgrm19+Rj3lChaz8jdtFus6/7
	Aj5iQIG0Muw4s1iNel3aUdfl7fpAkGhvMOFFVQPtq3HHl3s5SPPu/hQsKCmFKvn5xnX7zWAkG5o6d
	Tp3CVSA2kCogoDNM8p3P5n65PWdZJaRlUwbytGWdMiq78WoMO4R0KQGJlyeOTKgud8FpUqk1OJHwL
	rqd7RYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUkQ-001lCb-AP; Fri, 24 Feb 2023 09:52:14 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUkF-001l5v-HB
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:52:04 +0000
Received: by mail-vs1-xe29.google.com with SMTP id o32so3102257vsv.12
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hy9qFm6Se/EXdsfdDRuKKStMA9t1Y7+V3hdvzyTdE1k=;
        b=KaPyZwJldbAZMed7/XIR6NSqzh75fY6A0QtfIFNwMdS7G3vWxZ+J9HAdx4yhkYkidR
         h/9jJ3mzYkS18gADZ7h9khXny+iBQhpl4mfmKAUQ8cXLfusQoGCQ18F8bBh26NQZEFS4
         YPX0b3llm/Rty2OdOfzFDZJKQrssjQlkB6j+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hy9qFm6Se/EXdsfdDRuKKStMA9t1Y7+V3hdvzyTdE1k=;
        b=HzWS2fao6FiylHVGoSUY2Wm8WxdmY38giC3aMTrujcxiurEjdcfl5RX5xnUHYvmiwl
         9z0EY0Tr/Kmxr6HSUDJjNoUMKz9Tzp2NuqgDhHJzL1X5nTe6gfXtXvmvA2dARh3BX2mK
         x2IT+woNU4qHzle9TyEH3oXrj1WVvZz4+W8zdRAV4thAzXb3xJvcjSiNpY6PQ4NFsoJo
         PJum4PoJs54HOE9Fionmb4lPqA1Cl8afoCMNN760rPVdcpFXbM7bhXV4b6OBGEDI3t5h
         bm+db3dD6LifY0XX51gcLwcyUfegxCyc0ij73A7BNMC0mKEb+P3rEimlNiLBg/AigRwC
         x/eA==
X-Gm-Message-State: AO0yUKWutOlfJLaaVuAnh8+DuQXNtqH6nBmJrkCtexZPlm39SR9aHdAK
	RjA/PHQBoGWjK1+vaJZK7HNXwse1QG0jdmS5Gy2Nrw==
X-Google-Smtp-Source: AK7set9sUlfcMOdriWx5llJESulwFsPBUjog+ETyhdNs8BStWZA6c/AggwcYCCE9Et4gzRvd61o1vXs/sQ8NzgT+VdQ=
X-Received: by 2002:a67:c584:0:b0:41f:641c:f775 with SMTP id
 h4-20020a67c584000000b0041f641cf775mr308152vsk.3.1677232320295; Fri, 24 Feb
 2023 01:52:00 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:51:49 +0800
Message-ID: <CAGXv+5Eh62NFNW1T7PYiQe+9KD8qX2WB7M3rwrYD=ca872y3WQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/16] arm64: dts: mt8183-pumpkin: Couple VGPU and
 VSRAM_GPU regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_015203_594578_0284E080 
X-CRM114-Status: UNSURE (   6.43  )
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

On Thu, Feb 23, 2023 at 9:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add coupling for these regulators, as they have a strict voltage output
> relation to satisfy in order to ensure GPU stable operation.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

