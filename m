Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47F9FCA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Aug 2025 03:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72HjhGwzLL0PbZTSkv6wDk9duccZmIns+xeA/qk65fA=; b=128ngxHxWZE8Y92zdm77vgFuE7
	a1kCcrqBmFUbw6qeBzAAa/avk2Ge+mdL4R2bE88lsS0amAOTP7jrc0lnfWUOSgmr72EbG5UIsADFg
	LqDJV1MbXEJVogyNzZQGFUF4yzTIGmy+H0WQv/SD8+YNe1xpgi8r/P6xXB/wUrvinBVt+uRuZGBEC
	FDog3439HVOUQvf/6Xx1IL6PJ1onowgYRBG25PcWg4zcyjr+FdaM6g8n2ki1PtWVPXEXZe85/BczG
	hF84XOyVLfEtaEK34nWMqZ7DR3m2+6w9JvsFsveIANYZkNCZ2ap/UbB+H7+jIEGxVusNuHUUqkG0+
	QKPOL67w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unqw2-00000006PWS-2mxm;
	Mon, 18 Aug 2025 03:53:26 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unqvz-00000006PVh-2l91
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Aug 2025 03:53:24 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-333f8f22292so27079791fa.1
        for <linux-mediatek@lists.infradead.org>; Sun, 17 Aug 2025 20:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755489201; x=1756094001; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=72HjhGwzLL0PbZTSkv6wDk9duccZmIns+xeA/qk65fA=;
        b=eKvpZSw/a5GL9Q8ouS38RaBJkGCOnippZP7DBLvMus3y+4sDpsWz5wLESo+Gn3/eJ7
         3IPZ2Vfeyfqt2qxotX3mEGffx927j31kgrAFDyAnsZLcKgfb48x3aHKTyQvybuF9VKLr
         YmuWeeImIzHf9bINMAGqX0MHtYpDYnZLlRYrg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755489201; x=1756094001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=72HjhGwzLL0PbZTSkv6wDk9duccZmIns+xeA/qk65fA=;
        b=FeKVWf+lmZLH/teSMDQmttF0VZlSqpZ1w8Qg2ampDexwS9Tc3WOvvtjzngG5PunQtU
         J4FaL81n25YOvJbTEh895Z504vpd3ywnF91s1LPaULEp5rL52XmYGMILgI0nd3PIhyQ0
         MIkNPOLEjOj5CU/DkdFSIZMKy7s/oOrzfit/ZMQ2En8Lm76tFSDjfemZ54cMLUGtrmlH
         sFolIes64zXWtUb9WapMhGJDxVTh7H40DIuDvb3H31gvpyJbndWYqDPEwrJLjdAIpo0k
         OeAjcAbh/QCNm0nZS3zIFCg1+tuqymIpLfTWYSWrSGkgWUcUt178rCZ8w0AOq/aASxp+
         HX+w==
X-Forwarded-Encrypted: i=1; AJvYcCUf/Rq7wiNN64fNGarAbN9B5OhTeHLu12gCdrhwWGUZm0kr23ZlRx4qrvbbEz/9Yxial7tvaTmqk00otDRB6g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPUp4Q1G8KWERv4zKm6IMf/4a6oVQUM9L+wUNuXfD2lkV9roiv
	l7LahjUWSC+vSxNbT9hhqs0Jib4X7n93OPkkI1bJEnxZWMalTfvTzn7UBmQ5qKsslvFjAnFhgCa
	Natao4J43REo1H5RnJK+P12V4h19CMy41bqGpM8hy
X-Gm-Gg: ASbGncsm71Y00JUDI7xlazzkdBt7qQ5dxPfxNg86hEKgpp5Oad+bzduJtvFiH2RRWTM
	hlA3VTYko1guTFWPIOeQ6wrockHtdpgHV3SkzgDeqfmYwg7kSuqCRXeBz/GgjHC+1TtoH5B5/zy
	OiyRuz9lpxo19HBqOydgqolzelUrziceAbb63mNV6FoeeqjRX7SoyQ9JtM9SufK9EOwztGM7Uew
	UlHNBQ2e11s6MXxkh4KeSs5C+UnDDqRWi0=
X-Google-Smtp-Source: AGHT+IFPS+3sb9CZbTWfnTjbDa0k7A4z8cLwROgvhlDgLeCCeIOup1wcDfmt4xXnfNBN2Bv5bh02EwambURnN0B3nkM=
X-Received: by 2002:a2e:b8d1:0:b0:32b:6bae:e3fe with SMTP id
 38308e7fff4ca-3340982d970mr29405411fa.9.1755489201494; Sun, 17 Aug 2025
 20:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250816075434.31780-1-leilk.liu@mediatek.com>
In-Reply-To: <20250816075434.31780-1-leilk.liu@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 18 Aug 2025 11:53:10 +0800
X-Gm-Features: Ac12FXzbC3a5fYlt94iOei7CP2T8RPhSU-BFGXIPrEu4iVpFb5TXKRGwyAlG1lg
Message-ID: <CAGXv+5F8ABGTRdUrf0j68cLiHZHSEFjwDOBtfTZBTOWt9APVVQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: mediatek: fix potential incorrect use of I2C_MASTER_WRRD
To: Leilk Liu <leilk.liu@mediatek.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Qii Wang <qii.wang@mediatek.com>, 
	Wolfram Sang <wsa@kernel.org>, Liguo Zhang <liguo.zhang@mediatek.com>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_205323_726053_B581ACC9 
X-CRM114-Status: GOOD (  12.03  )
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

On Sat, Aug 16, 2025 at 3:55=E2=80=AFPM Leilk Liu <leilk.liu@mediatek.com> =
wrote:
>
> From: "Leilk.Liu" <leilk.liu@mediatek.com>
>
> The old IC does not support the I2C_MASTER_WRRD (write-then-read)
> function, but the current code=E2=80=99s handling of i2c->auto_restart ma=
y
> potentially lead to entering the I2C_MASTER_WRRD software flow,
> resulting in unexpected bugs.
>
> Instead of repurposing the auto_restart flag, add a separate flag
> to signal I2C_MASTER_WRRD operations.
>
> Also fix handling of msgs. If the operation (i2c->op) is
> I2C_MASTER_WRRD, then the msgs pointer is incremented by 2.
> For all other operations, msgs is simply incremented by 1.
>
> Fixes: 173b77e8d8fe ("i2c: mediatek: add i2c first write then read optimi=
zation")
>
> Signed-off-by: Leilk.Liu <leilk.liu@mediatek.com>

This was

Suggested-by: Chen-Yu Tsai <wenst@chromium.org>

internally because the code looked funny.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

