Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EF0C5AD7B
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 17:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5JSOKGksaNKZfiKDtilTqpOi+B/vfPCWiy9wgHLU6A=; b=Y44wK9yDX4fqOvgPPtYsAGWGpl
	JvZCUclfrUgROZGnYUfGTAhI/Q8X2/N8wfPzibD+CN3n86gwQL6uQ2kwFwmhx2rGUEaZ5tIwok8zz
	f1kpsQojw8von4C8fe3flus/9wLQaYVxmCg/ZQiInzVFbJta2LclmEVFE4S7jhWRNTyICLD/yFLlT
	oKliewqu6fFpmSD4EFWDEt39jIN5ym0p+E89HkjFv2dXjFoBwnj0uAFVHiOTq/FAtvz1npzuN2Lbh
	AIai/SeXBu00UJMg65PoKNUvJhrFKRyRslL1mdGFkdQUvXnEzymx9kN+d1kFUj90N5RbzOyhx+pk8
	PhTM56HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt6xH-0000000AWQA-3YxF;
	Sun, 09 Aug 2026 17:04:59 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt6xF-0000000AWPU-1Vb7
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 17:04:58 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso12505095ad.1
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 10:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786295096; x=1786899896; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P5JSOKGksaNKZfiKDtilTqpOi+B/vfPCWiy9wgHLU6A=;
        b=XAJNYFTZAuSmOTT0MPL6sZDVXw3qTSmejt6eEWhTdPZSP7cPaor3O3rESGN5olELWA
         4uhWaQboisfoekpi/0HDLiIghf/x9Cf9v64lEAFsI6/R3DAXPm8ICpVk6QuPDGAw5lv/
         250bobYc3ZidZl7QUpc2xcoTusFoO2yd6EqFjuybjcN6wlE/1xxHe3GWc5qO5A66V5JO
         uWkUaIzZavFrEwxw3PT4p94gtJT92IQ9j3hHqpGVoBvfhlDMS5r3HLXiGSFTzdwCbiCV
         3KhQuTLQ5Rf0HZtipL/atbMC+3fFGpYqSe8o2aF9RdgG0tzS6Noj6l6T1JL+TjbSMkz+
         7SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786295096; x=1786899896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5JSOKGksaNKZfiKDtilTqpOi+B/vfPCWiy9wgHLU6A=;
        b=UKuEzjSdj+k4OOQ3JJAm5bgU2VOJKjpDvrlWcoOiDlUoy/wJaRP/OC68FZA8IF5bSf
         C604tNtXP0AopbE0oGHig20Pm7Wadtx/Tzz2dtrBtfyRmt2wqU43geV7aVWlyfMk/1qJ
         t4deVkVzKFX3baGM/+PkVsVX9OoJ1RbBMfg7q83iC5amC9eU2gDnNBA8qBdNfqu+7hBV
         JK3ZcVj8halpTFNf8+jyvxAonbz6vRkm4gg11TiK4U8jFUgrX5Hs9K8Mfqd2c9Ep7dX2
         lEQphEqdOn4NhJVNs+cAjyp5Cscngr2uddgO52RpZfqBzG/aH5HfcTP+xjEGiT/ixtHg
         tgBA==
X-Gm-Message-State: AOJu0YwLkj7MQynoeDbmXYSl1lzyLl1y+NvsyBDAhS0SbWw99aq/5Big
	VHiwSFL7NL/VrF84SkQ/aNHd2XIhnJUGkkKEyxiDSc6l9lnatb34TAY0
X-Gm-Gg: AR+sD11a1dGPz179fYxjBSSKi5Gs02ry+5gPMf1nJFgplWsjIBpUmA3LJRYWKve8z28
	5qQLHbfu0z9ynxdFShnnwJtBLCkxrbDCiKDve00A3eaui57hTIHAJH03kA0btIf7e9A4sN8o2lU
	A+LL+Zyy/wVdJHpSJi0x48PWptp5yq9rsK96fof4Xuut7G6GNC9avrTyAGwaLGxXdWhQ/ThUACb
	MM1V2Wml/Wknd0hlShWNidAsyEUaFp+Q18jPqKqPHf04xUWcPZratm5wWfrC6hc0UwnnKwO4ZzF
	EelSxu5g9KcqujxVLd1e7/UB7vct+Z+G1fJFit/jwpLGdvltTjzcbbpW1XT0URHI8yOCZ3Uvq24
	tQ8osw0wgbdS01ZnH5td8DX4UbQcwh1jY15nN1Z1TtO3jpy33MTkJUEzywduX/nuDx7LFurOijI
	PUlUZ5EhNZE7memjt6VKJSo2ogVl99rZtXQ8OYebgep6Ln6+Am/B4hgS01TdZOHaZuqhfOrIlwO
	kOdXCv5UEb4T1GBaX32zCcLBz97lfxk
X-Received: by 2002:a05:6a20:4321:b0:3c3:b57b:6291 with SMTP id adf61e73a8af0-3cb85e6689fmr39981875637.18.1786295095808;
        Sun, 09 Aug 2026 10:04:55 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm2824978a12.11.2026.08.09.10.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 10:04:54 -0700 (PDT)
Date: Mon, 10 Aug 2026 02:04:50 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/8] arm: dts: mediatek: mt6589: Enable toprgu reset
 controller
Message-ID: <aniv5B4jz07mI70D@buffalo-ssd>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
 <20260809160643.33991-4-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809160643.33991-4-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_100457_403904_4D911E89 
X-CRM114-Status: GOOD (  10.70  )
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

On Sun, Aug 09, 2026 at 06:03:27PM +0200, Luca Leonardo Scorcia wrote:
> Enable the toprgu reset controller feature for the mt6589 SoC. This
> allows generating reset signals for the 12 subsystems managed by its
> top reset generation unit.
> 
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
>  1 file changed, 2 insertions(+)

I provided "Acked-by", not "Signed-off-by"...
https://lore.kernel.org/linux-mediatek/amEBgRmQktZ44jc1@buffalo-ssd/

PS: I am also fine with this patch carrying my Signed-off-by.
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Best Regards,
Akari

