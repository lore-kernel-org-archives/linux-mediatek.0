Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF28CCA0FED
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Sep 2025 09:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3J4+g2V4sWrtHtemeApia0D1CwSCabpiECH2Gc7jqHs=; b=LxEAZLG9xrhn81iTKuF5X5e+Uv
	1xwIETbTin0kHLBYkEMvHYLOru5W5uMH/ejGHsjEQDSTg99dGbRrpPwJZxg3uhQOLqKeNMdOOqsFv
	QSlNaAIzMTwVZrZHoNnJ52C0gQfieW0JxCwIaiCbbLJhPpuBzPelFkdovLFr3rAExn4Yim+lTX4rY
	jqGdGYJLS3UW5DpDviO9Oqx+s3D3p4+skOPJlq1VkUZza8JAkiMBMeTkKWE2I6KYdnaoWSYEhpyEk
	+oPigTL639CeE0em7Tw9M148yHhX8jJX5chXBpwkt+rGz5FI3gKLXH9fJqBqETh5QV9ZBcD7W3EqI
	KcapNeng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSfX-00000000ieR-3y3D;
	Fri, 05 Sep 2025 09:23:43 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuRR6-00000000EHT-3bq8
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Sep 2025 08:04:45 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-336b071e806so16880551fa.1
        for <linux-mediatek@lists.infradead.org>; Fri, 05 Sep 2025 01:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757059483; x=1757664283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3J4+g2V4sWrtHtemeApia0D1CwSCabpiECH2Gc7jqHs=;
        b=S30xlrtoQ0vKwUthWUbn1F2DGWMqy+xbKoIXbL7/TsgdpK6aMFfHKtL1Q/y2dheRyU
         7p1Hlnv91Hnl8YUzTWmfu7itcvOSs1mOItxzNnhLgcY1g/bG8xM7MvR/6PDRx0OFLNjh
         1My2gTfMPCtUNXGoTDiM5PGA+H6HlwW1S7kIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757059483; x=1757664283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3J4+g2V4sWrtHtemeApia0D1CwSCabpiECH2Gc7jqHs=;
        b=d/7D9d+IkH/tsxlqBihpfd4FLxFpm+rEK2vK2cxe3GBvrSELW6Yuewm1rIjFb+s0ny
         Q/DlZO/MLeMxzL0HJU9/aQAQ2vj1b1B9pI/Tpg+7LBiIlFPCxEkoeMLqp4BE1FJ377Zo
         v3++XksxVfarCKJnLxJwv4h+HmbsX531mZqPXCrksTy1Pp8QHnVJgt0DJe2H4bd74kSN
         +b4o/1txMgpNsRH5D+5HGshqDTfnWkyENgdxiSOt6n6IxieTOaIfbP3TwO0xrOZf23TT
         o6gGIXiMrSjwSg4q5OCqXIf0zP0MEhuqgVGFuKaAHdN8Wrr9kCeX8S0HH0CEd3bxIuxD
         cGQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTBZftk8UEXs56Kh4bynUQE3pL/PvsmfUG+R8WpzGD5R8wJsInUHJXqiHo/13/mI88065Mr59Okyd3fny/6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBGgzG74/seO29WE3kEQn+b16wPaazhCYhE103RstSoCj1YBDj
	LLqccabaqODqWQLHTp3BAjF7AGoveA5udVG1i7cjwbDNiY274xLhkyW4GddyxTacrdSPk7c8/um
	R3dyEmhb7aoaoxQY0KEqbOc1/KWCQrtsMUbtecddb
X-Gm-Gg: ASbGnctjic0LAv1UBCGXemu2QKQfdNboPlPL39HaBAD8EIiDcGCdLK67y9wiLUS6oAT
	a0WmOGwx+iYFO5BI/OBWtWAlCLaU01GsFE/696+VXlLRWi/IfTW05H789mGIxKW6v/YtyGwpqhh
	T4R9NqBuIldlSzSQhrjxb9wLdvfjMibbFhjfEq2j5QNqJpkYk5a8AcwJTM2tQmSr+Wh/pOjG4ip
	PV/vsuyH3AgIDaGtU2Qc8XDA9PKYasNThf2ETgOQA2qeBfC
X-Google-Smtp-Source: AGHT+IFYc+QgjrNQcnNX0OlLPGUtYQKqYiLrIJbM/loEuXaaE2NFn67DssV7d5/BEdo89ntnizvXLq3xRVbqrk9nj5U=
X-Received: by 2002:a05:651c:2106:b0:336:e176:cd3c with SMTP id
 38308e7fff4ca-336e176d479mr52475301fa.38.1757059483084; Fri, 05 Sep 2025
 01:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250829091913.131528-1-laura.nao@collabora.com> <20250829091913.131528-20-laura.nao@collabora.com>
In-Reply-To: <20250829091913.131528-20-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 5 Sep 2025 16:04:32 +0800
X-Gm-Features: Ac12FXyKW6bhjZsI-yGgtsh7BXxxyLqh5BQG4iFyVSU7pOJ_sKap2vxzQ5qbqlw
Message-ID: <CAGXv+5F0pWn5+iE+3pgpZ+GMoXDV-eoEx4zKTfsmV5cpa-WC5Q@mail.gmail.com>
Subject: Re: [PATCH v5 19/27] clk: mediatek: Add MT8196 mdpsys clock support
To: Laura Nao <laura.nao@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, guangjie.song@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_010444_899438_7AFF10AE 
X-CRM114-Status: GOOD (  10.12  )
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

On Fri, Aug 29, 2025 at 5:21=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> Add support for the MT8196 mdpsys clock controller, which provides clock
> gate control for MDP.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

IMO removing CLK_OPS_PARENT_ENABLE is the right thing to do.

However if the hardware ends up does having a requirement that _some_
clock be enabled before touching the registers, then I think the
MTK clock library needs to be refactored, so that a register access
clock can be tied to the regmap. That might also require some work
on the syscon API.

Whether the hardware needs such a clock or not, we would need some input
from MediaTek. There's nothing in the datasheet on this.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org> # CLK_OPS_PARENT_ENABLE remo=
val

