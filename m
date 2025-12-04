Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5730D216A4
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Dec 2025 15:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UA/yY7fbsmAtbpdVmUxmHBhgln+Uq+ruk57Ak1wbz+s=; b=2LNIPAHvHtjGE7ufVNo90I3XMr
	05siarDou1TGEupSjKNHh/McTfakFxxelwsd0gJs7sPp5+pWV3GPucW0geY8Bd+ITi5+gIW+IVL+M
	JybLce5BRqq+qHE4w824Lt2v5FbFei8UUPlJDHARE6/j3vwoNDNBnROw+3xDUYNKZxQVP4rsvNrkX
	EX8Zsc9dnL2k0ypEH90fe8kwkBj0Rs9OcR3EXHJ8q9Y7usKztsAV7USKZQkEPmTF/PmASgytR5EeJ
	3AOTfP+SSTO/mZChY1il0Z0wTnqIT0Psb9359RA+kb68Ot4xMjjMcUElBth/I74jBK/xYqj2QhRrY
	RAk2QuVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBWv-00000008E4a-1Kyr;
	Thu, 04 Dec 2025 15:46:05 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBWs-00000008E3u-38BE
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Dec 2025 15:46:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4779b49d724so2250025e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Dec 2025 07:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764863161; x=1765467961; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UA/yY7fbsmAtbpdVmUxmHBhgln+Uq+ruk57Ak1wbz+s=;
        b=g3enQ4AKNn7mCCgmppevJ8esnozxTbsbhOD4jL8D/cOOAt8LL7/ZQDoXffl5NxeXnC
         /dXThd9DTxTnhYx5YOBCjc3rdj7eKA7thdjmskyM/i3lrFPJm70rGSoS+4vXxj7Wboi6
         qlWyfCGE/bMJprcqBJ/6Wq7zdPRvN164E2VZp7hnlFINx+LCgPlhafP8cOtG1yloVCxe
         Vn/tkyZE80TJgui460UTSzHlhav46MeoKrJwi3Ed7NkkzsLcNNFYKaX0azfsX3s9Zwbc
         0VxS2sVdBcp66dBwW/y+Jo6e4FOzOIJmpVKlMY9ePAN7dFfwkMMksaDwfpSAvDYX0HLI
         L/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764863161; x=1765467961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UA/yY7fbsmAtbpdVmUxmHBhgln+Uq+ruk57Ak1wbz+s=;
        b=WmwrewQP03/DuNek+BQdy+/f+4+RUcpc1x0X9ez9CDxDIwCjtBrzt5onVFkIQmsReu
         H/aMUC4SritY2EroiafmfbjeVV6lxbYvKitOY0dJvrar/FsYVdzKhJ8T2klRGZvBkzQY
         O8/lP84biAm6qDu/R283OZ/YObVPx8U5RAASVHfbo7ADhvzxK6BSsRmv7mnsSc+Of7HK
         RFEskypWdwUmjZgFh+uoultb19xLv0cEU+FCefiKC2H4jxcSJcDty1InwmTyi1/JC1tb
         DaiSq11ADsM88BSlBdV51LDWqjRK2CKyx+fE3EgKYLrdjvMCW2qoHNIkah36u2rl7t+I
         ifew==
X-Forwarded-Encrypted: i=1; AJvYcCWnyppzAjiddByUZHWuSsaoz6KUN3N+HFKl2YhxKOB7vNt1tJgj/m2wswdNHzehk1XUpKxhweHW4kWFiVDjdw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKV5vSIYGI30PmRGru85Y/PYieB+XUt++GB3wBuisW5Fi7Kf9L
	lIM75v/iQeUkg0Ev4VOjOPUbMm/8M+5656RGFES07hMmO/1pL9LHb8Cw
X-Gm-Gg: ASbGncuXrCkx4JtzhwgrpaSDer2EiUz8T5DMkg6Cm3bvFL6nNBr/8U19AUHlAEwDpgs
	5hyqm21m7ItJnyPsoyvlsBI4abVhgjgMlDJTn1XbfuV2mdHm7W7v2EJjIQbf3/GRG3GXF1QD+WW
	/iPKvORN75YZcEHHdc3IrS/pT7grSD0+e22MJ/rvPnWXBD8X6MWo31bB41cMZIANbWSzf1u+F2/
	OsGdie6yKiaRjH+5vaJ8kqX9alGaeMhx00ntwNxkwo1e9J9rW6yuR2O6U3j9/RQfQ8VYJu+KnU/
	AdRAUvUlYTifTv18y73V+xO4MHHQNWgZFd9iSD23eic5dC8YcH4NYE6ZmJB2F7N9s17jbJcZO48
	FKN7vPj3TH5V0uOqGbFcWEdAmK4uelktsxVVS0UifkDSwf+cJbQ/NhcGCq7F2JIn9TACHXNKIpz
	4ZUF0=
X-Google-Smtp-Source: AGHT+IHDhvMR+KTLaJIj8x4ZJCrP7vfLKbK4kH2ayI19QzVBsuMMnG5taOmZS+QplfMCnJIxB2E8tw==
X-Received: by 2002:a05:600c:3b90:b0:477:9c9e:ec6c with SMTP id 5b1f17b1804b1-4792c8f2462mr33160085e9.8.1764863160680;
        Thu, 04 Dec 2025 07:46:00 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:dbb2:245d:2cf5:21d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d331a4fsm4069295f8f.33.2025.12.04.07.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 07:45:59 -0800 (PST)
Date: Thu, 4 Dec 2025 17:45:57 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Frank Wunderlich <frankwu@gmx.de>,
	Krzysztof Kozlowski <krzk@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Chen Minqiang <ptpt52@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v3 2/2] net: dsa: mt7530: Use GPIO polarity to generate
 correct reset sequence
Message-ID: <20251204154557.b7asnuxq7hiy5zlq@skbuf>
References: <20251129234603.2544-1-ptpt52@gmail.com>
 <20251129234603.2544-2-ptpt52@gmail.com>
 <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
 <20251130080731.ty2dlxaypxvodxiw@skbuf>
 <3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch>
 <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
 <aS7Zj3AFsSp2CTNv@makrotopia.org>
 <20251204131626.upw77jncqfwxydww@skbuf>
 <aTGRvADkT-1kAQgA@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTGRvADkT-1kAQgA@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_074602_821467_09534C62 
X-CRM114-Status: GOOD (  18.79  )
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

On Thu, Dec 04, 2025 at 01:50:52PM +0000, Daniel Golle wrote:
> On Thu, Dec 04, 2025 at 03:16:26PM +0200, Vladimir Oltean wrote:
> > If this is blocking progress for new device trees, can we just construct,
> > using of_machine_is_compatible(), a list of all boards where the device
> > tree defines incorrect reset polarity that shouldn't be trusted by the
> > driver when driving the reset GPIO? If we do this, we can also leave
> > those existing device trees alone.
> 
> From OpenWrt's point of view this would be kind of ugly as we would either
> have to extend the list of affected boards downstream, or fix the polarity
> in some but not all of our downstream DTS files.

Including the downstream-only boards, how many compatibles are we
talking about? If we patched mainline to cover all, are you confident
that it would be an exhaustive solution?

> I'd prefer to rather have the option to force the "wrong" GPIO
> polarity for theoretical future boards with that (very unlikely to
> ever exist) NOT gate between the SoC GPIO and switch reset line. That
> would allow to gradually update boards to reflect the physical reality
> and yet the driver would not break if the GPIO polarity is stated
> wrongly.

I didn't get that from this thread - how would you prefer having this
option implemented exactly?

