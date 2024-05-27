Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B252C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 20:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:In-Reply-To:Subject:cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8bs9EbhcdQK3rxulMupHjqyar0ItbldeLVgIYJXmjo=; b=bAGAAhZ9c57nTublSi7VDqivuf
	NQZcMIcpGs9HFGfPTNPBveD+rKKiM91RKSIjUlfe90pQT5mv0Fv+oXFCqeG2mlMNOvBz+WYh8r7Oi
	DGp+ppX4u8l1KsrWqEknn8m+kSw+hU2mBOHNalt3POeI3FYqiRaE5t9A0tSLuA6mIaQvL94yQgRHw
	lO9RFjmXJAjSMyVTxRVp0lDMTA53bLACyos8a1tITtQA5nA6VTQvrjDMah46nCqJZZ6UMmU+cTmV5
	4/WuiIZ80tUnPOJ2CXbNcgKoD2QF0tDl8gTIo2BP7YDiHyi/wOnP8iY9/JjiKiJVXtF2KImrWXXAW
	Z39l/6og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBhPK-0000000GIXB-19VY;
	Mon, 27 May 2024 20:57:26 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBhPG-0000000GIWP-0XG0
	for linux-mediatek@lists.infradead.org;
	Mon, 27 May 2024 20:57:24 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-794ab1bafedso9615585a.3
        for <linux-mediatek@lists.infradead.org>; Mon, 27 May 2024 13:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716843437; x=1717448237; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=e8bs9EbhcdQK3rxulMupHjqyar0ItbldeLVgIYJXmjo=;
        b=caIyKBoHIGBpZjmdFfeM3zDoNEU+Qp9vAjBvpZUhEiKcMfXY+9W97pIjDwB2ig1bDJ
         cfeuAuukRPeBtQsPYn/ratLF88ixPe35r3bQPtcj1RZIT2ePwNXo38LZpK0jOnAomrNG
         Jc+Xtu8jKcqfsSATCHWK9G74Hvj82FhnWOkLHqGj+XfUxlCr/7LtwikQmfoRYJdwKDLy
         SKO7YLd+Bl8VGBO8+2LTBQYkv1dQscPNmk8r+MDlE0Q1sHHU6nDe4COiL7nCLxUgyeFO
         aaYNsh8SKCdWyhSvhMV70W5ai1QV9FO/iXtoU6GpXX3a9EsCS5gC0TkSMVnKIBaprKve
         gz6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716843437; x=1717448237;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e8bs9EbhcdQK3rxulMupHjqyar0ItbldeLVgIYJXmjo=;
        b=mRRiGmO3aVHTuaI2jas7ZverOVeP3IaypPMmNJ763XHtwf77j8grwkZg5XbICEm8M1
         8KZtVW/Ieoebg0nBg2K5CFttz6JjLCNiPtEEQOFL5qr7G7qi0Utywd/vL1w8wLcZUqbf
         8VpybMGwW+jqhT4UZhtxCy+oOlPirOKnvOwAsuW8geWmAJUF/AzSX9WDBJiRDD+R4lPY
         yOB7ZMmGF5grhRDzOYP/4/465+9rmGwDTregHJyQsl2Jrz/cX9EhWypUfoxd3kO0EqEg
         Ssr9GK9IQf+fGKUEWEg6R/OU6n+WArUVLltDCZFKs0heav7sSNgDkIgtbQF+UEw1B/ih
         ojDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDY1N81VyuK7M4GMw0HsOn9nk3iDV8QwIWUzOB/0O0ghmJ6MtxEtE1qEjuri5BuG6sxKQ8M3nVQsx3SgWNdDmS+hebfZdHJ4SqFtLcchE/zadT
X-Gm-Message-State: AOJu0YwMSfaeLb6QgOjpdQ4+SzBc2m57WTZtcwLJRyViGU5LtP7EpiLV
	zzjdEMeJkhr3ul//pwSZTepV2kcUz2w9KMQu9eLls/c8FMQ28HRgV25VRd42Lpo=
X-Google-Smtp-Source: AGHT+IEFA5Xl71Sl0vHc2fZVv9T+NoQ5HUfuJTzWManJsQ0IRn5ypl+K46w3nAeESk2lSwtK276CTA==
X-Received: by 2002:a05:620a:4548:b0:792:e0b0:7219 with SMTP id af79cd13be357-794ab1130a1mr1438768185a.77.1716843437229;
        Mon, 27 May 2024 13:57:17 -0700 (PDT)
Received: from xanadu (modemcable018.15-162-184.mc.videotron.ca. [184.162.15.18])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abd4406esm325258085a.128.2024.05.27.13.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 13:57:16 -0700 (PDT)
Date: Mon, 27 May 2024 16:57:15 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Conor Dooley <conor@kernel.org>
cc: Julien Panis <jpanis@baylibre.com>, Rob Herring <robh@kernel.org>, 
    Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, 
    Matthias Brugger <matthias.bgg@gmail.com>, 
    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
    Daniel Lezcano <daniel.lezcano@linaro.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
    Lukasz Luba <lukasz.luba@arm.com>, devicetree@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 1/6] dt-bindings: thermal: mediatek: Rename thermal
 zone definitions for MT8186 and MT8188
In-Reply-To: <20240527-wife-dress-3ecaf1509506@spud>
Message-ID: <r9q3n5n4-4pqn-53so-4n65-33p432530793@onlyvoer.pbz>
References: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com> <20240524-mtk-thermal-mt818x-dtsi-v5-1-56f8579820e7@baylibre.com> <20240524-concerned-fritter-262f5e16293e@spud> <20240524-clatter-antivirus-b1939900ee58@spud>
 <61a1be10-7df3-4ba7-b7b4-ccc7f0379656@baylibre.com> <20240527-wife-dress-3ecaf1509506@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_135722_320793_1041D620 
X-CRM114-Status: GOOD (  26.67  )
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

On Mon, 27 May 2024, Conor Dooley wrote:

> On Mon, May 27, 2024 at 05:25:35PM +0200, Julien Panis wrote:
> > On 5/24/24 20:27, Conor Dooley wrote:
> > > On Fri, May 24, 2024 at 07:24:47PM +0100, Conor Dooley wrote:
> > > > On Fri, May 24, 2024 at 11:04:34AM +0200, Julien Panis wrote:
> > > > > Use thermal zone names that make more sense.
> > > > > 
> > > > > Signed-off-by: Julien Panis <jpanis@baylibre.com>
> > > > Removing the defines is an ABI break. If these are all the same devices,
> > > > but with more accurate naming, then keep the old defines and add new
> > > > ones. However, the GPU1 define changes in the course of this patch which
> > > > is more problematic.
> > > > > [RFC] When PATCH 1/6 and 2/6 are squashed, checkpatch raises this WARNING:
> > > > > "DT binding docs and includes should be a separate patch." That's why I
> > > > > split them in this v5. The problem is that the driver can't be compiled
> > > > > any more at PATCH 1/6. It needs PATCH 2/6 to be compiled. Should the
> > > > > checkpatch warning be ignored here ? Should I finally squash PATCH 1/6
> > > > > and PATCH 2/6 ?
> > > Heh, and there's just one of the issues caused by your ABI break...
> > 
> > Conor,
> > 
> > Would Russell's suggestion be acceptable for you ?
> > I mean, this one:
> > https://lore.kernel.org/all/ZlDMNkdE2jmFgD8B@shell.armlinux.org.uk/
> > 
> > I could implement it, but before submitting it I would like to make
> > sure that it suits everyone.
> 
> How's that going to work? MT8188_AP_GPU1 currently means 1, after your
> series it means 2.
> You're gonna need to pick a different naming for the new defines to
> avoid that. Additionally, why even delete the old ones? Just define
> new names with the same numbering and you don't need to worry about
> any compatibility issues.

Isn't this making a mountain out of a molehill here?

Seriously... none of this was present in a released kernel. The naming 
can be adjusted "atomically" so compilation doesn't break, and 
it is within maintainers' discretion to bypass the checkpatch warning in 
such particular case.


Nicolas

