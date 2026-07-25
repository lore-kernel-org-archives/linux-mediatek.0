Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9177C531D0
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Jul 2026 13:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vbmSzYd2ryzojmmR5tmxApAUV88P2Dup5Q86ZV8c08M=; b=1dlcWPoB1uXLXuquhs3d1bhDt1
	fMX+QiRg84UDV1TSQbuz49rDIoD7NAZSv0QjYM6lNbbkwPHctQA68u8Jno7MR2eVx278geJg/LNHs
	xKj+/3dTP44AN07uIr5jY3tewYvHVNeEu72sIfXid/GoNnlI0P6ZYpghJShWc15JKQbtsQSZyN0ut
	s7EXogxvSEO/GHdSsHYkwuOD80oJfysTKe1HB2c7cCngZjuNrtU4nNe4u6A66D3E1E3dAhjSKLTZi
	5vuzNhmia/qakBH6qgJZruHWl4zduF0kIEuM6jy62F05NWygwptv/lkkdT3mpTo1iamVuNMJtJ1kW
	xIFEu5vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncmL-00000000PQL-2Mw8;
	Sat, 25 Jul 2026 13:51:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncmJ-00000000PPg-42A0
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Jul 2026 13:50:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F40143D00
	for <linux-mediatek@lists.infradead.org>; Sat, 25 Jul 2026 13:50:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB011F00A3F
	for <linux-mediatek@lists.infradead.org>; Sat, 25 Jul 2026 13:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784987459;
	bh=vbmSzYd2ryzojmmR5tmxApAUV88P2Dup5Q86ZV8c08M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ORLG+fWhZosGalSGWmyV3Kh++97/MDHrKaLPYfDJtWfoak36JOSML9k8SudIKrrp7
	 wubLUe56gXM8COgYywev6qjsm9UZDTBYS277roo1SLeT6iNgjdN2Z+QKLcpkgZtkNW
	 uHE0C8c3XpcS/RRzONKUC3CTxBZQm2g0V67rfNBAIjcsTEAdylfX/qIAaGoTV0TGtL
	 Mdu0hdJm5RTpFNtErkG3HBY3G0u83xcEnbZEOdlXMMm8TFrmZh/7simaAEcqrmif9X
	 kXaXnn0aBKcs2+twQpN7vZkPNcpI3zWOxZ+p8QRwnGqp80lqCRQqEeyq0rCDkLnzA9
	 Am7RbQGbgE/XQ==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso1103213e87.3
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Jul 2026 06:50:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpq2Ypr4gwIymKd5xc9rXEI5of+KtQkgAKbWktMvAom/SeLxD8VLWGWmR4P/+wPB1Aw+R3AGZZ4Rjr40izwOw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxMZGAqpnCriXhCiTgH414OfXfznnBoZvjhB5qSRx2Ii2RmYZWG
	Ybm16ZOvJ6ph3GBZfRS/jHcRp+CXV9XlL5Vh7eUE50CHOQCb69xzlgs4ZTIoGu0yoHo2PC4Deoi
	RYuoxeYw0avQJi1nShsHh7tVnGU5JmFE=
X-Received: by 2002:a05:6512:3c8e:b0:5ae:c239:f052 with SMTP id
 2adb3069b0e04-5b2c1b569bfmr442527e87.62.1784987457975; Sat, 25 Jul 2026
 06:50:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260723184538.3888637-1-ekffu200098@gmail.com> <20260723184538.3888637-25-ekffu200098@gmail.com>
In-Reply-To: <20260723184538.3888637-25-ekffu200098@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 15:50:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Zso=W-6hu56Jv_JPLLi09zXQVPdQnzDu+qjUNtai8zw@mail.gmail.com>
X-Gm-Features: AUfX_mxl0SbySY5a9lGPh5hdtT44cpsgYcs6gRZ2aF1kuTPcG7UsdR_1xQAGZMQ
Message-ID: <CAD++jL=Zso=W-6hu56Jv_JPLLi09zXQVPdQnzDu+qjUNtai8zw@mail.gmail.com>
Subject: Re: [PATCH 24/36] pinctrl: mediatek: remove conditional return with
 no effect
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Julia.Lawall@inria.fr, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, cocci@inria.fr, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jul 23, 2026 at 8:47=E2=80=AFPM Sang-Heon Jeon <ekffu200098@gmail.c=
om> wrote:

> Both branches of the check return the same value, so the check has
> no effect. Remove it and return the value directly.
>
> This is the result of running the Coccinelle script from
> scripts/coccinelle/misc/cond_return_no_effect.cocci.
>
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>

Patch applied!

Yours,
Linus Walleij

