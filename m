Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F10F6EE49A6
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Aug 2023 10:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlC9WzvPLj1udXhDgs5mN/rA7M/i5witjQfQthytlpA=; b=k9JwZFCM3dO9ji
	P9asy1Xsgi5zyULDST9/eSZMvQFI7co73pYWsfzdG6ohIFZZYbVQQ2TUc8GyIaV9ylibkIMlFJkbv
	bdZzuDhnCjyw5R7KxtMVd99BeE6rXXRflEAZ/G+KlfBpeDoZu9Pbj2cpTYMskRd2ExGFd50M2fgXt
	hTUROdJeXTFmIaqjkgnAbkwh4NopTtt3LK3XmViEGqpFgQ6rM1MskB1rtCgVo+6jkVQDKyBntsCbj
	kjklOa+FGR4YGLA4gBGlGlNDvoHJMtXqrekZjeqnyKY3UvflWqvMuu/4UaX7gvA1fVqVFhZWy+eSp
	xciNCbIeAKFgz2A9fAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY2Kn-00DnRA-2e;
	Mon, 21 Aug 2023 10:40:33 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY2Kl-00DnQ6-1R
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Aug 2023 10:40:32 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-58cf42a32b9so36737657b3.2
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Aug 2023 03:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692614428; x=1693219228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlC9WzvPLj1udXhDgs5mN/rA7M/i5witjQfQthytlpA=;
        b=lEGYS0+/m2RXDHmGzNT/IeCYMT2c4iKzkEHrfthtsslruS/BGNSt9Qw/hAbsmwooGd
         XDsKaaQvYKJjlAoALNP+YXz0uNkdYv8kP5/v3FPxaI+VyKJuQBs6ZUW+fW2iJhMw3thl
         oHEEyCXKhlU2yBr8RBNSjDOk29vg3CmE6B2e4Y4Ry6RTmtJWFXmW6z4vttjeLXCMuF9/
         7TEvzE2cQIh6tWhypp3SJoP3PUBoB9b21SLyD490RawRd1uqVyaYb01cwKFFiKQ836X7
         fB11AS9c/tfm54SzK5PW0NUq3z3XKXKoHQgAB+nwIBqxWIXYLyzkHhEuV4vIpWG4YuGx
         +bCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692614428; x=1693219228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qlC9WzvPLj1udXhDgs5mN/rA7M/i5witjQfQthytlpA=;
        b=ekmFeIl/DKzq7rzk0WO/z6vu0eXTb6L2hKRHRZhm3+mZIzIM8oX0wwqIjZtpBM4iSF
         /DwZFNPyBgU4PhEbD8dVV3YbLcJN4NqSFS5TFrO9HxDuaNsvlEHm0/XSl6S0IcmN8+ai
         pw/nWH/b24uC7zeDCgWG9lV5EdWC/9OlTxkJqnzw3hV80KGxzUwwNa56ZszhkSKC2ASH
         JskowHY8n6ePoqEa2/wAMFypqGt4+9pwx+VBXqNyoeOmOW5IH+C46pO6VCKViFkIAL2T
         K2woCcQlQSu2BW4x/Hku2hf0dcNvvDVDFJDYKPWCYG9yUZuqN7STOhgwWNSFDW10G7iY
         wFbw==
X-Gm-Message-State: AOJu0YxoTM/CFaTt66GA66TIad776zPwCO0/LJOi8pbmiHN3j8Sy0dN7
	45idyxWBiJOJ1FsIR3EpnulnWMKaaZSlW9MpeMrz9A==
X-Google-Smtp-Source: AGHT+IEij7GtqhbEmiG1OmAYGBYbDU814/39PfKVABeSfeoimu6g7FqhFvg5sPRBjX8bW4TgvYUsOrRpqYZU1N0XD4I=
X-Received: by 2002:a25:abe7:0:b0:cea:6760:d2c6 with SMTP id
 v94-20020a25abe7000000b00cea6760d2c6mr6144912ybi.41.1692614428225; Mon, 21
 Aug 2023 03:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <7bcc8ead25dbfabc7f5a85d066224a926fbb4941.1692327317.git.daniel@makrotopia.org>
In-Reply-To: <7bcc8ead25dbfabc7f5a85d066224a926fbb4941.1692327317.git.daniel@makrotopia.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 21 Aug 2023 12:40:17 +0200
Message-ID: <CACRpkdYpLkPp0-3rT5xxbzO9Lf35020Aid7QX6iqZGaW3C5x0g@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: fix pull_type data for MT7981
To: Daniel Golle <daniel@makrotopia.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_034031_485587_A11901AC 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: Rob Herring <robh@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Aug 18, 2023 at 5:02=E2=80=AFAM Daniel Golle <daniel@makrotopia.org=
> wrote:

> MediaTek has released pull_type data for MT7981 in their SDK.
> Use it and set functions to configure pin bias.
>
> Fixes: 6c83b2d94fcc ("pinctrl: add mt7981 pinctrl driver")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

This looks pretty urgent but I applied it for v6.6 (non-urgent)
for now so we get some testing in linux-next.

Can some maintainer step in and ACK this and indicate if we
should even put it into fixes?

Yours,
Linus Walleij

