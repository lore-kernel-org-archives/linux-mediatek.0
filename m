Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE8ACD8C8E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 08:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E05iHIbrevOWCYE7OJG8GXkZLu9ViZ4PELOG+JHp3Us=; b=uxrzKiRVEfAOz70sb2Fdt1L3W3
	EfKfvUhvfSGq2LOZEUr4zyVb5nkkvtQDQke45vjS+4UyrodCLlS3t1fDoxjtktDtq6TiWp2EAVVN3
	pWoMR8ezMvm9k0YFBA+wiBEhMgZHQWrIfZXxlCjtnyi6d2RRgR4zlzR5YyEC5x+2wsjeFvXMa2dmR
	UW/aPWlLI6wtEhMUQS4ghYxjPr0zkvd2yImN2Cr/h0rydq8+LtGNJbRrMe4ZrU8pwHhHoq7XgkTE9
	nFczk0rmU8oMndNcQvqSrSPkWmT1VXbTBv2bEWklesGvnsWd8s9AkyQjfQtNTKJh3Mm/47RpxzDgc
	cTN47GuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVA7-000000034Kh-44hB;
	Mon, 08 Jun 2026 08:16:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVA6-000000034Jt-3jLr
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 08:16:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43919439FA
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 08:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27AAC1F00899
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780906606;
	bh=E05iHIbrevOWCYE7OJG8GXkZLu9ViZ4PELOG+JHp3Us=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=n6MJHNNPw/rdEQ9+/wX3e7sYwrJeF4CxEinDh2sL+Z4GuijMSbsR5Dza3YJU0oBXh
	 g2v/CHsHAp5LylgxEo6lI8SvRIbgPrJwZwTBCc4y7XL3sldmyIVN2ztGxeJgLk+GAO
	 qf/IoQ27vT25AeCxtGYu7WdYJyS/rlRuBDSaWMcf3hAwFuoxL+NkdjyNOUN00/+LYZ
	 WDFqmhOauGndRB0BYQvHkl9SjqGT9dYC7dUcD9QkWThF6FRKiDGbqjG/IxCjWtRLPV
	 uhg7QHxXf26JNhq9GK5ka3afHwFMHqCw1EzWeTSZVKsKzNWSvtxYsmOq9oM1CTzO5S
	 KZt47uQfgbIng==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aa68e66128so4057776e87.2
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 01:16:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ92SneGUHI07YpQ6KIzJxHlFHYnXOsUMnOECLQuyglcKy7aOzUgmPtG8xaQPN6QOEmY4InW5sQI1ljqYjwTLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrmVHpUJUMHYS0EgrX1mbQldVg0t3DGjZ54RVZCCr8EFEJoZ2T
	m3L59h1AwgSH8UOFqUGnjhBpgEbkodqplmWeEB4aNB1tIN+muzh0WGaUYqt9MJaSAJWamtgxC1+
	jWmvGTU8kC7plyiGkPmNeRycg0Tm+dfs=
X-Received: by 2002:a05:6512:4158:20b0:5aa:6f89:9378 with SMTP id
 2adb3069b0e04-5aa87be9785mr2712017e87.33.1780906604512; Mon, 08 Jun 2026
 01:16:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260605071233.28873-1-ansuelsmth@gmail.com>
In-Reply-To: <20260605071233.28873-1-ansuelsmth@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 10:16:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLnSLnbt=haP75uu5R8uQCk2nWM4vT7=tH2ZZf5MyG45nQ@mail.gmail.com>
X-Gm-Features: AVVi8CdivXSw4jUoM7pdXrQFsczZzpyDzmpPsLaovwgdJGugxO38xZTv12y0Owk
Message-ID: <CAD++jLnSLnbt=haP75uu5R8uQCk2nWM4vT7=tH2ZZf5MyG45nQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Move Airoha driver to dedicated directory
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
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

On Fri, Jun 5, 2026 at 9:13=E2=80=AFAM Christian Marangi <ansuelsmth@gmail.=
com> wrote:

> In preparation for additional SoC support, move the Airoha pinctrl driver
> for AN7581 SoC to a dedicated directory.
>
> This is to tidy things up and keep code organized without polluting the
> Mediatek driver directory.
>
> The driver doesn't depend on any generic or common code from the Mediatek
> codebase so it can be safely moved without any modification.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Patch applied because it's a good idea.

Yours,
Linus Walleij

