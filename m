Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF86CCD183
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Oct 2025 07:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cCLugtlKER5JKVdxfXmIi5m5k7cSqN7AKwCJ9L732vk=; b=29Cy5aYU/Q4BJh5SOg9Cok+efA
	8imG9roFrIY2sCXgEaU8v9WjJS+oiaLdSH4tKsTfT3DKWpYUU9UXSY5h+StHFIw1R1AdUQthvil64
	4r0UZqLUSK+A2c6flq2helOu76BvWdFH9rJkj6vj2uiHnmPdEM7OW/RamRJisrq5Q0lKiDfkOCJPz
	bjtFxxjuyiLcx6G2n5AtcDa4mD5Ub7wBhdVSRAz7V7V4uZn73YS72G0HibZiPHckJ2GQ9R4jpflLf
	HBHHMO7pEru07X/Pe3G48n63OgKHSgodMSddVql2JSE4n70xRbNLhjQp+lfYvWgui/VorqkLq0Gl6
	MySgYH3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kmp-00000005KJk-2z7I;
	Thu, 09 Oct 2025 07:10:03 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6kmm-00000005KIV-19tE
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Oct 2025 07:10:01 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-3682ac7f33fso8129141fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Oct 2025 00:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759993798; x=1760598598; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCLugtlKER5JKVdxfXmIi5m5k7cSqN7AKwCJ9L732vk=;
        b=bVwXPNLrnCtrGV70wsqZF8oI3zX2WT9cVDX8dmzAaQ28DdTu+qUooRYoJWuAWu04cR
         AYUfaqR4IuCF7qhkwEFgFX/7qqZnvNzmBsdf2GB1af6AVndWbCPJhgeNPyrspCRiV60e
         4wBz1PYcGCxZT9ldEl3/X9YwYiF8sGbwWoXvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759993798; x=1760598598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCLugtlKER5JKVdxfXmIi5m5k7cSqN7AKwCJ9L732vk=;
        b=KeRwky30BEC+Dmp6hLjr5f4y7ZUEZjhnAplvQV58vtWR66ccKTjkysgPNWt8RoI/JT
         YfNid5xcICzbYqmJaM9hQBsdZWe8gqF/yWonAlUftgiZLBz8tdrGrDaetG8vKPdKRuNm
         QdRv6hxdE8tQdsc7rUe3KaQqTflNOq6+gU8SC9SN4Rma1cmu93/AM3h1xZpXQ92twRsP
         h5l8SZKb6vrCRP4upB+wE9zVPluZJBKu2yFdde4lXZhzoE/kMPBMFMQc9BXo0ZEAcnbW
         E1D4SnVx3MNyozHVgx9ej6reU8+0EcXSIj/ACcpE1MkppYlrvW+K+XP34BDD7HNvr5Fu
         Pn8g==
X-Forwarded-Encrypted: i=1; AJvYcCV2cNHe4CIemdExt+6naiBM/yMHB1AmPxUhQsq3whTfHP4XAjc4dW6u6FDnHapsOJT3mxfzdDwuQCG/NaWucw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxP1usbKNldgCqRwKqhZuJPrxvMcBOvdFDePkw7GqwXCCjztiys
	iyD4gU5K1xTdj4Y0eBUSNxiiMNqCsy7Dm5LqJh3x9QHJVQDxG1tlGTEfz+Cv+Ys96Qvv4jz7X0u
	xRRHj9mRPOd7k4WETJGHoKXV9sN6vRRGAmsZ0nIaA
X-Gm-Gg: ASbGnct34g4ys1UDqokn3BmJkTBlW04tbZT62/Ogur622RVwr/LEZhJC7KwgKqCOVzh
	5fUUsoReT3AGVg/XyVHPA/dxQ6R2NndlE2WUIswneDINUjwYcra79Rg6BiCcih2JX1qAUYmK6K9
	Ovejmc3FMtfHWIjRtjiAX0e7tO29sclPR8dZcijmQYbGBSQZJTW2+8Mh7Z1Xx6fRN2Xx8/uFKqK
	4Per4b8AW5DJr7f7Z+4MtpJ6KgYKTen4KtpVoC05U60b3zpHM7XqPtcSkXLrg==
X-Google-Smtp-Source: AGHT+IEJhbj8B5bmWohXhF9RO2rE1lp3Eq4MRp9b8SXg6OKS6nhaW5FvJnYrKALXjGj9kyLiKxmA5YOScYogDginsYs=
X-Received: by 2002:a2e:be10:0:b0:366:ef7d:bab3 with SMTP id
 38308e7fff4ca-3760a2aec91mr17588391fa.1.1759993798125; Thu, 09 Oct 2025
 00:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20251008-mtk-pll-rpm-v2-0-170ed0698560@collabora.com> <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com>
In-Reply-To: <20251008-mtk-pll-rpm-v2-2-170ed0698560@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 9 Oct 2025 15:09:47 +0800
X-Gm-Features: AS18NWBfT_0WimyLL897lV8iBPOUkT6dheJLRJo28H-RJf0AZ4JmglLtj3pPXGo
Message-ID: <CAGXv+5HAvx2uqJM7hWyBpF=wPZLWmCkKDaBnSOsPnU2+YFM0CA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: mediatek: Refactor pll registration to pass device
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Stephen Boyd <sboyd@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_001000_343210_01C17F92 
X-CRM114-Status: GOOD (  11.88  )
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

On Thu, Oct 9, 2025 at 12:06=E2=80=AFAM Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> As it stands, mtk_clk_register_plls takes a struct device_node pointer
> as its first argument. This is a tragic happenstance, as it's trivial to
> get the device_node from a struct device, but the opposite not so much.
> The struct device is a much more useful thing to have passed down.
>
> Refactor mtk_clk_register_plls to take a struct device pointer instead
> of a struct device_node pointer, and fix up all users of this function.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Thank you for taking up this task!

