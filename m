Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AA8CA0EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Aug 2025 03:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1bVscfxC4uFT/CEoA/bhRidOult40TJcVZcOy00MCI=; b=Vz6jq7dCkuanq2ao5ElCGUIBP6
	lt/xx3cjP5oDX2ZyTwAh8MIoVzeOtvoCKvfHlHNtqWUMnNRyrC5zdqcZXh6rtPMimqXVrhkjEc4J5
	bXvDUIInplleFH+9GYAhaAi1DeMCgkpuYlnntxAUxQXWOrbN63PVy9i/N7JnvjV0gmfLO5jsBBVCL
	PnRGipqRSYXgkAp6F9MjvSarJCZYO0U/wyWVGKzGdOIe+4oMiq+mR3UPMS1bDxpjOC0QONaBu8JaX
	Ra8tS7W4Lz4AWdEynalP0VeQ3QyriHE5fig/ehArQ5k1iNoJbdk6KdeUmXV8Y3TQJPC3HVZQqzrWe
	3vN8n0Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlWl-00000001Lhs-2pnY;
	Fri, 15 Aug 2025 03:54:51 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlLf-00000001K07-0Pf7
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Aug 2025 03:43:24 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-55ce5287a47so1451707e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 14 Aug 2025 20:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755229401; x=1755834201; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1bVscfxC4uFT/CEoA/bhRidOult40TJcVZcOy00MCI=;
        b=LPUwS4xPgo9KV8hRYUIFjC5BoxTkS8Iyt+CeMd+BJ4Ct+Bfqj/LG90o/N5ZOe6C3Am
         obL9rme7+s7kR9yr7wOvHC8jmDig/6yQ2RNXDNBopP9CPJaVYqLvghcQS6Rz/ZYhekmy
         AqvtqYWSRXda2aPOcsraz94SlUCXiARe1prUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755229401; x=1755834201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1bVscfxC4uFT/CEoA/bhRidOult40TJcVZcOy00MCI=;
        b=OZ9WmzJDhVCzkkuxXU0noF5UlColkYY5aCW1hZyhzQnpTVLRmoX4iq552eHwfU1+S1
         eGd6b+7hEv8SDDX8SUZMCExmzlBNX6c+jJFfgkBw7xJgqAo6vXHZ3e7IhRrB42QkO1xI
         JQVbei0z/atBUS6BwKuUmzO+gjbGCxdegxzSvVc7dHK3lOFAxumMKUE6eLxlCy3AtmMa
         ohKoKBfQiWbmKt1Z5Erdu3IjDJImHZl3c3A6/tcBN7iMNXajxoBKLAFaJ7ZTqHKU4DeI
         qONSUhELY+htaNO4lDNcd8SSnuDDLf0vfQZ9sWkKnwoxY1itb7I3ihnfpHRm/oeAxaM9
         i6vA==
X-Forwarded-Encrypted: i=1; AJvYcCUuHYJtQrRlktXuGakZIIg/6WmFD/oHigA1U3qvYRvnduKDh83adW+xNE+oSjEWRG5oJb+rCh89I6i4RiM53g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Fzti8GXyEkqewfkQtC9uxtKKsZ0Q/LSWFS/fyWW0K8pC2Pmz
	wNj61wCXJwIMWPvV2hDcjvauz9MsopCIm0JZN5JeH3TMSUgWCbLmBhvHC2T/XHYwvzKsGJ4O80r
	Q6EbVDRIhMB4xNJE2n5mDHa4WJ06cIaAT28p+QSN0
X-Gm-Gg: ASbGncugeq22rRhwlBWzPIPZiyXHfZ04aJX0LcFdWcpmCkDPcp/UrDf93gwUWgfpIB8
	QpYuQ6EcBQSBHJ/OUvyacLnK5qGYpX0oQMjav0+sPFHsiiDKlLdkJliG1lyCUrINB524ClRDpk7
	I1oH14yCvCnH0oqKGOfeMrM4OFLV9KPIqtXYCvz/Hx51Z7yth650vGdWLVMJviMGrbBNegINkxU
	5t7WRzyXRdyiLo2QD0sIbCawdl0pjYD+N6gQw==
X-Google-Smtp-Source: AGHT+IEqCwdjtNotzKv7k6sNon11epPQ9Q7yaZt1pImrKpO8J5PSviVGiMjVATClFXgSR2SA/yoBT6p78Ov7Q+2gotM=
X-Received: by 2002:a05:6512:3e0d:b0:55b:84e7:e14a with SMTP id
 2adb3069b0e04-55ceeb42b0fmr131122e87.25.1755229401420; Thu, 14 Aug 2025
 20:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250805135447.149231-1-laura.nao@collabora.com> <20250805135447.149231-9-laura.nao@collabora.com>
In-Reply-To: <20250805135447.149231-9-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 15 Aug 2025 12:43:10 +0900
X-Gm-Features: Ac12FXzyZO_yczjiRVwJ_XiOUJ7K7LAiS8kN-QE11MKfkqUjTCK5j2sczcKt2tQ
Message-ID: <CAGXv+5FwV1YuBoefMAX1UvOd1=cg9Ld1ZawyNts1BR8YMezhKQ@mail.gmail.com>
Subject: Re: [PATCH v4 08/27] clk: mediatek: clk-mtk: Add MUX_DIV_GATE macro
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_204323_144550_41912D99 
X-CRM114-Status: UNSURE (   8.53  )
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

On Tue, Aug 5, 2025 at 10:55=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> On MT8196, some clocks use one register for parent selection and
> gating, and a separate register for frequency division. Since composite
> clocks can combine a mux, divider, and gate in a single entity, add a
> macro to simplify registration of such clocks by combining parent
> selection, frequency scaling, and enable control into one definition.
>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

