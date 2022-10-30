Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24981C38A02
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Oct 2022 17:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQ7uJLBIhN6i85bshrC6bijT/YDWeXqFsg9Tc3UQLxY=; b=RwN8k5Z9uMFcFctaNDNRW4GAV+
	4uoHTdYzErEoEzm/kzSmGCA3GNdgjxhuzSwN8H3PiA3Hduct/FVHWSqa39GmDrOHC6s20shLQF8AL
	QP2jBdNP6zyFoOD0xovaQM0oGL713aOGEVPqANEdGvuMn90J4YDKq22oYfV6Aq7l4kFMcXDSVOyBa
	unNxt8OaSCwSFIeZGJAvHIIUluuoVRP+IAbGO47ryjgnqDT6+tl+u2XsTPHG3sprqfEEZGfZ96BgI
	SkPVsZxBkCKrgdLNUhVEcv7IvQd39dBAEFuifnI+IrozFw7xKdxCYfgVYY2VK5SQMCVixgD7V69dI
	Sw4nholQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opBwK-0011LP-PU; Sun, 30 Oct 2022 17:17:40 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opBwI-0011Ij-GS
	for linux-mediatek@lists.infradead.org; Sun, 30 Oct 2022 17:17:39 +0000
Received: by mail-yb1-xb33.google.com with SMTP id o70so11422663yba.7
        for <linux-mediatek@lists.infradead.org>; Sun, 30 Oct 2022 10:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OQ7uJLBIhN6i85bshrC6bijT/YDWeXqFsg9Tc3UQLxY=;
        b=ACnpJ5mK07YWG7SrKB+AOsI1oo2Cp/w8OGk3mQBSzEp43U510vT9y1sDXj7kgfoR/k
         Lb4MTUfVAQEaNtlB9DUy/FlxCwzU6uoisLyvszi9/IZTu74T4T1pjpBLCKJ35QkIFf5r
         wROu3WZep4MOF23gRdXFUpcjC3JtSfFACYh6cGlCINAetusBTnY4S3JQ+e9IlaQJBuvE
         CFdYmyc3ue62bk8OO7fd8VH1MnAXnT1VDOQ0yjlkHJrjSiLIw5vCRtwsBo37nVqYlKjt
         PrbVOpy+7ZIgT6iedcx2c+Sc+x5eTA+0Fb5hLARVqt/vGk0aoTLeHXbKZEvc8TNQh/6i
         nIHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OQ7uJLBIhN6i85bshrC6bijT/YDWeXqFsg9Tc3UQLxY=;
        b=Ghg+WRJAHXktI2M13AT5Xexpvdaemo7v95+YSFroaLlTakaxowb1BXm+EWY350TT1H
         T+aS68EVKW0UYHKFk51iYP+OA7r7rmQoQVZaDNIzckTy8/DnZOah1RZrUnUtAsKA85+R
         oDafskvrrpte/fCJXCmB9VUVHe+dj2Ndo99RBK9zWetoWktjEqwyeYSN8fK1zS6HDJRg
         znjTywvEhLDt7aUw/4Yf20KMrfCKty7EGxYBzzTvXe/QiEtvOq8pEf9v9fjrCn1w5Ngg
         uqzV1a6UtZjWppERnTnXdrn/SWZnPKmMH2fh9gXABelH7BM38DYnQ5BrP7F8s5SqBjb5
         miLQ==
X-Gm-Message-State: ACrzQf33RrdewUqnZy6JJRivL3kEj/4ceSOD1s5F61iuJDqQ0VgpHrOu
	18W5F9q53YIBZsEX2YaMzJII7LD6s6hijQ+BLIKbZA==
X-Google-Smtp-Source: AMsMyM42BGs2fhx99u/w9idGVeX58S0wuZSo8XELt8XRKWvIHOSt9iOpY08Tsg+YGY4VPcICFow8CroCW2E0+u21gME=
X-Received: by 2002:a5b:241:0:b0:6b0:90e:1d4d with SMTP id g1-20020a5b0241000000b006b0090e1d4dmr8985854ybp.648.1667150257212;
 Sun, 30 Oct 2022 10:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221030085358.1619285-1-ajye_huang@compal.corp-partner.google.com>
 <20221030085358.1619285-2-ajye_huang@compal.corp-partner.google.com> <166713668618.965877.11108951663566363754.robh@kernel.org>
In-Reply-To: <166713668618.965877.11108951663566363754.robh@kernel.org>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Mon, 31 Oct 2022 01:17:26 +0800
Message-ID: <CALprXBYwi9SpgOSN9kx6JqyY9tnc0jWbZqWv-iJ6Sq079rSTnA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
To: Rob Herring <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mark Brown <broonie@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Takashi Iwai <tiwai@suse.com>, 
	Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Jiaxin Yu <jiaxin.yu@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	"chunxu . li" <chunxu.li@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221030_101738_575182_55854607 
X-CRM114-Status: UNSURE (   7.61  )
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

Hi Rob Herring

On Sun, Oct 30, 2022 at 9:50 PM Rob Herring <robh@kernel.org> wrote:

> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.example.dts:29.35-36 syntax error
> FATAL ERROR: Unable to parse input tree
> make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/sound/mt8186-mt6366-rt1019-rt5682s.example.dtb] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [Makefile:1492: dt_binding_check] Error 2

Thank you for your review, and I will send the fixed patch again  thanks

