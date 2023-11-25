Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B880C4167B
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Nov 2023 18:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puQH2pOXfnIbSZCHOkkIa6H+MNcLIGSdWyuSjRQdnv4=; b=H7d3baYe9vJdUPcDm25qRGXOOn
	QSHewSg2OfEp4yahQm1vLbznJVWLzCcT8G5EntEll05y2yyw8QT/CZxnW/VxuJNDjpBC88F46YK3n
	3vSG0Faao2PMTDSjErTR+Px/AjBUxcCdw6j74VhLzQ8nCd7i9a6+FjB63tKF5bWPE4XfMG4MKoC8v
	a/asVF9tWfxclr3V8XF65wPIMKtCTjvkbVt/NJ0wUkGOiuY8MzvI67VZ/QRdhmqRazlK8shG12cMo
	HVbrBEJUf6eFGpfc2ydDIUd6DDi4w8bWYP/jlCav8uQUCdq51dro6V8aAS/B0ErSPRdsXQrQyuHPI
	AlQkjbTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6x3t-009bLG-0u;
	Sat, 25 Nov 2023 18:07:25 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6x3p-009bKF-1q;
	Sat, 25 Nov 2023 18:07:22 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-32df66c691dso1878180f8f.3;
        Sat, 25 Nov 2023 10:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700935639; x=1701540439; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=puQH2pOXfnIbSZCHOkkIa6H+MNcLIGSdWyuSjRQdnv4=;
        b=PfdLI1y9uB7ZHm64pTJ7barwt0z2s4JAKw1z0lxCtCByi/yyMD3aRqMwypl/0i8jQN
         1PXcdzXp02v7Y5Kt+hSGxcYVmq+uUShM5KzZVVxE+QmR49/8I5ehOBoMX8tVdDACpt6h
         u5VIQK8ZdZWjJoh/DXLYogjpdEAxOaxTg3QMaHUFrdv/JX17DPfvoeH1BseQIhjP4Sp5
         QEbP8dU+jeGcC5zmuJcp4ibOtFhXO298TsEIQdbttbhkRxd7S6xntcknPkpF1FS7TlLU
         ChEsqj1BSD4op986Fz6x+0TINNpUXFnO/otGzFOeb+43Vpo7b0KoliNn7BU4vAUxkKyA
         vLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700935639; x=1701540439;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=puQH2pOXfnIbSZCHOkkIa6H+MNcLIGSdWyuSjRQdnv4=;
        b=q6lXVpnMQYHfMZuRGucHddGM4Z7PxhCUXIncDVxb8gfHA3aTgGxoW6siYuHZWXoVXu
         fhEZ5050+Iy2iX2cQlV5fzuT2fF3oy6nCTWxcNfpmveJeUa2YHOYaTNSPTYsb3M/bY9G
         d9bqO1UqowSIcL6zYL6FvpN96lo9fKzQJNUXK+pIjGuf0CMehZh/dMR9itT7+pfTZWEb
         rkibnQ7WZIrTsNgOlHP8c2tVxTSDtzwtK824CVQNXgkrAdkQ6kaB+gX1LjyW1r4rCZG8
         E5hinLmXeUthaI+Itq+X/s4BoCna3mKwvQXs+8HhsMKTnOkR82BEBX1c2WQJWjDorK7s
         Ntww==
X-Gm-Message-State: AOJu0YwzaGHgvd+E5S9nYgApDmzR/cW3LrDFOHidrF/Yh/F1HVneLa4/
	HTlhfCWwP4uGyFZCa+CD89A=
X-Google-Smtp-Source: AGHT+IE8oqH78KDfOnat9E+eH4edH5VvXMcZEZWP7aUt5DnBsHQUFMDzllU13QYu7RufzNpza3wkvQ==
X-Received: by 2002:adf:eacd:0:b0:332:d607:a0dd with SMTP id o13-20020adfeacd000000b00332d607a0ddmr5953879wrn.47.1700935639149;
        Sat, 25 Nov 2023 10:07:19 -0800 (PST)
Received: from Ansuel-xps. (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.gmail.com with ESMTPSA id e4-20020a5d5304000000b00332eb16d215sm4100561wrv.23.2023.11.25.10.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 10:07:18 -0800 (PST)
Message-ID: <656237d6.5d0a0220.2c3da.d832@mx.google.com>
X-Google-Original-Message-ID: <ZWIDtR9oOu2BoLGt@Ansuel-xps.>
Date: Sat, 25 Nov 2023 15:24:53 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH v2 01/11] net: phy: extend PHY package API
 to support multiple global address
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
 <20231125001127.5674-2-ansuelsmth@gmail.com>
 <a8ce4503-c24d-4d6e-91ec-d03624b31fe0@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8ce4503-c24d-4d6e-91ec-d03624b31fe0@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_100721_613515_0248A700 
X-CRM114-Status: GOOD (  30.79  )
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

On Sat, Nov 25, 2023 at 06:51:54PM +0100, Andrew Lunn wrote:
> On Sat, Nov 25, 2023 at 01:11:17AM +0100, Christian Marangi wrote:
> > Current API for PHY package are limited to single address to configure
> > global settings for the PHY package.
> > 
> > It was found that some PHY package (for example the qca807x, a PHY
> > package that is shipped with a bundle of 5 PHY) require multiple PHY
> > address to configure global settings. An example scenario is a PHY that
> > have a dedicated PHY for PSGMII/serdes calibrarion and have a specific
> > PHY in the package where the global PHY mode is set and affects every
> > other PHY in the package.
> > 
> > Change the API in the following way:
> > - Make phy_package_join() require a list of address to be passed and the
> >   number of address in the list
> > - On shared data init, each address is the list is checked and added to
> >   the shared struct.
> > - Make __/phy_package_write/read() require an additional arg that
> >   select what global PHY address to use in the provided list.
> 
> I think this is overly complex.
> 
> I would rename struct phy_package_shared addr to base_addr.
> phy_package_join() would then pass the base address of the package,
> which is the same as your reg property for the package in DT.
> 
> I think all current users of devm_phy_package_join() already do pass
> the lowest address in the package, so this should not cause any
> problems. Most drivers even call it base address, rather than cookie,
> which the documentation uses.
> 
> I would then extend __phy_package_read() etc to take an offset, which
> is added to base_addr, and the read is performed on that address. All
> the existing users would pass 0, and your new driver can pass other
> values.
> 
> I also think you can split this out from the DT binding. Make it two
> patch sets. One patch set is about extended the package concept to
> allow access to global registers at addresses other than the base. The
> DT patch is about properties which are shared by the package. These
> seems like two mostly orthogonal concepts.
>

Yes can be detached. Making addr to base_addr would change the thing but
can confirm, any user of the API always used the base addr as cookie, so
it won't change a thing.

Will have to make the separate commit a dependency to this series but i
expect this change to be merged before this RFC is completed. Good idea.

-- 
	Ansuel

