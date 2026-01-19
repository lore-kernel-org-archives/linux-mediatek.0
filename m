Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E23CCCF2D9
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jan 2026 10:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TKRnJ+VtMZF6TaWgWCKUw95h9bhw7Ve7U+aGgjkJdw=; b=gHqbf7WBHjLOE/n1Bn+4K+iN+j
	Na5MSL0BULCxB4Eil7QPtSEK6EhGnuBKLpPKdR7GlpITsit0577UMzL9mn0ygY/Pd7GT2POIeUGg3
	atDbmV4H+wrKjBrqEAo4s3TM56+4oKZBKfTXNF008LujoKLGZ66TgyEM++0I6fM2VNasjwzkt6OLH
	3kh8g6QkT/2jZ6gCSFN/SsUhHUF3KGN6kTqEOElEpmXsZ/DtO+pMj0txWaYDhF+RqvS/hqCLhbAU3
	4mBTpPJXvSv9hc322y3zTCQOg926a2HOXDcTcS3oWoKr8iqIy7mFV7P/y2bfuWNUF8qW8usVCWNhJ
	lFjQldzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmHn-00000001jZ2-1a4F;
	Mon, 19 Jan 2026 10:15:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmHh-00000001jWU-2LKx
	for linux-mediatek@bombadil.infradead.org;
	Mon, 19 Jan 2026 10:14:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/TKRnJ+VtMZF6TaWgWCKUw95h9bhw7Ve7U+aGgjkJdw=; b=D7Yp1LDZgqElmC/n5DscjpCG3C
	dHpa2kODaRWvpJMQcvymZ2gc6n3mAOTWH4nxrvmsAq1Ri2Xa2/shYEqYUOk28ztzTCvj8+RkaPJ1E
	6BgeF+pjxgPQ2PStD+wJ3n/LliGKrjASEtVeP08Zc3UVmaevpBAIyvUok0eYGqWuDmKPXGk5fdTeB
	21ZFUnWQWo/BVBYZb+ZjUlGRloLNAJ1gi7dWzDz7NnDBLHE2b62PXfPg8BuwIdU2CiL+zFBdUC2da
	N7yf7cfJEZVzpv9UdUBeOdTCUpkO6ssQx+3ZDtLcYbtyG2FFpYmGyaNqZpj6Potdhn3414OOo3KIe
	SZVNiS8g==;
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhmHe-0000000Bpfv-3cG0
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Jan 2026 10:14:56 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2b6bfb0004aso5330172eec.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Jan 2026 02:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768817692; x=1769422492; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TKRnJ+VtMZF6TaWgWCKUw95h9bhw7Ve7U+aGgjkJdw=;
        b=ZkJAfOqKTH7icPGBY7nP29tuHqNHmWaPIpGRhhyt1uO26riL+/wNlczG2ZjSNJ0swb
         RHiG0OZg7sSk5B1XyGMATyCn7Igxr5QME6st1Is7otZEyHAktKhJuDHKGk5CgFxn0Gfg
         VbGkDEPVi7gWPRAeG3GP0wDmCzlwTVa2wAsRlneAseToMgqpIFQRkl/UuaAR2NdDRfoV
         mo9BtISNJ+qIp0KWP0gVoRH03CuV54AyxlxgZLZf+arixCzT/BKtV5aixgJFtTT64orI
         hnTY5VrhkZB22cDlrVtCGdS1DLbjtWaH7rl8ifGV+LGBCC/Lgk1TnZ2/KNAiv7ObLyaE
         BGng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768817692; x=1769422492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/TKRnJ+VtMZF6TaWgWCKUw95h9bhw7Ve7U+aGgjkJdw=;
        b=QuSKhA+bkivpOoXryyoO7mVKxqxKXrJm/EMVMBVWc/EvjvdjaeZ9CTvikrhojPzaa2
         RZFxTTscn8S8TI0RvO1PfHvFkPRDsugxFEMjiZPlPtiJogtegVnZEDUG5Z9BGTLf/xuP
         /WBHdu7Y6n/Ivb5qQbZfCmBXsCU0jY9eC/jukLAritokTcQ3gjgLZmRbMe1Tg75NO9Se
         vn8CnEx9lU/bajO9orTMiv+VsU25VWasit/BOOM0urEsmGvZTEzkVBkmpjgvifFtM6uV
         UPdu+yzwKdTOEjEVu7qMxf3OZqkTrLxohhXTmcgebLMLiv077yEhNgNZNE5TrwamMjT7
         xBCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBAPi999x+TSJnbRkiIUz+Mv0iOZ7I9Crww7lGmVnsi8fP01uky5d4xOHQcAd2H2XL309vIKtCdhmdJe/RcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJLZwFtos+/aiT1hBDyF0L4BUzocZivNNa1KwXcP4qsDQqlOFc
	W3sR+kKcBQQa+/hM2xHoHaNvcLC8/dztPdzgVV/s+3wKP1ANh+e4QfNjNswZWGoVQr2rrlSx71n
	zxW4IhmRo4xWVpYlxqA8gTIoEYCxmrBo=
X-Gm-Gg: AY/fxX4/ArUHZEl22LRYovkcWHaJNMp/RY7+RAhnMUVxPmgh5V630gDU54MPkfDtqAE
	0subFzNkHG/1wsGUnDHb2lhPXc1Xc4E5LkKPpTl6VQh0x67Uh6KbaXCAIZoqhvisFUYR2zV9jd/
	9NGxgsCOID/Kl6nBiPEvkll8Lj8YARJHgzmu1nRN1M1GLie+Oc/COLidOtQ2rVvrJTOFmMWhTwP
	Qw/t9Uk/O6h0eU43H8Acx9ixcFr3sCU7iSXa6JZ7wGraGcOCutfd33trDcxJ6sUBEERpoyaEcGv
	FwQAKWV9fC2axK+F+hK2XIbEhMHuLveTn74C/1P8Majxk8fuvH4Mb8J8ond4GzMKO+BEHdxy1jI
	+S8C6vE13fQ==
X-Received: by 2002:a05:7022:48f:b0:11b:9386:a3cb with SMTP id
 a92af1059eb24-1244a77e0a4mr10011720c88.44.1768817692373; Mon, 19 Jan 2026
 02:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20260119095511.3030739-1-zhipeng.wang_1@nxp.com> <20260119095511.3030739-2-zhipeng.wang_1@nxp.com>
In-Reply-To: <20260119095511.3030739-2-zhipeng.wang_1@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 19 Jan 2026 12:17:31 +0200
X-Gm-Features: AZwV_QhxRo6F5HrkZuvbzdlVN1eKqrMGyjLqsb6FzOBXX-W-zaQ2c6zE6aIsaxU
Message-ID: <CAEnQRZAtLYG=ddDSfF3LMOtpGWYAU4Y=UJKAyi7NH-sZyLubMA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] clocksource/drivers/mmio: Export clocksource_mmio_init()
To: Zhipeng Wang <zhipeng.wang_1@nxp.com>
Cc: daniel.lezcano@linaro.org, tglx@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	chun-hung.wu@mediatek.com, walter.chang@mediatek.com, jstultz@google.com, 
	amergnat@baylibre.com, aisheng.dong@nxp.com, jindong.yue@nxp.com, 
	xuegang.liu@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_101454_943403_80D19430 
X-CRM114-Status: UNSURE (   7.28  )
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

On Mon, Jan 19, 2026 at 11:59=E2=80=AFAM Zhipeng Wang <zhipeng.wang_1@nxp.c=
om> wrote:
>
> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
>
> Export clocksource_mmio_init() and clocksource_mmio_readl_up()
> to support building clocksource driver as module,
> such as timer-mediatek.c.
>
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> Signed-off-by: Walter Chang <walter.chang@mediatek.com>
> Acked-by: John Stultz <jstultz@google.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

