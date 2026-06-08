Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF7ACD8C92
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2026 16:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WTtvSs/e4atXwoKhD09E3lWjpJ5mSO88VMWBPo2Qa+Q=; b=sTpeRSsTXfgh2OKqJBBX7VuLdf
	6Gm2Qn2IvOQHCIdMv1/zYg5fKxC4jXIrxTYhU5q+MinmQUA2qjF4+/3DtI2nKapnPoWyzjUhwzUKp
	zegPNHexlj01ArmLC5Cf2yo4gSzGhvij35T5hBryj6T0C/ZrOT2UFQ+orQgE53wN/sP4JBVA7C997
	vUE/CG1H0JDRmBdO3WlqF3RUrWaWT4uQrl+O0mJgIPTeB0Y7Ha5hKH3gg0c0VN6IqP6UrX30YPawY
	Myd0NP16wqZYEnbVre1AyO+7XLbTa+Q+D7MIrMjOApWXPYB+VuQYvBQMqWgjDsUe2FdJlVLBKT5Hm
	U9o0bung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcf5-000000042zz-1iL1;
	Mon, 08 Jun 2026 16:17:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcf4-000000042zm-49pj
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jun 2026 16:17:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F61C601D8
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 16:17:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2599A1F00898
	for <linux-mediatek@lists.infradead.org>; Mon,  8 Jun 2026 16:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780935434;
	bh=WTtvSs/e4atXwoKhD09E3lWjpJ5mSO88VMWBPo2Qa+Q=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=LyueLEj7jp8yMu1AEQixDI8q4B3w+XWSiIw6WEYpDkY3cuAaHkVs+Gkv4r3oFQ+nE
	 j2kEitMrOypDilGIkywdHYwTiG54nerTMKRg+wFacTquoygRP9xid7cpz+jTJSKgyW
	 +abDJZazjpsyZjStWHiiW/goTyCBX6IkYG8xY8+2fwLgB6kacNDSnOUhIlgELABJ8H
	 xljLDTpbnIBYx/FiATjwXyRPT3p9YhztzfUvwTF4kqjYUueHxZKf/ysMkp7zxVHY++
	 dIwlZTpl2ALCGozXK+SRCdBONQkltTbaUrMFKqfaNg83xgGZ4OGeu5bHwlG5KZMyCF
	 GonMhW5EFkO4g==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aa63628d26so3647729e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jun 2026 09:17:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8wiqGDQ6+gHttCzM6wCI1IW8VHf4PWlgCDvCupqRoDBwnhr+36xEbk1C2gQLisOpw/Qm3Zqdwv4FwKavDI0Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaNNcnyP8kaTqx0NLPAs1DQzMaDsYeId1la/Rz3QE4fFYa3SbN
	hSORWGdyJUlmAp79NYB8kcWR0fj03dkVkMBB7zuQWVx6T69tbBwi7Is+nwR48pj/2j9qt6xNwuB
	TYz2usMxUHbL/YTSsQbiRAbmdhlDSJle4lNQeh0P9Uw==
X-Received: by 2002:a05:6512:135a:b0:5aa:74f8:72f4 with SMTP id
 2adb3069b0e04-5aa87beffabmr3825436e87.32.1780935432883; Mon, 08 Jun 2026
 09:17:12 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:17:09 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:17:09 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-17-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-17-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 09:17:09 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdWhfR0gQz+cJsks_-L0+fKKXGPg1FKDqt8dSSGr1EA9Q@mail.gmail.com>
X-Gm-Features: AVVi8CdSgzI-OCu4SAMZh4v6VzPB8Cgbp2XhrMRq6YuwW3nSlK1BMg5J-5Z-maM
Message-ID: <CAMRc=MdWhfR0gQz+cJsks_-L0+fKKXGPg1FKDqt8dSSGr1EA9Q@mail.gmail.com>
Subject: Re: [PATCH 16/18] pinctrl: airoha: an7583: remove an7583 prefix from
 variable names
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 7 Jun 2026 02:16:52 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> We have only an7583 specific code in the pinctrl-an7583 kernel module,
> so 'an75831_' prefix is not necessary anymore. Remove it.
>
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

