Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC7BC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 01:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nw7lJeHpRVDFo2y9OeZfhTiqPLPx6ObPD3zTI8pHiMo=; b=Pbt3TuFI6EHc/pjWTMj90jnv22
	MkzTxSPBvrDOY4DI0O3elY9qOBfgx3dv3fsUM40oFwEBxO/yXV5aQjRAE1nAtp6QKaloU5FSN6esJ
	a1YgxlRO8zB5jA6QL1Rf1mVAAzPVPKs+jy3eRXVQ89+TqGlXuKmCrQ+HbPfy8xDzfQ+scSiR6nBux
	aogZZOzsCy5e4JbQHFhaJ/Rk7AJIl9MiRo0KAESL+FGYxwAAiIe7XpHyJH9qNocyl4KiN2q6g2+a+
	5DcWmLx5jyYwVoOTJV6rKzCSy4M157pzDddiH4sz3Cczi+stdcf7tYYzas7m8Cn9pSdQW3dZKU3us
	FOaocLuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww5O-008LTu-JD; Mon, 21 Nov 2022 01:59:02 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oww4x-008LHp-FM
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 01:58:36 +0000
Received: by mail-oo1-xc32.google.com with SMTP id r10-20020a4aa2ca000000b0049dd7ad4128so1602814ool.13
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Nov 2022 17:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nw7lJeHpRVDFo2y9OeZfhTiqPLPx6ObPD3zTI8pHiMo=;
        b=BslRvuvHwq4RffX7b09RlXn1jTkjG3TGMGXA/Vyqku5kVB+AvSsZSpQQpQ44pA20x2
         rpBsAj4NEStFpWGiZHIaz39M8+PYkky8wvkZxNnVIkXfNtSWDYiQWbAHyf6NFTdp0xsP
         CNlb5ycaWaWzmfBaWf2JVAsG7DpnhdaULtnw39l3mWKvPC2h1PkeBh8s07QFpsBUrYMq
         TgmdZ3Znp5HLFu298d6/UGS4Dwk0x4HBYyqUkmT7g1JRhJEAGNznk8Cf1j80PMsyIFs8
         oW+jtkPwt6PBnIIvNk+ILl5gGUUwDHpZfKEiEySXiaY3cxJ7VPy+n1F7QA8m2tqUkgCb
         w+6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nw7lJeHpRVDFo2y9OeZfhTiqPLPx6ObPD3zTI8pHiMo=;
        b=gZSNhgm+j5txiMRxCpHIuoK+yKobLK1sT+nlPzlkLgaWxKeKEwCsuW8A58D+Wcst1n
         DLlKtgKiXdglGFSz169r0XgCufyr9kA9lNlp2hL85zkVgkAJWSKoBjsOor3Y8n+/Z/qC
         XY/AZQ8LqbDgwnvONdETj5nytmWXiPpQcsalWuF2gbYZOOxG65B3WDlOiznZuoQVKpr+
         9/tItFqkj5meTZJqpebakHPUEgPXeIufOpKU+uzar1t/oVS27s1PTEDmygLRa9PylGc1
         WPUYTQ4eR5HU39+hdlck/T94wle8gRspKYBBAln1DdW47vtyelruG/3DlBpuKRRSB+Cn
         mVNw==
X-Gm-Message-State: ANoB5pmgLrkk6r/JRojzQFHAvgCs8rmLwzRqAUIBxgPfsCC1tixHG12h
	6Mrx8RNFNt3Vq7wzmn+pSu9egv2jKeL5cGLf6/gMxg==
X-Google-Smtp-Source: AA0mqf5hC3CJKCmoMVgnBmKcIAMXKJfznqI2sQVGVTw1Ezc/VASK11qwClHjwj9WF5iZe3T6Z8EE7/1wxyO7PEjW+jI=
X-Received: by 2002:a4a:1486:0:b0:49f:542:819 with SMTP id 128-20020a4a1486000000b0049f05420819mr7638371ood.71.1668995913588;
 Sun, 20 Nov 2022 17:58:33 -0800 (PST)
MIME-Version: 1.0
References: <20221117210356.3178578-1-bero@baylibre.com> <20221117210356.3178578-5-bero@baylibre.com>
 <06e916b7-f8f2-6de5-f86e-7b020c052451@linaro.org> <7ha64o9h1d.fsf@baylibre.com>
 <76cae9bf-c81a-684a-c22b-9548dd82c8d4@linaro.org> <CAP2ifjMQAx23xc0p_LZ9Dj79Hx1cyLZ-tx8HrGUbtDR-SmdECw@mail.gmail.com>
In-Reply-To: <CAP2ifjMQAx23xc0p_LZ9Dj79Hx1cyLZ-tx8HrGUbtDR-SmdECw@mail.gmail.com>
From: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Date: Mon, 21 Nov 2022 02:58:22 +0100
Message-ID: <CAP2ifjNeGqrr+LcMBAsVjEm8ciZ=zXxZxq3wppQ3Y37LbmvroQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] dt-bindings: pinctrl: add bindings for Mediatek
 MT8365 SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_175835_542049_6D542192 
X-CRM114-Status: UNSURE (   5.16  )
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

On Sun, Nov 20, 2022 at 3:38 PM Bernhard Rosenkr=C3=A4nzer <bero@baylibre.c=
om> wrote:
> I can prepare a "remove pins-are-numbered" patchset

... and I did.
https://lore.kernel.org/linux-devicetree/20221121015451.2471196-1-bero@bayl=
ibre.com/

Best regards
bero

