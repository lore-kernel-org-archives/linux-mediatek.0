Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C215EE801F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 07:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7kvJ88hdcyZxn7BimPdJ7m6da9aZWKUxh8JNEoyIe8=; b=a8WnA++bB7U53Cx5wVIwAnMgml
	hAGNRU9bG/MO5QqiBxGSVc3WbTyWH6gWDC5Y19lZEk7amtrz9kCiMnSJPzTvfuRyKLj17MKRmSThJ
	4RSKbYrdnujRDk4YPNX32rgHUVeCl+emfzXcXTRVfpuU3M0IbjM0QY5noluQhePlAKVki9feBflN7
	cx9/VnBBe590HZtLmNeO+l/CHqklkr3lvVOoP0vZOnrHHwMui2a44zdA0pdmcM6DJbCcQOskYfp0q
	S0kufRAnQPu7rfyNTTRK++/sNg1FvQ38BnGHp2qOifr4V4a2E3vLg/QVgX1I9y1BYNqoCwKF9VyWM
	zNzww21w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbC7-00HOox-0X;
	Mon, 11 Sep 2023 07:18:51 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfbC4-00HOlt-20
	for linux-mediatek@lists.infradead.org;
	Mon, 11 Sep 2023 07:18:49 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-501cef42bc9so6627082e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 11 Sep 2023 00:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694416724; x=1695021524; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7kvJ88hdcyZxn7BimPdJ7m6da9aZWKUxh8JNEoyIe8=;
        b=gyK9Y+zoxCu1anR6+pL8A0ov/EtJG7hNycyYan0mao4pWFhCHdVfwsOgcS4rY1jGGj
         /n73ZoesrYgMtni3tvUHMBbA4gOOQ3uY02q0/w5cRDOkdkoWI/UCmvbQCWIiTDi0eEQc
         Zi/33fVys2KfLChPin04d/9g9lnzDKkPMuSzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694416724; x=1695021524;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v7kvJ88hdcyZxn7BimPdJ7m6da9aZWKUxh8JNEoyIe8=;
        b=Nl4GI0KhQqT1bmZmSGxgWGPULaezZAlhwPbIoemY9iaSDVeCiAgvg+fv0aTXYJi8Aj
         RCF3VFU2zsCd9J1xSI4GSiA+zPJponL5IH1yX5fCaGLF3AIjYniDbGiyO3JIvA/bZXQP
         idj/mA7SPLBEs8nsrrDZrraaWNhkZ2NNohFPEdLlwFGO3SiyE87V6/IRtKJLFyTdMAdk
         bI/rfsPE9X0t84gYL8yNwKddOxrKlDDsohgv0zW6VzrVqA1ud1FUOXs2bfCFFBB13g5c
         ELUoUYqHxKEG5GUlerrFG5j6bl/z24FVwQo34hPnvECy+SW1vXvhfoxgFGUpHNfy4eZj
         45Tg==
X-Gm-Message-State: AOJu0YwwmyCFB8NS6v5UmNFAqSdG2kiQK69RXM0yI6dLpquUgBFKx0z5
	mEjRmqd95uUWjDT3veYGlvJ/luIsU8CastgwnYYG/w==
X-Google-Smtp-Source: AGHT+IEfwkrSD/W5aQfqkRsu93iH17HGzskopX5yylq6aylm+CrnHrISf+6jlWMFCw+UpNmLMMnSQNXHiOKXlloMF5U=
X-Received: by 2002:a05:6512:3194:b0:500:9a29:bcb8 with SMTP id
 i20-20020a056512319400b005009a29bcb8mr8495782lfe.4.1694416724107; Mon, 11 Sep
 2023 00:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230908132839.2034566-1-fshao@chromium.org>
In-Reply-To: <20230908132839.2034566-1-fshao@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 11 Sep 2023 15:18:32 +0800
Message-ID: <CAGXv+5EdXbQgnOBN=Jw-rUX-NYdPFybH_ev6MxrS3oLiWZq_Fw@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-jpegenc: Fix bug in JPEG encode quality selection
To: Fei Shao <fshao@chromium.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Bin Liu <bin.liu@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_001848_760030_3F57C7A1 
X-CRM114-Status: GOOD (  11.23  )
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

On Fri, Sep 8, 2023 at 9:29=E2=80=AFPM Fei Shao <fshao@chromium.org> wrote:
>
> The driver uses the upper-bound approach to decide the target JPEG
> encode quality, but there's a logic bug that if the desired quality is
> higher than what the driver can support, the driver falls back to using
> the worst quality.
>
> Fix the bug by assuming using the best quality in the beginning, and
> with trivial refactor to avoid long lines.
>
> Fixes: 45f13a57d813 ("media: platform: Add jpeg enc feature")
> Signed-off-by: Fei Shao <fshao@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

