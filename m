Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA028D0C601
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 11:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WI7XrMwtXL077tWZKycguwQfQ38m20vMCPsqD+m+N3M=; b=tnkMigxA22nZNIZIDB5pqkWoTd
	o9gTiU5+nR+2IazUgNUy65cG6weCHHc4LX5ayRuuPJndg05IpX8+oa/ZifZq7czOEO6D3x3Sa1Kth
	vvQUiZou6BGm+bYNcD5xhj8rOuRh2UN81NlYXN4DBhkEzzQRd0BhWrwpZFubhSkHSRTtou3q0Sr2m
	mubyGbQrCp0y9QbrX2dnf/plN3qrR0B/+kPZbr/U9NHr7rhBYNDgbt47jmht23NS7PIJqm7Pupj7H
	741H+uhX5e9EHO1RD7wuw94hQVEpYO5hajusYNKojfkTCGWrzMqPUG2czVEN6KxySe4u2XCm1Bse+
	/3zG3Ohw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Iaw-00000003Wji-3Wcq;
	Fri, 25 Oct 2024 11:35:06 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IMh-00000003UUL-08zf
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 11:20:24 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-4a470d330a5so739968137.3
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 04:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729855220; x=1730460020; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WI7XrMwtXL077tWZKycguwQfQ38m20vMCPsqD+m+N3M=;
        b=QI7ufuiYXYn6l9L1qslSUxaN5m9Cunm5umz1pzInRZBlwBbW20HGMhENKmVY6yldfk
         jOLKEcLwkCWN9uV6iIqiLm/UQQvj4UzQN/t9lo2r/g+/AvD/qkp/64BmsKihTMFr6lKh
         vfTIFlyTnRAJCuSqjZbnjVynrHwHERVvm87dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855220; x=1730460020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WI7XrMwtXL077tWZKycguwQfQ38m20vMCPsqD+m+N3M=;
        b=tbGJwnHDelEYbA02zvoMmWaxZqlBgn4ov8cqRZ0ueek6REsFfeaieuFsjpHcud0tRz
         O7aPTH/tfYWNWbApbRlxACIgYZMd5ATE6qnRVgmV7oHEp7EYiGoUrq2pD687CD9DaSh1
         6ktoTgC0hEJhLhtpQ6G6pp69Z88Wudb7UDZr9TS5X2qN0zKnNSaE/UHLIvQe4mFEIRwZ
         VMNxNkjBWssfM4pDHuhV/W08cZeOSAG+d0TQyZ1OKUVZ3zDRT6DBBKBybAn7tFsYmvit
         L6/15lK7aTLdBiUhJPRZK34Xn4Bzm0kaKQ3dLLG8ALdq6ZKccISLTkJoXN7fiBqPfMlu
         AZ2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVEExaIfJs63B6G+IfzTc+Z22W+2BvOC+EI4rzUeVR7QrkJlVWoOxYYqhRFwqs1gzubDb1C+9FB/dKYgfEFnA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa0kwBSrZh7enLvJe+gQGtIQanXYxfi2jHMX08IYOeRdh2ehuM
	YVNj+JDT9Eo9EqdU0M/FYCZgqn5Tqp4HKEyntCUB1uCkls23hIOJiW341uhujj2hhR5nTiD4ylh
	TxQ==
X-Google-Smtp-Source: AGHT+IF2O7pilmSrAw8+OI/6/LloAvoQyGn3iB74uRhapVmgWKHnfHMrSwSJr6gk3waasjKbxgIfPA==
X-Received: by 2002:a05:6102:dcf:b0:4a5:c297:7d5a with SMTP id ada2fe7eead31-4a751c017f9mr12508896137.16.1729855220352;
        Fri, 25 Oct 2024 04:20:20 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4a8c5209600sm164309137.2.2024.10.25.04.20.19
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 04:20:19 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4a470d330a5so739959137.3
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 04:20:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXx8pEjOsvgCDbdkPMOGMEcqDKZaT6OXMJFjc+9MPqji1hNXW5HQozooRihKMC+MLagDbKMdw4f29w4ZQurOA==@lists.infradead.org
X-Received: by 2002:a05:6102:954:b0:4a5:b712:2c94 with SMTP id
 ada2fe7eead31-4a751bff426mr11555515137.14.1729855218618; Fri, 25 Oct 2024
 04:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20241025075630.3917458-1-wenst@chromium.org>
In-Reply-To: <20241025075630.3917458-1-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 25 Oct 2024 19:19:40 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhPsPRYk_w0n9or7KrEhF_UzLjN8MFCL6xw_FLR1b1++A@mail.gmail.com>
Message-ID: <CAC=S1nhPsPRYk_w0n9or7KrEhF_UzLjN8MFCL6xw_FLR1b1++A@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8183: Disable DPI display
 output by default
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042023_143481_C39294CE 
X-CRM114-Status: GOOD (  12.31  )
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

On Fri, Oct 25, 2024 at 3:56=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> This reverts commit 377548f05bd0905db52a1d50e5b328b9b4eb049d.
>
> Most SoC dtsi files have the display output interfaces disabled by
> default, and only enabled on boards that utilize them. The MT8183
> has it backwards: the display outputs are left enabled by default,
> and only disabled at the board level.
>
> Reverse the situation for the DPI output so that it follows the
> normal scheme. For ease of backporting the DSI output is handled
> in a separate patch.
>
> Fixes: 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183")
> Fixes: 377548f05bd0 ("arm64: dts: mediatek: mt8183-kukui: Disable DPI dis=
play interface")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Fei Shao <fshao@chromium.org>

