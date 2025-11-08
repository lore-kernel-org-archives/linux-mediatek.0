Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6814CCFA13
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Nov 2025 12:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZhUqK0vhsnwNkBTiPWIeR9vkRWXucF9aapfrwexWHYs=; b=gA6cvF+4x1OrsuRzgiTwjkcVH7
	bJTKQ0c8S6038M52I8IePkRBMHmtCopju6jSgcTGT8mfDutdCPOAr6ZbaVF0pnlHEG13iTkajfKh+
	2ruvEj+SoNv5LtTRebgV6V3moff0N2zajGsCODiFQFno2Od7x8GwSngec2Db2jhpLaqB1y6TkSeR9
	uPsT2GJHUhWYZwDGRbOv0onVTfi8TApZipTsFWqFXo+o5CvFEOocyLnBrQXOEo/dQJJVXXjDPDNiy
	cevqcgGOM7qVB+apHDCvXhxe9EJ4rbd9uadXSxTwU6txUQ2t5IjYh1ah2dErSq8ylEf/RWrZ9npBc
	0tFq5tOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi5o-000000036xc-371V;
	Sat, 08 Nov 2025 12:30:56 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHi5m-000000036wl-03qN
	for linux-mediatek@lists.infradead.org;
	Sat, 08 Nov 2025 12:30:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-297d4ac44fbso8245855ad.0
        for <linux-mediatek@lists.infradead.org>; Sat, 08 Nov 2025 04:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762605053; x=1763209853; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhUqK0vhsnwNkBTiPWIeR9vkRWXucF9aapfrwexWHYs=;
        b=XWpJm9NHkzPPhPks5NIb2+zugM7JG+CAr72LfgViwiQoC/t3NTm87tLive9IgrYLEt
         EImk3/AC805VDPQV+ynKB/Qm+lTdamiRVwZvprwGXgPzPoe0R5MeNXy9gDS7OwPXXiJE
         esMghM30c9fXlFijjuskGcfgO3lryDFWE3TGlxpgxY/uzlrbzt/Dg1zMrOk8ZnXbwkd/
         SR+YZus4gGy9OM3QI3IFKAOxhGqHGWWJo6nFCUc4KEnYwQyzOB5IgeqyBM4YF3V+Fcmx
         qksMQWQEA4XWBP0jgjL9O37TjwLo6rjtO5z3v/Qu9Y6/fMh+F6fQ4RBN7pKKNxQAqyvV
         EvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762605053; x=1763209853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZhUqK0vhsnwNkBTiPWIeR9vkRWXucF9aapfrwexWHYs=;
        b=NeRon41DmZBIgfwEtCGmv8K02/mAyevCuC7TY4WaQC4aFsci1XRV1szEw0XI4v5+hu
         9k0ldNkQU2UPo56LzKHUsf1sxScbCEfehrTuhlagKLWMjmYADtanb7vGg4PpYyQKA8In
         hIxJ/LjAtBnVHbHfg33cIw2yaI+ncz2wU0nnWi+nP3Tb6ekrUeXECQzyttgpinTZauqS
         gHZvhWuykLnRjgkDdC39rcg85k9Droq4vVUwnXe2qFNNtZ1oNxWhbWVOacPVEDB1WPEV
         3GbQKdEagLLBaTEmnf5nRo/xcP3JfrSjNv4D7BsJApCMoXHy/z2xOMRy4NsEeaS/bsS6
         tILQ==
X-Forwarded-Encrypted: i=1; AJvYcCUALNUysbPEUsBA8L609n2KXcyBRH0FKlk5N9bP8aYsWjHBgDS4Bef2yIwXLub0+uSrZ3IOgNu+ilRQ9GxazQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YztXSlBS+chYo/JBV9lbatiV8MdJBRs1//9o6qZG2EiBPxnFxkR
	hvwXdjAlE0uoZSx8vYQeHssGIFYh+Cz69Ld3/dnvw/SX7mnyLXqWjI8DGHhhnWN+G7a+JP1TJrT
	bpvU3jLIFsxMKmcq5kLvSPPypybboTiM=
X-Gm-Gg: ASbGncuSxf3D6j6L2Hq/HZL2bofOSKKGUGOR1hH5jE++KMHy/S4gKCZHMvt5JIfYPDL
	0TrE5u8KLNdcF8jD+ysOlNF22V1vLWfMQiPpegh4aXpYGgWTeIeyY0P+fH2sp44TC1KywA4cos9
	LsEP79N3UKPKUYWmQcBzZ0jvvm60SLiT1k+6wUFWW1bQaqH4yvjaiyo3sp8Mfb2s383R3OW9eVE
	hORAWErVZD82pvYj2a5ivjdLTkaOsCpu/lGvQYsxai5C5BHgJY9hLLwVxFScvBjksifgE0HbAT1
	z1ujBvqk0dnsmsAUXVlirC/FCVs=
X-Google-Smtp-Source: AGHT+IFggAiteVIarAA4yH7nX7bpSEtb/3RAGcM3xV3yeTnEsgYxWgJ+blB80el3RONC2EPUTf3q2DoKMIlCAJuDAHE=
X-Received: by 2002:a17:903:1a2e:b0:295:5da6:5ff7 with SMTP id
 d9443c01a7336-297e1e3409cmr35315945ad.15.1762605052702; Sat, 08 Nov 2025
 04:30:52 -0800 (PST)
MIME-Version: 1.0
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNS6-0000000DkSV-39Ff@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vHNS6-0000000DkSV-39Ff@rmk-PC.armlinux.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 13:30:41 +0100
X-Gm-Features: AWmQ_bmyclexD2i-9GELP91SUMtxA9fKus1hhuyJQbz-Kh7t3dy3c6LqsK6hIg8
Message-ID: <CAFBinCDf5jMMFbkRCj7jWOSB__jBpQN5FWZhKAgdoELeKwW+Ow@mail.gmail.com>
Subject: Re: [PATCH net-next 07/16] net: stmmac: meson8b: use PHY_INTF_SEL_xxx
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
X-CRM114-CacheID: sfid-20251108_043054_341686_7C2E7E86 
X-CRM114-Status: UNSURE (   5.43  )
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

On Fri, Nov 7, 2025 at 3:28=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

