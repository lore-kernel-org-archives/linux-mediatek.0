Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38A8C05027
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bpuj4csXn4X99vb3I/8s21NoXDHeQ/0SUOopiJHmpcA=; b=2y4Alrar2g/JOukaKg6pQRIDTa
	717LnxFYGzP4KeMv3g2lV9wnME8TZ8kdH5OisVu243PGMIdKvOAymo+Hai4XGWRz68WMU695i4dHR
	rZys2ALX/2E99a7zqad3Fxi9CfqGz8T3Ay3+ioLpq/3dJT8Yuw4SMLkekxtatwaCP62gHiUsuAQoh
	vh04h/HN0BounQnLSNL7VkjwP93LCcpD8DEOt1VWkWV31DdmUHw2THGVcmnB64rVR0OqVs7aOaf3z
	NQZG90FAEJ1mQX/DDjHBj9OoGh2Mdc7j7cfA7BshuLRth/FlTwGM/61mtG4LeXF+5h81/AY0ZfMwq
	5lA9/a9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL2k9-00B4F4-G0; Thu, 26 Jan 2023 13:56:45 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL2h8-00B2jr-P4
	for linux-mediatek@lists.infradead.org; Thu, 26 Jan 2023 13:53:40 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id p141so1980226ybg.12
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Jan 2023 05:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpuj4csXn4X99vb3I/8s21NoXDHeQ/0SUOopiJHmpcA=;
        b=T1OCixkhNVvyqIZG02I05yLXMmu0eRtoy7a1SbHSvmaUaNSxhw1D3/LIvUbLquayXB
         yV+BtLGzuQfszCSBlQ9R2P2LmFDhBpW5QHj6vNoet2lRvFj8mHM/2tGpoJwDJnX6vfGq
         9aG1wkd9GjOd0Qo5EMgr5y9lhqsZraSPNFYsOSMgJ90jdp8NZdl4VDBVh7+UXOdvYoUv
         aLPu8JIpl49wnMfa+jFlLrcWSoWGWtDdAWA31H+OqdURvRn2fO1wKsC98OoirxOfs102
         psM27Q4jO2ZFe+Mw/uTheQ0YXYL6e1JXsDMIYsioyjJA6+a0xudWPVol+9wiSlfZMCqZ
         1Ykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpuj4csXn4X99vb3I/8s21NoXDHeQ/0SUOopiJHmpcA=;
        b=XzLlfzcHczXe78MTScs7WYDts+60S0AfdEGIOf0ny2EhhF+GwY98PgtEt9FcWikFwP
         lB2hYoyB7TwQOo6gWcdv2oQC/HresXh0ipxxi+ZtnGgdOIt4c05OBVpHgXgED/RCJpW3
         fTEJbkNMNfQ+9iA7TSu/DspOP/5QoALDAto2Ri072DBXUGAVu11qgzPc1qJmNfkMnxe+
         SvJja78/L/tBMc0tUOu249O5hIapec0tDUWQKWUIsEriM0Zzalekwyw4TVXOlc5GyNbw
         h84AJZ1kXDKO3tvwPDOFzPG1nACsRQHuLJurrCBfSHMB0Os8StussJau2y98JzeHTd09
         VEpQ==
X-Gm-Message-State: AO0yUKVhDs5JvaDL+WU9Y70G5hcUhePsnc04tgRkdbUa6Uih9KTINq17
	WwvQ+Br7CK79Swz+MtA0JRmsBwvGLWxJN8J4GvNWmw==
X-Google-Smtp-Source: AK7set9K8VEvJWIIsQbzLpHPBdIj6YRdDIIsA2XTX+4WAVIQ5O4wlEhz7CX7+BOEhoz7cif/nbeZ9U+rSHTl2iHnGDQ=
X-Received: by 2002:a25:f81b:0:b0:80b:821f:b621 with SMTP id
 u27-20020a25f81b000000b0080b821fb621mr752679ybd.24.1674741217835; Thu, 26 Jan
 2023 05:53:37 -0800 (PST)
MIME-Version: 1.0
References: <20230125143503.1015424-1-bero@baylibre.com> <20230125143503.1015424-5-bero@baylibre.com>
In-Reply-To: <20230125143503.1015424-5-bero@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 26 Jan 2023 14:53:26 +0100
Message-ID: <CACRpkdYMif0--zeKe-tccUJvjiQAkbzBq2nCYMS8qU_imZmCmg@mail.gmail.com>
Subject: Re: [PATCH v9 4/9] dt-bindings: pinctrl: add bindings for Mediatek
 MT8365 SoC
To: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de, maz@kernel.org, 
	lee@kernel.org, matthias.bgg@gmail.com, gregkh@linuxfoundation.org, 
	daniel.lezcano@linaro.org, chunfeng.yun@mediatek.com, 
	angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, 
	allen-kh.cheng@mediatek.com, sean.wang@mediatek.com, zhiyong.tao@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_055338_849530_E8B592BC 
X-CRM114-Status: UNSURE (   7.90  )
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

On Wed, Jan 25, 2023 at 3:35 PM Bernhard Rosenkr=C3=A4nzer <bero@baylibre.c=
om> wrote:

> Add devicetree bindings for Mediatek MT8365 pinctrl driver.
>
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

This patch applied to the pinctrl tree, decreasing the depth of your
patch stack by 1!

Yours,
Linus Walleij

