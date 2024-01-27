Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37419C46CD2
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jan 2024 23:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3j2XrJbAKRPfKEgohba8XBDniun5xPyD9KczMHMqhRw=; b=2Rk7Uv9nDz6k4WR8f9S4wedUCi
	UQvFRYLwbSxB8+kcb6mug2xgrim9oDAQmqjSbNGOIqUNlO05PlsbGIBz2RJ44TRF64NwDlKj28jlI
	6ZHGlI6unDP8VSyc/H/xD9oGO0vhPhQ9Luz3rRYPFch5xJLdqHSWlKTpPjZTLltO1dOySwWhfOSug
	jrol4BzA4O/4LGmhIKfGOxt5ZjvDhgEQL5/ecmf1aiCU3XlU/T0UhcvNoxzYtwQctSRqKOlLgE1WW
	gZxKGZpNCl8thOhqYKQyxqv5oyoK1hrpkdp8EgGggHHdfSCE3TEv+mVt+1i2F4WqtxjSuBsaeuDFe
	aER1IfgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTsUx-00000008Qk4-3kFX;
	Sat, 27 Jan 2024 23:54:07 +0000
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTsUv-00000008QjC-2Bhe
	for linux-mediatek@lists.infradead.org;
	Sat, 27 Jan 2024 23:54:06 +0000
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-dc22597dbfeso1916123276.3
        for <linux-mediatek@lists.infradead.org>; Sat, 27 Jan 2024 15:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706399643; x=1707004443; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3j2XrJbAKRPfKEgohba8XBDniun5xPyD9KczMHMqhRw=;
        b=uUN77L67Z7CzDk1Njt/EKx+QtYE4cC3rLpSxqo51btSfdVh22HzuFSiF81o9pewJeZ
         2pzYqycb0udhgiQBv/4603tG2cuLuPbnD2n3HWr2Mv42LAj/9CfjOVN3ZUsXbbwSEtPO
         2DbrjDbh6WeatGvQY2DhDfygiJtvW6KEQFgOg61fRtYCiDuuV4QSiuESrwRzkqTvX4Lw
         oZ0+aAF2hS+XVmlQ5Ke6xvCdA8CgvnQZ0Dk1bo+YxmFRQNC9r0CDrwNkRdzOTZ0IfERf
         J8MbS7JI373X74EmdvdpPJgpX9xI+DOfbXn3HY6GeX0IQP+QRDgVpxj7muQhScfYsCLe
         7DJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706399643; x=1707004443;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3j2XrJbAKRPfKEgohba8XBDniun5xPyD9KczMHMqhRw=;
        b=jwfW/N+zW1IJGdZdDKEEcVZ/U/razUWNhJamK/A481y99nmalOQ9/Xn3sRLTURGnl+
         wSuKOy3QAdSwHXZ0ugVw3pzhJ6WwbXFoIjLBj4nMslm7jPcQa6qp3T/u+qfbEVu3rJvr
         B64mqfwSyWmkZ29f/d9vTW7B5lUtvzh6r8UoP7fTsnIjPCoeDGycOSzQcM/Iiu3ZsNUm
         HecTcyvA6cS/Wl+OLj3KI252WDCa5F1+8mYo1aayFNSF6S2wAHf3DzPmO7bgAoM+3tKe
         15g/u28IwO7l4L76XRTLCqbAd3pMnge3VNVrW+xLkhHKjPChoOQd/OFQBnSXq+06dk60
         2L8g==
X-Gm-Message-State: AOJu0YyKpCATtc0Fwvy/v3RDvZV7URacoSUMscDNluJTuaOzGKah6YJs
	MO8Q9WWyjGbV8sOP/R5DePoJ/LGE0xcpuWRRG9hMLGbwvVPsBA44j8ssXHSn8QyLcJWSwq3axul
	mBlqFTddyGci/HLU4T+7fAoaLcTMja9A2qMldbA==
X-Google-Smtp-Source: AGHT+IF0zXLfNk4PL6mSHQar9gAq8/O4dVlhQVJQf7PUlFg1dzZ2dcuXAao/29FrSqyCrxTjdNeAJDQy5A5s37XrG6E=
X-Received: by 2002:a81:ec01:0:b0:602:ab27:3752 with SMTP id
 j1-20020a81ec01000000b00602ab273752mr2698550ywm.33.1706399643680; Sat, 27 Jan
 2024 15:54:03 -0800 (PST)
MIME-Version: 1.0
References: <20240117145547.3354242-1-jean.thomas@wifirst.fr>
In-Reply-To: <20240117145547.3354242-1-jean.thomas@wifirst.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 28 Jan 2024 00:53:52 +0100
Message-ID: <CACRpkdbfeL4AG0EJXyh-Bkaji7=b7MLiH6htEecAwq17Yt7w=w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: mediatek: mt7981: add additional emmc groups
To: Jean Thomas <jean.thomas@wifirst.fr>
Cc: sean.wang@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_155405_565124_F4F7E624 
X-CRM114-Status: UNSURE (   9.78  )
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

On Wed, Jan 17, 2024 at 3:56=E2=80=AFPM Jean Thomas <jean.thomas@wifirst.fr=
> wrote:

> Add new emmc groups in the pinctrl driver for the
> MediaTek MT7981 SoC:
> * emmc reset, with pin 15.
> * emmc 4-bit bus-width, with pins 16 to 19, and 24 to 25.
> * emmc 8-bit bus-width, with pins 16 to 25.
>
> The existing emmc_45 group is kept for legacy reasons, even
> if this is the union of emmc_reset and emmc_8 groups.
>
> Signed-off-by: Jean Thomas <jean.thomas@wifirst.fr>
> Reviewed-by: Daniel Golle <daniel@makrotopia.org>

Only resent patch 2/2?

Anyway: patch applied.

Yours,
Linus Walleij

