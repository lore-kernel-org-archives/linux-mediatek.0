Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352BBC4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHnVbdVJT4h/CWS4BWjRC7l/yCMSQb2yUYxDH3FTp80=; b=vWg1aSx0/5Xab6bBgrgrPnmsbQ
	RAOMdE96Q9z+cmP7OxoHtSDfOe/Ug2Qxcx/+NRoPegTRHcHx+vhEWb+yRMDtGPg9++sWWiu0JkTY/
	W2mNLM0QB1/MUlUXUgLlYPWeQ1h0kD7nNYn+Srd2HVENNSn4F8uLbo1BYrRitFczi8e90fKpkmjUF
	X/hxsqXE94sFv/nFT/8DYPR1iUxF1CdmEjEYce+o0uEpFtMrkDGPOnKYaW6597wwvwoINkV1C/3+/
	sSvuAxuDEFj0o+kur2aTmSkoQ3oQWZ5yZqMUPlaK3vxHr3txApZSW8hJP7G0GrcTlqNlg3wMHPJXK
	zkN7Q47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQogO-005eL4-0Z;
	Fri, 19 Jan 2024 13:13:16 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQogK-005eJP-2N
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jan 2024 13:13:13 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-5ff88cbbcceso6954727b3.2
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Jan 2024 05:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705669991; x=1706274791; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xHnVbdVJT4h/CWS4BWjRC7l/yCMSQb2yUYxDH3FTp80=;
        b=yDIaLQxwdOq11wH6OGw6Q0qIobBD+37BO3SfNnFLYylYWg49EmDODp0vS8Ilh/dZ1c
         b/dr/RruLhnm12rwKyUgtulTFXUagXhmzF9rTJKUpd8iSUppY/qYexky1jB+Bp1Ve2tb
         F4Ebb/cRp2mbNmCBNB6iRGtrZR8mb8ST5Mhxd3lvWrM1L3VwS/KJfwx9PCd631r6ul9R
         RX3lQos4l2B3gxVVlFRtiH5WVa8wUdNShzb/qK5D1dnjeMJjNKNt8Jo2wUVzn+AFouh7
         DCxAV5PrYLjTsTV2u6hjFoN8ibzrrNjAH9z55/EPmfcx/YK1+q7QuzF3v1RQfRFUVcCP
         s16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705669991; x=1706274791;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHnVbdVJT4h/CWS4BWjRC7l/yCMSQb2yUYxDH3FTp80=;
        b=DunDbh3Mv2hz8AV/+korJVYv2Ip54E3wakuyiSOlX1aMDjQIrLS+G4yiupXGMUyPOw
         q2ZDCb3iyHLFvaytyIqz6Yzo+/6TZ1d9TO+a8nh8f7hU9yTapzKG6WpcZEu9Es51Nc20
         jdixcqemF4qy49gbniwyUW68c0Q5tToh++GLwrbgA6N07fQ2YWCmsADgJcy4zBwjA1ZS
         HOxCDDnAn+uL9mpGP8lhzhAYQzgXAqHfWcvwhQmQpv7hBjvVnK6piDPgPr1v4nHBzhNs
         fDGN4cemtUKQ10HyUL+vD9zcxS08N3u+vJZDmW2FV9TEpqW7CFrszcDyVyk+YoptGiIT
         koQg==
X-Gm-Message-State: AOJu0Yyq23qAUlrs//VjW6ABNmt8wRYzzuZQuKtXIOi2K0Qr9It1SEoU
	xxxjxR9vOCQTcn7G3LOnCSoSUAc/LAKFZG7PIFGzeoJZTfWk3ImgPf0D3zBzJKs2BSyij1Cig/E
	i0yEGL/W71KQqDCXoRMC/81Mxy5aa4IiOPc0YAA==
X-Google-Smtp-Source: AGHT+IHfqnIizJU7bNVjSP0/AXHYr1nDGF7BowSr7g+dg3LcGz2IfpYeTEym8tB3K+krwyb0bUD/3CD8ALbza0lV2Kc=
X-Received: by 2002:a81:8047:0:b0:5d7:2c6b:623 with SMTP id
 q68-20020a818047000000b005d72c6b0623mr2678702ywf.39.1705669990951; Fri, 19
 Jan 2024 05:13:10 -0800 (PST)
MIME-Version: 1.0
References: <20240119125812.239197-1-angelogioacchino.delregno@collabora.com> <20240119125812.239197-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240119125812.239197-3-angelogioacchino.delregno@collabora.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 19 Jan 2024 15:12:59 +0200
Message-ID: <CAA8EJprHsBPOAA-M6Wk=maTCnJqORo+mLcW_0N8_+QRHYwLQwQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] usb: typec: mux: Add ITE IT5205 Alternate Mode
 Passive MUX driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: gregkh@linuxfoundation.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	heikki.krogerus@linux.intel.com, matthias.bgg@gmail.com, 
	neil.armstrong@linaro.org, andersson@kernel.org, nathan@kernel.org, 
	luca.weiss@fairphone.com, tianping.fang@mediatek.com, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_051312_771692_BCF3247E 
X-CRM114-Status: UNSURE (   9.54  )
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

On Fri, 19 Jan 2024 at 14:58, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The ITE IT5202 is a USB Type-C Alternate Mode Passive MUX, used for
> muxing the SBU lines of a Type-C port with DisplayPort altmode and
> also providing an orientation switch.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/usb/typec/mux/Kconfig  |  10 ++
>  drivers/usb/typec/mux/Makefile |   1 +
>  drivers/usb/typec/mux/it5205.c | 294 +++++++++++++++++++++++++++++++++
>  3 files changed, 305 insertions(+)
>  create mode 100644 drivers/usb/typec/mux/it5205.c

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

