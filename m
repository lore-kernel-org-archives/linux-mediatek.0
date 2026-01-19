Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAB9CCF2DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jan 2026 10:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3q92h4IZ2Vq5Gf1TltvGb3LBBGAyynZEUdMpN9LU/E=; b=fIaIMz5r/j5I5a6CR5XQK2pSD1
	Ge/GIxZH10lkhUdoPTO09Eu5QDONHOcJT0IXR80ftLq1SCu4IhmKbw0yBikWKAMxEYSyULwfaCHtL
	07PxOucQJ70LtGBa0J81DXWByLC484syQEM7SXybQ/QovPK9gy7FDaXUTIW2NcrtYfGqnTOcXxuEY
	t978FQe/17ZQtyHp9aGVBElJN2X3LaDnzSv1GMAaueJrsQRtfS78qk+om2jj+iqYJM7yN3jFcVIGa
	FDONKhDDdOiLh7/rapvygjLwdgCUF4VBsa0extOjdqCdNPzavjyKcA8EEYuO2kE6oWz9Y9GJNSx7u
	6z9z6A4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmbd-00000001mTa-2xTL;
	Mon, 19 Jan 2026 10:35:33 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmba-00000001mSV-0cic
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Jan 2026 10:35:32 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-11f36012fb2so5785670c88.1
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 02:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768818929; x=1769423729; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3q92h4IZ2Vq5Gf1TltvGb3LBBGAyynZEUdMpN9LU/E=;
        b=fR/aqQAPg/3Yk0AZiuD/fe/X4ba6eyj0RMtRHhJjtaEJMa+9TSP7myumUoExZuPVxE
         kFD0HZMtVdxMLCaUXcxkDIrTi9OhnfyvBrx/PdSjzRJEfHXm1HyuQ2BsdGblPMj2IWWX
         Yw110e6BYd8sMwPYC5zPpuiN6Mt6HVkiIR7ig6AKUQ6UfSLFQd/A4arxo6vBGjA85xFj
         Pxq1qDg916lQVP7+PBWmq1Uzu/oRLJbxG3+jWee3Uh6fB78BRFxkgO5c1k10ffJ4kol9
         y6oExeAP5874D2MpWL5OuZzti+s71vZBJvY4LV8fl99C4nqLQ9GRicemNpFZMpSW/P4D
         fuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768818929; x=1769423729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n3q92h4IZ2Vq5Gf1TltvGb3LBBGAyynZEUdMpN9LU/E=;
        b=dQPuDef0EJvR9HwrNE2EeV8YNeR4IEy2hYy8v3CvW8JOvo78dvWrWGZSgnwgJr990O
         5WgU+GBG/6DloF8aQKiPBipZsOuolyHnXEFnibp220gRosvP3tFIk6XMo3mCd2Zxzls+
         lFvWzI6TwKsq3thStVT23CRiFcakBc8CsURritYDdkBlj7dUqFz/QNBCUy02K+TwFBb7
         cujZTfKjnrXBZlojVpgdajUx2aYXG9F23CWfJKOmYg/pg2kk6XILnRSfoJ6s5Z8JfkfT
         1rV44jijI8rwywHkvbcMmAo2EcK9DKv04rgN7272nglKtxT62MP66SGROLaYVseKVjyV
         Qcbg==
X-Forwarded-Encrypted: i=1; AJvYcCVcj33CBMlcUlF1c/oJQudZY9rSN09q7yQcqvnhXnleZn5dkZIIXZj6D+ed+KyP7kQdp/JVZKJe0IgJfjiIDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyQWS8jl5dKojdvgJioS7TU8w/daWU5qSnPtszDIeCI4eM9f/my
	rqxCUi/rYrUWz8lgbamjgzqhTfR1GYBMlRHozSexL0ABMIC8Kis10mo5JdBmqL8d1D9BPK8SEU8
	KOXTTWXEBI0D2P3qx3Ix7twFoYXEaMoU=
X-Gm-Gg: AY/fxX7FUUdllBLVkJbqjJi41160FuzKogp+ZDFvQFd6+E1DoGhLzivop+4qFKmQ9VQ
	Tf9KjN80KKomwcZ258uwfwJ0tK+2SMxTcUDMQ5il0l4T1DJzmJh6NHPGUvSnCFYwe7fxyQs97vt
	i/nR5N1B/tyiFK9B8zkEzxS7zJJxt7iyNnMmE1uy8LZhYoDMJp4r2zJCQEfb7/xfEeAvk6TmiVx
	fd5wwvbqOee037yWI3jxdpAlUe7xmKPRyInoMeYyFm7Sdt7dC+5gTDieWfrEur6agl/fLFjJ0cn
	UsNqmeW7orQo5JRj0K+J5AqzoWcsxv5BhAaYZC/aLmo+xn35R8kyHWwxNYv9fToglA0zVur1iRj
	f45ZGtdybTQ==
X-Received: by 2002:a05:7022:3c12:b0:11b:95fe:beed with SMTP id
 a92af1059eb24-1244b36f52dmr5548679c88.38.1768818929182; Mon, 19 Jan 2026
 02:35:29 -0800 (PST)
MIME-Version: 1.0
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com> <20260119095511.3030739-5-zhipeng.wang_1@nxp.com>
In-Reply-To: <20260119095511.3030739-5-zhipeng.wang_1@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 12:38:09 +0200
X-Gm-Features: AZwV_Qgr_591rcHqBwOlaouog8Vh6-BcA6ABe_pXfwA_9p9X95EWt1kL0IH2W8c
Message-ID: <CAEnQRZBf6ymmrHUVXPdvQ3pQWwhON-dCqJ2v8FZPRBEo-X=zPQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clocksource/drivers/imx-tpm: Support building
 imx-tpm driver as module
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	chun-hung.wu@mediatek.com, walter.chang@mediatek.com, jstultz@google.com, 
	amergnat@baylibre.com, aisheng.dong@nxp.com, jindong.yue@nxp.com, 
	xuegang.liu@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_023531_124585_DEEEBC2A 
X-CRM114-Status: UNSURE (   8.74  )
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

On Mon, Jan 19, 2026 at 11:56=E2=80=AFAM Zhipeng Wang <zhipeng.wang_1@nxp.c=
om> wrote:
>
> From: Jindong Yue <jindong.yue@nxp.com>
>
> Change defconfig as tristate type and add platform driver
> to support building it as a module.
>
> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

So you can now select the driver Y/M/n even if no COMPILE_TEST present.

I wonder why we needed the `if COMPILE_TEST` in the first place. But anyhow=
,
this change looks good.

