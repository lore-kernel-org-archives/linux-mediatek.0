Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F4ACA0FE1
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Aug 2025 06:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaAUnNBQO1VRtLjO1YXIZilaY2y7K5KoxfwlKFSif3M=; b=CCBuRh31JdIsg6P3QbP1oGeDnG
	QT9o8znk6twh4z5vJzutXhKAhcP6aczn2Iu59bb1trR31b04rcgn7Wz9N3pvkIKXlSM9HRSk7204e
	oGsE6zBp1LsU5AwLo2E5YEqASqvtrTr5jE8vMFzleivAiHlgeyjq/8FQREdQ6wLlD+plI9dY5Dblk
	PvgD3Yxy3876LtKC1AzlaO2ynbPSM31fcTVytB1wUY8tUFOi5MzP30IqY0lmtyNobUDu6vaNhrD8R
	cd3nhwWkBcHybtGAVUOJ/JsvnOyqoZGwyYokdGKXmdE4RgTfyOunzlicRT/AE4FnFO0qUEdyPMD3W
	6gyTuH1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphls-00000003yvH-1OW7;
	Sat, 23 Aug 2025 06:30:36 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRWY-00000002aOK-0QGx
	for linux-mediatek@lists.infradead.org;
	Fri, 22 Aug 2025 13:09:43 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-3354b208871so14459371fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Aug 2025 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755868180; x=1756472980; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aaAUnNBQO1VRtLjO1YXIZilaY2y7K5KoxfwlKFSif3M=;
        b=FTX1sDxlbSu7txN/cTw4s/lTW0gowNcrmY/5C+tajJLXgQBOvUuRvOySJZyhNyL8Js
         xtNzO+84H+Jp0AKjBaydAnTVb7ZHJB5ozWIWTJ2gv6iGlcSWeeVOpyYxWJ+nfwMBl8t/
         dhLdPTdA9h/1HVUKE2Ipkh6VL52WPkkCc4KqI0wYS+xRF7Ef47kixr++5XlRZVyQm3UI
         Dnzfx5gdJYrttjiNyOJulpA33W3feslDfl1m+xHkKeZFrnajHjOLqp0wjnenWT/qomBF
         BsFIDj9tKCvgqpd6oHsj9P6H07yp+oSrvLgHYRRO/lwMpdzU2n9QC41UEqlYj4xn5RQY
         G0QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755868180; x=1756472980;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aaAUnNBQO1VRtLjO1YXIZilaY2y7K5KoxfwlKFSif3M=;
        b=nIakOhMlsCVMnvWpda3hrzYxlyWuR9BvdEY75hj0f5oVrFese94E+Cd5fGWJvvqpkm
         x5cB7duh4+ktHJ5odUiEscpBCBvWdpm/TQsV0AS9rotgnMIag8pxR+1Peu4AMv9lDnKC
         FK1VNsmEQzpMnAlWpx75HjI0sydz4N8n5Po3L5kj+cs1HpS2XIAwUfL2/J98rITOzc9M
         EKeqlwc+3mI+1srr5vCtqF2f/IaC2juHPHV5bU2avE6qesAlyjWpHdfpQaJ4WwdnCOui
         BbOGd/3sog+wKd2OHWTubZZ048nXaqyDLI66/SVGbSA9dNfBZ6LMbpvkrDH9ua2XO0BA
         bT9A==
X-Forwarded-Encrypted: i=1; AJvYcCXjUAYgtOFIZTTp9cyrOqm96Z9K5zBuIIBIJL3WYB7LqR6YV5bWq5ZSSaW17nHkU67RQVcX7UJ+i9HBRa5jPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfJCjgyosLjymTd73CtyBcNXQqcrdPkAb2IFi6v1U/5jYYhBeP
	H5+ArKnDJasmNhzqMDhog5DuVmUvgzVKN4fFWKqyqHmDFwfVbZOTy2jnnURwtbuVmSakFJFa7XB
	VG+HU5tkeklCDpxhfi+GLHSohgxW3o3lX6wFmX/Mhrw==
X-Gm-Gg: ASbGncsC1ndQA8bSS5rnYZeYh1d1qTTxO5QjbTY5TI5LXR4Gqv9pJ8+u/HK7zPXcLXB
	1GZNlFQEIB95Kp1cl7oIiuTH/FOnPlV4wYGSdSDqZlB9pYjbdhB/28Eu0H26+4UPTQK2m6wFW2b
	mwPc27EXWCFGzUaY4crGW+wBBU88h81ylMD5m8tBoZbCIwo+gnHBuPTMI2fRxML2C8cQFSf+TRu
	ahdvKA=
X-Google-Smtp-Source: AGHT+IE38aK14JH5doGJwJ/L1zggU/pkge8LUJowEiyqKCoskKkhAj74fv5SRzqMHcI7hWw+wLFl8EdWHeb5F4Wq9Gk=
X-Received: by 2002:a2e:8a86:0:b0:32b:6cd3:3938 with SMTP id
 38308e7fff4ca-33650e433f0mr7211421fa.13.1755868180212; Fri, 22 Aug 2025
 06:09:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250822-airoha-pinconf-err-val-fix-v1-1-87b4f264ced2@kernel.org>
In-Reply-To: <20250822-airoha-pinconf-err-val-fix-v1-1-87b4f264ced2@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 22 Aug 2025 15:09:28 +0200
X-Gm-Features: Ac12FXyilBE2jL31VnOTILlWWCkKRSKs1Im0EeZ6mew8D2IIMZNOLHho3Nv17MQ
Message-ID: <CACRpkda4m8awDHOwo9fRj3dxCrGp9=pDYmV5N0qTw39a6-qQ_A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: airoha: Fix return value in pinconf callbacks
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_060942_154937_F6BC076B 
X-CRM114-Status: UNSURE (   9.61  )
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

On Fri, Aug 22, 2025 at 2:14=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:

> Pinctrl stack requires ENOTSUPP error code if the parameter is not
> supported by the pinctrl driver. Fix the returned error code in pinconf
> callbacks if the operation is not supported.
>
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Patch applied for fixes.

Yours,
Linus Walleij

