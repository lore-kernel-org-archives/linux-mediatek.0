Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62EC9C7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 10:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cIVo2dlqJiiyp85rWZ9bI1y0w9kmh/mgSwb0qLyW7E=; b=i9jvM2TEKPCwgV1+tEDG1KFAZ1
	hKTImnCOwBtdg+K5ULTn45Lsbsq5BZ5kROEGrSNMCHNohOY/9HbXKGTBbDXRGJ225rpU51Lcuqkp/
	/2X76XoRL7LnfqBQO+yH/RKo3aha8cH7Ym+T2p046xV64DDTleuxrcqnbluO9vPjlKXxq8zNVqT8V
	1obZGRIlhnGS0blHPK6C0/41NIXhu8JuJA+i0Max66ob2PHn0ar64L85bNSDNaNDY5tjWJXZ4Aopu
	Kaw6XuhWwR4fqLyjhI9yPbhcHVyy+fSxMtmi8WOd35PsdOcvGtK5llM+WOf42frTz5TDsqRV3By+B
	CfYu5CgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkZl-00AhER-1Q;
	Mon, 27 Mar 2023 10:59:45 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgkZj-00AhDb-0g
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Mar 2023 10:59:44 +0000
Received: by mail-yb1-xb29.google.com with SMTP id i7so10004458ybt.0
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Mar 2023 03:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1679914782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4cIVo2dlqJiiyp85rWZ9bI1y0w9kmh/mgSwb0qLyW7E=;
        b=HpAU6+Yufd8ekUlVDHkFI81rDPd94b4qWTH7yuDsOEA2Ut0f5J9ba2s3LHM7SMrzD0
         w4fZByz8p4ux2lldYl3Q1UsWPLfmAcEf/nDVyEBb/ndixUMiN8pxVvjIqr7bVdm8ury0
         sg97heLG4+thQaiKAgBZ29ytx6MeDpoIz+tCv3bvymjOe25rY+GO5p+ikIMWu9jyuhn4
         W2IZDHevp92O1BcmnOh8RmtV5hw/VZH0BqjixPMJqjiJl9FFjq+OhRch/rh/pVhbdrd9
         dxaxbnvOcfRF/Kzto/tuDreZSm9wNbGsfp7VmlmGInt1sU4+xdWBrNxWvYmwbgzbE0v1
         /o3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679914782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cIVo2dlqJiiyp85rWZ9bI1y0w9kmh/mgSwb0qLyW7E=;
        b=bGjbLGgXpjPvN5xnuLo/AfibiKPyutcvYp4h6CwYy4W4Eh0RrKU9kR9Nu3s0Ycs7bq
         dY1iVs4qaJPdwS3JAoRMXNbYD/SgiRij2I/29u3N/037c0nEpxO5M0mIVaLeLPaQw8bH
         MslogUQ3V0sGDaZfJCOej49hteG4+9xIoVeGrTP5GGmYEEyPs4pJGlRg9WsDRDJRlBQS
         6SZ6Oam12g2I+Ex9ChGArxWInCeXL62l9oInle74oSQvwfIPgORI1ZQyjCnVvgn/YwRg
         h3nn6DTvKcqj01ZIgsawSJCZciTbilMZGqKL4/qoSnAwTyaW1oCOKQ4N05PAcLvjIk8m
         emHA==
X-Gm-Message-State: AAQBX9e6YVuiHOJ/ghYjNSrnwJXWMiPIkcRb4/k9xvdT4/eEbBMuh6kj
	idxeapMWi/yQpNrZ/KezoJA/rFRqxgqcVZKkOartow==
X-Google-Smtp-Source: AKy350b5PoC9b2J9/khe3V6Tkw9uAc0Lp6gjwZcsHGSG0CxqeaAumyEo+6eqBsCqxlWqhiTzMb1m1rI7YuEqSoTqylI=
X-Received: by 2002:a05:6902:1586:b0:98e:6280:74ca with SMTP id
 k6-20020a056902158600b0098e628074camr6889426ybu.1.1679914782191; Mon, 27 Mar
 2023 03:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221122-mt8365-i2c-support-v5-0-6e4f3b54937f@baylibre.com>
 <20221122-mt8365-i2c-support-v5-2-6e4f3b54937f@baylibre.com>
 <2a1b1f66-970e-5adb-389e-b9c47a790712@collabora.com> <CAFGrd9pf+ojPDciF3Mtw-QT51LZCj+GNLHXurGx_vcC17GHA2A@mail.gmail.com>
In-Reply-To: <CAFGrd9pf+ojPDciF3Mtw-QT51LZCj+GNLHXurGx_vcC17GHA2A@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 27 Mar 2023 12:59:31 +0200
Message-ID: <CAFGrd9r-s564RPk+F5J_=Ns-1tjWo-osEYaXNNt0uXU_k=TKqw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk board
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_035943_248487_9A149205 
X-CRM114-Status: UNSURE (   9.79  )
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

> > ...and please do *not* use the mediatek,pull-up-adv property: this is
> > supposed to be there only for older devicetrees and there's a replacement
> > for it.... unless you have any specific reason to do so (and if you do,
> > you should well explain that).
>
> bias-pull-up isn't necessary currently because MT8365 doesn't use MTK

I mean mediatek,pull-up-adv. bias-pull-up can be kept.

