Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31443E92FD4
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 03:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9d8YucWYRdks50PJ3AO/4iP8wds+F1vsf/WqvVgXf9A=; b=pc9Ag4vVoh0cwaC7xCbCZAUEdr
	S76G/ajab94lvOODkilkB+yYlfyOOdYdNQ2XIDNmsht+RuVHw4SMtG1DzYPhTQJbSdoqALPfirLXh
	50qh+a+FcDjzaEp30xUF2ttt11v5BGbYsPBxpJs1loL7s7wwrsZYWe8xcuFfzSes+nw2BDpNO/HXO
	fDEY/j1li4MoEMVf9cfepqYSLHqG7gsSlvYZ0l8dv2XL+uHDsusf3jr+4ovLYUjfFCKXJjQ/wwz9e
	3rp4hwbrZjdl9C1xEfauEiCe+FdS98O7O7hw0+iNOvMF6f9+821J05BKSC9Emj9fmDbSPpF7Ob4kG
	SvJoLlww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qobIh-004qHe-00;
	Fri, 06 Oct 2023 03:14:51 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qobIc-004qGK-1J
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Oct 2023 03:14:48 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-50307acd445so2096762e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Oct 2023 20:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696562082; x=1697166882; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9d8YucWYRdks50PJ3AO/4iP8wds+F1vsf/WqvVgXf9A=;
        b=Io3Bf0QnyQbRGMja1Zv7qX1jW91diNQoOfmrBe+fqnZ9rCSqh7uSVP5PEwwLJS+V0V
         Ocpk9lHJ3XgOXenTm0VThZf2WZBvQdEpd1akOQHuevVftL4o147tSn0qzd+l7kRhJdVn
         EAnFMP+VqVyd+J1vFgk3cpCe2vR/aHFnkhmCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696562082; x=1697166882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9d8YucWYRdks50PJ3AO/4iP8wds+F1vsf/WqvVgXf9A=;
        b=h7aK8lnIa6O3A8E6wYKc6haXubithgLko7KeilKsn/Icjlnr9NJL7h+oiZ+B4lvgfH
         izyTUe4gTT6jRy8VC2WI0K3n8nxJLPHEXdj6MjMeMi8vW+kZDDsjgjRcwkxgKbH92wkj
         8HdDpCNQbWA+6qngrYgVWqhPm09X5hRAYsVCGdp+nPLCRvHd6F8VqZoINGf+TpAdFU56
         vojHFuMuRkur/4dmywvIv7W5UaDLfvEZ0588F2FXl5arDgI0p3kZLFEo/nB3rAjivD8f
         UKjZ6MyRRM41KvEmGQX/aKCEIL00MK8VyuHbHGQEnCcwuJT9HK0Sl0vLN5572FZwLt8k
         aVDQ==
X-Gm-Message-State: AOJu0YwwLQmBRm2nGlIG/Xw0QEgpBkrCa2HnLCs60E5RFK3PlEDKB7NI
	N58lYUA/D31xxz3WN7KIF+h50aetbhBMf0lBseHFOQ==
X-Google-Smtp-Source: AGHT+IG6oEIiSjqmR75Y19FZq4C58Sj+ydK0AHtmfB75JNsgXpugv208s8JaBxDrcniI2I80JC+hyLHWlK9z6LIrmQc=
X-Received: by 2002:ac2:4a65:0:b0:500:c2d7:3ab4 with SMTP id
 q5-20020ac24a65000000b00500c2d73ab4mr5754286lfp.8.1696562082174; Thu, 05 Oct
 2023 20:14:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231005151150.355536-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231005151150.355536-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 6 Oct 2023 11:14:31 +0800
Message-ID: <CAGXv+5Ehu6XiFQQhLaaO91N7Xse_ANxLCAwqVAMvy7UST-Q=7Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: Change gpu speedbin nvmem
 cell name
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_201446_478426_8DC49738 
X-CRM114-Status: UNSURE (   8.88  )
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

On Thu, Oct 5, 2023 at 11:12=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MT8186's GPU speedbin value must be interpreted, or the value will not
> be meaningful.
> Use the correct "gpu-speedbin" nvmem cell name for the GPU speedbin to
> allow triggering the cell info fixup handler, hence feeding the right
> speedbin number to the users.
>
> Fixes: 263d2fd02afc ("arm64: dts: mediatek: mt8186: Add GPU speed bin NVM=
EM cells")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

