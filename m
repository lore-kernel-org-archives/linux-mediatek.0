Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724A1D25039
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 07:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/al0P732L/og3jdqGor9t3lBoCQ/uX7BhVeOm6+zIlw=; b=NfgW4wUQJB+ok0UOV2ok08LkfM
	yYW09iG10xsptcV+vJEhAVW+xL5GyZFmbJN8pAr4KawmmM8Mh8VHqQ0eVFaoTWoiU5l4eOeMxdjqh
	9U6cXhE8qkB17SozfGyR8y+RwTnmLUwAnunoZ2SRWW0XrSRZR6uUPS1CMZdp2H7jXet6uOCiGQ8ZQ
	5TEgdzDS/NHToebU6A2dF9lhFQz5dNTS9wHqYuei1KOXmREYInijnfhYM7TEw5Mhv6+hpnn+detnh
	S4ROjKFTJIoi68vcClaWM4m15spLfhdhH88v7Djt8ZtoQ5Gjt2SpfsPYLNteMlHi17TcCNmnfX0EC
	KVx1OkEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCLu-00000004sfp-1oyR;
	Mon, 12 Jan 2026 07:28:38 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCLs-00000004ses-1rQM
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 07:28:37 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-59b8364e4ccso3008729e87.3
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Jan 2026 23:28:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768202914; x=1768807714; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/al0P732L/og3jdqGor9t3lBoCQ/uX7BhVeOm6+zIlw=;
        b=nmbR4cIKWblWfqbK/DRb3P7MMX3nwobPEadPYnVESbJPtQrcTmin1hp3itT7iAqvca
         LX9Qz2SdnChQzKsL1n2q5MAVn6cZBoX1QI3YsMTnKDyAVltUQK+Bf6YzjPj0595ULfvx
         ar/kK50mMnvv19io2VrdS7sRtGXnm5IDl0ydA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768202914; x=1768807714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/al0P732L/og3jdqGor9t3lBoCQ/uX7BhVeOm6+zIlw=;
        b=ITYH4/SA47ExRN7mtF2gyPD/TYtawBaZD/NBwIwIDgCD4G7VNA9t9L7yoGC4Wm0uzP
         6JcKRDQLK6+RrebhmBPKpZKP7qG3etUphXevaEzb5Jx8d6NDGDETyXDwHUaaiiBbJ0wq
         MBCf09fEPPE2NnLcUh2bWzlw3/rkxFX+sX2dnv0WSNarbG3x2+Y5n5ZqoDEO1LcTMDEh
         fCuKhGZGplCS22EeeS3bdi0rh1IaXri5mKUP9v9DX6UF1CwBIZ8Izx6vnxCSO7lXD/7s
         QzhLpvvyUgvtS9VivCWxhscXTG9n7ZQhNl7ObyFsek8rZ87Qyt/EkaKw/D6kRxKTSfFt
         BMOA==
X-Gm-Message-State: AOJu0Yw1KI0873tFz+DMbCzjwbqI0WMj+Uig9kE6a4F1YK9V6JZBbV96
	LYh0RJHHy18vslTGtdQsMREh6sdp61UFLZ+K7dDY6jquAybJpvU9YN+xHi4EBOi3wSfJIrWbLXw
	OrAg49rcKIUf+zSh4eYaDlDRK4T0Gl7XF3vYZtYNI
X-Gm-Gg: AY/fxX7++u1XPDt87vU+jL/Itk1xh5GNHQomKTTfW/c6Ie+/Oi83zldo0/KQ/bBpw2n
	Uh7/Fx79dP7Qw6pdLzP1If7Igt9CLsVn7AGUDhL05jJhLKGMj2XhbVXeHPywM37pnt58Zt/idY2
	eRkBUay/ihYtms17tMvHYa0uOgR71jxtssumgD2NmJw3dRQ6rJebJfikTsHUJfE9CAhdtT14tCN
	qa4f/hPoqOG6osDFxxEBsm4y0Z1+i6EHwaMkrM+9dyIa2q7aBiOrXwpbsSa8M1Z3O0OcpmJzRx5
	uG3YBoIlWwmOp+4pf2HbnDyY
X-Google-Smtp-Source: AGHT+IGMwy6DQKFlVywYqY1p1e6uprSqkxqICel2tbPSMKWFuPJXPyRbKkq2UeKMJs7PxPYan4+ENRZ4rgeXEWRIvrQ=
X-Received: by 2002:a05:6512:3b85:b0:59b:7b59:a4a3 with SMTP id
 2adb3069b0e04-59b7b59a4fdmr3780571e87.17.1768202914583; Sun, 11 Jan 2026
 23:28:34 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-7-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-7-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:28:23 +0800
X-Gm-Features: AZwV_QiB5ptUV19bOdXdm9RPLXnLOlfR_HO5ST_wuq0ulRnSOTzymqRKhyICJhE
Message-ID: <CAGXv+5HtoJbt3QWK2+J5wP38EfnQZGB_KUtc5MBDN5UL6xpJZg@mail.gmail.com>
Subject: Re: [PATCH 06/11] arm64: dts: mediatek: mt8183-pumpkin: Fix pinmux
 node names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_232836_487240_86FDB7D8 
X-CRM114-Status: UNSURE (   6.46  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Change all of the pinmux main nodes to have a "-pins" suffix to
> satisfy devicetree bindings checks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

