Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DB2CED276
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 08:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S995Kpw7Q5FgEfl8cukii355dy4P9Kqet+lLT/AJgBk=; b=QOREMmIw7RUwZItVcK2FefPNJW
	EAJF389Jdvbyjki32MfSqVoeiSe4ks/TFwvpilPw/rq6ZUWTvWrL+AEbzQshMuOSJAyPBrnHQPWM4
	9RwKhQNK3tg+5XEG7sqycktCs7bIKnk37e65iyAVYlbDSIc0b2NzhHorFNhCYhCIwM2tdxW3o8R+S
	CLSeCPAYWdcKeKr0oql81nc058C9f+/T9w3Ule1Ab8tF4/fy+h+adAjYy9aTgiO/HCRc6gvfEZ21S
	ARMBFMMJV8CTMM7HS6CFdaYICU9M9PnAxnnF7s8Q+eXggW6FLAc/AAEBufmC5nebujYO4kVln4lX2
	fRXrAIbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5Yg-000000051pI-3bGa;
	Tue, 08 Oct 2024 08:27:06 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy5OI-00000004yhw-39su
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 08:16:24 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71df0dbee46so2025244b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Oct 2024 01:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728375381; x=1728980181; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S995Kpw7Q5FgEfl8cukii355dy4P9Kqet+lLT/AJgBk=;
        b=LkF0AukV7WPUsHGJOZSGifDPp4NBsyvpWOMVNPeAhVRK0O+lGpp+1WrGAM3SWs779o
         60CgxlnK3KJyBgM6Ar74D2Fy88Ohl/csvaYVLm8my2OEIHOw9z5DyCFvSWXN+Uik3+Z1
         hWOpP65nH6V+MTxLAEhkLxWO/pT6LKZuUJTws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728375381; x=1728980181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S995Kpw7Q5FgEfl8cukii355dy4P9Kqet+lLT/AJgBk=;
        b=AMUgvhdzf2KzDHmq5R4PhoeJALDBxJ8NwHTYlpx7TW+JSfawPL8rsLm45Gh4o15EgI
         BWs+7tXP+aYfNzct7fuo6o9M/PMXb3nL8Y9PZkIkf/0FddgcqHMXMbjHZGMgXphftO/C
         XuBwWvz6lDJQvN2H/DFxcfBLz81o0HRR0E19J5iwSWaiwB/HiBGmbuVM5r4qvkaPOUbr
         JRjkyVEav8QsGT/FPmp+J3+cyHFDrdAWiEN63Euileb4BhG6FHAKmTjQqPMByghZ91Qj
         JnKFYdfKkUgLlOBE/IrMAQ7Kh5vHSsRxeEDDG6cM+sKxn/vPPTzNg++Zr5Ve1/oGX2At
         yLvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXktVMOlBWkxyiG0C9LycNVOiVn9hMgMVd8ALefCxZy2KwsVpLRfaqtvVW3D4V5Dj902c8IhMcOnoUM1jhOoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YytkB5kNjYk9t4n3baOUfPdgRm/sTm92rZrkRZkiB02TN/MGp7D
	Bpm61Ni/hvGAYlW3vLLBCr0ftESA33wYjV5nkeRUWX2sjYTRBmh3upfuIsc7qw==
X-Google-Smtp-Source: AGHT+IG1t262MIOZEYFnYoCHct2S8wc8u9PdiAmbJsD0k0DmGmjbRhJKVQFe9ZMXZmzrCWQUeq1YCA==
X-Received: by 2002:a05:6a20:9f0f:b0:1d4:fac8:966 with SMTP id adf61e73a8af0-1d6dfa27e8emr23031407637.10.1728375381636;
        Tue, 08 Oct 2024 01:16:21 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:10df:d27e:8d4b:6740])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0ccd04csm5610451b3a.46.2024.10.08.01.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 01:16:21 -0700 (PDT)
Date: Tue, 8 Oct 2024 16:16:17 +0800
From: Chen-Yu Tsai <wenst@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Ben Ho <Ben.Ho@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
	Nicolas Boichat <drinkcat@chromium.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: mt8183: krane: Fix the address of eeprom
 at i2c4
Message-ID: <20241008081617.GB3999626@google.com>
References: <20240909-eeprom-v1-0-1ed2bc5064f4@chromium.org>
 <20240909-eeprom-v1-1-1ed2bc5064f4@chromium.org>
 <01020191d6972ef5-12c59f31-ae58-4aad-b33e-5b7618c0443d-000000@eu-west-1.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01020191d6972ef5-12c59f31-ae58-4aad-b33e-5b7618c0443d-000000@eu-west-1.amazonses.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_011622_827634_FC46C44C 
X-CRM114-Status: GOOD (  10.53  )
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

On Mon, Sep 09, 2024 at 11:41:57AM +0000, AngeloGioacchino Del Regno wrote:
> Il 09/09/24 10:33, Hsin-Te Yuan ha scritto:
> > The address of eeprom should be 50.
> > 
> > Fixes: cd894e274b74 ("arm64: dts: mt8183: Add krane-sku176 board")
> > Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Ping for this to be applied.

ChenYu

