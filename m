Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3939EB64DD
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 06:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=14zvxAU7eiVc9OsMFSTax2qAuXB3wquFjwuS7Lf6Tlw=; b=2F3bGMYMpHMoXVRu87HXIV1Oqc
	VLK3D2huQSneWuU+ofElaCc3uo4MyZVDj+VlO3AxsNFNNn9ZbpOJVbsuficQgHxXsG+sIKU/Hk8eT
	salUEZqNw9+n//W/wAClep6tWdW59mB1auvjuABiaWBpyptC7Sa1lOOs4vYmSVYTHIsf3FnZBNy9n
	zIbH50kFyPPvjuAitt+94CCYyyNYpInIu9jlhqe6bn0n7LZ74vSXi+jWcZhHrj+jPzw/BEMXw4fev
	HkdSVE4esGoevj9znEzUYLu59Yr09NWbaOHNGbyfG9A2Trr9awm3oEU56AJ7SI264kFfseAzjwFoH
	QSAwHBNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ6pn-00DsKx-0w;
	Tue, 11 Jul 2023 06:26:51 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ6pl-00DsJv-0M
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Jul 2023 06:26:50 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-440b54708f2so1937754137.0
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jul 2023 23:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689056807; x=1691648807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14zvxAU7eiVc9OsMFSTax2qAuXB3wquFjwuS7Lf6Tlw=;
        b=gEslKzmGi76sa3HPix8sv8lFIKh/IchSUQMngoaBtGjwNKvRZZp7VmMQTbc6e03YKU
         +ms0jiXPFnyWAn93cwscaBrQJBEE5YyK7Had0AR5R7C7z4NNJnA1RAOtVTenOX0jiEmz
         kw4RrrPaVEyn8FpKME8aRqtX/eaGQyUwYV4uE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689056807; x=1691648807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=14zvxAU7eiVc9OsMFSTax2qAuXB3wquFjwuS7Lf6Tlw=;
        b=S2miiwddme/mYynZ2W3xWnSnUikFu9VgKUvfUX7xhtkYjc0a2rHpdKPVqV9kwqmoSH
         JAQkC/xPffzhmYzk0UI4u3yP1r2Kxpm/jalB92Kt/4fXWBqVOB6EgW8LMG2zQmbP+YUb
         yxBl9bVOFw1VL7V7Vl9WUMHEvZgZ9w7IenYBTNZHy7rYqFPJyhyARVFQCAvIHFVtxkna
         a22+g1j3cL69GdMmFgyxMVirG87fwxUYRRuiZyWOovRaXm7TJCmhfha5o4rE9IHoAd13
         CY2ayXGoCiAA4W9Ly7sIKjkpq+DKXUDHCCNDJ7PcijypdCZrqwHqotkSpsBDaadUpYEH
         ErcA==
X-Gm-Message-State: ABy/qLZ5hSuVvM/Ownq+GAy05SV/PNuGf6TqTgfjylGhKM66W+ahKpEr
	GTDDcdRZnuYG3OYglwnuSlwWTyKlRvvIaYUZF4bncA==
X-Google-Smtp-Source: APBJJlHMaEnbxmt4E425Igz5HGD3wCNh0BoMyvBAaMvai+Tv83dzAu4AeO63cdOGIykZU4jOxYPixceOqCzy6e8qkLQ=
X-Received: by 2002:a67:f851:0:b0:443:66c5:a4e3 with SMTP id
 b17-20020a67f851000000b0044366c5a4e3mr7465305vsp.15.1689056806767; Mon, 10
 Jul 2023 23:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
In-Reply-To: <3c699e00-2883-40d9-92c3-0da1dc38fdd4@moroto.mountain>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 11 Jul 2023 14:26:35 +0800
Message-ID: <CAGXv+5FcBapQSOQUU6c00Jirx+Zn9KADP2cEj9WZSs_ABiCm9g@mail.gmail.com>
Subject: Re: [PATCH] phy: phy-mtk-dp: Fix an error code in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Bo-Chen Chen <rex-bc.chen@mediatek.com>, 
	linux-phy@lists.infradead.org, kernel-janitors@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Guillaume Ranquet <granquet@baylibre.com>, 
	linux-mediatek@lists.infradead.org, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_232649_172454_DF8BEABB 
X-CRM114-Status: UNSURE (   7.12  )
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

On Tue, Jul 11, 2023 at 2:13=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Negative -EINVAL was intended instead of positive EINVAL.
>
> Fixes: 6a23afad443a ("phy: phy-mtk-dp: Add driver for DP phy")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

