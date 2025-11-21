Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B052CFA74F
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Nov 2025 08:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wEtuoMiVjHpLpaR9GzcLxm957ZTjBHVy8JV0VCpcAs=; b=3NLWojSrr9GpproaH/+VRx/ZGR
	rp4YamP64JejQV9XmwP+505lS4CFvnMp2nIuSgGNkGOf04jMuxKdr5xYKeP89OBoxrIZHpke6Cwcu
	mH8YGzCL0+jhnIex8PafvtA7Lg0dojvg9Jz5aJiwZkRN/5ciabIMzDa4TOLmL99K74/MdyKLlTfup
	gaHtRxWBsRvG5gwr2wFfyWrZ9QV/1/Oc3B8PKkQznfCt7AEmMVJSjNK6tS1GbiOBAsCiPkT63p2vj
	sCZ641TieaA3D5lcyezujMkK7pyHaL2UL6XA08GFJw/dTsf2rfLdKGhkIDIbCdnuS11berVoqoHO6
	i8617Pvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMda-000000085B5-34X6;
	Fri, 21 Nov 2025 08:37:02 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMdX-000000085AB-2kE0
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Nov 2025 08:37:01 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4779adb38d3so13016735e9.2
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Nov 2025 00:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763714218; x=1764319018; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1wEtuoMiVjHpLpaR9GzcLxm957ZTjBHVy8JV0VCpcAs=;
        b=SYSzliJsGfI2wlwRyc+BY1wF77EzY1B52qEvg/KXDdk6X3VZRdsrUIGfaykOjCYvpb
         UGiqffU9v1KvTW43kcWmbC+LJVwOUs+mzkfA2HVeG9fxGekL4ewE0u+8pvZ2Vh5PsFr8
         rvTz8s+dAPdN9bME76vx+Cfv3yRp/h7xj1Wf818h9VXubDH4p1jB7AbpVdZAGrtt6kba
         LcPSpIaqVkEMdIe40jop8UiLNn8gQXqxro+SrAa3wuXb1BtHHWy8Qlq3F3+5pmM9jXkG
         35wl0egKwyujfPeuwwk7Wx15SSAA0WyOWoJbm0957IrX9ESS6pAPo+R+GMP6mcg3EkDn
         rF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763714218; x=1764319018;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wEtuoMiVjHpLpaR9GzcLxm957ZTjBHVy8JV0VCpcAs=;
        b=sR2tuPB0m7t3HPVro4MXLqzi0Qs7t/srtJ4SO9NxhTaP8iYcoI/NDpj6eMRNWNO4CX
         Y2noiW3xvxqqgImV7zEQUSJGTZgpSwuhzk9fXIILjr9n0Iv2HLIvdGCsUYCe99hF/4Uz
         SODbqBOjwyNT2xeXL1TLri9TFcJU9YvdAPhZomx5cvXqw3CnGmqZ+NmAz8oFeeHHna0i
         2XGsmkFh2ZKPjmZDqpcWcQVUs8eWgfHqDm8FYvcDWNyQxVY0USttIrzz7oUGImy7lpAJ
         sAX/ZO0cWdKTdHqdVy6k3DZGA/kMilX9Z7XsL5SZ71hNJ1Ae2xQKteMrSS/FW//+abFV
         MCfQ==
X-Forwarded-Encrypted: i=1; AJvYcCU38TGisWLP5xD7t6Kuh31ZTUZFTeFxh7r1UZ1tV+8ofBGf3DWaUFnlVZCwrL8JeozYu0xT4CV7jW2Ihm7wuw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwQPXGW4i+Jrf/zl58w/x6vys+NWcjIR8bZHjkxJ/yWA7NOiSAI
	udVgRwPz6LXlJr5bIsVMceVjsKYcCiYKDiMT8Cz7I0eyuraz8qHpYDUX
X-Gm-Gg: ASbGncuamkPAd4lO9fVJwOgpICYKBuDxdfn1Fj0pNP79VidS5i1Wtb8WmIx+O4aB1hF
	WB3E3fEzaGp5VLlUGSlt5KOD44h4iflXhiPEzfQCnZ643q5uVELY2SRUcYFqi36AyT8xuffVURA
	oLq4EyLaMZGUi4cOdEXnqJUzpYZVYz6SZmi6K650EqDWjntoDjtRyEHDZ0+1M7bOFfA7EQs2aXr
	5Rt0NtbYPP4KxuVh7X8hd6REEAD4918m9AZYUdKZ14x0m5CNpVwOQVcOux98fn8DbJgKYB9STsU
	DizWfn2ybXPNSwP8ofQ3M24Bb7ix1Ou9UDkICCUdyiPnjJ3pEJXpQi3SJLsgtU0VKpnBGpAjunK
	nAre8RCJ3QH9c3BxcW3kTd+u7keM4i4UeR5+Ut7gyQAcRYPeE9Gu6O5k2f/lNdqyHMmgtlZUADe
	9cvvtuPSCC9kuJJiWrJKbcvQ4MXVfoQPZxApuRts0=
X-Google-Smtp-Source: AGHT+IHPLw2jQaPF5ElF0qIXmxXxh5kNC5rhs4V0teeBNwT7wDD/o8bBEszH0XJ2zTJXCk24Llcm4g==
X-Received: by 2002:a05:600c:1c89:b0:477:8a29:582c with SMTP id 5b1f17b1804b1-477c01fc60amr15542125e9.34.1763714217408;
        Fri, 21 Nov 2025 00:36:57 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dfd643sm78628425e9.14.2025.11.21.00.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:36:57 -0800 (PST)
Message-ID: <692024a9.7b0a0220.878f3.25a3@mx.google.com>
X-Google-Original-Message-ID: <aSAkpwReMrolkA5k@Ansuel-XPS.>
Date: Fri, 21 Nov 2025 09:36:55 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v2 1/3] ASoC: dt-bindings: Add Airoha AN7581 with WM8960
 YAML
References: <20251121054537.25796-1-ansuelsmth@gmail.com>
 <20251121054537.25796-2-ansuelsmth@gmail.com>
 <20251121-hospitable-tacky-cuckoo-b53af2@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-hospitable-tacky-cuckoo-b53af2@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_003659_705150_1BCCD55A 
X-CRM114-Status: GOOD (  14.21  )
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

On Fri, Nov 21, 2025 at 09:33:45AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 21, 2025 at 06:44:59AM +0100, Christian Marangi wrote:
> > Add documentation for Airoha AN7581 with WM8960 i2c codec YAML schema.
> 
> I don't see WM8690 nowhere in the binding, so that's a bit confusing. It
> feels like you mention here entire sound card description but binding is
> for specific component (AFE).
>
> Well, anyway, probably not worth to resend, so:
> 
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> 

Maybe I have to send a new revision for the machine driver so I have to
resent anyway.

I took mt7986 schema as reference and the i2c codec card wasn't defined
in the example.

-- 
	Ansuel

