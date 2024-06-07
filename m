Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD38C27C55
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jun 2024 20:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/qOH0xVbdv81jM0nNIDKLRqUAZO1z/a91QrrgXPknI=; b=CuHxjG9Yupo/2CKr9Q62u37/Oi
	LiWfKGFiF8OEWpGluwSPPUWhzMi7qKNeNrBNF7ts1tM2Jo7R2o89b0IRZRm8Ikooqk7NK7sK02zgC
	uZoRwAGQyJXB7NY8U2fYcaL+3KABwolQr7356b2VDoVg2dNteFY4Ge179RS2W1KcsUi2i+PcogUYQ
	8HJzGXtOUMc/f1HHUYdrSyHkVMsEmz5vvUbsmPOl24JVWEvl4swFWukUmiHXrrGKHL3xbUsX7vItn
	C12AzotxsXkOX5iBwWQyg5jLz8qmhAwUbAul4ugJgbYPRxl4KftvuXMvbfPfapI2o1GfGbOgYx8o0
	TqWdZodA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFgIW-0000000Fbh7-1yJY;
	Fri, 07 Jun 2024 20:34:52 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFgIS-0000000FbeM-2TVD
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Jun 2024 20:34:50 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-52bc1261f45so962424e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Jun 2024 13:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717792484; x=1718397284; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/qOH0xVbdv81jM0nNIDKLRqUAZO1z/a91QrrgXPknI=;
        b=v/Tg2OK002DV4uDJsYzoLC7w78wSsc2zSfdkzJI6g0UxB6Kjk2AjGMHSZuNcDiXx6z
         YIbaqEDtPSuJ2eIOiKKhtqh9EJSgL1kq0akT3dMt9ZkLh00gKVEOeZzHeF3MoIZMz499
         CxoDu+VAtYTuumPWRWYSBp1basDqzReC9WVUt/HwiHCxGJYtMS3Ai76IvCNEodGSrmdV
         bc6jf+8rVV6VsMsx11VrP0sC3cI4aYI1hLtA/I/06AJJtoyHR6qRfuQlEpPP1J9+hpjQ
         KyUetOllR9/k0o5XqAgnqgA7YzUF66gNMJOAqLd9rgo69Z8CVQsO75R0BbEGl5r3jzpK
         A5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717792484; x=1718397284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k/qOH0xVbdv81jM0nNIDKLRqUAZO1z/a91QrrgXPknI=;
        b=mtpD83lTMl5cyOEU82UnIiDZiC2p1kA+SCbwFHH18hzoaaY5RAHGWm9injm4EnmtfP
         6sI4RpZQjWTjumXm9K/d6ZSJRlf+twM8tgZ88fzI4t1zeMh1vJzX3huN+OlEIidZ1fKN
         A1U+yoLt8jkbZnvRhST/Ye9qaHhq7jtVVV+XyLFVYUjK7TGGD7tWoOadiJ2VmZYqAIBw
         HbUFW8uqf+OFFfvME4fz+6PJDpYmwhO4U3NFuYOX4mLttbe9cqIkXIXdIJEvAqcfIMbo
         mPRzNUZoqPfIPhSGl9A6ZPBdFh0aySuRRsBcE/npTeg7LwV3aETnhiKPXYMV24IzdXR+
         GnTw==
X-Forwarded-Encrypted: i=1; AJvYcCU4bzkUE/MuBEbCj+dWH+U9jSfH5LXaf5hbejoznxd0H0TZgH9dIoo/g05axHGjnlVlQIMiga07KY94XHkd8fSheJhSU3B+8LriW7qhbfXXZjZ6
X-Gm-Message-State: AOJu0YxRpXorlJvn/iqfdKp/xnqCE4Fj28q72+/wapWSrV4cLV3MDOyo
	2zpOden8zxlc8vmzCzXzYNFWQaOic7c39ld1ZR45EULabkuI7r5dVuDRXkv2Rk5hQeMah8IWjZI
	klK1B93qmv9O4NABraUxcQZoJcEKbgGziFMhtRg==
X-Google-Smtp-Source: AGHT+IGEyJ+w+NYHGdHZTgbtEUQOfYGBIFct41lT8WKTrSrUoBr0eDijD2Dx44IKe7RqxIodGmEk6AWnkM/ViP3EgMk=
X-Received: by 2002:a05:6512:131c:b0:52b:e2ab:7db2 with SMTP id
 2adb3069b0e04-52be2ab7e90mr867659e87.22.1717792484193; Fri, 07 Jun 2024
 13:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
In-Reply-To: <20240530085745.1539925-1-andy.shevchenko@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 7 Jun 2024 22:34:33 +0200
Message-ID: <CACRpkdbHwY2UJ-OodeJu2VrhML6tcjKeD-00ZoZotmi1tKzsEg@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] pinctrl: pinmux: Embed and reuse struct
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Daniel Golle <daniel@makrotopia.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_133448_809698_F99ECFAD 
X-CRM114-Status: UNSURE (   9.62  )
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

On Thu, May 30, 2024 at 10:57=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> As promised to Linus W. there is a series that converts struct function_d=
esc
> to use struct pinfunction. With this it both struct group_desc and struct
> function_desc will rely on the generic data types (struct pingroup and st=
ruct
> pinfunction respectively). I haven't compiled everything, some builds mig=
ht
> fail. Anyway, comments, reviews, testing are all appreciated.
>
> In v3:
> - added 'moore' to the mediatek patches summary (AngeloGioacchino)
> - added tags (AngeloGioacchino)
> - fixed build error in IMX driver (LKP)

A week passed, no comments.
Patches applied!

Yours,
Linus Walleij

