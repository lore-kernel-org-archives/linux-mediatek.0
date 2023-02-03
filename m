Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A865FC61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 06:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87XVyWNqDZs7OnynGfVzLfoOyWepgm8p9Mf1bGJRDhA=; b=xAuN3eFCAdNGmPuTGYq5CgYVsK
	2CYy2HATMgf/J4TMrMLRJFbhSDfkZUxEXjcPkVDpNGwdVmzQQtsY+nqT5bVvPRdn12utsiWiiVJL9
	5j4riLKUfgsBlOkmkRASLY7L+bzIqsXS25a0IH6gZqPLih05U/Lg6rNtJNwf7pWHhe05lB9SlnUM3
	eM5Qd45izkkHa3pDXKyj2g3+vjJuuCAnQafcX38OLg9rBXkPsZ7TpqY81zlpimyEbmtnbGJBqotfO
	o1PYiWfyWPpLYw33KkDwDUNOG2d/R2xF/u1nNtCItFrLX/k6K/HaCbBaoYlmJ0jfknAm/LNQ8gbjx
	ZwVtTDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNpUV-000Ytu-7C; Fri, 03 Feb 2023 06:24:07 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNpUM-000Yqo-1e
	for linux-mediatek@lists.infradead.org; Fri, 03 Feb 2023 06:23:59 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id h19so4335077vsv.13
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 22:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=87XVyWNqDZs7OnynGfVzLfoOyWepgm8p9Mf1bGJRDhA=;
        b=R+yrD6SZeW3NvQBjviyOyHYp6ou3qyz5Ef+Q1DOKtEcnv5KLX2fJ8IYoW2fAiLuwvn
         M8HpKfYkv6EDwINyv1bjkZVZrUvV6BvZ+S20c8cqG7VvhYupNPsggSIZWCsRApY9lkCi
         ijuc4soU+v7kDYz8Q5eQSBHNJw0OTeMtcIRRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=87XVyWNqDZs7OnynGfVzLfoOyWepgm8p9Mf1bGJRDhA=;
        b=fplG6fMYzV1byLm9ZBvcCd92h5kusjbIy6dLalrccqgyFrlpsX8NVERHm3hXbemRAT
         8tZ4c1a0mun3fD4EO5LNIvpDQCxFfSP7qHXr6v3dxL/eZZVIcdBDH+2UnCusz0OFKY2T
         zmuOtXHIahrQXin0VWd9wIXPJz4fTfsWP3n2MpEl5y/2roGHtVaiXsoF7WJsBnuXXkIK
         E84N4uygLrpMKOcX84K+t6jIatNdXV7/0KDm3oCQkjwMmYIgzDX4KyFyiR2N1Vg1O71j
         i/P8gochNzc2D+FzkRQyT4KE475862o9xMm47cMwL74WruRj8uvjhOd+cyUnfrgNO51z
         v+Ww==
X-Gm-Message-State: AO0yUKUm0ID393Cv58b3kocboK3MjDeNeJbS+mHWUkKCncuVz/UOOhEw
	6bhpbMg80gD0NW69s0V8zMnu7oU1saWUVAavsNAgGw==
X-Google-Smtp-Source: AK7set8tKApF3KpW1F9+oUsByrETerJjqd7LwwHR/1bzmqGkRDHXiULZXnQLIlhRK3pyp8ur/uPZ2RsN4nlsQmw4Zls=
X-Received: by 2002:a05:6102:23f2:b0:3ed:89c7:4bd2 with SMTP id
 p18-20020a05610223f200b003ed89c74bd2mr1649078vsc.26.1675405434514; Thu, 02
 Feb 2023 22:23:54 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-1-Garmin.Chang@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Feb 2023 14:23:43 +0800
Message-ID: <CAGXv+5F-4Tyf1Yn7BYYMkPVyRQffEpx709F6+T65M1J+LfUPvg@mail.gmail.com>
Subject: Re: [PATCH v5 00/19] MediaTek MT8188 clock support
To: "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_222358_095428_944461BB 
X-CRM114-Status: UNSURE (   8.13  )
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

On Thu, Jan 19, 2023 at 8:49 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Base on tag: next-20230119, linux-next/master

There are some recent changes to the MediaTek clk driver library
that makes this series incompatible. Could you rebase onto next-202302xx
and send a new version?

Thanks

