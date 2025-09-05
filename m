Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92766CA0FED
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Sep 2025 08:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OyKNmBG7aY30CUsH6LThft0vL3sOjRv4PBRyIA8/9NY=; b=tvE3jPTUuiCBi+4xspO3ZpZ4Dm
	anMjEXNaG6FrGET7KwpZRnr8nnu1ZvsVXfMUji2EyMbdzMWHCBlgfEZ0KlXhsLze4vr5kgTwz0B1l
	wPbhDIHrvN91urISvK+VOJVAzTS8cft2mFHUVsvfpwf8x58/dc3PvjuVsdjDy1vDs3wi8Dw0+t86M
	B7KIVZkLHLTpKBQeYtR57e7XAMSIqEBZz6b326OL0zcjwKvILfZLPr8H/NOMElknS9fCLqaG9hL+L
	v2Moi7wB7KdTVpM5v8PUHuv5eYohSbGMDsydDqM9jpCu69R6ZqcIA2fk91KKwslbRirApntpTE4WW
	IJTN3rrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuS9t-00000000UVv-3hhn;
	Fri, 05 Sep 2025 08:51:01 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuQoG-0000000HahP-3Cqg
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Sep 2025 07:24:38 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55f7ad815ceso2068527e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Sep 2025 00:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757057075; x=1757661875; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyKNmBG7aY30CUsH6LThft0vL3sOjRv4PBRyIA8/9NY=;
        b=V7Sermg6XtTM9qTfMZ+R3jKM3CN49UkVGOBYLKE8xRmWU4UohceSU0reRe9t/+u5gV
         4DeDShfDCn4GNPh+6jswH54us9ORMj/nBk3WZHLE308naCT0jQwEOZrGnK0MW3R68fFL
         uUr2WuevVHu/3qoLGg/Lj32cat0ahl4aj2U64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757057075; x=1757661875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OyKNmBG7aY30CUsH6LThft0vL3sOjRv4PBRyIA8/9NY=;
        b=KWR7e1CqX+C9Ty5T8WYEsuJfd/JVEo51CZxyVyIa1MIrMaRxr5NNx58qugOgCv3d7Q
         RDy519va8cFz5DsEdh3RyR3SHo+G+nGoKK4VxDLD3OgIomGRxM1jleRuX5R41/PxwG9k
         j0NT/bfj/Pf6ZaR1tROgkH2lG+mVO6tDQEDRfCNvDdRra5PJq7gAsfFgkmtQHWfUkJ55
         xryCWehm9Nr3kwamL4Mkxjoha/sFbWJ4Wp5O7hU+84sCbvSJKVT92RIA45cMvQG74p76
         QXVgZT3aZizsbxO5l5S4D5ExI9ySKVLqEOI+1SJCUnYkC1PHR7XJIzDu8VuZTgKXX5eY
         22Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXdPRIBtfujPtWWFQ7I3zW8XcNO2ODj/0yawwJ+g/DCoCZnP5FekYvb2PFya2UUgn5/3kpjgIh4mqk00r4ixQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxbTO3bwKAAYvGGu3hBjdV2CLZZc3oNGGzB+6w53wr3XHP/HGo4
	L2+Ko9DfmVOyt4Nn2AEVu4YffHcX5VXF0gDHnVX9ka8/eCyGTI+2d2PAQkfMphPNldiGglbVi1c
	wVhnUsb3FGR53dEnrKY23MNBE7k/MFeq6d0vCL4v4vBCdGs9lDcrYzw==
X-Gm-Gg: ASbGncv20NjHmnKaKIL+NVrFMWejS02zeVYX7qqTqqveQqtVWR3JXWJ+7fBBJ8ojs+6
	2aIMcRAiC0RzBboFaWH+kIoFOFoYcX4Orva+tJpVEEzTqqGSKkpQ0DZNvNA+JiQf7UJlUFEF1gc
	sNDRabvUT/JBq1fUx1y3Mk3ndkJoiQHsORLxhL5MB/wQ4z0ylls12Qq2AQ5d8ADWeW2yr2gWgG8
	hHvzWsNJHhnsbuaRkE78fkz+JMGhjJNfoTff7yuOjhAfWOh
X-Google-Smtp-Source: AGHT+IHsGV8p2LrSQ+5ebPuG3MwZsxnB0+XdK0d6HB4AboER/GhIXoUDzaGFZTbCNnePZ5YQiB7vHJZTSeMi3MgtzZg=
X-Received: by 2002:a05:6512:3d11:b0:55f:4e8a:199c with SMTP id
 2adb3069b0e04-55f708c2538mr6024739e87.20.1757057074896; Fri, 05 Sep 2025
 00:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-17-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-17-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 15:24:23 +0800
X-Gm-Features: Ac12FXxXPTzm9nG4j13NbvkvAJ8eK4LgCQVwRNdKf80aBqhtT_PDYtc5qR-IPds
Message-ID: <CAGXv+5HjrwPJBC-wina4ZrQe_3FBWcyZc3e+iaCCmNOKfMicsg@mail.gmail.com>
Subject: Re: [PATCH v5 16/27] clk: mediatek: Add MT8196 pextpsys clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_002436_830610_A153F961 
X-CRM114-Status: UNSURE (   6.84  )
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 pextpsys clock controller, which provides
> clock gate control for PCIe.
>
> Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@co=
llabora.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE remo=
val

