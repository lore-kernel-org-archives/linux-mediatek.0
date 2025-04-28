Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9638C369DC
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Apr 2025 19:34:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mfzpR+XCt8jA2E6ve9YtKygB0tbO6iFuLJbvzZ6DwIk=; b=FssukADL4JAz21mu1khpwGD4Wn
	d1mV/IPB1MH/Yrxv7HapSWDMNQLzHLSd2gkDDK+teqg2keJaaK/7Y0KVboxseyNTFKimJRDOxhjpc
	HICZm2k5WHei8yE5wkGJKj+/Ll5n7nLiARvNvbHlEkanjrR+PJNhvZtVsAxzqBxKsRpRuKEE1SQyX
	D/xlOoLNkvpTw7azJ/dGDtas7xvFNlUiHZ7rXCy8d9HH9gzrsr6y/Xv1P/F18z7n0+07xP8xJyj8y
	aNEDMCGCbzPkI/1906+hFWw02Ogxrlc1wYbTB4ef3vmMvmoKu1hqo7dguPjuvgRsiMotZ98A+8AXe
	hjTSQABA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UFj-00000007M3k-2724;
	Mon, 28 Apr 2025 19:34:55 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UDk-00000007Lod-3oLN
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Apr 2025 19:32:54 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso4814685b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Apr 2025 12:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745868771; x=1746473571; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfzpR+XCt8jA2E6ve9YtKygB0tbO6iFuLJbvzZ6DwIk=;
        b=YG3pQW6aMH8dUtnuoq9pMf4LCQSYKKZBlSsnc4QXqEBVBiDbPe1D1L6lr1lRiNQaAD
         kPYCF2BM2akvd7bcOkph2Qyt49R3PYINxX4GU3P+JnJQ88B6jo1NGXPR9FlPFitxMWAg
         RnOwoSE0WZxyg232Ge0AogF1XXzs8tPnvvOyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745868771; x=1746473571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfzpR+XCt8jA2E6ve9YtKygB0tbO6iFuLJbvzZ6DwIk=;
        b=Xr+/nZjxa0GVSnj0ZzL1avwYpktw0J5eYQRaB1ogTbLjJq2dkN6r6qVYzEKLwNApdD
         fkBrcBhGP1IUZJYZP3X9I/lHni+ZjcqDmseOFVFICKJEG37FTo/9MaLvV6TWBsCJ2o6a
         5eVHtFs4lKxVW6ku2xl6OmjFTptGHoywlaf9LOcQh2qFwrbqsyenyOf++k6f4hqVqmHS
         HM0DM+5ggFZO/TkdjYDYgfBpf675i2FhqmK7MmJ9+IF92T4NbZ/Z2tH/HPhpbUhLFdKO
         PavFQGqBFxw4avw73n44O/ZvpF/yc2YnTNXS/cTyraZY/Ktko7NsfTgpcPOSF/RhTBM8
         IVqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHXGwPQUMM8dJkcB9X5REnbRodltNdyGQZ40NkF4bZB/92/F4I9efe96/r0oXUTpFSbpdwFOs/Q1B1BSpmKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx/OwNL/WwOtI9fRhGNW4KCJ6K3aBOIsdfGGgk4T2y3YtgaBYM
	YC8yOrUygnMQD9aSOP3Uutyd4y4UNKkwxThrQIhIRs0EcG7hd0tinUeLaRY3bnZTfMu5OlveXRQ
	=
X-Gm-Gg: ASbGnct/ObRg07qTbFdrELL66loNRVtSp5uGM9/oQG2B9JLIeNsUrp95BKmeLbLqH4U
	5R33MI2fYvcMlNY9XiC2MfgacMBSYwvYAezjcsiMtcGV0yBOPJoneAIcIEMLSBhEbp6YQNQoI8c
	whhFnIYHu3+k3gf5y6sRxxBe/S4WiTAMBw6asvUlNIZUBgaRidUqhwrWqxMTi1jbu+nwpyJe9Hm
	s3RPE6aCbZTz6FEU7M79fexO6VETZ99mzFAx5QqGHhtcQiYNkuibzHCL/ZCTarRvHo35wWYMRsC
	0eipDehcPO4v2kjGu+48j/PT8a1vwipraHxYlY3JxGLO3fafq0G0KVVLSEBLhhbBP+NlDQ6tQx0
	R99EQ+4Qpy1A0w34yErI=
X-Google-Smtp-Source: AGHT+IGYJhPA1i8ZvxDlPFO0sAtXZ52pxkDfXlcsM0ZsEnniHw2CPC+dOw6a86PLJSotHSN5amNE6g==
X-Received: by 2002:a05:6a00:ac2:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-73ff7246ffamr14503650b3a.4.1745868771674;
        Mon, 28 Apr 2025 12:32:51 -0700 (PDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com. [209.85.215.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25a6a995sm8393862b3a.112.2025.04.28.12.32.51
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 12:32:51 -0700 (PDT)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b06e9bcc986so4049116a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Apr 2025 12:32:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW8iu9cVORGocQC5QcMWzKKRq/9Pg377a6ih9oqGHtbelcKzLrIVmDLU4UPJ+/rKSOCcPmzpY4w5h31sksPvg==@lists.infradead.org
X-Received: by 2002:a17:90b:5490:b0:309:f5c6:4c5c with SMTP id
 98e67ed59e1d1-30a01398884mr14674637a91.25.1745868770606; Mon, 28 Apr 2025
 12:32:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250421101248.426929-1-wenst@chromium.org> <20250421101248.426929-2-wenst@chromium.org>
In-Reply-To: <20250421101248.426929-2-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 12:32:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
X-Gm-Features: ATxdqUEnTKoRxhC-TaBEXil7UFoCr2GvfRCzsqwspS2g_INzWAwlvG_Di1SAl68
Message-ID: <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_123252_940301_9964BD5C 
X-CRM114-Status: GOOD (  17.66  )
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

Hi,

On Mon, Apr 21, 2025 at 3:13=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> longer boot-up time. Power sequence timing wise it is compatible with
> the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> enumeration, both shorter than what the eKTH6A12NAY requires.
> Enumeration and subsequent operation follows the I2C HID standard.
>
> Add a compatible string for it with the ekth6a12nay one as a fallback.
> No enum was used as it is rare to actually add new entries. These
> chips are commonly completely backward compatible, and unless the
> power sequencing delays change, there is no real effort being made to
> keep track of new parts, which come out constantly.
>
> Also drop the constraints on the I2C address since it's not really
> part of the binding.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Reworded commit message
> - Dropped the enum for the new compatible string entry
> - Dropped constraint on I2C address completely
> ---
>  .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

