Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCBFBD216A6
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Dec 2025 16:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhOkEme3R2b0z1JToTf4scmIbojsMBoLPZmWVqYRzNs=; b=RIZNmEMVmOokxS0EuGMkF1DAsl
	1oLYtQg+kiNnOuEahvLcN/A2hqKpAIk5ChvBBGyw4C77DlMve9Jkwj0K1alQ8pqFt2geV51xohytI
	J+oXBCC6v20D62JDoaRlMKz4YY6H2fJsX3ciPKmOdjCMPyLPuXccvTMQ2cALluL1TLCCEHU2dItsS
	mevsiB3JhGhv1N86nB+QrpUqnm6Vnm5Xp99OOmO6noH+g7vrH0UVDdvEdDzC6V4o7mslR9uxn0SSJ
	/wqE2jt7RZ1BwfuW0ga8+rkcjZJ2mBPOpCi+FBPHEUb443NoYlzOQeJKpb/FQUxKA/GQ/N3HNWzTt
	qN/AdeRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBnF-00000008FYN-1DjH;
	Thu, 04 Dec 2025 16:02:57 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRBnC-00000008FXX-1tBR
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Dec 2025 16:02:56 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4779ebfa91aso952985e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Dec 2025 08:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764864173; x=1765468973; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jhOkEme3R2b0z1JToTf4scmIbojsMBoLPZmWVqYRzNs=;
        b=QYhFmO8DUdKWtt8snefFiPoidO/BY3VpFwArQcsJ1WqPvdiXG0JCHia2j/ofh1TYFJ
         2HEJV+zT6WoG4X77pubHZ2gFZUEIJHIJtSOGz5BthSX26HZSzEzjJPxeI5XoKJZlZWLS
         nB2FBDMj3N7YGTM5wi9bR078ewhMDXOj9My5fp/xPhjZ9tbDtrXGuEj8ulOpA637wEng
         2pcWvJSQmzww1Thq/BvtkMx/MtB/ACfILVoiFnO1jm7nuzosz6E0OxiU6Z4g+OneERn1
         VbanhYZitdxUHRWl/9z4A3RWdHApulNB6Qcn+aEa8xh8wwYFRvJBJKMjVKix/2Z4N15J
         zv9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764864173; x=1765468973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jhOkEme3R2b0z1JToTf4scmIbojsMBoLPZmWVqYRzNs=;
        b=imGRiX18AVCZDQJl6YsyDCDPsylAc/1Wgw6IBtQMaMiLJklGnBws5lZjmHC/BOLykI
         BuBianYwzSZrOgxd1nwNYOLSLJLLZr/s0YVLOhNNLrx/W1Gu1HaqvwpGvE1NWDunLItb
         i3jyd5YVNcQake4H3bIOPvhMjbUrKhdskDwsznXj1bI5dPGhg4j4lc4qiLh4C9AaLU8C
         ABW7GlYZAsR8wHSEpnpmz/NeKwvGi4BsA8kBa9aZ+hUnH5RcSlrFC1bdPbWMlfpELC7q
         ut/mLFfLu5MIQVmDOmwqPB2wwUMkqmFzOyqVK7O8sz1v31C5ob3fOFsU+qnwi+TJ1P7j
         ucAg==
X-Forwarded-Encrypted: i=1; AJvYcCXWgBwZ/eTGLTo/k3O2W1RHyqPJXTF6gqwUWeK9sag+1t4m3AYRAQkJ/h+FXDNohM7Qsw1kvZV/3VxTxIm2Kw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSGOo0NRLwPG7RzJyRH3h8ZHbR6ReVp6xzvaZA+NtmxzfJiF4O
	v18ey0RioW47HrYUm4nil1vSu79PwSl2L5HUA14ZxABwCT1FClCor6Pl
X-Gm-Gg: ASbGncuiQ0hL3eOr3EfxsEkzEHJ348XMMzxnRdJaQ0JrTXO/qd3H8gF8bwLgtSFj5ho
	Ov0S49p3vjbwevqzwEUENfL8y+lIaZhmJXzLax8lM5T4xfU5nV8HNfXgSfoc1KtBFsgkEHuNuJ2
	efz0Mu57MfzlRURYum3PsmU+IxpPjIx0Ds5Gql4DoWFNNWRd7EBDpUso/0PSdD7A4Kz5L24Ko9L
	dz3Yoghz56TFOnTaXHV42RJ4CMMr8w/MVVwl0rNSdhYgEmgTnSgcuKtaAeFLnN4iNW7Pfb60yUk
	fUfUvFIlmQODgdDgJdZB6ZNKKna5RW1quWXI/Dc6esiTdiVRmF6WCKkmX6SflWoYuqCdLCW1sNb
	4pKgc1+gXjbCbTnglMVgrhLq7yti8uDTJqdKooK7y0pohUgR+Q6Ruwff4QT4dxAZ4cL8YN28Nc5
	z1Akmqn3iRU4kOog==
X-Google-Smtp-Source: AGHT+IHk5B99duQzZVP/Wufl2tAKzpvxK3UuoYOHJ/wpcMeiblvQQD75UaOGAiMjZDyGGJIQCl5ZZw==
X-Received: by 2002:a05:600c:45cd:b0:477:5b01:7d49 with SMTP id 5b1f17b1804b1-4792c909a62mr31833775e9.4.1764864172487;
        Thu, 04 Dec 2025 08:02:52 -0800 (PST)
Received: from skbuf ([2a02:2f04:d106:d600:dbb2:245d:2cf5:21d3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479308cd87csm40499885e9.0.2025.12.04.08.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 08:02:51 -0800 (PST)
Date: Thu, 4 Dec 2025 18:02:47 +0200
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
Message-ID: <20251204160247.yz42mnxvzhxas5jc@skbuf>
References: <20251129234603.2544-1-ptpt52@gmail.com>
 <20251129234603.2544-2-ptpt52@gmail.com>
 <0675b35f-217d-4261-9e3f-2eb24753d43c@lunn.ch>
 <20251130080731.ty2dlxaypxvodxiw@skbuf>
 <3fbc4e67-b931-421c-9d83-2214aaa2f6ed@lunn.ch>
 <0d85e1e6-ea75-4f20-aef1-90d446b4bfa1@kernel.org>
 <00f308a1-a4b1-4f20-8d8e-459ddf4c39b1@gmx.de>
 <aS7Zj3AFsSp2CTNv@makrotopia.org>
 <20251204131626.upw77jncqfwxydww@skbuf>
 <4170c560-1edd-4ff8-96af-a479063be4a5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4170c560-1edd-4ff8-96af-a479063be4a5@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_080254_508256_0D327556 
X-CRM114-Status: GOOD (  22.66  )
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

On Thu, Dec 04, 2025 at 03:49:52PM +0100, Krzysztof Kozlowski wrote:
> On 04/12/2025 14:16, Vladimir Oltean wrote:
> > I get the feeling that we're complicating a simple solution because of a
> > theoretical "what if" scenario. The "NOT" gate is somewhat contrived
> 
> You downplay this case and suggest (if I get it right) that NOT gate is
> something unusual.
> 
>  I mentioned "line inverter" but it's not about NOT gate. There is no
> need for NOT gate at all, like some magical component which no one puts
> to the board. The only thing needed is just to pull the GPIO up or down,
> that's it. It's completely normal design thus it CAN happen.
> 
> Of course "can" does not mean it actually does, because certain
> configurations like powerdown-fail-safe are more likely and I am not an
> electric circuit designer to tell which one is better, but that
> downplaying does not help here.

I don't want to dismiss this comment, but I don't really understand it.
What do you mean by "line inverter", is it the component inside the GPIO
pin which makes it active low?

I thought that the premise of this patch set is that old device trees
are all (incorrectly) defined as GPIO_ACTIVE_HIGH, but someone familiar
with the matter needs to fact-check this statement.

Anyway, you and Andrew are talking about different things, you haven't
made it clear (or at least it wasn't clear to me) that the inverter you
are talking about isn't his NOT gate (that isn't described in the device
tree at all, as opposed to your inverter which would make the GPIO line
GPIO_ACTIVE_LOW - that's something verifiable).

> Just to clarify: I expect clear communication that some users will be
> broken with as good as you can provide analysis of the impact (which
> users). I only object the clame here "no one can ever pull down a GPIO
> line thus I handled all possible cases and made it backward compatible".
> 
> And that claim to quote was:
> "Therefore, regardless of whether a DTS is old or new, correct or
> incorrect, the driver now generates the correct electrical reset pulse."
> 
> which is 100% false and I am surprised how one could claim that.

Agree, the communication should be better.

