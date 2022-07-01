Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 524D3C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 10:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvJVjczKtDiPL6abszYdMKTMozraAWQUFyZEkrc/JT8=; b=OeSWHu8cf7f/sz7qG6iOjI8U8U
	EmQtHpbnkmwhjvnnNqyrpLM2o7l99roBLAjGdJqSSG2TFFrl303XkpSIh0Tcgys7BlgOgj6aXbH2Q
	EXG2HMnXtQHrXV7/ebnlrBzvx89m7hzb+N4HMl7O3NKZRShus703sxmfVskV92cTCoH6q24mOueqE
	KL/5ZenrwZU8inyG2jXuYKeWm33S3wr+6SLxTAm0s1707lESfHgeFv4x78VtT1veTtgCfbvhWjuTQ
	1nROPWCgmd+qRX1+00QbVER+x6gUpUMjMGCPAN7+5abEnrTgWJ2i+P3SQutLnHGqWvak0XXfotMCA
	eUuudOjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7E3T-0047Lh-JD; Fri, 01 Jul 2022 10:39:19 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7E3I-0047HY-U6
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 10:39:10 +0000
Received: by mail-yb1-xb32.google.com with SMTP id r3so3314011ybr.6
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 03:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=FvJVjczKtDiPL6abszYdMKTMozraAWQUFyZEkrc/JT8=;
        b=dh+SVF87cEY5zYSqbnal08C6dKRjPJnNOKlb1mMKAZP8LVYhRu+8Q0N2o1moi8IzN5
         NEw2E9+JqjSGn5PanmLxNkgDwgOmzxpgSWUzwrVIMggQ0IQnv43D0jH4lpSHkVw4xmin
         z1CL49mZMPMA/BEGxuLz/WvbHIAwgpBBXJYDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=FvJVjczKtDiPL6abszYdMKTMozraAWQUFyZEkrc/JT8=;
        b=n6QqPK/RtM76FBk97KYw6z6UILued7GpyffupvX26+/R5HT8ZOuunm8GABD2m55D6P
         eCBbG3hzv91XB1f8vYqcmG9r3Sgk4PCZOFaHQXXJjw0oZFa/t2HGVS4Pa9AryKy8dpzu
         8Dsv5zzsbHiY37fT2vgB4xqluitJQLqwGiG1K22U86jQUNIls/OXR/jTgSke8SMIqPBj
         GvSLzaDqOGautypx5zAdrrjKxerG2WR6LB0mjZD20jRG1iHI/nZwd7l7jSvoQaI0foMV
         g3PgUQVlblj6WRvtemmXwNsmNTaKnGYzOT9cT4/Fr+4qQqt1fOX+Zkh8dRl2mX3zQVp+
         A3Sw==
X-Gm-Message-State: AJIora8/GvkTG6qkUEBOZ2OHbV5CnFja2t/Kx6c1ke5tpg1ZjibTOMFn
	oDVKRM6eV/VmphXqY0h6/Srl6AwqWScNCy1N+7RN2w==
X-Google-Smtp-Source: AGRyM1srrLz3JQ87+W13agmcb1kXXtofB5K+QT9XZkN6dy2Rpvl7sdgAuv0zOBNAjH/1QNRT/nW2/BLw5XDm0zzHvs0=
X-Received: by 2002:a25:6644:0:b0:66d:c0b8:81ab with SMTP id
 z4-20020a256644000000b0066dc0b881abmr6710851ybm.85.1656671944937; Fri, 01 Jul
 2022 03:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220629155956.1138955-1-nfraprado@collabora.com> <20220629155956.1138955-18-nfraprado@collabora.com>
In-Reply-To: <20220629155956.1138955-18-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 1 Jul 2022 18:38:53 +0800
Message-ID: <CAGXv+5FdiJQV68JaBPYnV9Gd1GhUF=6gvZ7ZfkK6ZuyRzVsGkQ@mail.gmail.com>
Subject: Re: [PATCH v4 17/19] arm64: dts: mediatek: asurada: Enable MMC
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_033908_994418_918D5960 
X-CRM114-Status: UNSURE (   8.84  )
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

On Thu, Jun 30, 2022 at 12:00 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Enable both MMC controllers present on Asurada. MMC0 is for
> non-removable internal memory, while MMC1 is an SD card slot. MMC1 isn't
> used on all machines, but in those cases the CD interrupt is never
> triggered and thus it is basically as if it was disabled.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

