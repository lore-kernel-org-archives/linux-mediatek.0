Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 774D4CD80A5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Oct 2023 11:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GTectLvPvyUAeR+UK3mFeleYYPacIavTIv67tqstYk=; b=cMUCufSLjECSjTXsm7Hr6R6u7s
	ljXQr2YFkbk89H2oWN9YPbUUCoIqFubF580ocrvaGPeuL85UrWFkQrHMzAjx7cnv6h8b231honk4e
	iNYEgh4L+7pfp4XrcI+LsuxecoAVGYcmRGWj0JgmASqmczeAz8fS1EB50/n98D50pjuZsat8iK/eo
	lVQtzr6AKASxJXyb9pBR500C9I+Om6edN62k8Yuvf6/+LPgrru9T6AG/AAeXimTEU+HUi1Ss0nOoB
	/A0F80Fo/YsaIfeDWhC41yWw4yrwu7Y4BQwKhv+owCbgntqvEQHfwN7xHr9AbFNL5cHfE6xpoGvLF
	o2HDHhnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqAUH-00DB7j-1H;
	Tue, 10 Oct 2023 11:01:17 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqAUE-00DB4a-0a;
	Tue, 10 Oct 2023 11:01:15 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5384975e34cso9807351a12.0;
        Tue, 10 Oct 2023 04:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696935672; x=1697540472; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GTectLvPvyUAeR+UK3mFeleYYPacIavTIv67tqstYk=;
        b=SU1g2CDy2nnPODEK2vbmItbicMnDuK1JsdZlSsTvONO75sZx4Qv896d8w/7UXzrZd8
         lXpjj99xpuqpE0J6gdV5wbSA38Qyd2BpZXKUSLueyejKYzxHgIfdCBbRORFGYXd4CFQx
         eSkEMpIRbkKA1q6EzT8kDBPivnqh6ZDFNeoH2aAqkhDezX9lXtKZoEDZ+Mgw++AYt4+A
         /fcOkfSYYrm2nvBJlciIZrPtRlLMjGXPN+c8hCSXrqwoQgvlw2ECqbOesOTSwtThWKlh
         al6XIwQQKFFqn4Zp9eqr4pV9hDZ7Si9NhY6W5oASVx6t88/3xCZCsItpqzVv5OwuZKRp
         7Wow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696935672; x=1697540472;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6GTectLvPvyUAeR+UK3mFeleYYPacIavTIv67tqstYk=;
        b=CkMxKf3s+zjL6Laa87509Bl3BM3KWjKmOKJ+UE5ARg8AEYIutVtRqAI47yrfuxWs5Z
         kIsXNaJcJa/j27l2PsVwKax/dxidv3t2VvRs37YYag/gkg+Cyi5Po+iVf3fG8wqkE8dx
         TJW9I7dUBKAcesCneLEa+quJ/fw0J/o+3cdO2OUeptW3GCNSQUnW/di4do2jFtp6ZSDh
         GIACtlJyFW9TlJRY0LD1APTsEE5p0aAToz8ioqPXF0WpL71kTPGzkRh13hfkJTcZkcb3
         mY9LFxjElGTGVzkVUv60OBbb8dSqZvBgBwOoiiFiOMt/0OG4E2Gh7zoUA+bO9N1wQkUI
         fx5g==
X-Gm-Message-State: AOJu0YzIEnoXO6BbIGYWLuNP1hn2a9CxH3iweEvqFTf+oWWYswqGKWDX
	KceiqQzIIBdBERP5MhQw3BWlmtR1QxuY9jiHthk=
X-Google-Smtp-Source: AGHT+IEEzyWdsvC8fh+kP+bgc2U+zJJLc3nm+2dxOgBkXQWWK628e0++wSoW6/Ywrasi76fnvCKv6ghaB7r27HBWTH0=
X-Received: by 2002:a05:6402:707:b0:525:691c:cd50 with SMTP id
 w7-20020a056402070700b00525691ccd50mr16977820edx.24.1696935671648; Tue, 10
 Oct 2023 04:01:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231009155945.285537-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231009155945.285537-1-u.kleine-koenig@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 10 Oct 2023 14:00:58 +0300
Message-ID: <CAEnQRZBzEfwC3kgaUWty769L4wD-LGng5yUJwQR2_C4T0oJjxA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: Convert to platform remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Mark Brown <broonie@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_040114_221192_FDEF88AD 
X-CRM114-Status: GOOD (  14.12  )
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

On Mon, Oct 9, 2023 at 7:03=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
>
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
>
> The SOF platform drivers all use either sof_of_remove() or
> sof_acpi_remove() which both return zero unconditionally. Change these
> functions to return void and the drivers to use .remove_new(). There is
> no semantical change.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>



Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

