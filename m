Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BB8C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 04:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H3vSmDTpKPJyN2CF7HojtXkCexAH05xPbvML6DNIIq0=; b=bK2lpDywQ1wtvE
	mgQRXuI4csuHusDckxiHmBWy6ycPgyILWQJ7aSFe7wHt9J5A4gKLlFjSARXE3s+xoooi5zqnOAfYA
	Hlahds30MSZTDbMMXVAksRPkttoA2V4OluOL12ed+41X0XLraOEV36YXZfUxdHYqWhs0ZBbrqseUQ
	p2I3Jwf1dITSNBfEtMp4nR7Q9cz7OgRb8PTmxdzO/FpgtpSuMiy24guzb6MZfx5UAtX4Jk3lTNBUA
	kCMhl80mdFc/Kle9ViL8eyoxK1uOaSIiRTkMkSv0BMNhazOX1+4rVp7bP1hooGwGDGC4K/NWA0Dks
	puaZ1i6+y49IkW5N63Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM0FN-003PAp-Hv; Mon, 21 Feb 2022 04:24:25 +0000
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM0FA-003P77-Ce
 for linux-mediatek@lists.infradead.org; Mon, 21 Feb 2022 04:24:13 +0000
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2d310db3812so124761157b3.3
 for <linux-mediatek@lists.infradead.org>; Sun, 20 Feb 2022 20:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6/DnNowH3r+bx2ltFVLOEYXPzes7apZHo8qc6tZmack=;
 b=fuogfxbwZ/6ejxZgnJLHJjEabeg/rv6U1j6/+NVdkHF2h6fOz/7kaiooTto0bFrWvQ
 C49ySfCJP0IPkPbSYdUy/0BOxppwbhbASyu3EX9qZHmuqU2vm4oLabP2+768NhJcGRb0
 MIfk8uu7JooxnViFnBvk4Drqt9uhUnO/mZ04Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6/DnNowH3r+bx2ltFVLOEYXPzes7apZHo8qc6tZmack=;
 b=i4R+6t0cW9B4tCZQiJIrl6Nzydf4ZsjUey5bTexPr8pzmKp5M/PHAucSNc8MMH1vHZ
 p5F3xyO97AExfk+qPTSdTgxDsEQN1XeElBdhzOGumtyfllCWmYJ5Zu1H/Yl9waYoiGU8
 r4g5zLbVo4NLA3a/f754ngw6VsHQvbHdUsq+rZiq70SLDsQs5i1sb/+rucgD8saMMT/7
 5JCXjZKT4zuo06PZg55AcrrU7hQKGtJZ6n26uDSCm6vXJj9olT+sShNaw0TftsJhPqL2
 ondcjiReNScv01gmjepSqOs7x3F/9xYqqxGECqB+DvyQ0XrbAzQDOuZfp/XiBPG38BN1
 4hcQ==
X-Gm-Message-State: AOAM530C0G8OKqUQMMRiCjbKh+DPJL2Z0YDTO11YLp6WCVoysdq9XOxT
 S1oya1Qr8g4UJ8cuOoOHCTvKirVjvh5VdfE8jpRDRA==
X-Google-Smtp-Source: ABdhPJytZN/PK4m+XtCToX84qZfVUy9yfbPQVMa2AclViI286QsZGxFQJJ3+GhCYLXLRPIrAMIvQ+wG2ySoMQRrxFwg=
X-Received: by 2002:a81:b044:0:b0:2d6:bd1f:5d8b with SMTP id
 x4-20020a81b044000000b002d6bd1f5d8bmr12913803ywk.27.1645417450796; Sun, 20
 Feb 2022 20:24:10 -0800 (PST)
MIME-Version: 1.0
References: <20220210141931.291712-1-angelogioacchino.delregno@collabora.com>
 <20220210141931.291712-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220210141931.291712-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Feb 2022 12:23:59 +0800
Message-ID: <CAGXv+5HDcKYcSfdVgVBcZm1uWzVuoUr9AZDQbugYxeRAGAxNtw@mail.gmail.com>
Subject: Re: [PATCH 1/5] pinctrl: mediatek: paris: Unify probe function by
 using OF match data
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sean.wang@kernel.org, linus.walleij@linaro.org, matthias.bgg@gmail.com, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_202412_464594_C7772374 
X-CRM114-Status: GOOD (  10.14  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 10, 2022 at 10:20 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> All of the SoCs using Paris pinctrl are defining a custom probe
> function that is simply calling mtk_paris_pinctrl_probe() passing
> a pointer to the SoC specific mtk_pin_soc structure and nothing else.
>
> Simplify the probe mechanism across all pinctrl drivers that are
> using pinctrl-paris by passing the specific mtk_pin_soc as match
> data and using function mtk_paris_pinctrl_probe as a common probe
> function for all of them.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
