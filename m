Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDD4C677F1
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erxkKaNmgReQjjCE5Nun08H4QtCCa/ZqQiqJBxoU1Ok=; b=tJCf2t8f5ZuxXsDj4qjIrvyJJ5
	S4CJ/Q6YJ8dzUDjuWPWhhx+vZTwWkJzGG4zGD29BGYAiOyhQq62VGKDT+5rZlls9DjGiKjFBnKbFt
	6SAD0/MiCC5Va2muoGfh0pMXlzzOuOLj4sEc5y2cQ5wUNTo2nzMLq747qdwDnzqfCrRcJAtlGrnSF
	vs/dWWEpVAsyUQYJMKFDtxk04rFMY5dnJML5JBCoiDQHXJoX14o4TCLvessZm0Dr8e+3SMUR6a5Xq
	EMkZgad0lNc0hxmVYXcIBPPd91tPFe431Mo4Ay0WayQ3N3Mrg/gaAb7cqT4ipvSOTzt3WVQB9Nxu8
	FxzmzG2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV2S-001uT8-UZ; Fri, 24 Feb 2023 10:10:52 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVV0J-001tES-Sb
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 10:08:41 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id o2so7263255vss.8
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 02:08:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=erxkKaNmgReQjjCE5Nun08H4QtCCa/ZqQiqJBxoU1Ok=;
        b=X8+SA9pfi1u8C/Wv6YyefYb/yeJjqHbKIaAaHzXq4HKxYUUHaNYaVsO9Vq3GWF2tMG
         30+rCnyWewJtcmlDac+TEe742tubnvXwDpwXdgRGEgAw10FYMe6HKyIg+TGOK7rLHBJf
         6x0CvO35P9Ej3Q+x2erGFEjEPgDOiIYwiFkdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=erxkKaNmgReQjjCE5Nun08H4QtCCa/ZqQiqJBxoU1Ok=;
        b=3BaR4q1FOpA7e7LXi9pch819Xfy6PDtAboHXSbuoAmZdKEXy12MAb2wLuoQT44Ndup
         CFRojQ/yPCnc5rNn917uNQCKeh/1t8AvBW7KoXEQLwMDamIINEtg0HWG/Hxv0Iq+vY5w
         S2iVPw1/+y1GJ1W0KljPqa8yTlTZUt0Bi4gnKylBev4foRh6urJJBvqcAY0cPWd0PAJC
         ebWbVkUnjw5J0HDOQdHyOgLxbePWFrjmBUc1tPF9C1mNbwlnLCZDYBDl0/M3qBx5KuHv
         c5xZ6Y9aaKaBauXqqnsEa7pVgGvjOMIrLqYOYn345g3msj788X3MHfAAguFhZrEqmcyG
         3Uuw==
X-Gm-Message-State: AO0yUKWG59lFoeSvp2JQtCAGwrucw4PufF5sPu7j9YbtHx5z/eFvXZwr
	dhMkfPQpwgFAkII7uSwMPn2CTG8fHw2Lj8/lE0TJ5w==
X-Google-Smtp-Source: AK7set/1xvdm5pq0EgFdZuGlRUZGFwjjdxewTbrvfcb4P2N6x5bfqAjJm08NFJELbq4Kj0E1OC3BOpwdByH/f1V0aw4=
X-Received: by 2002:a1f:4343:0:b0:400:ea69:7082 with SMTP id
 q64-20020a1f4343000000b00400ea697082mr2084061vka.0.1677233319375; Fri, 24 Feb
 2023 02:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com> <20230223133440.80941-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223133440.80941-4-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 18:08:28 +0800
Message-ID: <CAGXv+5Gk-G=TTSu8E7v8EHMfrp4j0mwFR32hi3_urPJ3sDxpDg@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: gpu: mali-bifrost: Allow up to 5
 power domains for MT8192
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, steven.price@arm.com, 
	alyssa.rosenzweig@collabora.com, matthias.bgg@gmail.com, robh@kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_020839_995465_2B1C8038 
X-CRM114-Status: UNSURE (   7.55  )
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

On Thu, Feb 23, 2023 at 9:34 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MediaTek MT8192 (and similar) needs five power domains for the
> Mali GPU and no sram-supply: change the binding to allow so.
>
> Fixes: 5d82e74a97c2 ("dt-bindings: Add compatible for Mali Valhall (JM)")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

