Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C72C9C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Nov 2022 22:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIyu2ScaB3AbxUJeW+TW/jRCR8cvhLIs+eO6qwh9G40=; b=wlgquyKjcF6twupjWokClGOK2n
	iC0Fceb7ZBkuiv4A7DA0p/T83FXl2dw+eSUn1Fduv3N3qXeajjHXiLlLUagmRykJ7NXi7mZQC3tdh
	GCv+dMqAbUR6NFPq0Rv6n3WhdFebgAnLryD8/ITDo9LiI7zYkLFMNN0rKEQcdSjjZKdvVSs/TSEto
	VehnUrcuViodM9DDYUZtDoGdCuyRWCwEE4oUba+mD2F7KiARyUtpNHNDpFvehtmJdU4HahSI5A+8U
	YQStiS7dVZiIMHVxmJPh5hig6iuz8DHyA1hiIG+o1yVFSvjKJ4svovtAf4sBiF7Mg5LZNzJ2ZzH/d
	UOrecQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osX7H-008l0Q-Vt; Tue, 08 Nov 2022 22:30:48 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osX6k-008kpp-2v; Tue, 08 Nov 2022 22:30:15 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-13b23e29e36so17827138fac.8;
        Tue, 08 Nov 2022 14:30:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EIyu2ScaB3AbxUJeW+TW/jRCR8cvhLIs+eO6qwh9G40=;
        b=JN64Wiz8FjaoGd2MxD5LwkmlImpp+XC6gqGG5G7BBpHRYHIkBXdy+wDg+NMxvyOrln
         9LuXrcHwHecOsPPMz4o4AlnuHHzjx1vs3Ohc7XYi+yx+FminpPoXWGUZ3f8dyT86NIPN
         0Tj+yZkvyFSVUQ1gIVBYKqGV0YuPJQAMZzr00Srp/dZnkaxn0mhk07Ylr8zEbni3j0lU
         kwb9f5xYbh0eWjcrANoqQZ9dIFC+vQUx00Gnmj10PlXyALFAGdzrwnC4H7QPxpZsfXNB
         fKS03uC0xsxD/ykPEMHH6CjGRok1xufdSkiZRl9olLVleEJMXmqV7wj3Pi19IdOupC2w
         tVlA==
X-Gm-Message-State: ACrzQf0CXbybGNeqn45vmo8ql6EZSY2JXm+wUZhbegz3L+jtO+TTqx/n
	y5yNRBAYgpDlK8uaGHJ5BA==
X-Google-Smtp-Source: AMsMyM4ErTAiEBhhWUnCfkse1uPFXHKxuqvHukpK8jfMZpw4aZEAx3TQfjnc7l2d+tka0EwpvviWtQ==
X-Received: by 2002:a05:6870:15d0:b0:13c:2aa5:d967 with SMTP id k16-20020a05687015d000b0013c2aa5d967mr34222286oad.143.1667946612838;
        Tue, 08 Nov 2022 14:30:12 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 89-20020a9d0c62000000b00661946468c6sm4574509otr.31.2022.11.08.14.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 14:30:12 -0800 (PST)
Received: (nullmailer pid 4095486 invoked by uid 1000);
	Tue, 08 Nov 2022 22:30:08 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alessandro Zummo <a.zummo@towertech.it>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-input@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-rtc@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-leds@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Fabien Parent <fabien.parent@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
Message-Id: <166794645623.4092225.9597102589319285416.robh@kernel.org>
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Date: Tue, 08 Nov 2022 16:30:08 -0600
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_143014_152389_8790A69A 
X-CRM114-Status: GOOD (  14.57  )
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


On Tue, 08 Nov 2022 19:43:37 +0100, Alexandre Mergnat wrote:
> - Convert rtc/rtc-mt6397.txt to rtc/mt6397-rtc.yaml
> - Add mediatek,mt6357-rtc compatible.
> - Add maintainer
> - Remove the .txt binding file
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt   |  2 +-
>  .../bindings/rtc/mediatek,mt6397-rtc.yaml          | 40 ++++++++++++++++++++++
>  .../devicetree/bindings/rtc/rtc-mt6397.txt         | 31 -----------------
>  3 files changed, 41 insertions(+), 32 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/rtc/mediatek,mt6397-rtc.example.dtb:0:0: /example-0/pmic: failed to match any schema with compatible: ['mediatek,mt6397']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.


