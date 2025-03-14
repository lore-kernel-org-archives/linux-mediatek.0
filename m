Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64493C28B2F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Mar 2025 11:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Tabw9Z4bIh3i478fwUir3sqjYhIhXJXxI7g2bFV4tk=; b=EI1GR2RLWs+C0cvNQ84eZBVhPj
	ud1Axmbjk+Q6EcSfrR/tD+uIL9pKyybreuqgDvafq0m7crOxY2V+8/KTcA+Nh4mNseDVNf7tQE+sB
	/tfKZcgTmJxtrRMNVGro+6q3hGJN3krw+lKOpfj7W6AjVjl1ZKxahm/oQjXHdv3qFqSJzJEtHWLMQ
	zEnjjm4bl3QYTa3nrOKvFmjZ7pj7JMS+2m41kY8D2t/lo4NxHqRRfjbFgCw8rk5wLPObZ11Envhh/
	ERoyeihQDBoDBku741BrSEbax0aLcPRGjKvoxCfWzp5AQOX3lgdNX0NBOkp+kf9BT91cc240QEx9a
	BIyxJfzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2ny-0000000DvpO-2QnC;
	Fri, 14 Mar 2025 11:02:18 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt2TI-0000000Dsoj-47Hx
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Mar 2025 10:40:58 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5499e3ec54dso2045986e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Mar 2025 03:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741948855; x=1742553655; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Tabw9Z4bIh3i478fwUir3sqjYhIhXJXxI7g2bFV4tk=;
        b=mgGQoNNFMBSFlGX7zKJIai6Vz5TIGkC3+i39V+cPP5nWtf+h5g/dbwsMrxaP36sBmm
         WlLuNqnz2ORQNELlITIgNfsi316gpOZav4QECoTcTocmIhFSF0xdF8hPCg9F+vhdpyw7
         J8fklW6hTSL8dXXpfI5GTQWwgcpSTyBRtj/dNPa7r/BUJsQtREUMDvhMbNHK/VmvK64J
         IdJVo02dI6lrCBrvJ2hiZQpRF7rstnroq2Cwr0ZdPYEoCwK/4+S5kgqK5MRTWwoKPV0w
         sjcS60g3qbwhNvXVY2fnKxcIvj50g66l4SdOX+kd3dwFCeMsunrxJuzXe4YDouyz4ndr
         ogBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741948855; x=1742553655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Tabw9Z4bIh3i478fwUir3sqjYhIhXJXxI7g2bFV4tk=;
        b=UnmjDWpUjVTEGCTy3iJ5LWBVtgqw1k2wljcoHy/fTVu43LQ5in2jJ7k3UwH2wm2LRi
         vkX42zf4mSMX8GNFNPSxepiREFc8qCe2ITChyOIE+IpxxJHF5Jnj5UKoscU27a5GfKNF
         o5vSlYMk1YX9DEXjZE8IqkhC5V2HORafuZKJAn65Jd+EW1qW06ZBkhRgN9YD1uBTDn2O
         PUINKBwZe1g9GyJ3sOYqJzBpq7r3en1FSpyWnntSmOFgAwxeSL6ABtmh1KtYAD6XYE+G
         TfZUiPZytil2divy9YUUMyO7imZ5k2l290uMOyRHDqRZRL0YOaxgUxnxOWZ5nxHH4MIg
         J+rg==
X-Forwarded-Encrypted: i=1; AJvYcCXYUZQmzMIFT3dQDrhJKgZxTUFUsv1dSqwcA38UjEwjJKmwedZXW4gq0IYMX50zCDm/jMzG/nS9decvCbpX1Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq/DI5/qZs1Dd7edoZ9NwuvFgrdr69KsSKsfNWtbdiJWlBWQXK
	rigIbzSa6KotyGvE8sSnpzU9cUj7YmEtDQrVXQzcHX19u2UMh9Ul/YZ7gXFaMaV+HDZcvtYg7Pr
	4BiZk3OX+Rat67A6W+N1e4HaLxj0K5m74ljDqkQ==
X-Gm-Gg: ASbGncu//Q2dLGeJxwF1O+jSdsgZ99z/NOJAlW/BNqyqNqQrG/wjyP4MbC5JIEneh4O
	1XWUVnYPIfx3CZusftl0B5HdJLalQqWf7wweHW1GNYy1Z5bDFKzaKO3NmPEobcJPsf8lKYpuOni
	L0a+TosvlObHCFu1rC8ZY1iiM=
X-Google-Smtp-Source: AGHT+IGA8lu4+YUGRbMGDeqXVRC8S3Eh82gixaqk7ULSw2GQfS2l/K24FNsAjmYoMd/QI6TcqRWxeO06lBY+iwQoWKM=
X-Received: by 2002:a05:6512:b0d:b0:545:154:52b0 with SMTP id
 2adb3069b0e04-549c3911fdamr634456e87.22.1741948855425; Fri, 14 Mar 2025
 03:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250307-en7581-gpio-range-v1-0-de1262105428@kernel.org> <Z9CYEZloamPhVdBS@lore-desk>
In-Reply-To: <Z9CYEZloamPhVdBS@lore-desk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Mar 2025 11:40:43 +0100
X-Gm-Features: AQ5f1Jrsfi01k9a9ZZG_NbGUIuQtjx3Ff3ESsGiVH3198fMHG_n5Ix8wLorhDCk
Message-ID: <CACRpkdagLPe8Mt1imjeBhMuxn5rUMMgsF0KceQpGyQE9ECoJGg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add gpio-ranges property for EN7581 gpio controller
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_034057_022265_40681621 
X-CRM114-Status: UNSURE (   7.25  )
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

On Tue, Mar 11, 2025 at 9:07=E2=80=AFPM Lorenzo Bianconi <lorenzo@kernel.or=
g> wrote:

> is it fine if this series goes via linux-mediatek tree?
> en7581_pinctrl node is only defined there for the moment.

I applied 1/2 to the pinctrl tree.

Take 2/2 through the mediatek tree.

It will all land nicely upstream and works in linux-next.

Yours,
Linus Walleij

