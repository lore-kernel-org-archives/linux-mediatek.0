Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91D7BC64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 04:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwsREfLzKNuoHKNJGJ6iVvjj/6dxpXa/wWiq+aOws3Q=; b=vCeHLYhJ7J/FeeRNWA3mBSoWOv
	gMUx3zm4cGiBm8e/wcLGysqd0FxKToOIb7Tey4XXaK0ene0PV7EIyAqoga+ThfVHu929xh3pfL/Sx
	xvDFCFP4Qv5OVh1c73FkewVlxnpK1ihVNYwfNI6akxxUoxEXcixUvBDhdK5Wwg96T+BAGP1g14aWE
	XlNY2XYlLHrbRDKpvjyxp5KHvY/ahMzI2AoQvetNzSUTAgLAdqdXclUkokq52RkHAvgQiRVX0QlQ8
	RmLrpnbJnG9zJgkGbJ7P7DANaSjmdhswmZi7cRBNYR/No+TkZZ7Po94ql7S8pJi6xzw1oI/o27o5q
	GcF5w0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXEFx-00F6gs-IO; Wed, 01 Mar 2023 04:39:57 +0000
Received: from mail-vs1-xe2b.google.com ([2607:f8b0:4864:20::e2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXEFn-00F6dk-Eb
	for linux-mediatek@lists.infradead.org; Wed, 01 Mar 2023 04:39:48 +0000
Received: by mail-vs1-xe2b.google.com with SMTP id o32so17940150vsv.12
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Feb 2023 20:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NwsREfLzKNuoHKNJGJ6iVvjj/6dxpXa/wWiq+aOws3Q=;
        b=a3gecTzILo4UywzFzA6XXXh6RaikEw/YKRyaBgeIOOMjPEbvFOf7aAOe/Mq9fpzGHy
         FfYlwS4LQOXAL4xQ+sHOGdG2UyTEo8fQhglatZHkCeSF5TXhcYX2Y2uRTMTUYxtM/Pg7
         W5//enhVOfpdJrGh3Rbn/9Cg3KaUMtsUd5v0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NwsREfLzKNuoHKNJGJ6iVvjj/6dxpXa/wWiq+aOws3Q=;
        b=IW67qA4rVFRiJN65z1mPRhABPD3yY2vclXg3C/W7gN2xLNoTYSp0gD9hhfYWve3yko
         hRmUiNWW8NyMBFs7kesyO1RB24RjXxRa27FD76iTAdWds2phUd/OmVUl1EfEZr2RFPqx
         C4m+xVgSW7y7h7GHfTjzqS/HBNYKa8C1lRqfFMJvsTSA8FXNqITnl4+9yb4dsgvS5y/P
         eMRPgSe+OcXAAqkSBz0vTsfzaj/7PEui0K3+PH/QPSO3H7ZIRCh6C61fDHNRceEJVpXe
         9sl/AKDEiFjLvsZVjwxee1fQ2YD8PXqd53qMXvtqxud/9faIhGHBECL7aroKqat5XEnl
         Bw6g==
X-Gm-Message-State: AO0yUKUQxATeTYcD2Va98irZCAEbmnVYqgl1nLJV6E9OLoZcv5JZVfBK
	FplvO/4t6nWe7iP6U+IQmmpByE1Pc22a40qkLU5aXg==
X-Google-Smtp-Source: AK7set96qHrtO9E5hIU6PpiS/WcbX+668xtUf+kbQTX5iSHTL+FANLylbrBzA8nGrr2JX/hYjLJn25PCOTFRJBtAILY=
X-Received: by 2002:a05:6102:3c8d:b0:412:d91:5ef5 with SMTP id
 c13-20020a0561023c8d00b004120d915ef5mr11393790vsv.0.1677645585976; Tue, 28
 Feb 2023 20:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com> <20230228104741.717819-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230228104741.717819-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 1 Mar 2023 12:39:34 +0800
Message-ID: <CAGXv+5FVKK0BJHu2Y9ne9zQ043J=AaXyXScMKZcx4ZqZSLyFUg@mail.gmail.com>
Subject: Re: [PATCH v3 04/18] arm64: dts: mt8183-pumpkin: Couple VGPU and
 VSRAM_GPU regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_203947_494288_9F545B4C 
X-CRM114-Status: UNSURE (   7.02  )
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

On Tue, Feb 28, 2023 at 6:47=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add coupling for these regulators, as they have a strict voltage output
> relation to satisfy in order to ensure GPU stable operation.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

