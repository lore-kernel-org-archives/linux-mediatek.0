Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EDDC74A5B
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Mar 2023 05:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PQRYTyJUcXjGIlb32K69CN7N/CfuacDHmOLvuVVkIeU=; b=DvDwCN1P6wCW9N0AfCgEUj0G0x
	wdHFZQv9qeWE4C9CI53mSBZc4AxrsrERAUlYk5RXcR+ELIKVpoiwJHAW96TDxCmQNLYBabHuQfbTS
	UpwoKPZZiDW3hCqzrQ74StuX1QsFBcKn5DCVQDJNUan++eKYEI2QpnCo03i07o/hXLe9FJWJDu1Ij
	QNcj33B8SKvnHKoM1yoVVN0i1IrQOaFHpkZI5l7ielENawbNogeIIskAkeatGdTiS/fa/zc5jkFgw
	ub46aHRHgZRIvrqgqlJOUJOcmZTQIHK0fKljVqkhvi0GtT8KxUd3NRbUnbzWDAtLJySuy1Ryopyyl
	B8krZKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peUsu-00BIK6-0I;
	Tue, 21 Mar 2023 05:50:12 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peUsp-00BIIO-24;
	Tue, 21 Mar 2023 05:50:08 +0000
Received: by mail-ot1-x332.google.com with SMTP id 14-20020a9d010e000000b0069f1287f557so3597439otu.0;
        Mon, 20 Mar 2023 22:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679377804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQRYTyJUcXjGIlb32K69CN7N/CfuacDHmOLvuVVkIeU=;
        b=dvXZYzN833ztFsoJznnGxdR0/0KDzNzHYXwzXQT9/sNO5xkoJ+lNZq/os3qZoAT1wT
         4ltJ90CCuSJ8X42Ogt8uA+Q3s2aGHigv7h+tgQul/G5CQe7uuJFxX1L6ZKKmpWzd7MRY
         SVgWyoSI7Z077Drc4TD3uQOQGSMSM9xVxURJ7FsCVG0kK4KjVvfpKgb86P01KVQOTA95
         4qwUwGifTLRgcCe+8BC77XrGhglPT8wIuoFHPpYmB7khakZnKYzlFm8PF7vrexs+9OtW
         y7RErnsp1t30CYFI6Y7rbth9RiDeTgYGQHYsEoDtycNWHGdrLF/Nkwc+K/9YmFAq3SkK
         lj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679377804;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQRYTyJUcXjGIlb32K69CN7N/CfuacDHmOLvuVVkIeU=;
        b=Ihheq+KgMrEdOMYg3Pa55mkI6s7i136Z81XbWoiZAiHEqJ2dr34xFPx9QtqD2owKT5
         ikJ7mE938k46eT724KwkMHnv0c4CjC/EZuq1v6gvq0tqyNZM8rCKoOUUQwWsLNn7PLrH
         g9ashzs/iEgiqXJgo7vRZOud/lok57yoCZ6+85pyalKQOjXBtJy0y59qL8jTP3eolHxA
         IY4ijUzHZPSiDF1ZTCBUmMKJtJPeCHKWZ0bbg8XnmCi86LrGuxTarzW/MO+gLLpILI0M
         KGo0hjijvtunsOPqmu8cCw0WFoKyjQi+tiLG89ECLjexBbcTsftts1O98le7qie0AXcV
         n78g==
X-Gm-Message-State: AO0yUKWLIjkGsmV6v9bRtJZ7BpPfrhyoFTjckvIdtsazZF5DCi1ZrLK+
	ZyUHxk7yJNm9oH6GM6ak4Q9j77UQS+SmtEynhJ8=
X-Google-Smtp-Source: AK7set9hGdm8jb3Zms52xIkHW02ezlDplA4s1W/5C+8w1fxRVUiCGMOX1ghjWbWe1rulG24xEDF5Rs78eQG2Vsd6oW8=
X-Received: by 2002:a05:6830:13d3:b0:69e:24a7:e042 with SMTP id
 e19-20020a05683013d300b0069e24a7e042mr409968otq.3.1679377801763; Mon, 20 Mar
 2023 22:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230320233955.2921179-1-robh@kernel.org>
In-Reply-To: <20230320233955.2921179-1-robh@kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 21 Mar 2023 06:49:49 +0100
Message-ID: <CAMhs-H829e-QSwMXAVN6b4pYTB+_d-PLJxbEqdhd9oOrYnY-aQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: phy: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Yu Chen <chenyu56@huawei.com>, 
	Binghui Wang <wangbinghui@hisilicon.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Robert Marko <robert.marko@sartura.hr>, 
	Luka Perkov <luka.perkov@sartura.hr>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Vincent Shih <vincent.sunplus@gmail.com>, Wolfgang Grandegger <wg@grandegger.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-can@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_225007_693735_77432D3D 
X-CRM114-Status: UNSURE (   8.30  )
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

On Tue, Mar 21, 2023 at 12:40=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  .../devicetree/bindings/phy/mediatek,mt7621-pci-phy.yaml    | 4 ++--

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

