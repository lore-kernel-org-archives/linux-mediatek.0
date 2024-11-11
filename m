Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A9CBD2E9C8
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Nov 2024 09:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16u+npe4MbHHsmpZ08MOYgrA6j2B46LPWEmoqUuH2IU=; b=0Bqplxax1sCVZSKT0PWvrxypUq
	/dD7Qjs0UEEVwcZGcWwD8gcDYbZcn2E/oTRcBkSfvcELonQKQtMKR6edzhQfQCpXLrv6QRi2BMtNn
	J2h/11rima+2hkd8CHW22sW0p5ohGpdaWq+4rI/wqfFOLERV8nhCKzeOOEFr72ilW69uuw4rBclDu
	cG7+cOLeR4VlqvpFumCucPmTM8quhzAsEEMdGwcU7WdM1daabDl5GKorUvHrGCHxrpP6jO4zxTi6F
	LNgmVSuwDiL7OHpoF33UTKwqjzh67/DGlGCEb08rjauRUCKF0/SLH1WxZ8nCv5+DUHjhAoz4XNjh/
	LiPYDxWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQgQ-0000000H5Wl-0rbq;
	Mon, 11 Nov 2024 09:26:06 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQgN-0000000H5W3-0zYF
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Nov 2024 09:26:04 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-718061440e2so105239a34.2
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Nov 2024 01:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731317161; x=1731921961; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16u+npe4MbHHsmpZ08MOYgrA6j2B46LPWEmoqUuH2IU=;
        b=gOjyytuy1WZKjHHIpYKlJquNeqhvuoBWZXL9Q5hF7Ohcl5KKxD/cNdksDzNRjOo59O
         CoSFPXf+3NpyzR9uFkAmoVcDS/wASPU4kcFudAsaKyQLFSmVUa2+ucVL+4R/GgGA3R17
         WvQgJIDyZkZ6/G6l3F1aT0M7qp5z7W/UvyeJAbZKg2NpJvGVWaJw9E94M2Ho9e9Hs1+Y
         EF5ou4KypVKiPFt2iUXA79P9Bvjatbr3VsiOgdsOsHcjdx2/i6JjyFyz0Z6iUCOATTFO
         6jCT0e//OeqOwgy0lQJwpHMQMSLrmSqIG+6EciTqKjBifLm/AHQH65AwIoyT3gSsf7up
         28cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731317161; x=1731921961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=16u+npe4MbHHsmpZ08MOYgrA6j2B46LPWEmoqUuH2IU=;
        b=JVf56sDEBVYwBv42YREuXyi/WnvMJjKo+5H1RdRNURc64kEpgou1aMsoGytLYLplUS
         YF5ZlTIXa5SA1uj3IZ3EAl2pADLAAZOtwnOmbtVTqo30haVIiYgyaS2MH88sPZS9BVga
         7s+C3xPhVcLwhiHZcqAi8+XatMelhG9mqbcxIXGvQwUF1nYrB8iuOpNxb2XOkuiCP2aP
         ZoyGFOYbAOPmSobQoBKFMWxvSUkB0fSG2KjHfP/YjxRl/iyCu+8SxCHNnJ7L0p7ZwMpz
         2rJeKnhmxb19bV5JysFjo8Smj1zGqaFE0zqs65bh43IFV6vULv7h459eZVKvVJxYu2Cf
         ym1g==
X-Forwarded-Encrypted: i=1; AJvYcCV/4e12i+7BKcJ/0rhtMqzgEOBkgvGPLkOhBAdjllKdSOYJ6OR4Hw1QsdPFAYtzBZwi2O+obdRIf+ohBl8Fcg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxI0+0pbi+19TEWSIsCd1984Jcz+3eCEyyTeTxwh/7UHjv6f5xH
	FTBwARZI13fWEsT3JjD1JHXQOE916VJeXT4CgXBi/0aJcYauT6LIwvKhUH1nlJIgZmjcV9dm3Vo
	l6kpu05wl+W/PYKCIE7eSbNsi/pwBV2JqgwNu/A==
X-Google-Smtp-Source: AGHT+IEbddWaWnCjkmvVli+HftqZUgfuRo1RHD4WnRBKP26ug1MHqgXnTsC6sGlZxqlzp2/8eme4zlIKL3HJtTUpKNM=
X-Received: by 2002:a05:6830:d87:b0:718:ffc:9445 with SMTP id
 46e09a7af769-71a1c1f11b8mr2581183a34.2.1731317160303; Mon, 11 Nov 2024
 01:26:00 -0800 (PST)
MIME-Version: 1.0
References: <20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20241021072626.15102-1-xiazhengqiao@huaqin.corp-partner.google.com>
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Date: Mon, 11 Nov 2024 17:25:49 +0800
Message-ID: <CADYyEwQjDUALxi482d=KTY4Jt1zpbByPQXjF9YR4hu-3Qd-u0w@mail.gmail.com>
Subject: Re: [PATCH v3 RESEND 0/4] arm64: dts: mediatek: Add MT8186 Chinchou
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	wenst@chromium.org, hsinyi@chromium.org, sean.wang@mediatek.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_012603_296069_DFE0601E 
X-CRM114-Status: GOOD (  15.13  )
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

Hi all,

These patches have not been reviewed for more than two weeks. Please
review them.

thanks

Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
=E4=BA=8E2024=E5=B9=B410=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=80 15:27=E5=86=
=99=E9=81=93=EF=BC=9A
>
> This is v3 of the MT8186 Chromebook device tree series to support
> MT8186 chinchou platform. It is based on the "corsola" design.
> It includes chinchou and chinchou360, including LTE, stylus,
> touchscreen combinations.
>
> Changes in v3:
> - Add a patch to change codec in pmic (in mt8186-corsola.dtsi) to audio-c=
odec
> - Link to v2: https://lore.kernel.org/all/20241018091135.17075-1-xiazheng=
qiao@huaqin.corp-partner.google.com/
>
> Changes in v2:
> - Modify location of "const: google,chinchou-sku17" in mediatek.yaml
> - rename "pin-report" to "pin-report-pins"
> - add "vcc33-supply" and "vcc33-supply"
> - rename "cbj-sleeve-gpio" to "cbj-sleeve-gpios"
> - modify subnode of sound
> - Link to v1: https://lore.kernel.org/all/172900161180.733089.89635437453=
85219831.robh@kernel.org/
>
> Zhengqiao Xia (4):
>   dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
>   arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
>   arm64: dts: mediatek: Add exton node for DP bridge
>   arm64: dts: mediatek: Modify audio codec name for pmic
>
>  .../devicetree/bindings/arm/mediatek.yaml     |  28 ++
>  arch/arm64/boot/dts/mediatek/Makefile         |   3 +
>  .../mediatek/mt8186-corsola-chinchou-sku0.dts |  18 +
>  .../mediatek/mt8186-corsola-chinchou-sku1.dts |  35 ++
>  .../mt8186-corsola-chinchou-sku16.dts         |  29 ++
>  .../dts/mediatek/mt8186-corsola-chinchou.dtsi | 321 ++++++++++++++++++
>  .../boot/dts/mediatek/mt8186-corsola.dtsi     |   8 +-
>  7 files changed, 441 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-=
sku0.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-=
sku1.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-=
sku16.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.=
dtsi
>
> --
> 2.17.1
>

