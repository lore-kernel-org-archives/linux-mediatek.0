Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D0FD106ACE8
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 20:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TE8SfkVbVBBUM4eryiGIysgS23QgsEj7qFxF34WfEmM=; b=ZmDelNBBXNnELbVN9GlaHVHZJc
	Lj8fNvAhpfLL3XRDKfsv9AyMaDW3VPguvJlLPu2hyThdILeqAHENpU4hh+mHREhWlXM9g3m7Vr0pu
	O3WnRQawco/mPT8msgPNvF07BrQwnfeVoMoSWkiPzctq0bKvKoLL1YAlf78SZ4h8LCVtBvI9kD3Jp
	x0B2pldxlRS7YkBDXPQDuMKzZOdnm3BzN8ZaVZF3gBCT7+C4TzDSQJ05iv7daUl82EJRDzbt6KoKr
	p3lC/Qk2tu4uNUJGZgKK+F6e//DJgTh2smyfkrRVeSlk9CMiVbiHdywkotOTb/b2i48sAZWS54nlx
	3dGtAr8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJW-0000000FDaZ-1KGZ;
	Thu, 12 Mar 2026 20:07:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJT-0000000FDX2-0Yol
	for linux-mediatek@bombadil.infradead.org;
	Thu, 12 Mar 2026 20:07:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Message-Id:Date:References:In-Reply-To
	:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TE8SfkVbVBBUM4eryiGIysgS23QgsEj7qFxF34WfEmM=; b=qdWz5QlifoXRFViU46VDtto9ll
	wnePOgEqDOvoCUS2uLR4zBYu4miU5Eh6HarddkZAmPPFDI+EC70RSv4BJ5aZiwgewLaNbupOJu0Dt
	cr4Jxw0CqZrUzBh0cdy+yhYJopDUsVyYbUHb3+jZN37qaFv5NZt53ENInA6r4nUaHJleWNE84r7o/
	vA188aExGXyTEXvVjDPHAKPdRcBHeoJzXao/7HUMCbJGM6h+6Mh00eegYqSlxvXt/9KzdinAICFYV
	nB4WFk1zSZ7b+2zg7qFi/IHAH3K6CbhFDevNT6EZEZPNjJ5gSeEX7R9kSWU2TA12gHEai6ZpQPqBv
	X+oTmHrg==;
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0mJO-00000001xkR-1pYh
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 20:07:16 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-464bba3a9easo1030941b6e.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Mar 2026 13:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773346032; x=1773950832; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TE8SfkVbVBBUM4eryiGIysgS23QgsEj7qFxF34WfEmM=;
        b=T/FG2qwVb74PA99SfIKZYPEV2HFSfR4PMDFkJgLdWwr/p63jaDxpZIsXj1lUy6BQug
         31Rk2z0Bn3lJ/q5u2ytrJdI9SZ41BsEzfob8mePdD5rk+BuTJpZ3hmigVrSZ47kkZiaG
         GFrM0/jmOQBmY26RM7K7Ki2YzZR07KZZNhzIOHUXDKg0PcK0wXJyUumpNX+hB2pB+G3A
         PNeFauBonN45qz3sODQn8JwSiNTVjGaD3HkAHOq83Be/9qL4FEV/zsL8wLXxEU1738Tz
         VL/5q6RykpuBL0wVpt/c513+DhoFIbXRTVSxp5Ax+JhKc0tuxxcS3gczX8gY0svPPqdb
         3QIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773346032; x=1773950832;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TE8SfkVbVBBUM4eryiGIysgS23QgsEj7qFxF34WfEmM=;
        b=RTQPgEzRjUy7HRMbQOkO+F269GP+8S69O5o7+Bc9QrDPfFbyjG/ne2MIceuvu0C0wp
         LMrZjKN1FXp8gvvnup68oS97EljfIfEfKAN03a/KwIYOgEhyoctfFn8/BaNygsIHYCs1
         XtMryD0wqd/QMkePJSwn20fXm31OC2U+udsUSgqF/FsPMEX+sWbs5zEnOWnnw8qdPhZZ
         eoXPAAMJyoe/PVVqqOZ5qg9ultniS8OkX/HFl9kywfnV979V6pBbSaUbT2zqoM2haPNj
         B18C7T5JF/UnbnuyHEwk/hZ2fbMMTcBoC+IEI8U/7ezvzjZiVeNMuLDbltBebP4gJ0ay
         hL0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWir1cHwlAbH9NTv0FXdAPoTmYrFnKnpaxOgKurmKHpFtJ04ZbBjLe5uk+ERFh+FHodCKfKK7K1kKbBAy9N2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwX4e990FJeVdiVz5x0U2Z5AwFd9i0W3vYPo39KgF2DU43GYUFl
	6BLp/EPe8kPTvZY3hu+DpK6jXS1RhyqN8kRuUIVCtNCoxqNjtxh1KY7uZERHt6cjuAE=
X-Gm-Gg: ATEYQzytfSUxwaRlQtg8A1GYWss11ftac4gvLYLsOxm1w6xlVsprvPDYtHoDWNgok4t
	wVm4N7eh4zM0NwKq/lE4Ei5b0fD35Y3z03Ct43/GTrfMopL+g9fdGE7zR8FXF53l85qw1EyBusk
	NET2q1SIYMFalalTtTYkd2eq4Izgh2owiyDrvZLt744aKNclv+TBFfZbmTdRQhuFqhRKQlHy6++
	jx0oBZiw1ZgTGLTbdVgZxBdd0YQkoIiU62SKk+mBFkPUCweZKPp4eAUyaKbOD1eA5UFfXVeeS1y
	5hwyGeeLr8pjFU31eGj3C7GOwJKd+KgcBGhg27Lae/niCid3Jq+gMM8hrcmFvsqaCRWgQ0vHSwo
	Oz/JjPioEGn8w7qrE/SK9KlyPvZU4ZMzXoeVPuMn5Iwh08EXa3tRoFyZCTM80qpBTKyzFIpKy3M
	hTzv7lfTOwc6zpAeyVe5LjX3JmlAEN3S6JteH8AKY=
X-Received: by 2002:a05:6808:86a4:b0:467:2584:873f with SMTP id 5614622812f47-467575432eamr241621b6e.40.1773346032433;
        Thu, 12 Mar 2026 13:07:12 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:500:1f95:f82e:8747:8137])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4177e6c7885sm5600081fac.17.2026.03.12.13.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 13:07:12 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 15/18] clk: mediatek: Add MT8189 dispsys clock
 support
From: David Lechner <dlechner@baylibre.com>
To: "irving.ch.lin" <irving-ch.lin@mediatek.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
 Miles Chen <miles.chen@mediatek.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
 Qiqi Wang <qiqi.wang@mediatek.com>, sirius.wang@mediatek.com, 
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
In-Reply-To: <20260309120512.3624804-16-irving-ch.lin@mediatek.com>
References: <20260309120512.3624804-1-irving-ch.lin@mediatek.com>
 <20260309120512.3624804-16-irving-ch.lin@mediatek.com>
Date: Thu, 12 Mar 2026 15:06:36 -0500
Message-Id: <177334599652.4124794.12067751220383417571@freyr>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=622; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=CMNpkQG0OX1ZmIY4eNoRhc5pN1fKRttQ1DPPmQGZ5Ok=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBpsxzklpGpUf/ZQQIyqz1DGbRxkAj3JX3gj9Fst
 kHYKcWEcLiJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCabMc5AAKCRDCzCAB/wGP
 wAB9B/0amsj5mtHGl7JwYJ4m/8bCDd5vMrY9EYIYFmV67HC/3VsGnfj1wPsBIVVvEBbRl+IhIIA
 ZsVi+f/fEjvU6prplQZ/YZd8np1yTT1IWdeKgbGDDKpmhj+ay9gbv30oTZ7hntcUeH8jUMJrP/q
 tZU8uftAxgDKfME+lIWGswpoBwlUSOzobxeouycG+WNAHOkJA6P9MGeEtvRIK+FKpHbvhe8km04
 Ox8e94DXUVshX9UMS9lDnF5G0nMYaWHn1RibGjXUQ/s0dnAAbbdC5p20fdx+NRF7/D6TTyYAO4N
 AauC6vpKcGuJ+POQeLop+wx9WdMiq97CgGUQthHxIRLRvwFx
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_200714_576072_A2C2728C 
X-CRM114-Status: UNSURE (   8.33  )
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

On Mon, 09 Mar 2026 20:04:57 +0800, irving.ch.lin <irving-ch.lin@mediatek.com> wrote:
> Add support for the MT8189 dispsys clock controller,
> which provides clock gate control for display system.
> 

...

> +	GATE_MM0(CLK_MMSYS_0_DISP_DVO, "mmsys_0_disp_dvo", "disp0_sel", 20),
> +	GATE_MM0(CLK_MMSYS_0_DISP_DSI0, "mmsys_0_CLK0", "disp0_sel", 21),

Why the random CAPS here? Seems like the name should be "mmsys_0_disp_dsi0"
instead of "mmsys_0_CLK0".

> +	/* MM1 */
> +	GATE_MM1(CLK_MMSYS_1_DISP_DSI0, "mmsys_1_CLK0", "dsi_occ_sel", 0),

Similar case here.

-- 
David Lechner <dlechner@baylibre.com>

