Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC8BCCFA18
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Nov 2025 12:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xzpprXbiGBlRsIHbzms9s8FVApMbHJGm/eVCI6hf4Q=; b=CSlso426XKgJU+NPpvunhENyA3
	7OAOxiNOOhyZ5+QqF3cuaeUECLHtugsbQVUGVdksxrPAmi9r/gHIfWQR3kv/KsQ0hm4eDpzctP5Fi
	Zwkd5lu4p4EzEVA/SkYUJKs0DYKj/nUrdWvPIX1d0gkCxtv5bWmB5esut9k3LdL2VVnwpxewiPxLM
	L6iqfCJ5uM7qIjVMsn3dkvDU/qiyP6TvZr3AkD16fevPW0PprFbuAPzCwHtPsJXQT9ys79wIW44um
	OXIFdI3QSWFUHpjvBW8Zk1UOSO86zjSmlAZRtjP5iu5XXW9WDrQMdnMllJi+l9AAjhJrf+Nuqjffe
	WKLoyKnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi62-00000003726-31UI;
	Sat, 08 Nov 2025 12:31:10 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi60-0000000370m-08ai
	for linux-mediatek@lists.infradead.org;
	Sat, 08 Nov 2025 12:31:09 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2957850c63bso16058705ad.0
        for <linux-mediatek@lists.infradead.org>; Sat, 08 Nov 2025 04:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762605067; x=1763209867; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xzpprXbiGBlRsIHbzms9s8FVApMbHJGm/eVCI6hf4Q=;
        b=X4Dr+pkbxK6mPAb21GwdJxmUq4lxC+WL176LO/GZFBG+yIgj3/vnS8NBxI8bpKutwh
         t+EN8YVBdnLUnj+3c+QNDdlMIeJPOCoqJEDWYdfqG8qePxyHp2xYKozcNAP1G78xVANB
         k6UbxZnSoAP6PXkx3w/y6Yyo+rwS76SDrFb2F9wqU+dJXYfEXMRt8bhaOJ9G9F0SsCXL
         FtFqFilwD3IeInkrbfcbnnefruC8M3EOK4AWmvhukMwZLQL++asEkcL9xEFyw+xAZCwO
         KhEjAr69GIHnGBcZY9mBnuUiUxezqOD4mODgNAqwYQXq95lqWyvxp5pBJWi0JQtl5cn/
         2qbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762605067; x=1763209867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8xzpprXbiGBlRsIHbzms9s8FVApMbHJGm/eVCI6hf4Q=;
        b=V7tFjVDPF1sRIPxI6cRJPi5Ta+9wML+iBPgM98WfzMJhxrSwnjx2Qc1JqwTi6GjOWX
         MqUCz6GjQgtpcLQEL8UFeBZQelL4WluGryUQ+uIKCjqTqF5DDxSQa7+vrrE6bvTyYa86
         p0xsFrZoODTQm0Y+KQCNIIwZ3xlJ/qVAuvJxdMcUA4WDsKanyEGzd0gdZ5XFGeqnMRFv
         X1X6qtYrvT1XI+OsCCCvCmjv9M981U/NewC7CeWe4TlT7qMrMLMmCiaj5zuioy39q12N
         z4Ymi0aL49KLTP7/u+ANbsop4WInSfMVk0mskeeUeieg7yA+KJOZ86jPkqrI1qE3XdlH
         v0Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVVMCHUZwdcT4aavQrsDAPYdGd0LdT6KRkHSU/PnH8Sy48Om1TI2m5GbGf6TdAGHtUXzKjoMldV46PlHWgPJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwohLwYfFh+KqKSeUDkEFZlUq2tRwzm7JwrUQ244zEJuYQw4BD5
	64U/m4qWVaiCQWjnTRlGfG5BiNPb9G161LdK/VckvpgnTLY5FHAxw/JEg0IDgunbLTXNJ9Ujjpn
	lS62fAwyVqSYXsuLatDEJTqT/Lmfk+40=
X-Gm-Gg: ASbGncuUQ9bmZ3XfN6H3c+kgkzRIUI5oE12olyg5V7qsaMRFFP6rOd7nevbI8uuUFiW
	YgUR15YII9syQUvP2NsSWjU9IriJByAcOW33gCm2dZThDLSjJmSMkqoy5Xtuq/GwWltl+pevOhH
	Lzdeee5Wh60lmdBMtGzVP0GNCqAsbpCDmzhZC5xjw7qsWgWlPUCrPlr29C6vp/ow/ehp7ZoPNiQ
	JO+LbscDXoydLpeANADeDdSpDxnxd0l+Fmp8l2o3Tljt7AXN/IWZ6uW5TGWnoK5Ezfdgqm0erJs
	EiKqr/d3atcIY5Mw
X-Google-Smtp-Source: AGHT+IEuHvgMZMmDRNRPAfeOAymHEAn1hYvpEGWDduP2LeVblYn4NjcSRVQL/UdeJaq1Z4u9o2SDmDIZmKAPg0jARQs=
X-Received: by 2002:a17:903:3804:b0:295:5898:ff5c with SMTP id
 d9443c01a7336-297e1e3429emr34741885ad.16.1762605067406; Sat, 08 Nov 2025
 04:31:07 -0800 (PST)
MIME-Version: 1.0
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNSB-0000000DkSb-3fWL@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vHNSB-0000000DkSb-3fWL@rmk-PC.armlinux.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 13:30:56 +0100
X-Gm-Features: AWmQ_bkQCCCHuH8ylnNhyHhFQTUKFqSEN4LNOb9Me0YP6OYeddbK-4LWE8Q83H4
Message-ID: <CAFBinCDf4rHs-Q1ZVo_WqF1r8_aLJ745B0tG+=6NpmbBOe2c9A@mail.gmail.com>
Subject: Re: [PATCH net-next 08/16] net: stmmac: meson8b: use phy_intf_sel directly
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Emil Renner Berthing <kernel@esmil.dk>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	netdev@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_043108_340160_EEDD6AD3 
X-CRM114-Status: UNSURE (   6.86  )
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

On Fri, Nov 7, 2025 at 3:29=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Rearrange meson_axg_set_phy_mode() to use phy_intf_sel directly,
> converting it to the register field for meson8b_dwmac_mask_bits().
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

