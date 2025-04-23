Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8D2C369CB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 12:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q3cEhVrVTg0kZTdvS2evoNFsbjUG4Yiqw/nFRP9UnlM=; b=J52aUZ2TG7EGstHV3iVqOQQvK9
	PonI6Fw7q3KXYMCYl5gG1vyUQ2lebkg1rDtEuZaVTfrE4D5rb9CwQWxnsQ42fdjAO1mInH9zZkdMZ
	c4ono33yPBjXnawrulDb6LKh6+1G/BB4OW5JyDcqfatnSJAPZRlzF8VeN30U9en8q1Ury+wHCQLcB
	cqtG4Em+ITUG34XDj4CpElmbaj8y7Pnk8tWWT18FetXgDsrnXc4nmN8fF+ICSIJJpanFKfyR71P68
	iiGmI+TraYC7RfAkobXE8dizOnQxmFE6Fn800Fz5aWgNYPx28CP6nWEBqij/Q/jqRmG9gSzznWKOF
	9sMMInaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Ymf-0000000APmb-0iID;
	Wed, 23 Apr 2025 12:00:57 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Xpd-0000000AFRj-1Xro
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Apr 2025 10:59:58 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-549963b5551so6741375e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Apr 2025 03:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745405996; x=1746010796; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3cEhVrVTg0kZTdvS2evoNFsbjUG4Yiqw/nFRP9UnlM=;
        b=QCqu/1h7DwMJjUnfHk549TkimxeqW6SNV5xdW6dxmDB/QL1Vz6WSC5U1ybzWe4Fl2P
         dux2rq610cqVUe33i33tlOV3lbGJ6Z8SdIe+exGMebwvTrh03kFUmAtW4Cy7kCxaNr9p
         aIIcVaovxU1yzIgAIBgq1fFuTYqjC+oWS6WD7XUzmt/NNAq9bKz+eRCEptZGVHPHEK4q
         IqdWMZwF18k7accfwS3SQy9eqd+L2DQVRA7pKFgKNBJKdH3dHWQCM8uYDQvOPBYmqp62
         RXhpCwLB3RZcWLQCx1DQ4zQ+/dXla7n3Yz0cepQDiiBBhqX2ibNKdsS4XNfnvqn9usCP
         RF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745405996; x=1746010796;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q3cEhVrVTg0kZTdvS2evoNFsbjUG4Yiqw/nFRP9UnlM=;
        b=uEXH9lgjPs3as+g3v7ro4Vhsv29ot7DW+n7XS34uulOQbd5StrtXUrFIl+X8ZjWSRa
         iM1GqA3znRMkD26tOnjp0I8MmRGkoyHPuU7eZRScbYK0vImx8Zo26DGpqkRw55GVTmAM
         gAcpKPGrzIM0byWDxRBEDTqMMg5SL3HMOu2Q+9Xq026SR/xMDMmYFPCa13rxPyDzq0q6
         Sx7IytOmiznZPECEGjCxUALEox77RT6rsih10mTe0UlZoWKovteYItK2UF37G2TL9xsZ
         H+ZdcZDJ/1CYRiMh6n+29Galhpq0gmZ29mbDZgUrXJcNzijH1bronj0+QAKVCuXUxWAr
         W3/A==
X-Forwarded-Encrypted: i=1; AJvYcCVdVPgk8FQjqQRi9b+5tTW3HV8EPP1m1zj1Kr5rMGYr7XbX7xgpqM9hCthUOGCevGuoBvVzVoryK9mZv3B1vw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0uGVfPasrNWTRiRKoJdIUoRG1JnWhoOeSA7w6NBfnxOERTdF8
	r+RYBmUKdtV1jgXulppbpAF/soMEtmab92D8qOR/3FuWOh64nB7KgDmszQXJl00w880/cOhZkHn
	rqWZfZpKrGx7yvcVyOafk0g0zHLXe7ZdpbbXD0A==
X-Gm-Gg: ASbGncv1kQC8nPVXy9ZF5xBpW+1FNvFMVBzsyEWNsqKN7mPcNF5bISkXsp1gL5E2Kd4
	wXCNI3UjZ3w4rP9wL9vCS9pDoJre6pKJHSrO1TP8tjNAsDH1LvnOWiyr6OQW7RDG7IwCTJTgUVR
	jplyIeZv9uwyI5ePPoIYgr1g==
X-Google-Smtp-Source: AGHT+IFtzLtF0BmAxKelCLV2/wocCla2vyxucaLxjvgEw30Sch51eBsux5LzRyNp/HGiwEeiD7kURWUr//rXX69Cxn0=
X-Received: by 2002:a05:6512:318c:b0:54b:117b:952e with SMTP id
 2adb3069b0e04-54d6e66cbefmr4418385e87.55.1745405995686; Wed, 23 Apr 2025
 03:59:55 -0700 (PDT)
MIME-Version: 1.0
References: <aAijc10fHka1WAMX@stanley.mountain>
In-Reply-To: <aAijc10fHka1WAMX@stanley.mountain>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 12:59:44 +0200
X-Gm-Features: ATxdqUGhq-8Df0lmzkXAKLmMqiEIc6uB0ArJmTsIwn6uONHy8hOiVyiU37DBzSI
Message-ID: <CACRpkdbLwZuFKqLvdkuCodQrNb5h-W9567eA4CLOP1FrV+PbZA@mail.gmail.com>
Subject: Re: [PATCH next] pinctrl: mediatek: common-v1: Fix error checking in mtk_eint_init()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_035957_410758_BD42227C 
X-CRM114-Status: UNSURE (   8.25  )
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

On Wed, Apr 23, 2025 at 10:23=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:

> The devm_kzalloc() function doesn't return error pointers, it returns
> NULL on error.  Then on the next line it checks the same pointer again
> by mistake, "->base" instead of "->base[0]".
>
> Fixes: fe412e3a6c97 ("pinctrl: mediatek: common-v1: Fix EINT breakage on =
older controllers")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Patch applied for fixes as a fix on fix.

Yours,
Linus Walleij

