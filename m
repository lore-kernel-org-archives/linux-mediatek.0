Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E334BEB64DE
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 05:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkKyun3pACw9OkcAef3QM14XISf5GtqqFq5NzbfLfhA=; b=I0ILjH/mQ3HiYdNYw6soO6+9yO
	m+fREDUEqrkzxnEaDlyDVNLVSoC5StcB2k27PWAynz1N5vEpIc/TphneDdjJEycnE0/osgq1RzEeX
	FYdbixBQVad26iGeHVU9955VNng/j78nG9AzAiDNMf62MQzh9s+H7LUIl0x2SHyNuKQwbG4how/l2
	8tyRpJmmWmWGs6qwmyknWdCjogEYQdmfyVhlPDSzgJ1n4OHQgI3EYwo4BRP9+1O+95m6m9SrYLqOg
	DiBekqcSy8xORLHLZTiUUNBlDO59NtQ75bfTLB7MGBCYelUsuQqJGoyOa7Yaf12zL14/JmkM4RMEZ
	CzBAVyoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sntM6-00000004K6r-2c3l;
	Tue, 10 Sep 2024 05:23:58 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sntEN-00000004J3T-3gu1
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Sep 2024 05:16:01 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-502adfff646so1124350e0c.2
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 22:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725945358; x=1726550158; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkKyun3pACw9OkcAef3QM14XISf5GtqqFq5NzbfLfhA=;
        b=cMZO4oKqVBq7eSogpxlXUoiAQ0zl5ICCwOpQAGdb/gBhyTyCyG/1VQqRQ50C1zC08a
         2pYOu2C9dJ/OK2VqaZRKofLZJv8A3Y7DnPXGv37lGwO6e/kkgKsNub6cCO7R/GIf0Po8
         qcIZknM82GrZrf63gSnU9S4z2PxeCqDK8ya/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725945358; x=1726550158;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkKyun3pACw9OkcAef3QM14XISf5GtqqFq5NzbfLfhA=;
        b=tyAuM+6VBB+Q64ddH7hGpqia/6ysXnc0yiJ608KHASoITW93gusYlSYVKGJdIRte2Z
         QEPw0y/eMev9PizmouWyZOv9F63J1Zt1YvMyuW1PDcTz+h/1nXVAQbU/5yhMjWYxi2Pa
         uDv2qZlh+VdihYuQJ79LLlR7DJtM2Mf7KxBbmAbQU1zgs8qskpmydZJ5ohZDePas2twT
         UkZvhQgPvvNtTiMITGChDKtzKxswyQG5C8VfYjUWGGPWBUipyX5RX72sSyWhCIRNmXod
         whIdW9oBhAF/MXsD3VbfiIAp2xXdfGF+8gil7pvi3JB+/X94ReXiwIaPJa/38IAbme3X
         TF0w==
X-Forwarded-Encrypted: i=1; AJvYcCV76wHZmH1qrl3DNJF917H7SseOQ8HvUNe/x+nv+PgC9qljt38OnIOlbmjTdsE8Krj1ZKdWkHvRlAu/sItPrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsZ0MI+3/81w80Emmgs25sqsSggFcD1vCd8Eb3+z2x0qacaN75
	vJM8aoBfFIkPZ5hR7WPk/fJ/2YRbJBE6Y3W6NZ7L8VHbaIuuzWJmcaZAsH9E/slqY4aWQQkYIjy
	v3A==
X-Google-Smtp-Source: AGHT+IGxAdhLKXL2wQhVTJfiybv1WeISjj2KSax/BCeMD3nSwDM0BHlZLN+bhcyyv56Bp4BigtGspA==
X-Received: by 2002:a05:6122:915:b0:4ec:f996:5d84 with SMTP id 71dfb90a1353d-50207af566fmr14760221e0c.2.1725945357794;
        Mon, 09 Sep 2024 22:15:57 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-502f9a6b1a9sm128186e0c.18.2024.09.09.22.15.56
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 22:15:56 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-501192e8e12so1323561e0c.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Sep 2024 22:15:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWux3OsJyGco7vs7kqLIt/7Qkpy6pqPBp1HsvGf4geDPjBDIYcX4zmJIY3ELnylYeYMjJAk5BX/D1s21P4Nbw==@lists.infradead.org
X-Received: by 2002:a05:6122:45aa:b0:4f6:b160:3806 with SMTP id
 71dfb90a1353d-5021438e58emr15631095e0c.11.1725945356258; Mon, 09 Sep 2024
 22:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240909111535.528624-1-fshao@chromium.org> <20240909111535.528624-2-fshao@chromium.org>
 <b5b540f7-d26f-4529-8066-506aa02a0654@kernel.org>
In-Reply-To: <b5b540f7-d26f-4529-8066-506aa02a0654@kernel.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 10 Sep 2024 13:15:20 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhaNE3qoL=H1cx2XLszLO7EqTHX13KoKwgFENX_=Eqqvw@mail.gmail.com>
Message-ID: <CAC=S1nhaNE3qoL=H1cx2XLszLO7EqTHX13KoKwgFENX_=Eqqvw@mail.gmail.com>
Subject: Re: [PATCH 01/13] arm64: dts: mediatek: mt8188: Add CPU performance
 controller for CPUFreq
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_221559_928235_0072E397 
X-CRM114-Status: GOOD (  12.86  )
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

On Mon, Sep 9, 2024 at 7:42=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 09/09/2024 13:14, Fei Shao wrote:
> > Add performance controller node and performance-domains properties for
> > CPUFreq support on MT8188 SoC.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
>
> Order of these patches is not helping. You mix new features with fixes
> and bindings.
>
> Please split fixes from the rest. Bindings are expected to be first in
> the series.

Understood. I'll resend the fixes and features in separate series, and
group the binding changes in the beginning.
Thanks for the feedback.

Regards,
Fei

>
> Best regards,
> Krzysztof
>

