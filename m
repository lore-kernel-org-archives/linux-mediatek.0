Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCD4D2503F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 07:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ncCD7QdAbWZuTJ4VUM/GB5ZidYXAtNWFxqM/DILNihw=; b=Q9BTNtqFIR3pfc4Jz33UMTpCVg
	NGqSDbx0j2/4Bqx8MU8nMurd/OHSozk6m/dkzSbuuusFKCq6QxtCvdJfNwBnmAXl1FPUIP6hUCLCQ
	3zWYDsAW2ALO+/2xpQUmaUZhNjM1ysKxq76IdxJ8EP7v7PfjsCSItjPxoTmv64U12Hg07cmzXXyGn
	2phZ/W/QeXLOTa2uE8fDNUV4p899c92xWLh6UDes+qb+wHJsMLqDYr0Ra/oZTO8D1tJCSwy8z54U7
	eRF59hxFHGrT7QKCK1caE4vhLb0GITg5awhvzUjfb5wWSadWOB8OyXefQQx8YkCl0rQzP/+V5Afwa
	dmyABPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCKS-00000004sMd-35du;
	Mon, 12 Jan 2026 07:27:08 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCKP-00000004sKy-1s9Z
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 07:27:07 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-38305f05717so36541311fa.1
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Jan 2026 23:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768202823; x=1768807623; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncCD7QdAbWZuTJ4VUM/GB5ZidYXAtNWFxqM/DILNihw=;
        b=k/f4oxlWTEQm8vDRt4JWBHua7+pNaRcfCPJHCovP0/oydcZ3RbqJAAmvIuCGbVLqKN
         sb3bxP9USTu/ktDwMvEd0uoAoLslD5xMR9VkzBf1OXY4GKkwnD3JEgy6iWriNkALNzFN
         AWH56JUieHlaxIiplvN2HnDlBLn6z3scAIq2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202823; x=1768807623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ncCD7QdAbWZuTJ4VUM/GB5ZidYXAtNWFxqM/DILNihw=;
        b=mhraXPksqy4iIjmbcu6cHdFhWD3WUZltvtuHuwj1Q4Nm98kZ3H73tL9o67ApURU6+Y
         1TL/3nG+jyTPjQp4OKWM5ujCqpY5lCSj6rMHOhdR3k5+auQUGGaUWuzprOydAaeuPs6o
         1HhfxUOqk2LZjepF0+usoDo5Hl1iQiHK4C4Ha5/5PjtZ4SB2ozJl3zaeBIsEn7CfDP3E
         Ld8K9ZdQlqQbUpy8Z04ZtoaR0Sgtz3soDNnEjo/lY8sc62kaBjAKRilxlp/wOsj1q57V
         U5I3uqYyo7gCb/Hzd4PqlkuBsyReqaQQu1/7O0E4Pyu9qq3jV2XCjcmXZ5n/mYbYx63P
         NoHQ==
X-Gm-Message-State: AOJu0YwlSBDZiqvm/wtVfrZYhcbJ5zcBOVj/+k8N3W4RJeyN0MlOjWu4
	RUsQCOXgdp0TnrIPJ0FzRDbIUBYjLzOKF119BZ57ASK5/LcKfIJSCvnaMtzttzfnvsXaUFUpdqx
	usTpu/FYuJ7KfXwHDtDLW6POMz+vBsE1tR7+VmgEB
X-Gm-Gg: AY/fxX6K36ZscWPEXd6DCln48sRGwHFqw2Gs8PDx9e4IYD97QDfRxW0xEcDCzg4kvB8
	d9S3/RUETaH4oEbVjqN8xXns0Mh1fLRSKIzsgvTCSGzeUTosKWFrSvIPS4pzISuoxzKwIkMd2/b
	BWtF/TjvkZ+6jJF7Nm6k0ydb0GCZ4znPjCDQ7Cr2WiZTA6RTfH6/yiuZ2OJNkvJyAmBhHFeUiA6
	cO+12aRlwmg3IXra0Yr2ft1fxiZgILINIqRslVSIK4qEYxbehcLvsvZfpK9aMI8Q1lgDKb1muJx
	ZHL71kALbiS6QSd+bUzr7QQU
X-Google-Smtp-Source: AGHT+IEtdTzShXz4wPeF5M02jtiMqXCbiAjaUDFF6b38x8rVY+o1KK8e4krh8D/G4oVEUwnaUdpjoMM+H1TVs+8ZT5U=
X-Received: by 2002:a05:651c:18c6:b0:383:16e7:9c3 with SMTP id
 38308e7fff4ca-38316e70cc8mr33492741fa.3.1768202823275; Sun, 11 Jan 2026
 23:27:03 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:26:52 +0800
X-Gm-Features: AZwV_QhjiYvS3V8-WWKF8DW2GE2PKz9EYPOgwGThAo9U-y6HyA7IDDJVCRyVGDI
Message-ID: <CAGXv+5HmYUcwmXU2DyCEtYgsaJtVaLQQatzU9sUfiPNA0dQczQ@mail.gmail.com>
Subject: Re: [PATCH 05/11] arm64: dts: mediatek: mt8183-jacuzzi-pico6: Fix
 typo in pinmux node
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_232705_492078_3A2E1E25 
X-CRM114-Status: UNSURE (   7.21  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Rename "piins-bt-wakeup" to "pins-bt-wakeup" to fix a dtbs_check
> warning happening due to this typo.
>
> Fixes: 055ef10ccdd4 ("arm64: dts: mt8183: Add jacuzzi pico/pico6 board")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

