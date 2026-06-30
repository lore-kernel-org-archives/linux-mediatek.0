Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD64DC43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N7yjC32RZFO2zeCVufXjAZbsnHlmLLdCxMY1qn9+twI=; b=rfTaeXjqeMdDiJMRK6mmrY8gAj
	hX9ATBEKTDlhkEmf3xF14EYLYaL1XGv0/iIeqPG4KJ254yDUXbeW0nXQw9d9RPKsASheCKJNBhQjy
	EPiea7y8irlZ/vLxzbeOyvpXtpB6SO1VwcJXw9vhpUDc77FSLfVtfFzqUFkCbUd0K/uWj3onKJjKU
	bzpP9/EbPmCkrWqlr9b+rJ8gDQvJyyDQ8qWsRDjwfcT/7v2YVwlFU99F1D+vM/2/5Hryd5o3bDANf
	OwmbA5bzTQuZd/Oj/EmLu686UycqWt7jqxkJvchFBYWgT4W9qu9ADEZIDAxUcaPTnjDa+ET0wAFXM
	fXsfZZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXHV-0000000GvpP-0yfi;
	Tue, 30 Jun 2026 12:09:37 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXHT-0000000GvpF-0cwi
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 12:09:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C41A600FC
	for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 12:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A2B1F00A3E
	for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 12:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782821373;
	bh=N7yjC32RZFO2zeCVufXjAZbsnHlmLLdCxMY1qn9+twI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NcLHVss9KsnF/5DOh4xxod83EuSVKq1XaEYc7aEP3bZB96dKjjeL/ENc2BaG4OXVn
	 f0TuJ1Nv41EDG7BStv5oOegOmtpmM0Q/IWuE2XTuKyy2UotOTIbKEuD+Yyr4MylJZj
	 mHZZHWcr6yHnQ3UDQDgPBAb9wxotApqLHlCw6HE28zET4QwJNf0LiJySGImmftiMEU
	 qyGDCz3Crnlpm/atu+Po5IM8PA/8ddhcGD50rte9cdMBbcrOfwI7orBj/EggPpBZzL
	 cr28OoiruwUwQDlTZr5+PhKDQfimSOVb0EWtw/Oot/52Ir3ukBo9EjcwN+EU/aFtSa
	 WmwZGKthk3+yg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aeba09900bso1594242e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 05:09:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro+vKnGMPM/jx0jK4sbs3ef5ELl8rznO6VmlBUvlhYsp9Qj/GifEYNoF2kkufU4h4x10GBd0TE3et3b0WS4QQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlsQukbUZ6f6sHCn1f8cu3y9oZcyywY58gaybI9LAK8zZyAugL
	oPrRfERvDiooHs4ytL6us7wU7y/fKzEX4/LjOoqZm+19Bt33ue96YwzQkWeNWKRqzfQYTvzhIKu
	ESsVV2chqBtYxIEkh6l2BhQceBKOEm9o=
X-Received: by 2002:a05:6512:a354:b0:5ae:b7c4:d2d2 with SMTP id
 2adb3069b0e04-5aebdb8dd04mr655348e87.12.1782821372740; Tue, 30 Jun 2026
 05:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260617043654.2790253-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 13:09:19 +0100
X-Gmail-Original-Message-ID: <CAD++jLmY6Ase3hPC00z_kAJe+vJBUyrEHZEAOcWqkiuFnRGCcA@mail.gmail.com>
X-Gm-Features: AVVi8CeqvdqmX1k7t5vMa_RRoP0ZutCzLez8z7gtB59RFtVfKunQWvBDYQA20dM
Message-ID: <CAD++jLmY6Ase3hPC00z_kAJe+vJBUyrEHZEAOcWqkiuFnRGCcA@mail.gmail.com>
Subject: Re: [PATCH v4 00/14] pinctrl: airoha: split driver on shared code and
 SoC specific drivers, add supporf of en7523
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
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

On Wed, Jun 17, 2026 at 5:37=E2=80=AFAM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> This patchset
>  * fixes more airoha pinctrl issues
>  * split combined driver on common code and several SoC specific drivers
>  * improves an7583 pinctrl support
>  * adds support of en7523 SoC

No comments for two weeks so patches applied.

Yours,
Linus Walleij

