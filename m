Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E774DC46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 08:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D2KLHxUvH1e9UbdSzFKgZ7dGDdou3BHugEdao4BYMGM=; b=HYKujC7Pht1fK7MfjVvrBEZ+Qe
	65sN86doY7DYgIEYoLuSWekb9ExgsJFszRWm24WliohZmE4xzluaue/AJrW04B3Hj8Zbsc/6u2ysY
	ltDwSfn4283qnFNawax3KTEDTt10KAGTcBFff4a55l1mQ7xyTkhQpPwLk7G+ujDjdydlHtV6+wPsn
	+3v55U1/mmZYbDV9EA4snF1KZ7wIgxeM5jZSX+FiUBYkZWghF2Bo1IZb5z+g9/22+kCbalLeS5K3d
	TL1J6hov6e0aJNimXtEwWydxAB9xPMe4+991h7RN8LxK3ik2+qf+Qx4Sqi2dSObOYURfUN5Fa9TiV
	7XNBCLHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9dK-00EqVk-2d;
	Mon, 18 Sep 2023 08:29:30 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qi9dD-00EqTk-13;
	Mon, 18 Sep 2023 08:29:28 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1d71102a35bso392571fac.0;
        Mon, 18 Sep 2023 01:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695025761; x=1695630561; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2KLHxUvH1e9UbdSzFKgZ7dGDdou3BHugEdao4BYMGM=;
        b=PVuPA3rYFX93IU+08Db4IEN+4b3HrPr4yNai6IcSpMsQB0yso3PM8K5z5fSKdvXOd1
         DCK4Epso4X4MSQSgg/pXARmX6ueQ/5VDuHaAqIETx98IEUMqkK90goEisOcB/SJrDEJe
         Dcw0uUBMcyOB/DmMDRzBh4N9eXS+JJTfkRC4G5C5tGdQCwAjNBi2hn47nmhqggyDTyqg
         xbN8j9x5mPBsMYpzNJ4/lV+sSpjyUlBM7BfbCghqIQ/yQbyd16L6slwNCRiLID1/ZCbo
         Uyfds2oNPsmyT1xuVbEWSPUyUwdkP/C2+GMOqoRrBuNI0howjAXVpEoo4ea0NlUKSDCo
         mkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695025761; x=1695630561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D2KLHxUvH1e9UbdSzFKgZ7dGDdou3BHugEdao4BYMGM=;
        b=j/TGtXpkvBInkd4B71pClTK1THjoJ+3GrjCZm7yvwUsr7pmyVvW47WTfDy96rrtzGT
         k2j+iMvx7Gf2gllh/Y1ForvoYqVX1ei/qb3gaVZRjZAx2D7QopjaM0S0RBLA1Hs5DJdc
         8FKSxmlXBmXGVbk3aa2uxGhgHk9vj58DbGsFuzqVNdoxIOOL/CD5swefBcSYCpg8qUHX
         v+pxx/i+RG/gNVu/1Ibf490RNaKBIdQ4r0YuPPPV92MATiSq1GzbI1jjRMrenIvDle9Q
         RZFpQWri2J1/4PD76Irgq6exFWVFixakIaINghweBGOXCP1pPn2emCyQhngylS/vSyQ9
         qE2g==
X-Gm-Message-State: AOJu0YyoXfrb95qm84QSCyYChdenEaSTKS0Va5y+KGhqzQLk2sy8zgYy
	SgPgWrOR66ZRL+nvoTcM/WR8mKIr6hsaBlmpgMk=
X-Google-Smtp-Source: AGHT+IEL+QB/e61Xbx1MH5Fw3wpt10ePZoSoRShIiMWwnl4oYmopgX9CjPD/wm6sw4txYnkei3J74yBAixsu36G+RQI=
X-Received: by 2002:a05:6870:1604:b0:1d5:d8f0:7d7e with SMTP id
 b4-20020a056870160400b001d5d8f07d7emr10719259oae.53.1695025761373; Mon, 18
 Sep 2023 01:29:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230917103753.52644-1-arinc.unal@arinc9.com>
In-Reply-To: <20230917103753.52644-1-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Mon, 18 Sep 2023 10:29:10 +0200
Message-ID: <CAMhs-H8Em_ZKzuewLJ_0krwpXUr5u4Df5t=2V5-Wk9iviJW4_A@mail.gmail.com>
Subject: Re: [PATCH] mips: dts: ralink: mt7621: define each reset as an item
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_012923_362127_BCB53F84 
X-CRM114-Status: GOOD (  12.37  )
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

On Sun, Sep 17, 2023 at 12:38=E2=80=AFPM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.u=
nal@arinc9.com> wrote:
>
> Each item of the resets property should define a reset. Split the item wi=
th
> two resets on the ethernet node into two separate items.
>
> Sort the items of the clocks property to the same line as a trivial chang=
e.
>
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  arch/mips/boot/dts/ralink/mt7621.dtsi | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

