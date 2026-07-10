Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 816B1C43458
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jul 2026 20:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g1RZDUi7dmfHqz7HG7N5VHozu1EUFuTkNzT7Y8iTCjk=; b=B4LVg15JcwuEOl6UoVcz34tjfq
	9cNVofoG1FtHwqfiaIVpA5tQOrft0Ygi2xcrFWfWVRLxULIIAe8FCV52RNAVKPbGPnzqK/USm1a+o
	3gzGBr66ItnC2PltvShOWYjN1OORAqO3RdoI00iwoNlV5KQiljwRS2jopX7PIc/6Yb60u0SEYin3b
	YjjZ4mJYebIEW/3IptPk0U2nercbNh88KluXkMRx6OLdYsfnLBoFtmcy1CkhRfMMPgI1injwxg/jg
	Ht7j7oywOtpzROCO/4hBHKjh50tmMZ0iC3dH+IUVJSjomRrxqBZ73/VOKt6ZoRbNnNl61Z6YyMqaw
	mlEhkttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHrN-00000005i3A-2LUh;
	Fri, 10 Jul 2026 20:30:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHrM-00000005i2q-2vVz
	for linux-mediatek@lists.infradead.org;
	Fri, 10 Jul 2026 20:30:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29E95601D9
	for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 20:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C731F00A3E
	for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 20:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783715407;
	bh=g1RZDUi7dmfHqz7HG7N5VHozu1EUFuTkNzT7Y8iTCjk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gUBrtBlkVBehkmSrXfeUeRGqq84rmT48nO0J25GHh5VJZwzIxzZjNse13ScMGc+gJ
	 m8qa4RITtEa/6PUV38mhmyauB8nPYsfzeT/Llqg1eoqLlLPyD+MORlaTlPgFJtXeHD
	 3d0oG7nMw1mDRCBRJ+7L/mSU/5KgH9xob0BSugNBkj6B5DBx9aHRvL04FBukxvve93
	 9HQfTBtOMD1VGNdP/9+BwOHDY7526Q1dnO2ph2XEuKqjKwpbwQWw3szHTSo5WBNKlp
	 MlWPVMIY9R62tpeuPblEIlzGMQxZL6WZ1yZ7CuOGm9quRe+9HmduM/pYXPcsG6R7+W
	 vXLgPTG9o4BkA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b015532f7bso1453105e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 10 Jul 2026 13:30:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrgYYMKAy/TLkr2nT3ub+BSbM+mWP1s2cOH5st5e9YUf3Rtz/ZZcvtV2FP9W87H5hlDQC/rRYhzlCIqTsZXag==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgoks+O4bsNTaXhNwXVl4D4Q87sXWoaj0sC93F/E6eWnIBXrsm
	pSQBJF+AfgtDBrSPE+XBnv1NJF0FwcMCj7ZM++yDnRZjDdYORK0zeCgidMNjwDGok8KFRnCWU6J
	D5Kp6Mckat03aE7XfG0Vs5D7lEs0fcdg=
X-Received: by 2002:a05:6512:2529:b0:5b0:1b78:4962 with SMTP id
 2adb3069b0e04-5b0236bb5c4mr137507e87.50.1783715406670; Fri, 10 Jul 2026
 13:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260709063450.1615041-1-justin.yeh@mediatek.com>
In-Reply-To: <20260709063450.1615041-1-justin.yeh@mediatek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 22:29:54 +0200
X-Gmail-Original-Message-ID: <CAD++jLn00-Qdy=uerGkBJUT5gsTjr685HYe9hcnc3ubxbcDgdQ@mail.gmail.com>
X-Gm-Features: AUfX_myXqmF5Z9qSM89g-I7i4RZgYi-3UQwo4ZzGGQsHH7hMMjQ_teIFD1NMZKM
Message-ID: <CAD++jLn00-Qdy=uerGkBJUT5gsTjr685HYe9hcnc3ubxbcDgdQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] pinctrl: mediatek: Enable module build support
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi Justin,

thanks for your patches!

On Thu, Jul 9, 2026 at 8:35=E2=80=AFAM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:

> This series lets the MediaTek pinctrl drivers be built as loadable
> kernel modules. This is required for Android GKI + vendor_dlkm
> deployments, where vendor-specific drivers must be kept separate from
> the GKI vmlinux and loaded as modules from the vendor partition.

Nice series, I see Chen-Yu has some more comments and a
separare cleanup patch may be needed for mtk_eint IIUC,
but definitely getting there!

Yours,
Linus Walleij

