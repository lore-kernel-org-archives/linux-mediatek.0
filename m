Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79A0C369CB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 09:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AT3w9qrvqNQ7asAkLzicRanFyPBT5NT85+7uOTViCI=; b=D15RxdL0IOR8nRe4S9ZyrMBg9T
	n7+4+YjgClImMZb+Ex++8SsItBRZmrsQx9FLb75IWj5yVbBYYqxsqlBhsolduA7GI+CZ1r+aOlFTY
	quTT2DdC3ZqHpxQrSm9Uf7ED0Fjyphl7eLv/ErGTMI0D/pH7JDeZwdLM7mCbstTKytIey9UtQjGYt
	9rVGU0Yy5IDw27xna1MYd792Ic+2ZC59A/Kr6N6s7x7NWK2wMtJ+LggPcwyFj6OaohDUQbH9RGfFM
	2wG7Lm5mq15WJTfrquTjJlTgMEND8exYz/Sy4QcdK/nuU5/xnOSMXl/CHPIKU3h2sPUadOaYuZkw+
	mt9U8UKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WlO-0000000A45l-2j6e;
	Wed, 23 Apr 2025 09:51:30 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Vk2-00000009oXd-1r7f
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Apr 2025 08:46:04 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5493b5bc6e8so8127407e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Apr 2025 01:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745397960; x=1746002760; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AT3w9qrvqNQ7asAkLzicRanFyPBT5NT85+7uOTViCI=;
        b=I7XmTEW0db3rtKwVh2gsRm2DCybNaAiTtkf62GuTL8AMWZiUmdxp+cQBWHSXhMJ8Rv
         ufBUvXuPdB/GzbgkAbbB2UdreymKPe0YfTpWtLXIiT1rVywBjYaznD9hPjKVo6r7k4RW
         6D3edZlZNAJUrOTI54CQ+suoUp3IqT9ouZs2lp8jZcICQNVL62PQ/uHygNY4Ye7IGjDV
         rkk8v2MELAAoIjZ15GfbyKiMprSJuY9DFzvK4Bb+JOQZphtF6sbAJcGfdj+bJhnVaLju
         Gng3n7Ut+6dmf9sOaYQ+5vs8Uh6BC5/IXMa6ItDdVc7JjUyJo2doRlJwTPgUosVEB44G
         ey+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745397960; x=1746002760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AT3w9qrvqNQ7asAkLzicRanFyPBT5NT85+7uOTViCI=;
        b=u/lpt3npnRhHLZlt8qoAZdpX0ci7oTYMmbFP8/sN/xQl6ZSrIL/P8evKFXIbzfYYJP
         4Yho1YYSbdx88gn0KDNE1yL7Lc7DuVdaokMmeIzDz0+KHEc06EHRm0YcX8P1cwyvtjA8
         gtXO+A6MUMMcVA1rkP4hjkJn7bXhj7uNjmZLWJ8j/Np5uxNG6WAGk1oxgXf/LZtMbOIj
         KE9PYN2OEZE1FG++9ewBDtVdBTcdCmQHs0LUvC0GT60wu0K3W4Gq5KzF1yZzEEoMMD1h
         Eqcl0UdCVzsMEKiRJaS9nmT/zLpOhn06iZ5W3KTarJ88Q7YlyFDOB+hFMlXoDIot29sH
         MF6A==
X-Forwarded-Encrypted: i=1; AJvYcCUvC0/GKc9yhajB6b+hT4Kulo0L/s70I7QlU5dxGcvSUVSY71Fp1EGtZHfzfkNa+3gsDelcIJJvs8UXfR3JNA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3gTgKsDZXsBW+hA2rkSEPhUlSi6phOCLSKSV0njHyr3QHkOK7
	BVDAd7MINV4EIuRKe0WU/mNiglY0jk/7EQhi3TgTGJLT2eJ7H2/dc8sz5jyRBtJHDG6AKKt39xp
	X32tXFWz1eOprd82sMxkF3aV3ki02Qzhjb+Q+xQ==
X-Gm-Gg: ASbGncvX6maZiD2LqsZfvgBhO+oWwb1SBvEUOZJ0ZjhpuEQIavZYpcHba9q0fi4QGDA
	kOf0/Hius2m53nOpWsSg0Jjjnn7ADyTmrba56TnZ4OCfZ0/sBia484nylXeYwDbXTQWZ5NuROVb
	8ZfSExSgiNa2iC7S/b6JiavA==
X-Google-Smtp-Source: AGHT+IEM2sVrDJg1K3kkQKCG4hk7fklAp9PkKiypjTL5amBPKHe2ZUe0WuA6o3v/r3NttNzUZAhfuvsRPZ08Q44dSBc=
X-Received: by 2002:a05:6512:3b93:b0:545:154:52b0 with SMTP id
 2adb3069b0e04-54d6e62bd7cmr4837714e87.22.1745397960493; Wed, 23 Apr 2025
 01:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250422075216.14073-1-ot_chhao.chang@mediatek.com>
In-Reply-To: <20250422075216.14073-1-ot_chhao.chang@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 23 Apr 2025 10:45:49 +0200
X-Gm-Features: ATxdqUE2HM1GEgTnOYS1QVQsQ7fnZaFaPHwIcG2bQqgtWcyPZI7J9UPs7LEWcpg
Message-ID: <CACRpkdb2shemvCLHuvKvSo0s62-=Qjmpxb-aTKjc_CEoFecywg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix new design debounce issue
To: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>, 
	Qingliang Li <qingliang.li@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>, 
	Chunhui Li <chunhui.li@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_014602_502109_4DB3157E 
X-CRM114-Status: UNSURE (   6.91  )
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

On Tue, Apr 22, 2025 at 9:52=E2=80=AFAM Hao Chang <ot_chhao.chang@mediatek.=
com> wrote:

> Calculate the true offset of eint according to index.
>
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>

Looks like a serious issue, patch applied to fixes.

Yours,
Linus Walleij

