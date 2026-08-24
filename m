Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19BBC5DF94
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 07:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc
	:Subject:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7cAYYs7QCMaFSHUfhOXAYKr+4Ut6/0VfAcoLh4hkqJI=; b=IlF+VEIJ8+eCvXZmFrNONUXW8O
	7Rbt7yQLn0oDU7B7SRHxDUPgqGbtOAoBXuJ0iCooVItqALL5rCSddfX/qyoZkSRO834Co+Gd1cL9J
	ThZzq5bWJPHeV+IfyqyQQiEVBGWas4HVqNKng8dpUABxxsLaatCZv4M8wdx7OQ2GzxyrY5UeA4EwF
	59wYwg22GkgCi3aPBa9JlMf+YeIx/uxOYe/76gIMrNPFeQ3GkLPQqzbqDn99htT6C+ZJyUh1+XgBi
	pJUcFMQNXlPjZ3p9NNrwVVJYqWvH9Dzj9zuz1m58msXOUn93lrhaz1bebbEmacnm7Tp+PmVeY7krP
	q9bowZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyP2I-0000000G4BT-2Wp8;
	Mon, 24 Aug 2026 07:24:02 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyP2F-0000000G4Ai-26ji
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 07:24:01 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so347196866b.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 00:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787556237; x=1788161037; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7cAYYs7QCMaFSHUfhOXAYKr+4Ut6/0VfAcoLh4hkqJI=;
        b=m3AF5Edx5e3wLhm3xNV3ayd1A/hf4apnd5He1OH49GOrcOGKqEn68v7sf9XzUqa8lB
         mwUrlnVebfl6x1/flvISZ+1/Zh54Tal+0XgDZvSqSoXj0zvmZjTHX2en4U2Iw2P7cfXC
         ju2dc5T/gCIFCemWE9is/05SWnfavNx88L5ziPGi7JPQUbOxn1TXAEfAqYcuu1nXtHGt
         DQpIZugrm/oQTbQ9nabgr0cZxd6gER+ukwhV7h83WeSXIef+EsFtOXNQCZt9GEvhqAGR
         93ghr5GSVpWAowr066x1EMPFAzpOuZsBSNY/Cnk4UrHCClJm+rQM4/DE50CUzUYyeG6u
         nihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556237; x=1788161037;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7cAYYs7QCMaFSHUfhOXAYKr+4Ut6/0VfAcoLh4hkqJI=;
        b=JDFhxkiPHd20pZTxCsUmj4LN9aMhM9HnmaF5kBEz+8hneiP0JijGGIKKqG0oYmwmlW
         ZgQ+OJXtV/LRN3LawvZ3PH4Uv3m4Iqv5f0jM9tChgDG7qm19pNICdCpOZzfEhHI9sxWQ
         WDOd22dE0N9ejD0nkKPSJCdbrXC5DW8ScXk2vw+HUJEzGEaigEp8t2SKwVKLwb1KHyAS
         GO/vYvb2wvmEj8eYz0nBcZ+Ufrxv5MrvhSDNTP3v9UAFM4i5sc1e02m97hE/RenbtL5m
         /oG2Hc/TI7F2B8KcChnml9m+h/6CtkRTKvQuiaNrO26N/UHeGyMXoZ0nDuo/OimY3Yuv
         WzxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlSrF/oz48QRqbuPGTFsZNzZetcubRhkLmkGnijtRJ6w7HXZMRiSKZQZU+02woi5p8dyI90NgCHi/n8O6QQQ==@lists.infradead.org
X-Gm-Message-State: AFuF++luc6YSiH9bceDi0YPd7K9Bvxpq2dc8z1SRFrTrduq+Y1pGcYHv
	dxdhbTs9bINmWXbGp6jHBPuy4PiP+qVs7TtMskuoO+RCNOCtofMqJJLQovxm4EdkcOo=
X-Gm-Gg: AR+sD13Mpe5koSlqDasZVPCX9xuv9ThLeZkFQ+2kVYklvkCIcVHPfIZuD5LNZVLQS+T
	Kx2m78WAnwqPxp5NA4PZiBTQAKxj9BJ4B2cSszX1t2s0N9BOK2XhnZTqi9ALSGE7M+1vDrlk0A3
	tozMAh4i5xcp3vlPeOgTYDHqovMzYzj5cdekBXo46hCmKT7OossJQimbr86XXhr8U0+jh0JLwv5
	1V8DYFmmXb0seCVZOEfQSwMtHEVpZBTvkt+JJc3/vsMSYgwsyTSA7krU5W6eIhqTfbMyfpmvIQ3
	IPW6P9sSA436wudbjXzrQSjmMwXDEWyPQK+6o9lHy+DerewigjA1FbsnW0fnkxc5duppkt5GJJq
	hI1QKkWQtI0xUW56IlIvw8LSBikVMiBORk+99xzDwtN2glHa9c1HLW7ilvakWAgj+cwsZ8nopVo
	UV93QXd64qPuPHc4FlTKMzIw+LMXKhH6SvIqVmnk/BD6hOPMoo8JP38lWuGVbxPJW+Zlm9StIGI
	caH5saO8/bBv5nn6o3GEnDZv4DqSGC0FF5qwjb5J6ELei8wTzfGpYib
X-Received: by 2002:a17:907:3d0a:b0:c20:83b1:396c with SMTP id a640c23a62f3a-c246a62b68fmr2605606366b.17.1787556237186;
        Mon, 24 Aug 2026 00:23:57 -0700 (PDT)
Received: from localhost (host-212-171-227-71.pool212171.interbusiness.it. [212.171.227.71])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e199767sm7243944a12.15.2026.08.24.00.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 00:23:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Aug 2026 09:23:55 +0200
Message-Id: <DKWZSTY0TTBK.HRRXYTZ4CBWF@baylibre.com>
From: "Carlo Caione" <ccaione@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8390-genio-common: add boot
 phase tags
Cc: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, "David Lechner"
 <dlechner@baylibre.com>, "Julien Stephan" <jstephan@baylibre.com>
To: "Carlo Caione" <ccaione@baylibre.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>,
 "AngeloGioacchino Del Regno" <angelogioacchino@collabora.com>
X-Mailer: aerc 0.22.0
References: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>
In-Reply-To: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_002359_546749_B9F3A464 
X-CRM114-Status: UNSURE (   7.50  )
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

On Thu Jul 30, 2026 at 10:04 AM CEST, Carlo Caione wrote:
> U-Boot SPL runs after the platform DDR loader has initialized DRAM on
> the Genio 510 and Genio 700 EVKs. It needs the debug UART and eMMC
> controller, together with their clock, syscon, pinctrl, interrupt and
> watchdog providers, to load the firmware FIT.
>
> Mark the nodes consumed by the current SPL configuration with
> 'bootph-pre-ram' so that the canonical devicetree carries the boot-phase
> information and bootloaders do not need local overrides.

Gentle ping on this.

Cheers,

--
Carlo Caione

