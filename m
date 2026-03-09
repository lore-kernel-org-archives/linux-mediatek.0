Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAEBEA855A
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2026 05:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUExVCyNdG5YpObz2nxsxQo/pWFxavqjeF1Iya74LKQ=; b=Ro6yPKTCkVjeF/6miKerXJlq/Z
	eb1wME8ZnTFeeoByzoPQpaSM4Hvq9sLgQ9tCXi8KRyV3f0KRaazaySZbKX6vDTKxweFsB7TbANubV
	Sn/2Y9EJcZHpCTP0uyt4zqiSVpPkfbOMwkjLHWxTyMHB/GRQRyX9Ifi+bMPTcxTFnBUxmajF/+fx4
	1dN24O8YKqXuZhPeLlYLBDqbX2WUos1gwyKiLm9x6vTGz9rs/0WLTD7NDeotMaWDlqm7FwHWrPNAW
	az8x1QK29JVxytBHIjp7Lr1leQMNugjrRTcrbQz3Ar6Aht/M9srXUIANw/Aemg+CrgMkbS3DYCqcG
	/krLce/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzT7Y-00000006gVI-0SrG;
	Mon, 09 Mar 2026 05:25:42 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzT7S-00000006gUB-0kIC
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Mar 2026 05:25:34 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5a13e1cfa45so2475339e87.2
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Mar 2026 22:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773033928; cv=none;
        d=google.com; s=arc-20240605;
        b=aorC/o0cc2qh1vJxmobPtnJSOL5vrJiRsSLJDRnKGkqnr+S7olew+h+IqkVyFRcDu3
         qXKPukjxL9QXDegVW+Wn0qfqUqfP2sC73+5xRoC4eEE0ItOVpMG/u6aBrYL1rtxWs6Pc
         M9kRx/Wr2AqGPJoMDGwrgoU7SdK4A4h6h9IHRCAAUZpwpyozjUOkzISNTpRNEIqcF5fV
         UY3+mHOO21qmOkq3UfYZxBxLuE7Ld1wMiGC70jHi2zNWaQCYrJk6lwGBwLhXg0fUbmkC
         1/kzKmNljC2HjfMx3iWmxEkGl081D8DWKd+TarH16BQiQJpYADz9E0K63jFuqVo9lRR3
         ihOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DUExVCyNdG5YpObz2nxsxQo/pWFxavqjeF1Iya74LKQ=;
        fh=lP7veAnWDCfa7lzJbuc55JIKj3V7KBSXafId3jlI6fY=;
        b=j/S+UxMv94GUhFX36cl2/lETL4UfxB0aPrS3uBxWR6T2kQMwbggP0F7V+Fa2FS4IWX
         f79F1Ffhrw7KqJyYuy8K6WIrlnydfPNAIr3iEHTJXdsEj+QPJjgc1bDH0gL3PfwhYe5F
         H+peasKPDvcDMj5BIVbgwDBIMJ/K5HoByPGLcf12N1Q/zBU8HA3yncwD9g5Q0x/Qb0gA
         IyGKUjUeWrj8lqA8X6rl3TnaEmF8RR8bgfE9NrAz/epKzTGtMc7FDrbytH1RGF/oS2tn
         sdVlZv2dlil7E8epRE3/ZE5GeSRHSIKipnp4YR7vdaN3wcKn7jtwDlkoyKUnUhb2XE5G
         8aYw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773033928; x=1773638728; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUExVCyNdG5YpObz2nxsxQo/pWFxavqjeF1Iya74LKQ=;
        b=XAE8oOP1LGUmEqTPdHOZmVIijoCkUNkxoy5TlTSI6q1JDELDg2IQ4bvTDETs8del7x
         zfLtXG86aEnKVxj6xB8I4geBKEdMiFTfSU9348mH9J3KeeJgTb7dVJLA9JkSeBV67pTo
         SfOqnz7RTpJJIc4KeaJN0ykY+OzDkkmu8a3uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773033928; x=1773638728;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUExVCyNdG5YpObz2nxsxQo/pWFxavqjeF1Iya74LKQ=;
        b=C+Gl5HaBhYA8emCOCvIbZbQqUp0o0VOzM6LtRH1N7KfIYSrEThShpyweVSZiAFI/Hp
         qr+O8+SYJYoCfR1EB4FvQ192/6+DdXLSihdwCpALigS22umNdvn50OA8WaU/dksd6f1W
         PxdiPn4VrAEexceoDLfhx11xT1lyqydzGe0oBi658SXhPnbX0vMfwIbIA+WkI6cWy/11
         KMdmH75kn8OFbbuqe48Z2+iG8WJMDFWrtdI/ZRTzaCe7QUwvNMTDnJqMi+CpW/JEbTF4
         sc/sOPN+lfifXP2HHlt6tvfBb/Ov1JUbDkPgVeYlMpuVacwMrSo7C0pQoJjv24r+TQrH
         tRBg==
X-Forwarded-Encrypted: i=1; AJvYcCVybSMf7BWhinnfL37LqzZUyUmB5kBv7k24j5y/eGu319oVAVdtt9jgGltXoVqfj5men8fzl1Ok7kypIcA2aQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfwh9BEda6AsiPNnfFsTTNs/Qv4HiyXV3ACHgnozb0apBUrqSF
	4Wb2QTddaUqCDkSyey4cWlEgc+jRMooKB4GCJ3YAw1qQpp1DQ7jDzwWVfkk1S76EwEhaGB6po4a
	S6PAqjxvKAZhrPBtYKUTitZIRPn2/Y23iw3AYp5YhTl4b8CFntIU=
X-Gm-Gg: ATEYQzzP6xjc35DIwIRqlyHrqxHv7CTKO+m6LyPeAvWJ4jkLbxAp78x/9tLcjrmAX9a
	jTLfzy3psvhUNtI7tBtO0i4w1GWdSkLNq3h4DAqnkgjfO3HwaBDU+394jLCy2n8znBZjKZK3SC+
	7SD6hhkyE3MI9asZnC3ph4QFNjIEUSqRQXJQU/J44EOCMZ+3eN4adAp7lyFwDjQ+sY+HlBvRK2Y
	ErVHlSWZlqGXiRvTvv4G4/qQhxcryg+2i2c2Ozn0W0gOqxAvhWrozacaGk92r96FkDsFej41ZIc
	XSBp4df5erjaNxPMhfVthJPBDti7iiWLA/s1RTsXd2hKYAm0
X-Received: by 2002:a05:6512:1554:10b0:5a1:3f54:b3db with SMTP id
 2adb3069b0e04-5a13f54b53bmr1623132e87.8.1773033928040; Sun, 08 Mar 2026
 22:25:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260304181024.738391-1-akkun11.open@gmail.com> <20260304181024.738391-2-akkun11.open@gmail.com>
In-Reply-To: <20260304181024.738391-2-akkun11.open@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Mar 2026 13:25:17 +0800
X-Gm-Features: AaiRm50OIiHuDB6An0GfjyAzF0gVfkfGW4EfH-a3Pnq4RMgefi_HoUtnuYAX_9Q
Message-ID: <CAGXv+5HnCqNsQxnW0oKV52A9xYVQg-ur018S3=TzhVR2Jhfqzw@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: mediatek: clk-mtk: Add cpumux support to common
 probe/remove helpers
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_222530_900528_3454EA30 
X-CRM114-Status: UNSURE (   7.65  )
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

On Thu, Mar 5, 2026 at 2:11=E2=80=AFAM Akari Tsuyukusa <akkun11.open@gmail.=
com> wrote:
>
> Extend __mtk_clk_simple_probe() and __mtk_clk_simple_remove() to support
> cpumux clocks. This reduces boilerplate code in drivers for SoCs that
> require cpumux registration, such as mt6795-infracfg.
>
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

