Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DBDCF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 10:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5GXWrxFCux5MYHjtn40XJVN/g1vrOfIlhTBREhsD1o=; b=QTCI3kHW01N6+e9m9uXXiY/ps3
	ghbS92ZRTsX4Vxk1jHq8j9IQtiUKEHi8soBh/MYiqFh6x9g1jm73yjR2gQVYMqGFYQEQeiYbqkQhE
	xF+b143zMVphVSHtG/PZXJAa/JEjwAAROw04aJRBRUVkUn+LlJZmjuRS7dL7QqGE7wXKIMa2IeatO
	SGP+XjXOUIGLknNR6fo3eRnwcCm657oReomrKnBbM12Yy9aAXWwL8JpeU1tclCpW9WImbseS//BYH
	h703EpxLkvhAVAHt77OXIoj2J5piznFcVpFmk048JNAnA0ib26Ie1VTAUenJP37rDDVjuSoDaE0Jx
	QkPqugEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssg67-0000000GwlA-2q3r;
	Mon, 23 Sep 2024 10:15:15 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfzx-0000000Gvgm-2ulo
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 10:08:55 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-501213e5ad4so3103516e0c.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Sep 2024 03:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727086132; x=1727690932; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5GXWrxFCux5MYHjtn40XJVN/g1vrOfIlhTBREhsD1o=;
        b=NUlD8mcpxK+OyhfdS3Opqvuawvs8fvt3BLtppcRBRgkNP0Y2okS/tgS8ig/B8x+EmC
         Nm+nWD+od1xYo6PNSSlWimSPKlKxiWtPA69X4y0m8D3/1O1TQchokUQclihv1m8YCpTD
         o7doiVggzEGtz1lQJBp4lkP3s3wQ6KhGV6iUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727086132; x=1727690932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U5GXWrxFCux5MYHjtn40XJVN/g1vrOfIlhTBREhsD1o=;
        b=YwFilr9gXYiwVHdAQs9plYXgxkGD794eQGac5yays+yLB3zz8z60PMU5RPx1ery32f
         WZWJl5G2c0zuNRcEPoc3joP9dRtHug2bhIoYvIeplj89SK0LWShZDb9LES5tFgOrVbG5
         NCK2qhgVBR/7x5gToFwqecbdEzAZMAMS0oaFFxQwSmG+bb432MvjzHEEOPWwzS/UYLo1
         7AldvPiKHo/lS5VfVSquF8S7M6gpTdd7OcQPr7bHxrg/U0uJdGjmC4S2a+S8NIt23pPr
         +XBfCu/aSrQybqJCaSzoOMzZH+1kmTwLQaXGTJ2wCZCynJ6NdE09+CQDcOLP5u+9d3i5
         EyPw==
X-Forwarded-Encrypted: i=1; AJvYcCU1daYYuxVdMbnyWxSiebY5u29a+L7b4FVPBShOxJeIqDJEHkdiWf+/w2yj3ytkmshh5vGQS1ahA9aLz2bbMQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBW3x626b/xnVUWFflGnvxpAlOEv1xVsQ7jPTkXBVRMvpt45Jk
	Ibsf5IG0jhisZZttdvHH4FYhFX1T2LmWGWDUAm7KxagIAsK5udVxlhaSKBgs60Bqht5YxlBCf4k
	=
X-Google-Smtp-Source: AGHT+IHkew304VGY0f9MD+m4PDHcv07wVbBW3Ki/NRLVHpFTibSZbZ1Fo3MXrB3BNpmjDcu5Ekt+RA==
X-Received: by 2002:ac5:cccb:0:b0:501:2221:a3c9 with SMTP id 71dfb90a1353d-503c9a096dcmr6051178e0c.0.1727086131845;
        Mon, 23 Sep 2024 03:08:51 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-849397e759fsm2903512241.15.2024.09.23.03.08.51
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 03:08:51 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-49bc1b1368fso2019222137.1
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Sep 2024 03:08:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXJrvKf0Kcvzcf6wvqiOccPaDNUwUTrw/vvf44tG6lIAdd9+rSQ2Iuzf+ltZTd6TOxaZ6VaAYIKgoxjOFesZQ==@lists.infradead.org
X-Received: by 2002:a05:6102:5087:b0:49b:dca1:15c1 with SMTP id
 ada2fe7eead31-49fc72407c5mr5952529137.9.1727086130667; Mon, 23 Sep 2024
 03:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240918081307.51264-1-angelogioacchino.delregno@collabora.com> <20240918081307.51264-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240918081307.51264-3-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 23 Sep 2024 18:08:14 +0800
X-Gmail-Original-Message-ID: <CAC=S1niSEG_9kFDBGL+i=MjqvfiuQBmAhv+7He9A3_7PXUi8Gg@mail.gmail.com>
Message-ID: <CAC=S1niSEG_9kFDBGL+i=MjqvfiuQBmAhv+7He9A3_7PXUi8Gg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] PCI: mediatek-gen3: Add support for restricting
 link width
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com, 
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com, 
	robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_030853_757638_E888DF7C 
X-CRM114-Status: GOOD (  10.06  )
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

On Wed, Sep 18, 2024 at 4:13=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add support for restricting the port's link width by specifying
> the num-lanes devicetree property in the PCIe node.
>
> The setting is done in the GEN_SETTINGS register (in the driver
> named as PCIE_SETTING_REG), where each set bit in [11:8] activates
> a set of lanes (from bits 11 to 8 respectively, x16/x8/x4/x2).
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

