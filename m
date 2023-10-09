Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12491E95A8E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Oct 2023 07:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LcLBkttrnLyWRPQcmdLUsIhnk5fgBx0T1gVgylMyObc=; b=x1LIonoEkPmbeqCzOQ9AqSK0VU
	XvJZJhRb5F56oiRk6WKK9937lBWhG6ZEY8KKQJxqFrIlu7QpUOaqGH5PZbnaDdA6NVmAiauU1rOGn
	68zox0GIP7XSbdcMNMOa6GRsBQoFf7UkrITJo3RWrVuipFt/G8ose1ztrejTlSTicSRwmN7IL/sQI
	id9Lh03skrrxptlKvwTfpQxxoH39DMuo5XzNfuD2m66gCiS8lXS0pZgY0nq1CQPArzCpmXsX6pYrS
	VuGDmntly4+0FOWpHtntomtsjFLBIgoY2sPrLbLX/azAE3L+CzFJ+BYphMRmjmoM5BxZM0EYi1p7w
	NfRg9sOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpkRb-009sw3-04;
	Mon, 09 Oct 2023 07:12:47 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpkRY-009svO-0Z
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Oct 2023 07:12:45 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-49d14708479so1295724e0c.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Oct 2023 00:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696835563; x=1697440363; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcLBkttrnLyWRPQcmdLUsIhnk5fgBx0T1gVgylMyObc=;
        b=2K/6WRjVtX+7rSMKdFV/wKm0CIFfE4KwdNU7Su4frfWLbMGRtUWeAg6eGwdgnnLS9z
         NqvYx8aZp3Z9kIzupFUoUXQSN0d7/najzez0tm27IjhT8huDXcJYnX/QSlKgBe+eX2dU
         xmcA2jwvaDdl2wSGtWONKNYGC5SSj/ExQxsI9vKxfS/a2/Wl3MPYd9gpAVczhhwyqWBI
         8NcIAQbV0c2cFBaB3t9DH9out+HHFjHMAwOxNokAzfnCh0ocTvKDc6uYmnwo21CO8eR0
         U9oG9u8KaECRWVCH5MvJ+h+U9Mrd0MIV2nicL4BOI6lpPb88NNxTpp+nHHJvyph+rg9H
         Wf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696835563; x=1697440363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LcLBkttrnLyWRPQcmdLUsIhnk5fgBx0T1gVgylMyObc=;
        b=ud95+K40qk55nqk1P7EMnnz9bThozBHnqSrDEWX+XBwe3cahHnvqgjulB4TgiUID+w
         UpNVJP5jDb6/0uiqjm1mlpEEnohBsUTsX4jHjPBA9z1nzS6yhB09sfwTeaidZMJbm0Qo
         Vnxx1NrCWrUbG7HRrwgqxqlMp1kHgvQYWXEKn94sWyoB/ZNHFow68bIPJZrQDWzZ6lcT
         AQX3qCMMpawKOKUfFm/hXJTW1U2cgebOEISYQPXjGQ8PJbuX0nCAhjNohddaRoc365Gn
         cWGjO0yfeAIKhCFA0SHGuaJSkfd4lWW0EEEJ8QZxVY/6ry9yZJWinRnt9GZcVXtSS7MF
         x7HQ==
X-Gm-Message-State: AOJu0YyGuaVOX9V1sM95e1GE/CkT3O87NTAx05TOfZYPEN2QLD+PRTpx
	iPyCP9d/7uISRm0ulKlvw/VSgFrkSUgneyBFUD7Z4Q==
X-Google-Smtp-Source: AGHT+IFwDwzm+lRsT8bOFKIAm/GhR+1llhPbmAbOCazbvOSuFiL5J72lfZwBACd3hGJsn9Q29a1UTTr3OVDkXyj/GAc=
X-Received: by 2002:a05:6122:222a:b0:493:5420:f20c with SMTP id
 bb42-20020a056122222a00b004935420f20cmr13749354vkb.10.1696835562966; Mon, 09
 Oct 2023 00:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org> <20231006-descriptors-asoc-mediatek-v1-2-07fe79f337f5@linaro.org>
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-2-07fe79f337f5@linaro.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 9 Oct 2023 09:12:32 +0200
Message-ID: <CAMRc=MeVp63fPXWs=JDL-GYg7iYzL-m=3nkrp6J+nyM_pL2=tg@mail.gmail.com>
Subject: Re: [PATCH 2/8] ASoC: mediatek: mt2701-cs42448: Convert to GPIO descriptors
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andy Shevchenko <andy@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_001244_210293_0934ABD9 
X-CRM114-Status: GOOD (  11.31  )
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

On Fri, Oct 6, 2023 at 3:46=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> The driver is pretty straight-forward to convert to use GPIO
> descriptors, however a separate patch is needed to accept
> the DT GPIO resources ending with "-gpio1" and "-gpio2"
> instead of the standard "-gpio" or "-gpios" name convention.
>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

