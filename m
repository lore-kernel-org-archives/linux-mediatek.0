Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FAFBC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 07:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D8gS7kvSgEbeb/o/ciN4V33EoJopkFuravPZVQiFumw=; b=Xy4sGt8aWH21yo
	+K6Re81cSdGfeHeIvHNkXJDjG/FnkpiE4RyBYfOrX2Cm/Kx7oqpALv26vYVAJEQOqWeOJn3TSVHPy
	y9zaafV6/GqpEaP01fYKzqp7xEvuQLEVEha9I/wF2jEquWxs8aqa/PQnDW3cbp/Ey/MZQoUf5WGan
	oPyJ+3VYgUOQ9VNXgni7msoTiDBkipfa8qiJZIWt0DBEsukSeQMRPZIeiTcWWwnSnsFAauT1cJC5w
	7xcxCT5OH+AkhRWlSeU+kzN+JGRm8FB+4zFsH0JkGW7l7ZW32cMswNeRQgkr7Z7JY84sCosJ1qmNw
	nH8+oEOeNkrMcsRq/OmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4ecp-00AZ8G-Fp; Tue, 04 Jan 2022 07:52:55 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4ece-00AZ51-1K
 for linux-mediatek@lists.infradead.org; Tue, 04 Jan 2022 07:52:46 +0000
Received: by mail-lf1-x12a.google.com with SMTP id x6so27110209lfa.5
 for <linux-mediatek@lists.infradead.org>; Mon, 03 Jan 2022 23:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O+ZiY6IkcBRjtAxU1nAyJ1fPfCkxiGNTSP08edC/EcQ=;
 b=BNvys0x2/vXxzmavJQNBxAzMHyClqYXQeAkuW2nJDxevmDjxG5lN8RRDgnKOxV39Jo
 y+2PNlqnHQzUS8oErZ6UoWWwIqtNaqN7Ofon1U+nFKIby4A4RRdK+bJmZ51dFiKSL31b
 xpu5QwFJ7s6KFUV7awhqMxZGtGQNWVX66A03c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O+ZiY6IkcBRjtAxU1nAyJ1fPfCkxiGNTSP08edC/EcQ=;
 b=CRz2YVzbQYP7EJ3YzQ1YoYkrEoY0FMQv2CFiT6ETSzMNYXghK3eRTmptPpbgktIVu0
 FIiauD7Hk1k+yhVBJaLaMSBzhZ9Eaay/jTLKaN1S/APQlT0bWSjb6mDGirywdry/Ak2I
 w0NgUa5mKMk6moCMARs5HD2ylaqSAabX0SsokXhzhiSar06TCZdkUvM8cr76lexJYYnW
 QZucVvn1IRSmgHHHy5cfX8RuVekExB4DyZz3YE+MZgxi5UbTfb5mNFgoFAug/TDYDaQ0
 bQ91VBKW73awy3avmmBqTUoqHd9zkvCCDbGmtnG7i8UYJbr0f6dWoiL631VRzTBgHQlF
 JgdQ==
X-Gm-Message-State: AOAM532Kj7xRPggOEOmbo+IPtrLe74dshNS74IOZX4Mq9ZdT3zSe9gbK
 1AFLtTihVH4RUIR8wXf4Bw/wMKA67kbTbpMJgXsfOA==
X-Google-Smtp-Source: ABdhPJwvhKWuzdV52kSDSeheXXWRNnZjCsdHKDUDU7mBKaCvcXcXmZ3ie06zTYAu2zIfqnXzLeAAfRbz+zv8z4Ac7Pk=
X-Received: by 2002:a05:6512:1320:: with SMTP id
 x32mr43433548lfu.597.1641282762440; 
 Mon, 03 Jan 2022 23:52:42 -0800 (PST)
MIME-Version: 1.0
References: <20220103101855.17350-1-angelogioacchino.delregno@collabora.com>
 <20220103101855.17350-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220103101855.17350-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 4 Jan 2022 15:52:31 +0800
Message-ID: <CAGXv+5EEU4Kg4pgGBsAgN4TFBc8X-Euar9aMzM_0it3chGasKQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] pinctrl: mediatek: pinctrl-mtk-common: Simplify with
 dev_err_probe()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_235244_117389_5726A290 
X-CRM114-Status: UNSURE (   7.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Jan 3, 2022 at 6:19 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Use the dev_err_probe() helper to simplify error handling during probe.

You should mention the additional comment you added, and the error message
you fixed up.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
