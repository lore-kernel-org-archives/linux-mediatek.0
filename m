Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EB2CD1297
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 04:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TKJkBRRRuNaS92klijTOM4fdg+X+Lbr2orTtPNdiy8=; b=ZvEZjchox4DplKVmpdni7yGuBe
	Giap7zOAxhIcgndLNZkIiqfWkM9KaSiaZror/T4rPY0kknNB4c1rf5w9oZeODDp1sf+Wst8p2L43k
	UZ27VhYZalp79sKeTbjDlbUR0Zg+3Jp0zDUc8ebf/A7twK5Kla83etAhfY01aZSm4LTKg8ffVRAxZ
	i4NBmX2SzLOKO+wQS+IstjaFYcYNVNvgWQD3T7KD2SMZN5lPblqQmOBcXztx7uDexhE6Qgu9378Ku
	y5jFaeMoNDG1o/CRNejm7UbzeOrLYAssDr+EJ3rRVG5NR7vcfU1KFk/VQ3gZ1ULoFcmuMiCCs+fLV
	7eaEjBLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruPjK-000000052y8-0jS0;
	Wed, 10 Apr 2024 04:38:38 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruPjF-000000052uq-3Cid
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Apr 2024 04:38:35 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-516d1c8dc79so7028639e87.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 21:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712723902; x=1713328702; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8TKJkBRRRuNaS92klijTOM4fdg+X+Lbr2orTtPNdiy8=;
        b=PazvV/aKTGjv0/9jMQQrae8a3UuKJn9k97vnQwOvnajumjWOLcf2Kv/GzSdxr5EOjo
         YIdfRodHYjdapNk8sxNWUxGarOqDBOU80sl9Bi3KfwAiYcvy/JvHdO5zxCYQjs1eeNXG
         tyrqRZuccA/rFL/2H986Fp1Rluhg7KR9xdQV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712723902; x=1713328702;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8TKJkBRRRuNaS92klijTOM4fdg+X+Lbr2orTtPNdiy8=;
        b=C6yp9ocNu1rOkmyOrFyI7SwFAhiW7yXLLxTfaCOWAze8uIKmofwDlhGnqINg4B+EkO
         9JgO44AOOioOkpGOHgs85JJYYJD/KdyJIJVDk+OVclOJnyQpb4uVQ022dd2YHu9MOIu6
         I/P4cVtS8uLUjUPks/GbHyin32UFeCkyRRjytZRZ4+sExCrcx8JYRuI5JhpvkOIiIf3p
         XAtd886jF1HC4Z1DojEu3cKMo090MlcnPWY4/GaZOqvevR8UJqjh1ThZwou2HrJcSOOj
         bsEIQZGOpPeCLj9WlFuyM/kqtYxGVVw26M3812T507ta5mlFMRnxRVBcp3Y7dZQu1a9l
         lNFw==
X-Forwarded-Encrypted: i=1; AJvYcCUMyy9nvpumT5FbEC2+k55vCYaZ3Ps2QpiDsnfU8NfYDFw/nmk9VZIiOutErSdCw3E3HPTqoPbe39oYSU5CwkSxHtw2w/S8tAKAVUuDu/W+fstF
X-Gm-Message-State: AOJu0YxqV9vEiFmomr92+LXgcKyoR8Q6sRTZ0ziBTThO6DWXODMZXsUm
	VsKimAm118yEnQ8exoYsoQS1TOWCrtYS2nmC8dhjUauGLtiA+3uGl28fxRO4DwHEi571t7PaAfZ
	KzvxCMb1/uCXkYZMfHxOQN0zSAnP9l3AGwUaR
X-Google-Smtp-Source: AGHT+IEfhT9L1lVwha8NF93s8qNR0rQx1xZquNhLUkjAkkjDod/md17HI/TEr2fAp5m3WSO3Hk99DnE+Z0bxhgjxKDo=
X-Received: by 2002:a19:3852:0:b0:516:be41:5092 with SMTP id
 d18-20020a193852000000b00516be415092mr1096245lfj.13.1712723902339; Tue, 09
 Apr 2024 21:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240410000730.628043-1-treapking@chromium.org>
In-Reply-To: <20240410000730.628043-1-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 10 Apr 2024 12:38:11 +0800
Message-ID: <CAGXv+5ETAPVRuWaLDFJChpa55tYDACNzXQdE_-ubSjL=L8tpVg@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Remove redundant
 code in lvts_ctrl_configure
To: Pin-yen Lin <treapking@chromium.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Minjie Du <duminjie@vivo.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Balsam CHIHI <bchihi@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_213833_867401_4A3CA627 
X-CRM114-Status: UNSURE (   9.09  )
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

On Wed, Apr 10, 2024 at 8:07=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> The removed variable assignment is never written to the register, so it
> has no effect on the device behavior.  Mediatek has confirmed that it
> is not required to initialize this register for current platforms, so
> remove this segment to avoid confusion.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

