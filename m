Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3AEC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 07:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juAuSH1JPhY7PWUJ70Ld08vmAUyCp8zbapAQIba/lj4=; b=qVPlecBnUXxpSZC4+hAxDS+qKl
	/uh5QhD/oqxLi9Q+0h2Qu19lznOumX1xCI2yay6s/0nswEU3mVQ0UPvYgGA2ZfAF+gGtWY+6A+NUv
	gJP/U/MDY2gWHR8FAxizEo8YJK4q+26lhR6RJFCJoTUIXaqIAIPWtAPgUK3mpBcdHkwfa+7ksQcZD
	ykT8CnayDa+oVcHRRa4pcfUnBk9ttBYphRWS84ggEw03EZm9psW7wHTA1dMPai8BuSXs7QjEY/dM1
	rBqPsDAdejrevouiaY0R7l8gVqdqhWe/I9gsn4aY93k93TgLkdqZ6BiybYx2CsIRJBWcmvbMPwqT8
	UMpic9RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2REE-0000000BsK8-1hpX;
	Thu, 02 May 2024 07:51:42 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2REB-0000000BsJO-11Mq
	for linux-mediatek@lists.infradead.org;
	Thu, 02 May 2024 07:51:40 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-516d3a470d5so9516864e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 02 May 2024 00:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714636296; x=1715241096; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juAuSH1JPhY7PWUJ70Ld08vmAUyCp8zbapAQIba/lj4=;
        b=kxdTUX8uohaf6VlpKLKlno+CXCzDdPgrTNYl6UBbA9VyvNakG8M5FTTHPpNzAPhySY
         Sm78DmS3EwUKaU7p46vamA50sz7cJdUtOhr0AOiMvGVJzyyANcv9tT7us7nlWvQVrNTU
         oYfudHUWt6j8z/CUZVOvCcPrWTSC1qPtTGwsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714636296; x=1715241096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juAuSH1JPhY7PWUJ70Ld08vmAUyCp8zbapAQIba/lj4=;
        b=i70G2OOMaozQBalOz4yIaeXP9c37maebU0N1dsPE/XkAUiidDkslq1YHp07M0Kx1b2
         Oe0xyffwgyReX6dwRRImoX+/biYh6Lzu94zUR417JdhtYKFomagNR5VZCXixmOK9dEUY
         p/29duilH6Aik6tvlHsHTvK6vJnOPlVhYaPZ9sj9wnzHISOW+ruHSBL3VDuREKCMoPcQ
         RmL1ghLxjGoX6plKqHcj8yTBkTxh1ShehMj0t0/BlCG8fOJIW0dq4Avi51eIacebvlD1
         fofw0dEWLMPqSKYD7XKbSj0u1xlfmXo6Shi4c+0tEVeo6wRrll6W/duKgJ87lMmMLm86
         ZwvA==
X-Forwarded-Encrypted: i=1; AJvYcCVxaNX0zB4y92A5y1YcPERpgzVwHbLnvo6lN3vvjFj9D4+H2O6L1TKR7TMqCtonSMPk8WB/7p9I8XKFNZwU+rlA1tzPB4A0UycOxtiaGci3B2Zq
X-Gm-Message-State: AOJu0YxBOtFfrP0ATy4KefAiilvfBl7PGU6eGrzKgXatU9Vr4NTnLqMY
	Tk9m6X2PTFwvvjgZNFXG8SV52p1+j4lJATdUEt19bq0maMC8fL6PtB+9r8SFyloCSbMpcQeXjyV
	xT5UhMmfydsxbysO2Nb+DQrHu38+YehwvGihCArQIlMv7kmY=
X-Google-Smtp-Source: AGHT+IEAVYn1Zg5pB/+HWCfbuXWxOWUqPfY3srDAkAXrE3zW+4aKcPJ8YB092/ynCkhEGaNCe+bioePdFycOCNiVjR0=
X-Received: by 2002:a05:6512:3108:b0:51e:12e2:2a1b with SMTP id
 n8-20020a056512310800b0051e12e22a1bmr714499lfb.41.1714636295807; Thu, 02 May
 2024 00:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240412073046.1192744-1-wenst@chromium.org> <20240412073046.1192744-2-wenst@chromium.org>
 <171322232789.252337.16326980700188367647.robh@kernel.org>
In-Reply-To: <171322232789.252337.16326980700188367647.robh@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 2 May 2024 15:51:24 +0800
Message-ID: <CAGXv+5GroxzyUSQZNW-r9xt6Sgy+EGv3+08Htbb_ZcSRvaBR0Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: net: bluetooth: Add MediaTek MT7921S
 SDIO Bluetooth
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_005139_328669_36A9F684 
X-CRM114-Status: GOOD (  20.83  )
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

On Tue, Apr 16, 2024 at 7:05=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
> On Fri, 12 Apr 2024 15:30:42 +0800, Chen-Yu Tsai wrote:
> > The MediaTek MT7921S is a WiFi/Bluetooth combo chip that works over
> > SDIO. WiFi and Bluetooth are separate SDIO functions within the chip.
> > While the Bluetooth SDIO function is fully discoverable, the chip has
> > a pin that can reset just the Bluetooth core, as opposed to the full
> > chip. This should be described in the device tree.
> >
> > Add a device tree binding for the Bluetooth SDIO function of the MT7921=
S
> > specifically to document the reset line. This binding is based on the M=
MC
> > controller binding, which specifies one device node per SDIO function.
> >
> > Cc: Sean Wang <sean.wang@mediatek.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v2:
> > - Expand description and commit message to clearly state that WiFi and
> >   Bluetooth are separate SDIO functions, and that each function should
> >   be a separate device node, as specified by the MMC binding.
> > - Change 'additionalProperties' to 'unevaluatedProperties'
> > - Add missing separating new line
> > - s/ot/to/
> >
> > Angelo's reviewed-by was not picked up due to the above changes.
> >
> > Changes since v1:
> > - Reworded descriptions
> > - Moved binding maintainer section before description
> > - Added missing reference to bluetooth-controller.yaml
> > - Added missing GPIO header to example
> > ---
> >  .../bluetooth/mediatek,mt7921s-bluetooth.yaml | 55 +++++++++++++++++++
> >  MAINTAINERS                                   |  1 +
> >  2 files changed, 56 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/net/bluetooth/med=
iatek,mt7921s-bluetooth.yaml
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Luiz, could you pick up this patch?

The other one is already merged in the MediaTek tree.


Thanks!
ChenYu

