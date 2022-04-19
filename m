Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E889C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 21:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QXk3dueYIIPGVWMVLBoQMMULVmnkEywqsZkS+jd/sKQ=; b=GDPDBggNz+pBY5
	rby/4iI4WkFK3F83YK2vq6+YYh7+bNf8xjHGZFkp27XQ+IbvMabg8wZ0yA1UfpHMJlnWExLVIvhsv
	NU6tG9GmseWHnlDicOmW5hW5ZmXngna5650ES9vkaQ7n4MHLPpBSER4TeSt8vXat8+wH+MmaC8j2/
	4iyKvGo4bM60VSImcVWjz/MWXodawTrWSXbamKqkoDpUq6KR8iOjRrjmp+eNRv8cNleiEflh56IfV
	WQn+DIUdpMtNLwJr0ogWVH/TXZxT1aojLnqdqDp8X5+N+QlacYr0HCDv5SQu+hG0gmy0nf0z96Pzb
	umWxeWL5I4QE8WbTIbgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngvAV-006NGk-RS; Tue, 19 Apr 2022 21:13:51 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngvAS-006NEw-E0
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 21:13:49 +0000
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-2ec04a2ebadso186445207b3.12
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 14:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9ca63RDZP2/Fhfduz6S7nMbWQq2gHUTg7QQlbnT0kCs=;
 b=KauUyG3BMITTVwlUM0DdJiCAHqmwzHq8NOc3VoUwvavZzikh9PsyOG0ombzvtAmEBt
 RuRiPkPVmUGPu34MXTDAECFDJQ9K2FCq/8lPnIlfKgkNVn+0VHebX92OZ9bVnNCbVcXV
 LU0snQSURVFYH4FzoYga4oVdza1mWDsel3HUVwBXDJDeyLDljFxGcQ/W6mSdg+UJK9GV
 dclnu2838nfpFl9tUQsV24o8rzqSCK+NijneKWFd7AH+l+7YV0ksJPUiNVECWVPDpm8h
 8RytxIx0awNYwFikfXS/0tllZLVgJEfXxR8V+ocUfntmQcop4zVefLaOEsCSKUTfsUvA
 Druw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9ca63RDZP2/Fhfduz6S7nMbWQq2gHUTg7QQlbnT0kCs=;
 b=De5sI2a030oO7AWuQJqSAB54du/I8BC0pSMVrP2n+iYGzX5Unohv4TMQxX1IsCR0Vs
 gjmYByYKrOdb/sMlOWX7EihZ/dSBfOjZBln9G8uTF49UiZcbMkrMhuRHlFjBGn7Xq7Zr
 0owiOL4nC2QVsgH/sMD8Rgw3bISsVP5/IHE4vf3nVLqPvog0RicUmROLs5qYd+FZP7lX
 i78B/PyNwrJyGtUFTd3F7vt9IgshryyBynV47KLTvZWbuGlLjhQyYTusmu+1uT9zeL0m
 F5xE+VU2KZOaV+fbSmubrnNIzbVe6MlGKqCdLU5nU4JDimfTiOnluZza9XuXv7EEulMY
 JadQ==
X-Gm-Message-State: AOAM530IPdko8Iz4OwjKhJkxUXE2hJBF9kjh6B7ARDvhgRTZnVKhlr4w
 IAjL7I2tmJtiP9lUBIbLNLKoaEIZYRZy2dbdntooqQ==
X-Google-Smtp-Source: ABdhPJyt0MqLnf+DatszokGGQDXTSIysqg2Jql7hWnFyrC9meOK1weMLsDJUvUiJx71pdYgXI9ufHDksHv7z6RPmiYk=
X-Received: by 2002:a81:6d14:0:b0:2eb:fbdf:639 with SMTP id
 i20-20020a816d14000000b002ebfbdf0639mr17895570ywc.126.1650402824448; Tue, 19
 Apr 2022 14:13:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220315211936.442708-1-nfraprado@collabora.com>
 <20220315211936.442708-3-nfraprado@collabora.com>
In-Reply-To: <20220315211936.442708-3-nfraprado@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Apr 2022 23:13:33 +0200
Message-ID: <CACRpkdZErg0v5_CcfUMsVaF+Df-cEGZa-+N+kW5bfCfHD+3gQw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: pinctrl: mt8192: Add
 mediatek,drive-strength-adv property
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, kernel@collabora.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_141348_509306_5E3EEA98 
X-CRM114-Status: UNSURE (   8.58  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXIgMTUsIDIwMjIgYXQgMTA6MjAgUE0gTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8K
PG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPiB3cm90ZToKCj4gQWRkIHRoZSBtZWRpYXRlayxkcml2
ZS1zdHJlbmd0aC1hZHYgcHJvcGVydHkgdG8gdGhlIHBpbmN0cmwtbXQ4MTkyCj4gZHQtYmluZGlu
ZyB0byBhbGxvdyBmdXJ0aGVyIGRyaXZlIGN1cnJlbnQgYWRqdXN0bWVudHMgZm9yIEkyQyBub2Rl
cyBvbgo+IE1UODE5Mi4gSXQgaXMgdGhlIHNhbWUgYXMgaW4gbXQ4MTgzLXBpbmN0cmwuCj4KPiBT
aWduZWQtb2ZmLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9y
YS5jb20+CgpQYXRjaCBhcHBsaWVkIQoKWW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
