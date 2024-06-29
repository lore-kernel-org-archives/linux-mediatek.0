Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A48C27C4F
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jun 2024 23:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IcJ/ZbhYzpVFbCD1VrAgxR/tGx2PdhO5WUBCb6gApE=; b=jq6fiyk94K3i/6aY10+detLJbY
	EUz1YUz2Q+DxqykG05eOcrOAE35qsaKPNBlWG9twHmwzlLz6el7rW38tnUo4zareqHkRb2NPe951N
	7+zOs1qftearYNOKnm43Q63QV9OeXa871x7J8owxqsDJak+F6Js7Gt3X3k4/cWy+QO2TPTtSUcRs5
	qfBlHBZVcBWZkwrzitWk4QUAYZR8uNvdOG8X0lQDmm9dIGsgr964onQ9oxp5mKHbk3Y3lJe2q1H2P
	guIzFXD6B3ozOXECE4aRJ/kIA7Sg/VTRTxYZIa7sZWk8nSUwFZ/vB+UNwvPJCcikQprApeKBqMQvI
	9sRtmkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNhA1-0000000H5A9-45Ul;
	Sat, 29 Jun 2024 23:07:13 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNh9r-0000000H58J-07xa
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Jun 2024 23:07:05 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-25d75ead52fso1574100fac.1
        for <linux-mediatek@lists.infradead.org>; Sat, 29 Jun 2024 16:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bade.nz; s=google; t=1719702418; x=1720307218; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8IcJ/ZbhYzpVFbCD1VrAgxR/tGx2PdhO5WUBCb6gApE=;
        b=RcZOsN4KMQd/m18PYD2ZGZK2vW0SpbW8lTRw3+iefQWdaGcIZFCTYubI/K7kEGNOrC
         Sr/82toRVErnCh+7wHa/AOb7gUSZ0iiMzzIFANFKEcxGCnTHh5+3y86lmNRR7ThkcY6k
         8quLnUGdA+0e8lDh5GaevFgsPAM62gLso2SytRDhUc6Qz3n6FnYctuUXWD0v9YXicYQf
         DKp1sUV58kEmsbjMSC/2PuoW/UqNffn+8crGdjqewG4kbSafKAHXyz6nwNCXakK4Wfaw
         quf41jgCrYyJGJRGNTGbnKNQFxWskJ04Ho6cQsWPpx+gcQ4hxj5MbZjidYjpLcqdoDDi
         BbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719702418; x=1720307218;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8IcJ/ZbhYzpVFbCD1VrAgxR/tGx2PdhO5WUBCb6gApE=;
        b=jOItttJR812ZSkx4DmwdVMqKAomh+MEQ+yaYQS5GIU/i27qunCU2DR/xcA6XqjeMGZ
         ZirRmWv2+Nji4wiJXA3c3kjhnsEhNUZDBGE/YM2gheT1QCdqyT2N6zi3FTQ5Rq9UXShm
         rZhjoGTf55rxW0FaHdQ6VHzJrtbW/fJZ3p9mFfYEFmWZdD9cl5aQAzZlCXJCgHG1PCZz
         k81lK4npJcI59PeE7h+z5yi0VfJ3O1goiKsUQ2+RirNM7wguwHCK98rIghMD8OxZCdHt
         0We/93WupoPXObRFgzF0fUzqJ2yrWnr0dvZVKFR1hf1jt2DY/6Qypc1mIEteoq3/oqcM
         H/nA==
X-Forwarded-Encrypted: i=1; AJvYcCWnXmQNUkjmqLq3DN5UNvtfGbYNlUGT1Oh3JCCj4tK2kZqNcKxHbcNYSGBA/xILDXvsMWguDhnvM2MV8W315YPkt6WqftGVqYSKubbjO97ccRye
X-Gm-Message-State: AOJu0Yx3r6U+nkXlFV5cryK2p5kipHe7F/CyDnHL0XN67mctHzwmxUgu
	8tk172JRNG15gTGHY2Qq5vKACQoO5nKG8k6oHGCHaQNdmExs9aMxXV16jawllYwIjWQfS1wa2B6
	zxyJWtjHEM6K0URXRv6Es7Le2Z0qco2rhjTkl
X-Google-Smtp-Source: AGHT+IG5uVtbAqL4k4yZuunPbE2NhqQtoe2pY4HKYNXClF/dthcc9ZEbX2cFqK5Cy/836ZpeEmFbGujWbqsPtUhx5oc=
X-Received: by 2002:a05:6871:89:b0:255:43c:dd22 with SMTP id
 586e51a60fabf-25db266ce39mr919143fac.21.1719702418007; Sat, 29 Jun 2024
 16:06:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240627075856.2314804-1-leith@bade.nz> <171949936716.3312392.7734746271986363667.robh@kernel.org>
In-Reply-To: <171949936716.3312392.7734746271986363667.robh@kernel.org>
From: Leith Bade <leith@bade.nz>
Date: Sun, 30 Jun 2024 09:06:47 +1000
Message-ID: <CAPDEroV=4hW58u0+R3OxgPdeEqUoQkc24jUvsh5uE4sht9FXhg@mail.gmail.com>
Subject: Re: [PATCH 0/4] fix up pin definitions for BPI-R3 board
To: "Rob Herring (Arm)" <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_160703_529853_5B818AEB 
X-CRM114-Status: UNSURE (   9.56  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-mediatek@lists.infradead.org, didi.debian@cknow.org, matthias.bgg@gmail.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 28 Jun 2024 at 00:48, Rob Herring (Arm) <robh@kernel.org> wrote:
> New warnings running 'make CHECK_DTBS=y mediatek/mt7986a-bananapi-bpi-r3.dtb' for 20240627075856.2314804-1-leith@bade.nz:
>
> arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dtb: pinctrl@1001f000: 'boot-mode-hog' does not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7986-pinctrl.yaml#

I saw this warning as well when I ran the DT schema check.

However I think this is a false warning as the gpio-hog schema
requires "*-hog" in the name, but the MT7986 pinctrl schema doesn't
allow for this.

Looking at other examples of gpio-hog I can see in
arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi some hogs that are
very similar to my new one with "*-hog" in the name under a node with
"gpio-controller". Another example is
arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts which has a
hog ("asm_sel") under "pio" which is the same location as my new hog,
but this one seems to violate the requirement for "hog" to be in the
name.

