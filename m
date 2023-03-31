Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69D5C6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 11:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrZ4nuKFRbdrvkseheS7XRYqEh2EC/QvjKLix2jXZFM=; b=nZ3oGFWNXwBJynbf04+1qAb9K3
	tHO6VXV+0tR57s1FoxnA9I8N/0VC12TJUjB54BGxl1cguMldQW/XT0ZNzfCB5al+xYZvo2QZ8MduR
	mhjd2JebsTu4W7KWyZrs/hfX+ltbTfOYGi9RwzBWLyvMr4+gt0Cc0v47z6qxx3S0ODzQnsOovv1oD
	704IbEe29LAad4ERSgNydL6lydpzymgx6tJpsngir/GZY+N0j0h74cu/VfFifK3cqpj+rpYrP8STI
	w6lBpznXotmP0YV3DQC8YXJwA6kSvcA+Poj/ojCApcEPcSCR2XfeHD5QyS9Q4l7WG1jShnaKHeKhh
	cch0nvoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCd5-0074WQ-2V;
	Fri, 31 Mar 2023 11:09:11 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCcq-0074Rj-1z
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 11:08:58 +0000
Received: by mail-yb1-xb30.google.com with SMTP id n125so26900107ybg.7
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 04:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680260935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrZ4nuKFRbdrvkseheS7XRYqEh2EC/QvjKLix2jXZFM=;
        b=p8HE8uYDQXIMNWouHzNhuIPq4ZYpcpiB2tjtZuopwJd/AlYTllfvkZumoyD3e/aM7a
         Rsituuiso2kH/VdZb40vv8jtPdJNbYku8HkT1NxamcWm15rgUETuxgZWfce3K4OlsyJT
         8EYq24i6h1AxbQKxcbsErcKtHV0SISL4sLOHWGtxxHXScAUsEopBmv6kXPUb2UP3kamx
         7ejJ4g3jcDtINsK2lt0tIFmNU5xb6+K0y6cGos/6qAj9HGe3eQ9yrRkXgJxG1CWCQDv4
         U50TBQ8X7/8T8XMPSnMernOOPbz8JoPb/BIhGLvpV6JYEt/IuIVi75EXyJsAZUXykI0w
         2u1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680260935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DrZ4nuKFRbdrvkseheS7XRYqEh2EC/QvjKLix2jXZFM=;
        b=P0Urnoo2XN6uTJT7/ZhDmXf53f44UxwATMp5HdDcHBWNfLmAtWlab4xWh38eqAlMc7
         HVDBk73HHFnUh3P9aaE2AiJxQJCcP+OSwiA9cEPBIg6bmaGR6YeEtFVAGm++qSBg59Dy
         vfzdnNDNi9e5WNbWo8T+rnLiaVUd15deVJnjqfs6FMuJXEuIbSkK1n5WDtQTp7/xE5oU
         0Karm3GGOsseCEHwTe+S5HV2Q3/RQpU7C5qQrRKteuOhsvbZ0Uzj6zB4KpfB5zQWKvFk
         OBJCtP7abu5zVbPnNaNAsSRAcF40B1rURJj+uBZxP1timBX4U6kHlkoWNEHH4Lp/iDOe
         wPfA==
X-Gm-Message-State: AAQBX9e2XJQhkoo2HtDDClxG3McJwNHSkWOaWrDBLnPgD+S9OiPEbl58
	qN6HBDwu5gAkdDBeBJrz6yjepBuFfQUglrcnN+12pQ==
X-Google-Smtp-Source: AKy350bS9SyNRus3dGUyYtiJgys+HJA9rC8VrYDEuvi3iswc8ROzk0fLQpNKXYrIlL5r6jnukfZX+uNeYtTgRvFeeN4=
X-Received: by 2002:a05:6902:18d5:b0:b75:3fd4:1b31 with SMTP id
 ck21-20020a05690218d500b00b753fd41b31mr18131967ybb.1.1680260934863; Fri, 31
 Mar 2023 04:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-10-0003e80e0095@baylibre.com> <7b6be990-9e90-8e44-7c5e-f8b7a2701ce7@collabora.com>
In-Reply-To: <7b6be990-9e90-8e44-7c5e-f8b7a2701ce7@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 13:08:43 +0200
Message-ID: <CAFGrd9qMEtHVT+P-mBNxh6g1jOm5ifArSxi1bbGnrKgxCf7zSQ@mail.gmail.com>
Subject: Re: [PATCH v3 10/17] arm64: dts: mediatek: set vmc regulator as
 always on
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_040856_691259_C898E81C 
X-CRM114-Status: UNSURE (   9.40  )
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

Le mer. 29 mars 2023 =C3=A0 15:25, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 29/03/23 10:54, amergnat@baylibre.com ha scritto:
> > From: Fabien Parent <fparent@baylibre.com>
> >
> > MSDC1 IP block is powered by VMC. Make sure it is always on.
>
> Why always on?
> Can't you just set mt6357_vmc_reg as VIN of mt6357_vmch_reg? :-)

I'm not sure to get it. mt6357_vmc_reg & mt6357_vmch_reg come from
PMIC and are supposed to be independent.
You suggest to link them in the mt8365-evk dts file using something like:
&mt6357_vmch_reg {
    vin-supply =3D <&mt6357_vmc_reg>;
};

Also, regulator binding probably needs change to support that.

Regards,
Alex

