Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A96EE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 13:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lR+yotPL2JhFpXqTuMpqA2jqZRBoBG3MioUG07FwcZI=; b=IHRCAllwE85T5rf+vm4VkHcp9+
	NRurJLT+FcJNWevgxe5Od1nGnTv0h46OvulxvjDJtnjXmGPahQcs6wziRdtmwFGuQXZfiWoDU0dRx
	iBEEztgCJBO/oiPiXL8Fev3x3pPJpjfazx2dWdU4Wi/eiDWFtM+GXZWIstMgnoC6nDKB8t3hoyGWO
	5zvCRe7vvR45TJlSf7gUfcB1CGo1dDLp8sjsnemUl+W/Pbo1XTKTDXCmGw0VRGOZtcQ3l6oCWJMiE
	/eJUHAyb07TMVBwOjbmg/W1pCmhtXlIJy58rwQeUPX9PunpyFtm4L9WZ6Q3QZl+XKdy525PPIsQK6
	WOE+b6WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfhDa-000dZT-1P;
	Mon, 11 Sep 2023 13:44:46 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfhDX-000dYe-2A
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 13:44:45 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-6c0f2addaefso297516a34.2
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 06:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694439882; x=1695044682; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lR+yotPL2JhFpXqTuMpqA2jqZRBoBG3MioUG07FwcZI=;
        b=zvdtJuODowcR5aW7wVFdvCQli6iet6CKeqIYwHcAObrCbmmeF6WNha8dlBDT95hKdS
         JicyUnyedcBApaSq92XYYqFTHdSKuh+8NqGSpLSD5ObqG6/g+GLK9d6fkc5OfGzNg9NE
         DegHtx1Y5ckolf1qIwMoOBtVC+wfptYUAEN4ML6YFLIrctwa1vPcE/7Ewu1h5Q8kvIqJ
         r/83qsVVi53fHzzPun6PHX80fA6MnxeRXoxQIg64zbRxGvk8IXkwgKPSMeZTfsJxudj1
         tpvW8qhoc/2FjtsdWO16bccJmAT0L4TZROs1LVcJ60ZzflDfFyDpwm6RyQW2C3hitjyX
         1EEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694439882; x=1695044682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lR+yotPL2JhFpXqTuMpqA2jqZRBoBG3MioUG07FwcZI=;
        b=ud0ocXk7yMhtKTkP8p/I+nIZy/Dj8TqGTVZ305fRzXazuBp2trFdSF8A4Mj0bkij6G
         TcPMA8RCR61bXG0N4dlfGC3PyhWLOjy9G+tmppLYg5aVyEnGIfk/V6pPOua+it1tlB7y
         /taLsGmfc/NXLNa2+U4Zgs5kjVi9OpXkvc8n6ZBaAZ5jkX+hv6EtM0AfrcLvmyDdxHE7
         iGaV0wWpgIi1z6HcaLEi0M3IgE3ModRsl3NQqtryu0NDMqLaOTR5NQV+rhrTLNlcDdSN
         2XWO1HtaXT4THfIopFmzhpmdE25gQ3c3Gkgmqs4rS0dIxHDbjtLEDsFTEOKmg0pX2g1x
         NMDw==
X-Gm-Message-State: AOJu0YzMzNOVgO2cnne4d2v4IFfs108u9IIUpr+iKaWDo6ZVogiED0MH
	HUntKOuOj9pBEi2nZsMrksnAe/O/cJdW4TarNPXBGg==
X-Google-Smtp-Source: AGHT+IEYfLWIjZooHKmo4/urW6qtpQKHB2aG2wO78WtU7f8Rs4H4GXzdDaRKYxYBxo9eS+FIgiRJub17e48PFxbtaHg=
X-Received: by 2002:a05:6830:2048:b0:6b9:c41f:ede9 with SMTP id
 f8-20020a056830204800b006b9c41fede9mr8513487otp.16.1694439882074; Mon, 11 Sep
 2023 06:44:42 -0700 (PDT)
MIME-Version: 1.0
References: <11db447f257231e08065989100311df57b7f1f1c.1693082594.git.daniel@makrotopia.org>
In-Reply-To: <11db447f257231e08065989100311df57b7f1f1c.1693082594.git.daniel@makrotopia.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 11 Sep 2023 15:44:31 +0200
Message-ID: <CACRpkdYd-yo5+aHnD1H3HxmW6wO55NzfxeUq8Tq=ws1WMa4Euw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: mt7981: add additional uart groups
To: Daniel Golle <daniel@makrotopia.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_064443_723606_D727ACF2 
X-CRM114-Status: UNSURE (   7.63  )
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

On Sat, Aug 26, 2023 at 10:44=E2=80=AFPM Daniel Golle <daniel@makrotopia.or=
g> wrote:

> Add uart2_0_tx_rx (pin 4, 5) and uart1_2 (pins 9, 10) groups to the
> pinctrl driver for the MediaTek MT7981 SoC.
>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

No comment for over two weeks so patch applied.

Yours,
Linus Walleij

