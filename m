Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27DCD2F7D5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 05:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6V6eNGdE0SPvqcSpqgKb+DQULJcURDQCfkY0VUPRIas=; b=EnuYdIOgL+SCBadK+7BHvCbYRz
	+C3gb+wz6SR7jOvSUP07XaXInCdYk8+8muWoWdle4ikdmOgLADtvzrraFYaxloNywfnszJknm2fae
	LUrOBPUKkZpltZzCRm8MLNTpvR3ERHtZwvzIldk1PjbgbFVoqRKw1P2mT0PwWRJLQ/82BBwfpXdG8
	qvSGvAPP+VTdFMQifkpmpp/5LSl+6TH2WAAI6tC6nDZ9NxDuFCRj2xXjUR2xyl0zq66946uSi2PFz
	r9AJDgKO85QwPlzhvvvvEYsge0xiB79xmhVQVinfe06CXw91wELNTE6kPOFp2u4RIdosCB/9ply3K
	cMG3YOBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1IpL-0000000Dlrp-4Bbp;
	Thu, 17 Oct 2024 05:13:36 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1IpH-0000000Dlqz-0yay
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Oct 2024 05:13:35 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539e13375d3so558832e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 22:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729142009; x=1729746809; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6V6eNGdE0SPvqcSpqgKb+DQULJcURDQCfkY0VUPRIas=;
        b=mMxKkGZOUD4MwRaF/PzuMk0L3ThFmRSIO4n/+N07wWh99B20Bp0pq51dXLh4y/kX+q
         QqFhNWHwX5MIAByPgZNVrhxfjQ3PruUJa/y2OvMml7ByfGn2kDAxwhziiD4rLIWB5mZf
         MLaIwVYbstYqbN51N0BwDt1D48AmwX8mZ2PJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729142009; x=1729746809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6V6eNGdE0SPvqcSpqgKb+DQULJcURDQCfkY0VUPRIas=;
        b=FJ1QlDqHFGIEOM92M/tPVkeYVG2/MIPhsYciMB0aizZF5gfSrMANikLXuRleZ8ZZMB
         FfMRWjDDXD+e+fW3g5nWz/ZsotO+qISv9/O6YU7kEEBbojzbhRnBLX8siZauq1x75G2j
         6098943J0/DIGX1qJj0yYycdwa+vMTgmhWLlL9k2RUdDzfEY7ckJ5R7SmGCzoeh7MT97
         qeVxxDfNWl0Oy4v6aEEDj9lhuSSvr9ydWr2ScLhPZ/TvCHmQ8JPYCFTDRiI2cE+KghGq
         OLoNX8kKomkG33DI+jtDqZUSBol6/Bw8HZmRHY20X3EGwfDcgqaF9dOxLZ+v0u8vn70P
         AbBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJ5RvFOyTTr5F69F88nB3fQvidvY40CV82i188DNlqQNzS9V1a2y8bVOD77nGhsi/cA9yXOn//vHgflIoXnw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7JpRPFZTS77MvLW/+epWif66QFhKwZ1dI23Ef/BwGgAcFGu95
	u4PjSu2vycLcowZfwhNme/jL12v18iT/nXU5GG9jHotQS/8wKINKYXHQH3EArfwx/mFxElZEsec
	kZFXy19M4ATF8aAFpAfgVQllgTDHmL8RjPdqT
X-Google-Smtp-Source: AGHT+IFjzb2wpcnGWFDBZjNo1M6JPjsOZT8OvpkoK5cl54wpJ09jbG8ZH+YgyEBJvP+ZZVXYFVWt2kcbszuvdny5JUo=
X-Received: by 2002:a05:6512:1292:b0:53a:bb9:b54a with SMTP id
 2adb3069b0e04-53a0bb9b6f0mr1366138e87.48.1729142008876; Wed, 16 Oct 2024
 22:13:28 -0700 (PDT)
MIME-Version: 1.0
References: <20241016223312.3430051-1-treapking@chromium.org>
In-Reply-To: <20241016223312.3430051-1-treapking@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 17 Oct 2024 13:13:17 +0800
Message-ID: <CAGXv+5FEEXYu_h=_cnLGfwVQh5kdf0KpRFKfUYgFsR5oV9s=nQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: Add port node to mt8183.dtsi
To: Pin-yen Lin <treapking@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Jitao Shi <jitao.shi@mediatek.com>, 
	Hsin-Yi Wang <hsinyi@chromium.org>, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_221331_347453_D29974FD 
X-CRM114-Status: UNSURE (   9.12  )
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

On Thu, Oct 17, 2024 at 6:33=E2=80=AFAM Pin-yen Lin <treapking@chromium.org=
> wrote:
>
> Add the port node to fix the binding schema check. Also update
> mt8183-kukui to reference the new port node.
>
> Fixes: 88ec840270e6 ("arm64: dts: mt8183: Add dsi node")
> Fixes: 27eaf34df364 ("arm64: dts: mt8183: config dsi node")
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

