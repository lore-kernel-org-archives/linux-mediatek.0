Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 876E7C5B543
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Jun 2025 12:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upEgacp7mnJpqnEV2jZLm7bdZrVLCTZ4Uj3awIoWIUE=; b=U8ID0SchARhuGkHUlM377+4aNd
	PrVcABxKgmhq5FAcW0Zb2nCONLkZZMIEOUKRMK4sA3vlr9+AJgw438TcNfn0uisEnQrkSNwyP7uM7
	b2SN14i3xp27XwND0rP072DdRfPhWS7FYFTQx/VaqfJSKrVNhy8sn5tJYuZxxPbNa18q0NMKeBMF3
	RS8w90Fj8bzYpEDQKnqV1ehitPqGOjYkfa36HSVt7l8KxxejtCWNwyaMv/GoReAy77H2ORBIvlaCx
	cJDz3wKWQF48AQamjWY5/zJ1SLEiqK0/o5axUzJ7FBnRcEKGPAjskmcZy2prURRxDrbWTDt0wHte4
	C9z+c1ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyJc-00000006oND-2mKR;
	Tue, 10 Jun 2025 12:42:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxkz-00000006iWo-1IR1
	for linux-mediatek@bombadil.infradead.org;
	Tue, 10 Jun 2025 12:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=upEgacp7mnJpqnEV2jZLm7bdZrVLCTZ4Uj3awIoWIUE=; b=BjtHr57T9hgRpty+m/Nuob9Olh
	0Y5y0h5b3LHXfk9FU46+IH4PxY9wlRZQx84SV268c4a57EXuHt8ruEpKQRlj/Hqv+E0rADswA7EZy
	I0lParNCslGjuxtoDgkFO8KMtvpA/0EZ54ddMUegvYWubCEOOAUbOPRx9e3se2CMs8mg7WiWj1x2d
	n4ZjML5yLwgqPGW2H63b9pkW/4Moe++wYPYueUiCFw4a9IdB2zIHkAqHdelWpqe/LvCJ9ZRIxKFdN
	pRnIeTS+aMgG+jOdQCBhJJqLYgMkYzMRc8ylaKiJU6faCp8GWElr0B6QHFdeQciSidvPqH7LNeBRJ
	jYuB95pw==;
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOxkw-00000001nR6-06xq
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Jun 2025 12:07:09 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-32934448e8bso46596171fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Jun 2025 05:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749557222; x=1750162022; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upEgacp7mnJpqnEV2jZLm7bdZrVLCTZ4Uj3awIoWIUE=;
        b=hDZvqsQ8E94qsSIXnXTv+hRlwEgnNAS9ETdYze6rHvCosG/oKp5tGHQyochHWLKyzM
         z+cgrZ2EVwUdARe5JcnfsLWH5PQtWn6VHar7kbk4V715jisYZGsR7ckTBc07LIXnro4x
         rjrXdyaTuNxrAr0o16blvUktegGTdbNpvbmEZnqWIQQx+s2TyuE4MMvWyIwFTQwUaqQR
         u4MZOx3Q0uQ4fPNUMn7ywH1IEgv/Jx/hSS99T7OYHxw3fcH3sQwc/iIzR3Zp0dYHsR+P
         xE8usEPEND0gBLVL9lCGhjJ58gOdbc10AvvIoSkjI8JA/jM/GGURirtdPJtfvDV9NPyW
         gVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749557222; x=1750162022;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upEgacp7mnJpqnEV2jZLm7bdZrVLCTZ4Uj3awIoWIUE=;
        b=K6hqUFugqgGYMhU1etXt4lHB/nitogb6aHqAXde9v2FImlanZIcMESaK717Qw/8nG4
         i1nAIZ8YNXYM/GacI9uCrzgTVWqZcBcbOwX07VtuejPgFCeMAIjiFrd3mhN1UYGaOOWA
         r5z4nw8XxBagysPZiCnCXFTNAbaNbWuqHpRMPLpL3dzT1zStZnJqxiWze4qjfw6zkrtK
         AABoWDxMdkgkC+8XvBgwDm8Rsh733dwBPwze8Rv8O1K+VYhthMcNB4jG/lyljvItQ2al
         vPscOhBOxMswWecWqKgBl1oO0ImViKy8xzZPs+Qtu47zEzGJM2ZqQmIR8S44XT87Z8S4
         1TLw==
X-Forwarded-Encrypted: i=1; AJvYcCVvWTjvIIzHI8Xj+znJemZwz0QLl3Plfx2EpdAbOabzQFsUqbWep23oneeM5EDy7CFiOiW/fSIhtv8vDplAMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwbtzN7/pH77Btg+67nK69MZ0C2qU2P6g9tJ/O+P3id1v48GoJZ
	mFTS0kWlyToAQFt5V003Gy79jkwI8D9fw7l3SKaoF8dCmQyGhCpgK545sudLy8FzOfVacWVwlKr
	ERTDdamZ1f7d4l/l/pbIDMkk02SVESI+4en7yHWdm7g==
X-Gm-Gg: ASbGncuchaWBs4wIQMptW+8o6XPWtujIsn09PtJ7HFCAaDgk5zfad+qWjGbIWTc1Uz8
	7IbzQdxdmbnV2qxGihS6kPOjwp9YgqDbw1HGmx1d8wpdz1EMc59a7DTZH8Y2Fl5AhX3nxGfkXKR
	VSE+LQxMlpnU5WbkrYaDdAyOc6+50YNTol10E/t/pWcPAiWqDx0OodmQ==
X-Google-Smtp-Source: AGHT+IEqz0WMqtI0x3GGlKwfWemlBSbd12UaQPMKKY+qV7hhxbjKafYK8sYr8Wg2JEL7ScFpC5Ui0NiE4JM2Acs5Gg8=
X-Received: by 2002:a05:651c:220d:b0:32a:ee4e:56ad with SMTP id
 38308e7fff4ca-32b1533b1aemr8972041fa.33.1749557222298; Tue, 10 Jun 2025
 05:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250523094319.10377-1-ot_cathy.xu@mediatek.com>
In-Reply-To: <20250523094319.10377-1-ot_cathy.xu@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:06:50 +0200
X-Gm-Features: AX0GCFuHU7ZhdHSe32gs089Kj2im6LDUCERAjIX60g6Meb5i30AmFDVd_Qjjj2o
Message-ID: <CACRpkdaGMiNwBAa60hFzsboV3JCj=sWVz-NKah=eNk+vVnUHVw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: mediatek: Add pinctrl driver on mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>, 
	Axe Yang <Axe.Yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_130706_192069_284B7D8E 
X-CRM114-Status: GOOD (  10.41  )
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

On Fri, May 23, 2025 at 11:43=E2=80=AFAM Cathy Xu <ot_cathy.xu@mediatek.com=
> wrote:

> This patch series introduces support for the MT8189 pinctrl driver, inclu=
de
> the driver implementation, new binding document and pinctrl header file.

Cathy will you rebase & resend this patch set based on v6.16-rc1?

I think the code is ready as long as the device tree bindings get finalized=
.

Yours,
Linus Walleij

