Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C950D0C600
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 11:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6sRf6jyLr7Lp7D8SrksXFJe24XLraz/lmXNXBNiv60s=; b=owTrYrAbxwnpjWGQDOgIkGlt7e
	2xh0ZdPQ+1ualBfu61i5RG9rhDUV13e051sRiyjUFFilQiz7CG2sYcLSPCO0bTizRSys6cNb2EH46
	3mvtaKfgZieC/781mdJNvjJp+7Hi4cU1NhA+RU3iaBKV5aHR5s80wWVetPPh0T+23lz2UYl1PddaO
	p6HoH7BZpY1Zw+s9na7XdVoV88ho6kbLV32ZT3Csv2oPd4+huuxhlTLTrR6kL925NQ1tB7dY5DH33
	1eSEFESZ7NV1oCj+1HOO2OunW9f1QsDBv1kRN0iU3D3DxLDaAMk1KmuDdlL2GkT6H2MdQv2Aaq2V8
	xS1s7M8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Iax-00000003Wk3-0klz;
	Fri, 25 Oct 2024 11:35:07 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4INe-00000003Ucr-2KSw
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 11:21:24 +0000
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-4a470d330a5so740412137.3
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 04:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729855280; x=1730460080; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sRf6jyLr7Lp7D8SrksXFJe24XLraz/lmXNXBNiv60s=;
        b=Ts1KPcI7H58YDPdKOyB/wHS6oowM9zhtLf7dbz7FnoE8w9mjxjgP3aZGaFS9G8zwvQ
         mEUWKAVxMTqYl1s0q/ySoVJUEQxJLyMytYUHo+YRM2GJNUs5p6wFxoVbijtUNPKbcPK/
         7wUaWMHvUKazcz0T7uJWuunzcAZzP3UuhU2Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855280; x=1730460080;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sRf6jyLr7Lp7D8SrksXFJe24XLraz/lmXNXBNiv60s=;
        b=axBnrvW+GUExUKHwrbvuKaohkYyQ0wGSzhBKrQunvMVHn0h6buYfuS7evD9+NKdgiZ
         uf1NMXwt1s5/IScHogTB0MqB4SVXveP9A4aIyxcDKkmiCHUFmLPV+/Qxx9ybelZMrpxZ
         g2Yai+n0kNbVncCkEt/HTchknAncKvw6brVGQr8qvRZjGfIMbpwhITDDY12Mq2wdMRIS
         bwRAMMauD7UJiObYyCpwHDr5y/WDqyJO0lNzC5t2FxqY+R50okMgYsTHyOh+JPT6hTJb
         PMe++Y066PcS4vzx7sSIiNss0Kq3A7ARm66OyJiZ3gXdU2pL7ga0t5QVZQS5igidyAIa
         Qpbg==
X-Forwarded-Encrypted: i=1; AJvYcCXdvuEgrFUCegR4m1XjTu3PpWQy3uTskBmjbn3F2b88o6Aoq7Vx64x6UCXcRzyJNqsIuRNk2q/kleLeAdoFhg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4emWtOsJxKZ3Ha8aVGNKN7nymEGec6jak94PmBBjTzHlMp8Et
	SLAg3eYN13ioKad+7Q66eNGPTZobHD0DKH3DfRE+S0UyKRi47Z9/56MkdPvjvArCa8w32ieIxDA
	gEQ==
X-Google-Smtp-Source: AGHT+IEy6ad43hQURKOgWUjqSWN8tHqkFg6J00Ssvt9HWZM+1c4urJqTkwQtjKYD4jKYwxmLPh/0EA==
X-Received: by 2002:a05:6102:c0d:b0:498:e935:ddb8 with SMTP id ada2fe7eead31-4a751a8c537mr12193702137.1.1729855280423;
        Fri, 25 Oct 2024 04:21:20 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85580a7bccfsm135671241.4.2024.10.25.04.21.19
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 04:21:19 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-4a47fd930b8so597181137.1
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 04:21:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU1THLRuXbLrUHb5O/05uCDHExHRLUmDTbgesO5G+GgLOpXrsLYI64WETZw4HuNFeLCGqRIyRdps73oIQmdJw==@lists.infradead.org
X-Received: by 2002:a05:6102:a47:b0:4a4:8346:186d with SMTP id
 ada2fe7eead31-4a751cbd6ffmr12043723137.26.1729855278733; Fri, 25 Oct 2024
 04:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241025075630.3917458-1-wenst@chromium.org> <20241025075630.3917458-2-wenst@chromium.org>
In-Reply-To: <20241025075630.3917458-2-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Oct 2024 19:20:42 +0800
X-Gmail-Original-Message-ID: <CAC=S1nip+CN=YEA7qWgZzx4wY666Qpn1-S2yMHw_jQTcjGcRDg@mail.gmail.com>
Message-ID: <CAC=S1nip+CN=YEA7qWgZzx4wY666Qpn1-S2yMHw_jQTcjGcRDg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8183: Disable DSI display
 output by default
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042122_805692_FE10F44D 
X-CRM114-Status: GOOD (  11.36  )
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

On Fri, Oct 25, 2024 at 3:58=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> Most SoC dtsi files have the display output interfaces disabled by
> default, and only enabled on boards that utilize them. The MT8183
> has it backwards: the display outputs are left enabled by default,
> and only disabled at the board level.
>
> Reverse the situation for the DSI output so that it follows the
> normal scheme. For ease of backporting the DPI output is handled
> in a separate patch.
>
> Fixes: 88ec840270e6 ("arm64: dts: mt8183: Add dsi node")
> Fixes: 19b6403f1e2a ("arm64: dts: mt8183: add mt8183 pumpkin board")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Fei Shao <fshao@chromium.org>

