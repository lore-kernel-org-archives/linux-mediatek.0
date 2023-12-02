Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C67EC4167B
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Dec 2023 01:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=on0eUmIVBGIZNw/lnf6eJdI5XZ4MfrBWX3aiU7eK2L8=; b=hotONxV3byjmrAYOOzOeN3t+0S
	z8Wa1/HWb5nEONnNYaL4u7e4wKpljR8MFNhE9lk9ym5YEyEBrBJZOICqdRatpbNtjyW6Xp3eXJnTq
	pIoX0Xt7Fz5gTGDcHZFGem30HwAZKvftxwOVNCNO7Ft9s3gpHy4HxpN/JNJTUkSAu5veDsWp2cGI4
	h+JUj7IYXud/275XnViASovVy0nMWV5ICe+45JoThNCCs83ZLWfyVtIaVZHm9scWevGD82t8H4lI0
	3GESaU9mlzw+ZFcDf5qeSy7y57lwQ41dDloKtD0o+HBTPi62hMOPCtrO0m9UToalPlePoEqTmznjY
	NVKioH5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9EQb-00ExeP-2V;
	Sat, 02 Dec 2023 01:04:17 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9EQZ-00ExdG-02
	for linux-mediatek@lists.infradead.org;
	Sat, 02 Dec 2023 01:04:16 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50bc59115c2so3898627e87.2
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Dec 2023 17:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701479049; x=1702083849; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=on0eUmIVBGIZNw/lnf6eJdI5XZ4MfrBWX3aiU7eK2L8=;
        b=Bfhj8dPSJsD+pInxCnpu2KJ6RwmmP+ElvH8QosxBwl1CwR7cE3vgbqxTkcfgMhsMEX
         Zcr0Cxz8MnznyeyGDE1dU2i5zo/pQwoywyWc1iA/ZsEuBrJ5ldqJ7edXE1GFHmxCCQl3
         K1BW29BCz1aiPWxKulH22sa0VLb5imivyqMqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701479049; x=1702083849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=on0eUmIVBGIZNw/lnf6eJdI5XZ4MfrBWX3aiU7eK2L8=;
        b=mKs5C5boJoaRaLULapZEwjYywbElDiFcaFzSbASSA4hmXmmduT9TtQfWHz6TuzaBvW
         rrSWKqElNgHj9wEp4mQWxunhr9FFJRpix8q8pDSMFxplnaYrbgk6bqnK1N1Akde3tFGg
         W3c1dCUHFI3YgWByksy0cOKooH9jrkQzR6mgn+aRJfne+kpasO2WTdZn2cEjY+xWIE0k
         IDaheEZri4rn3czcFVgfIb+xJRqIODTFz/lBb0bXix4cF0xMrZYsDvLurIa7XILny28b
         aT70NI7IZkUrTpi16MtfzSvpuN8+BtNZPZ1NRb6Nbuhrcfl2dCFOBPE4wvrTk5y4aGY/
         iN9g==
X-Gm-Message-State: AOJu0YxlZpC1GAKANRJWABswf9HEhxyiODj/x9rwEIxotbC3XtcRD7pk
	C9vdkzyg7dGl/BkaAMrldNrP4GM/YChTb1k6fEW4r2yq
X-Google-Smtp-Source: AGHT+IGa10iXW02MvlKq6kxuQOg0pYJl0wHpKK1kYhEM0y7SLz8qSGEFsU9GmGWHVPRiFM6TCP2j/Q==
X-Received: by 2002:ac2:4204:0:b0:50b:c0f1:bab with SMTP id y4-20020ac24204000000b0050bc0f10babmr1335927lfh.28.1701479049490;
        Fri, 01 Dec 2023 17:04:09 -0800 (PST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id g6-20020ac25386000000b0050be64f4259sm38291lfh.250.2023.12.01.17.04.08
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 17:04:08 -0800 (PST)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50ba8177c9fso620e87.1
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Dec 2023 17:04:08 -0800 (PST)
X-Received: by 2002:a1c:6a0c:0:b0:408:3727:92c5 with SMTP id
 f12-20020a1c6a0c000000b00408372792c5mr311701wmc.2.1701478584358; Fri, 01 Dec
 2023 16:56:24 -0800 (PST)
MIME-Version: 1.0
References: <20231128084236.157152-1-wenst@chromium.org> <20231128084236.157152-2-wenst@chromium.org>
In-Reply-To: <20231128084236.157152-2-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Dec 2023 16:56:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V_v11eZ6+3gUwOvdWGNM9owG7zCK5EiezTY7RJ3eaEMw@mail.gmail.com>
Message-ID: <CAD=FV=V_v11eZ6+3gUwOvdWGNM9owG7zCK5EiezTY7RJ3eaEMw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/5] of: dynamic: Add of_changeset_update_prop_string
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	andriy.shevchenko@linux.intel.com, Jiri Kosina <jikos@kernel.org>, 
	linus.walleij@linaro.org, broonie@kernel.org, gregkh@linuxfoundation.org, 
	hdegoede@redhat.com, james.clark@arm.com, james@equiv.tech, 
	keescook@chromium.org, rafael@kernel.org, tglx@linutronix.de, 
	Jeff LaBundy <jeff@labundy.com>, linux-input@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231201_170415_071498_742FE21B 
X-CRM114-Status: GOOD (  11.89  )
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

Hi,

On Tue, Nov 28, 2023 at 12:45=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> =
wrote:
>
> @@ -1039,3 +1039,50 @@ int of_changeset_add_prop_u32_array(struct of_chan=
geset *ocs,
>         return ret;
>  }
>  EXPORT_SYMBOL_GPL(of_changeset_add_prop_u32_array);
> +
> +static int of_changeset_update_prop_helper(struct of_changeset *ocs,
> +                                          struct device_node *np,
> +                                          const struct property *pp)
> +{
> +       struct property *new_pp;
> +       int ret;
> +
> +       new_pp =3D __of_prop_dup(pp, GFP_KERNEL);
> +       if (!new_pp)
> +               return -ENOMEM;
> +
> +       ret =3D of_changeset_update_property(ocs, np, new_pp);
> +       if (ret) {
> +               kfree(new_pp->name);
> +               kfree(new_pp->value);
> +               kfree(new_pp);

Given that this is the 3rd copy of the freeing logic, does it make
sense to make __of_prop_free() that's documented to free what was
returned by __of_prop_dupe()?

