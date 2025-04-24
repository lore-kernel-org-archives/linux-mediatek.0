Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA28C369AB
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Apr 2025 16:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMDqtfSsgswAHK2zMki+icWH9z9g6NMe+d35IYgU6n4=; b=DZ3y+snCH65CTsP4poKexpvMRs
	nV5mRmMpk+1IV2gd6MfdFHN+dMwedMgOp9LTiXKM+Q478VhStRd5M139TQYM2Ifu42DFkauk98NBs
	1V1KIfwFlE7yW7fAbPesb5caDZlMU0ZZff66Y4DsYr37Wu9inMGfFtO55JoLCsWJVX9jW9ZX3zd/K
	fA0WtQmSbkMsGfaRydhCGotN61xOr/0OCrWlaXMkDEK7c9PXGV3hiYAZlOdbTX3Iq8vG5fnsmNVgY
	eA8HFrDsqlQYYdrRA3PsYvq7D16Fzra+fgXY7ZHLoJpcgwTK2fUGWcz6kjDK+QC/Qj1mayHw/tgPG
	bEz3YxSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7zur-0000000Epf7-3dv8;
	Thu, 24 Apr 2025 16:59:13 +0000
Received: from mail-yb1-f180.google.com ([209.85.219.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ztL-0000000EpRj-029r
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Apr 2025 16:57:40 +0000
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e6582542952so1192200276.3
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Apr 2025 09:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745513857; x=1746118657; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XMDqtfSsgswAHK2zMki+icWH9z9g6NMe+d35IYgU6n4=;
        b=oevzVmkMjDoEUKJ7wGdQz2UMwlWg9gJfIVkcD4N8Ys2yyN7mVVWLH2/N3QETM3NAcp
         As3amstjeBHl5pkUYUPd+Hq/oygD++Pezc/YPwUlGhGlWw/4BPgYGFTSn7BfKXFgQJ1b
         sTlAIGnTE2LDOmEo3RPNj5lPK/kmjsiYb2W/gp6a0G0fjySc+3P4/xX1P7QEQb3c7A2N
         H/VUZwtnxmglfZ/KxoEBQiRriwgbiotTREt3j3XMKfiuWMOjOuMVaUCSEBnb/ERxU8o0
         LqKVgPRcyML9eW+rUtYM6Z3DyD9+wxcVAz0IyJKzNqZHu/yFTXNrzW9vx8d4uEoqiHtm
         hwdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745513857; x=1746118657;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XMDqtfSsgswAHK2zMki+icWH9z9g6NMe+d35IYgU6n4=;
        b=nZw3PU6il2cZ6szuoz/RhxUfHGFl06MCwQWRZ+pussWDwPZimOQjWf8IA4dLgUsatK
         Q6h3pnh6mspe5USJ17KL9RaUcNWnR/WqFFhuNKg12OslCvAwTaUK4zajrkWN51dHv4Bo
         pelPWI0VWVaqeUCrIXv771Zikr1ntuO0phssTEVqBs4bbHnlYoM6rchFvYKir+Rg86m9
         wpuaVlEbZjcP7jl58pGCRHyKG4V7j7Q6Cr61PkIwPvNMZyjqqxc+fB3BypJMtt8pyg60
         mP6r56O56a+CQz+wS1jyTSiKaPPF9BrohGcAA6317xu1T7yRUIgJo0xhver6HO8oW7rf
         xL8w==
X-Forwarded-Encrypted: i=1; AJvYcCVvoFYx7kEyzfZdI7TaCvpPEOPw8nYSLPnP7nfe9v9N06Id8KL4smiSJB6MCNONxup7Pajn47D91Bsfbj9BPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCHnBM0C+cgdE59udPJQigs6zfpLSKjuq5fVVO8cSIrfAoYtDc
	2mXxcyAWjGfazfOCAMN8xvTkFyoJQH3gqXFo+OZMc1ybdCITtMLYKdulouEKShEXEOIU+FqVRsg
	B8hc17JhGyExC5ZJjTI0aHWooxm4ZNWXB8g4fIA==
X-Gm-Gg: ASbGnctpwnMsc3hwOjDU+x6GzBxHEti/G+YtrUmW7cKjlH8VdNGaw6Ip8DHiJWjdjla
	7ZAUkM20RhIn0l/w5pykHmNHd8cwK5SVhMXEaODsKYzj1FiHFqw10nIqaYseuc5Hez3K4npKxuG
	gZqJ6dnmxUTBINLS5K7zXx5nQ=
X-Google-Smtp-Source: AGHT+IHIsM0JcIVkaYurwu7Xm76aeWCRBd2kXA94L1zA7HY4+kXgxndqZ0iWhzKWJZRbPN5Psmgt3hk6PaDxQyb1LIo=
X-Received: by 2002:a05:6902:13ce:b0:e6d:ecfc:2328 with SMTP id
 3f1490d57ef6-e73034f04f0mr5006786276.3.1745513857331; Thu, 24 Apr 2025
 09:57:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250410143944.475773-1-angelogioacchino.delregno@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 24 Apr 2025 18:57:01 +0200
X-Gm-Features: ATxdqUG-Jb1AZR77fk7uAdSggUmnOFrjqf9oHFUx6Q2HN7mjbQy7Up3T4KB7Soo
Message-ID: <CAPDyKFob2wB=stDXLPG0VG7mBso4Hid32pXpMvaP6WPbL0SyEA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] MediaTek Dimensity 1200 - Add Power Domains support
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_095739_046921_468F0EE6 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, mbrugger@suse.com, y.oudjana@protonmail.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mandyjh.liu@mediatek.com, lihongbo22@huawei.com, wenst@chromium.org, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, krzk+dt@kernel.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 10 Apr 2025 at 16:39, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for adding basic support for the OnePlus Nord 2 5G
> DN2103 smartphone, this series adds support for the power domains
> (MTCMOS) of the MediaTek Dimensity 1200 (MT6893) SoC.
>
> AngeloGioacchino Del Regno (3):
>   dt-bindings: power: mediatek: Support Dimensity 1200 MT6893 MTCMOS
>   pmdomain: mediatek: Bump maximum bus protect data array elements
>   pmdomain: mediatek: Add support for Dimensity 1200 MT6893
>
>  .../power/mediatek,power-controller.yaml      |   2 +
>  drivers/pmdomain/mediatek/mt6893-pm-domains.h | 585 ++++++++++++++++++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    |   5 +
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |   2 +-
>  .../dt-bindings/power/mediatek,mt6893-power.h |  35 ++
>  5 files changed, 628 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/pmdomain/mediatek/mt6893-pm-domains.h
>  create mode 100644 include/dt-bindings/power/mediatek,mt6893-power.h
>
> --
> 2.49.0
>

Applied for next, thanks!

Kind regards
Uffe

