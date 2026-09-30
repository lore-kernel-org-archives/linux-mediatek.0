Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7990CA5FC5
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2026 13:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZGmye4k+YlaE682WwEkiugdda8o32numJuLT15EPQAk=; b=mDVX5Ql4mnGhWE
	pRV5nxJ6GPs86RlZ9k6/1IUXijq7Xs3MG7fijIdhfCD5hlT64PCMZIraIhiGdMuHHpVy1N7GVGWQu
	3Xlxq5F6xDA0oOIpX38oX66o7Glp0ac/qJJMbdRJ3L7IlAff17dqYyPbY6XBSLhyOaS3sxr77HMGp
	IPTLVAugVEHqUY8UmaWYwbQQR3AHfPC3dhmt8Ys56UclbuTD+1p+MgrYEZBoIPFpI2K0FUlahXljh
	lplIDhNYUdfYpLWEWnkOxcec/izC0Uld1U1d+c+YJTK7CLnxTIA+8D4DEDHyrtqZNT63GCwaDqXtR
	35UMUcKQjgw8NavS9hpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuPJ-000000068dE-3r6b;
	Wed, 30 Sep 2026 13:31:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBuPB-000000068ax-1SaB
	for linux-mediatek@lists.infradead.org;
	Wed, 30 Sep 2026 13:31:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E2EA43EF9
	for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 13:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40241F008A2
	for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 13:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790775089;
	bh=ZGmye4k+YlaE682WwEkiugdda8o32numJuLT15EPQAk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DYOfnDeg98pIK7T/72t2R+Avlri5Dv1BeOAYrCAWC/Kf9a0liTJhpC2zQQ0Dvv2s8
	 KxixrrzeIjOuEl4GJZO51qVSw+MSq5SOvLt9ZT8rQoVf7Yc5AtyLqagZUKg8/JTf2A
	 xx24H+7iNKa3AAI57N4ZeqhH2eMp/LoIbNiCT1jfCR2dfJ3BPMnd7f8v4URTlpqsNd
	 Ypgtieg6HMVK8m5oWoV9QCG8sU2AakPUGhqzqO4YsNU/+70MjrdepxGslcntjGJeUz
	 VwBRt+AzX4jHVlZD29p2ReRzJ7MFQw80JuTEWpKClMLRd7MFrOgS680Ne5r+xuvlIi
	 hhWPE2PIZLzbA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a76ac0bdafso10590601fa.1
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Sep 2026 06:31:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzaUzsr/jRTMFMcvnjnLDZueUb44Zu73oci2TBW9abQ7Vce6OZ3tBB2EaD/Nfeg3YUyK+phTWG9AGFePsxlpg==@lists.infradead.org
X-Gm-Message-State: AFq9FYJ0Ysv2jfDcgMOn4MMco8vYMvolWvk2HctqXBu+hAkOaJ9bOdaI
	ZS+E9NmNioBjyCvXsi9OkYm2zRpLUHICfC0Wxnjp2El5oQ0fFbvFaq391s9MUYDP6TSk/Q0XXAp
	kRI+Lewp5bMPXM0AVBUAKSQi5MnI/hnM=
X-Received: by 2002:a05:651c:2121:b0:3a5:a1f1:ac2e with SMTP id
 38308e7fff4ca-3a77920036fmr5378151fa.11.1790775087724; Wed, 30 Sep 2026
 06:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260918143846.30458-1-linux@fw-web.de> <20260918143846.30458-2-linux@fw-web.de>
In-Reply-To: <20260918143846.30458-2-linux@fw-web.de>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:31:15 +0200
X-Gmail-Original-Message-ID: <CAD++jL=vfpwSv+HORuqjcC1y5-dUZAK+6Fex-=an7voV73X3Jw@mail.gmail.com>
X-Gm-Features: AclHuK9hmbqqQ-iAhBFOSqKzQS-M6vgJ1tGQehJYCcgvkhZw-sBpo6gT2urSL00
Message-ID: <CAD++jL=vfpwSv+HORuqjcC1y5-dUZAK+6Fex-=an7voV73X3Jw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt7988a-bpi-r4pro: add names
 for i2c-to-gpio chip
To: Frank Wunderlich <linux@fw-web.de>
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 4:39=E2=80=AFPM Frank Wunderlich <linux@fw-web.de> =
wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> Add line-names for the PCA9555 i2c to gpio expander to have more
> information in debugfs.
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

