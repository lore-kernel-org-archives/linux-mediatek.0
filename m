Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81403D2444A
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Dec 2025 17:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGUWJRfLEGG5MQjirrXoFGblqtB6v7zhyuKgj/1LsZ8=; b=E2LKWOvKEinm0z6gmAsc44BYmr
	EensopOs/iUOijgDgGzyLr9bcv9W48OjfaaicX0ERMJR5zVE6D+BitRYw4+vj4Tc7OgocLf/I0j/f
	hC0h7eS7uHFrd2IOuNby/yacG5vJTCya40dmEVM0KHB/UmiIznK4QTOPr4eyHvxXDFnaGWkPsC4kT
	OEJsMsU+LKLmLEG0vC/c8WApbs+nQIGpyLTHfZjq8FqyAD/RiK8aW2UdqGynxjLUOqatq6myIEEbX
	uhzlRd4CP/OYEvCGjbbFHmrxaOIDBQgcDv1EENufN6P9FcpkfhkjlietidmiNfe8HAHGrprxWpMOr
	4pnszQSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCsG-00000008LwH-23QG;
	Thu, 04 Dec 2025 17:12:12 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCs9-00000008Lv1-0BUW
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Dec 2025 17:12:11 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-42b53b336e6so81880f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Dec 2025 09:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764868323; x=1765473123; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uGUWJRfLEGG5MQjirrXoFGblqtB6v7zhyuKgj/1LsZ8=;
        b=gCiBpy4zlizrtJCagQU77OuY3gRcjqorzEXrx06//yX6DuYG0gOHZ0cWVpvL5Jwa0F
         RQg8w4wtE7vp1uHhL3zOU1TKKzJ+q67hh7kMaRb6mIt3gg+69cUMMXNIZrBRe6lO8GEl
         F4u3BC+iaRePzy2Sw8VCC/M8sESr2NjeMyBDsuhbSh3wf45qHb7ZRo4zWIMbEU4LQ/Mv
         hltafCki2V6jXS9aqBrigpne2Wh5J71K3Tc0FCAw2e6vESicuM7sKv5w78e5pXxI0TlW
         AVfRe8hITeb9deD1pX7ijeDdXegTBBZ4PuA5+lGtPyuSzfMhLZkxIfVtV6Vip77mGEc2
         RrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764868323; x=1765473123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uGUWJRfLEGG5MQjirrXoFGblqtB6v7zhyuKgj/1LsZ8=;
        b=Qz5ijTvqU2533HvQCM5w8LvTFCGhKkQcwuuRjN7L96+m4fMCaENC9KViZcf1EXZ1KP
         bSGhlspyiXrqf471/Nx/nt7FPdZpQTPAb0cAey4QdsYBAYtpXmTTgMqTz30E4YdjYdZe
         VVSHPwFPpNywTPLKsyuziMrNGj1yC7VtmSPgYoHN+NvWYppZjjP0rXxFku+7OveE/tbN
         3P2aQRxBfaWNNXp8lgrDNG/V7qXzAJXOf6apYHnPEur0042Z5RWQmKKEAAcIDAoNNs4r
         K092gA83ebue8+cphKPcDOejzDqrZ7OVrrrM1nlrrsUpGRPT3dnXqQO7uuuBv3SObmsq
         pfBw==
X-Forwarded-Encrypted: i=1; AJvYcCUP2LNnRk3iKrG8z/0HzhuyGB/q5aquKnJbNm6lQmM1M6sSc+PUgjwoMrwjlFRv2XR3DoDSzaEcTc9T+kyBXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyP81CNJMSbUMT1j2+tkUKVGUBF7Qogo7SXm8SyWvTDPW77AcPE
	LTzOVyAv5ahWx5ntLuBW5aE/TbUk0bltXC8FH25jgPNER/pw/UjToMLq
X-Gm-Gg: ASbGncsZTTVf9LkkeimwmuepXiZK7GMtEskAAb7DeuRNU1OZ67n4pbrERE+eROtmi/w
	6FUHXe2r3XQBbJ9NDJB6t0nyDIduFFOsB6Ug2yS9Hof67SzKPvKeNj103su9vMa2Gwlv1T2RHgw
	qHsHYJ2pd6Jd0GTsjdqGpKozzQVD198DLFh14+36i1Jmcaq9iAHmuz3thT7/q9bXXpD3blwPRG+
	uDB21/c0yl2YoP44k0UYx6l6/q9QekX3LLJZUOqrO7Mck88rZXyark1Nq2JJmDXiDe5DeVEa99U
	L4l91s3aHDhaVL0KBWgV/n1SF91m3ldfawtjGpbS2fW1HX8ogBRdZqlQE4y+N9Q3EoMBaexpLwz
	1Wbhzhc4iGBZCAWQ7u6iRzUn0V8qFhizgTRy5UTpDf73NsNnAhFzb0zF6hn+lQQF0lTpWPjg9K+
	6vOUk=
X-Google-Smtp-Source: AGHT+IGxkkIvEqrKzXYEjrd610hQ5Joilqojfn2sZR57wWJ4rYVFOquGZdhrsExO4Zfqp1zUdehCbA==
X-Received: by 2002:a05:6000:2f83:b0:42b:2dff:d394 with SMTP id ffacd0b85a97d-42f731e6940mr4153566f8f.8.1764868322949;
        Thu, 04 Dec 2025 09:12:02 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:dbb2:245d:2cf5:21d3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7cbe9065sm4190267f8f.8.2025.12.04.09.12.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 09:12:02 -0800 (PST)
Date: Thu, 4 Dec 2025 19:11:59 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Golle <daniel@makrotopia.org>, Frank Wunderlich <frankwu@gmx.de>,
	Andrew Lunn <andrew@lunn.ch>, Chen Minqiang <ptpt52@gmail.com>,
	Rob Herring <robh@kernel.org>,
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
Message-ID: <20251204171159.yy3nkvzttxecmhfo@skbuf>
References: <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
 <20251130080731.ty2dlxaypxvodxiw@skbuf>
 <3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch>
 <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
 <aS7Zj3AFsSp2CTNv@makrotopia.org>
 <20251204131626.upw77jncqfwxydww@skbuf>
 <4170c560-1edd-4ff8-96af-a479063be4a5@kernel.org>
 <20251204160247.yz42mnxvzhxas5jc@skbuf>
 <66d080f1-e989-451f-9d5e-34460e5eb1b0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66d080f1-e989-451f-9d5e-34460e5eb1b0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_091206_303678_D71C285C 
X-CRM114-Status: GOOD (  12.44  )
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

On Thu, Dec 04, 2025 at 05:48:07PM +0100, Krzysztof Kozlowski wrote:
> Both are the same - inverter or NOT gate, same stuff. It is just
> connecting wire to pull up, not actual component on the board (although
> one could make and buy such component as well...). We never describe
> these inverters in the DTS, these are just too trivial circuits, thus
> the final GPIO_ACTIVE_XXX should already include whatever is on the wire
> between SoC and device.

Please read what Andrew said:
https://lore.kernel.org/netdev/3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch/

  Assuming there is not a NOT gate placed between the GPIO and the reset
  pin, because the board designer decided to do that for some reason?
                   ~~~~~~~~~~~~~~

You two are *not* talking about the same thing. I dismissed the
probability of there being a NOT gate in the form of a discrete chip on
the PCB, *exactly because* you can most likely invert the signal in the
GPIO pin itself.

