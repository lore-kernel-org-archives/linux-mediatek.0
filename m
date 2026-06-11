Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2DFCD98D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jun 2026 11:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqY2spfTOdxT6/z9DTv0mn5JpX+liaPtEnBVwLgBTnw=; b=1gqf/Tv4VBrvTWVwhClV9st3BS
	L321wpCQK0BIcB0i2S1yXKu8/yDWq5Ko7Lapd6EG26rcjgcKkz0+zDkT6pwptbZ1LXLA3nINGJaku
	NiRlXD00wKdAURm73Y58DHUOdWTAgihfHs4DzTNOaE/FAh2eYfjMruAFMSE18l92C70aEry9FObah
	R1Bq8LJLQI/aNp8HRASim5QcXOlLnnlHeZYxTC2oVNBRjWXvR2oHU/5v1k6Q/2SzjFe+7/wV8tQoZ
	l5gKKlCnMJl3pVc2mxojlybFUKUz8IL4sDXcM0IwujGdRgOspmQ/pSH5NQzceDyrgJ73TOJvRjMqe
	vxQrujKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdya-00000009LNU-1O1T;
	Thu, 11 Jun 2026 11:53:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXdyZ-00000009LNE-2B9s
	for linux-mediatek@lists.infradead.org;
	Thu, 11 Jun 2026 11:53:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB663441A6
	for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 11:53:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFCF1F00893
	for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 11:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781178814;
	bh=GqY2spfTOdxT6/z9DTv0mn5JpX+liaPtEnBVwLgBTnw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Z0Xh0cj+FPMHImvLlydsk6WEiI3l+mk2IO9zpn4hl6MI6hXrNabJxKzDCt91NKCh7
	 mVSVoz6zbnrsdic3eO9kkEGqqAEqLpi1aswrQBhn7pnn84rs92Vp9vM23ZK/ujeU2I
	 GP6tBSgo/UQ341vOfKTjchmsIfKBxjYecNyw/Aqku+TNFFufwwg244WCefmRgztQNK
	 qnsVKun7pPXyQ3qkRurGkivj1fGqvBVdkkCzenrDdHornVvFbFtFaSSCoqUVz+xocr
	 zBviDrAAKjTVWu9dC6lV2Wul6Grpnv4BQSu2z3ydoGIUS41F+2BAjIKyCx+vRunvi7
	 pQLclsg5mWI+g==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa68e66128so8213016e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jun 2026 04:53:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8SbtZOwihitIx+zfkhFDqiGge9aN/rgqiZAsjHQZ0C6wehgm2AvcNE4RN9FtnB1OfUeOBkwfbeIFmVsF1ouw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwdQFfa+h3GhmxAVC8IPzkEJ7cKMwBiQEprfKlkOXANbCcDZ2a3
	KWIeE9XrMLOEB8dWq3sff4PT/06t+B8fVZzyK/eimgpzIv6lPPGx/0giINL6e9pak4Ne8uXBju8
	EFQGCAFwd548GSxHq69ErwgFm94uT8xY=
X-Received: by 2002:ac2:51d4:0:b0:5aa:62fe:ec9a with SMTP id
 2adb3069b0e04-5ad281b7a20mr780290e87.44.1781178813544; Thu, 11 Jun 2026
 04:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260606020342.1256509-1-mikhail.kshevetskiy@iopsys.eu>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 13:53:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLnznOYt7giVz-xqLEm49oMdnr4HnaW8T5sAyz7Zqgi1og@mail.gmail.com>
X-Gm-Features: AVVi8CeW7u952qA2e8nha9s-_tLXnmRSu2SJMgx1bi89y4LGhDaKdjaaWzyi6I8
Message-ID: <CAD++jLnznOYt7giVz-xqLEm49oMdnr4HnaW8T5sAyz7Zqgi1og@mail.gmail.com>
Subject: Re: [PATCH 00/11] pinctrl: airoha: small fixes
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Christian Marangi <ansuelsmth@gmail.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
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

On Sat, Jun 6, 2026 at 4:04=E2=80=AFAM Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> wrote:

> This is a set of small fixes for Airoha pinctrl driver.

Patches applied!

Yours,
Linus Walleij

