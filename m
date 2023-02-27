Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C10DC7EE23
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 18:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdADJJit9jcEYXlvIJLOYn0H4Qs7tlr87LcMHE1QWmc=; b=yVR1lC6aYeFpP7mic46sT4Q8X6
	hdOPVUylc3aMI4xnJpjnSRiJ/ymz7qVy3PuE/STngDktR58ysiHgjFPrtBYiU1uiSC8hoQtJ/Mtpf
	wL9/nzXJV2W52j+v94KQDSKx+10h5YRQSPs5P1dBTdJhoq44AC9/BFDLpcRM9urWODo4bn/O2wupP
	zpoSd/dZRqpgS/2X6Dhif4Hk19/2qRLJ7tODlE9ReM8+okl5bh8k+Ns9yhojMv4Ae1eTSVTBm3hFX
	8r3B70KYiyTM/7wk8uBQQXLeoS8AG6mCvb5loz9bliPqf3YWZENfxCmyjVlXePosGpxw0UAhPlgJ4
	Ix5nAcew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWiAL-00AhoS-1D; Mon, 27 Feb 2023 18:24:01 +0000
Received: from mail-oi1-f179.google.com ([209.85.167.179])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWiAI-00Ahn0-Oo; Mon, 27 Feb 2023 18:23:59 +0000
Received: by mail-oi1-f179.google.com with SMTP id bk32so5879343oib.10;
        Mon, 27 Feb 2023 10:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tdADJJit9jcEYXlvIJLOYn0H4Qs7tlr87LcMHE1QWmc=;
        b=BOVloPh5LT92vyMO7k8EjMimtgXPnTC2dt/tBnw1jJgBficvm1MdGemK/vO0s2DSFW
         i+iYZBguyCy7hYvRFKXfUXqVetB7QhayFa5vkCu8nihNGcGb4tp/9FmtLAX2/t0uzUVc
         NX0OvDtoloiNH14egThmwDOZGngDs1FkSlyM3jnh8fLrdETYl0IAVos5El7NcFSCbJmv
         nQW28GTEdBPE2+Jl5EruocTYFmCAiGPpv2iTRjUUZKZwcf+ygIQc44IIhXWcVgJ2JJr2
         PSEDvywPXylFTDY83BddwICKDg95jgzP+EQyvCXu8gton6/JrNn53bQSEwsmd3qSzV+9
         AVrA==
X-Gm-Message-State: AO0yUKU9zMecErdrygpqu/7aTBYrGXR1dkD35YH+ndbGcGhGcR+Oosd6
	WPPRko9xAIsbAgkHY+ww0w==
X-Google-Smtp-Source: AK7set9igeideAjhDzRYNAY9NTgciq3AiH9XqtzFMJ+V5Pw/ePArDgnZ4jp/40iF7p3nRA/oT352pQ==
X-Received: by 2002:a05:6808:b0c:b0:384:4585:737f with SMTP id s12-20020a0568080b0c00b003844585737fmr49483oij.14.1677522236506;
        Mon, 27 Feb 2023 10:23:56 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t22-20020a4adbd6000000b00524f546997esm2930636oou.0.2023.02.27.10.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 10:23:56 -0800 (PST)
Received: (nullmailer pid 600045 invoked by uid 1000);
	Mon, 27 Feb 2023 18:23:55 -0000
Date: Mon, 27 Feb 2023 12:23:55 -0600
From: Rob Herring <robh@kernel.org>
To: arinc9.unal@gmail.com
Subject: Re: [RFC PATCH 13/16] dt-bindings: pinctrl: mediatek: mt8186: rename
 to mediatek,mt8186-pinctrl
Message-ID: <20230227182355.GA587025-robh@kernel.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-14-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230222183932.33267-14-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_102358_823277_BAC9157A 
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-gpio@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 22, 2023 at 09:39:29PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> Rename pinctrl-mt8186.yaml to mediatek,mt8186-pinctrl.yaml to be on par
> with the compatible string and other mediatek dt-binding schemas.

These renames doing the same transform can all be 1 patch. Either way:

Acked-by: Rob Herring <robh@kernel.org>

