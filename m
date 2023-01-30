Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85497C54EAA
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 17:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=q4RubPRL2kEyc8xeXA3LZgpNmnA/nBwbKFeLVda0b/s=; b=OZOo5KHdl19REw
	lsEWp4TaGkqHhroSa1FN1pF+9QzHE688B0p7uciFC39c0m7hcq4DKkjg3098DOKApSyuHMFhVP0EM
	CdsdiwuStmY6VcG6sw2FJTb3PphzJd+VKNMUTcsmABOr1Ucofb11abtm+T9FgPdNzEMAf/XGiyIyu
	mq3Lb6PJQ5QvEqfJD8c7FQVQNBxCqT7j7rD00nzO70kos8dKKc0OT4YfuGz8oZ6GO6peIyxrVybyX
	ULLmrnWKZWPEKclfdlViiMewoqrImqa/feMphZOIefkrqcIj3h8fbi/VIDYuz8FCoaNAFJp/xQ8Lb
	+4RKJUBaQPfS82C6g3pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXoF-004TZP-25; Mon, 30 Jan 2023 17:19:11 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMXmn-004T1q-MG; Mon, 30 Jan 2023 17:17:42 +0000
Received: by mail-ot1-f51.google.com with SMTP id n25-20020a9d7119000000b0068bd8c1e836so485564otj.3;
        Mon, 30 Jan 2023 09:17:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q4RubPRL2kEyc8xeXA3LZgpNmnA/nBwbKFeLVda0b/s=;
        b=kWOk3quuSTQJADRTmiEdmP0ZwRB+zlWz4Wb5J+GHPoSXy8diMPcLAMNKN43Aomri8O
         QfnEE3qxFjd6yW2hJ7da4bMXXEtq2CDB3009JHQsWk1zTZvwwyF4+hwy0AQuRpiWzRGJ
         MBVjZ7MEJmIROLuWNa3MW5Hez55yNIJBAHSgwnasHC8ahmT5CWh6sMWqgcA4MynVViUZ
         P85cOE7I4KWfrgcSCcCqkxAcannQBLNlIUEuqap0LYViHEMPs6sJpcanRz4zEVYkcZFW
         ERna1O8xJ2pcJ++jZTPiAuAH2A8efvr8QMht5oHGtZKOeGGVY0+UgFLlU9Jwc/49/MIA
         /Gdg==
X-Gm-Message-State: AFqh2kr2uhJ+MR05VEzTrstfDRWXvtarWyrzUtLaP3jHOJn8yYg/1OhN
	dco8zwaj+8DnNsl16iiuTA==
X-Google-Smtp-Source: AMrXdXtb6w6SV90Lb/AyryZDCyhK6CzQbJhX9lwNjfTghvU21g3pcLvW7SaUvscKBqRGxWUDD1EENg==
X-Received: by 2002:a05:6830:39e1:b0:686:5fcd:8b52 with SMTP id bt33-20020a05683039e100b006865fcd8b52mr20002471otb.13.1675099060407;
        Mon, 30 Jan 2023 09:17:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n4-20020a9d4d04000000b0068bcd200247sm2058502otf.75.2023.01.30.09.17.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 09:17:39 -0800 (PST)
Received: (nullmailer pid 2946630 invoked by uid 1000);
	Mon, 30 Jan 2023 17:17:39 -0000
Date: Mon, 30 Jan 2023 11:17:39 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Sean Wang <sean.wang@kernel.org>, Miles Chen <miles.chen@mediatek.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, Edward-JW Yang <edward-jw.yang@mediatek.com>, Jianhui Zhao <zhaojh329@gmail.com>, linux-kernel@vger.kernel.org, Johnson Wang <johnson.wang@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Sam Shih <sam.shih@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, Fabien Parent <fparent@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: add bindings for MT7981 SoC
Message-ID: <167509905837.2946315.3326500381163697135.robh@kernel.org>
References: <cover.1674693008.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_091741_746029_B78C3C25 
X-CRM114-Status: GOOD (  12.66  )
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


On Thu, 26 Jan 2023 00:34:15 +0000, Daniel Golle wrote:
> Add bindings for the MT7981 pinctrl driver. As MT7981 has most features
> in common with MT7986 (but has a different layout in terms on pinctrl
> and clocks), the existing mediatek,mt7986-pinctrl.yaml was used as an
> example to create a similar document covering MT7981.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../pinctrl/mediatek,mt7981-pinctrl.yaml      | 475 ++++++++++++++++++
>  1 file changed, 475 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7981-pinctrl.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

