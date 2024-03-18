Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1945BC54E5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Mar 2024 12:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91nvf3PjawLKSdl1v7VHH49qCH92cS47sWWSsK7c8+4=; b=P7YZCuk+NNjxNUI/BJqHVoTRkN
	0WXljvSOAKHv8HjWa2qaUdWFsu1mzl37vYVoeS6yOS7PHCgqy9p0Gx0po5JjI5dZjOvTz2SXxq6pR
	6Ug9UXw9SUDRX95G1uzshzhaNZ36JDhsBTtxyIVcOY47fzQtSPtoBYpIUsEGUw6ekmEKsvalrSlag
	1my4ioMkqqyOSI9qLqXWh4mWCNjvRrpiqpHefGJVBaN9+1lJNdg9iYBVeuSQ7ESEtp0EUgh8HJP/m
	49RzETQmVcv4+vX820jK7rFZWPkEwUi+Fg+bIeODHE6244krMXAIZ10F8Ly2X1ezvIowyU7PsmNNK
	WZ234puw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmCZ2-00000008ZtJ-1zf4;
	Mon, 18 Mar 2024 12:58:04 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmCYy-00000008ZsW-44Lo;
	Mon, 18 Mar 2024 12:58:02 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1def2a1aafaso16342515ad.3;
        Mon, 18 Mar 2024 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710766680; x=1711371480; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=91nvf3PjawLKSdl1v7VHH49qCH92cS47sWWSsK7c8+4=;
        b=QrGCHkH1ux/QQmwAg9ohr1Wm/vFKShJ32zlkprWZ6I/mEjpQpwtaM+nZ69jN8dQSgs
         jaOFVTS8ebC/b49irhzxLtcow9HvEOR6NxDQSzJvedKwbITUrhWCtbtEnV9+fTCC/U3i
         4iJuyG0jUdRxbEvA4xRXX7NKt2nX2XYFXGIdtjzD31jMLtTXcNxVYpxkH3jR3xnqVj9+
         fYH/KmAVUWkSl9kI4Bvc1A5S1E+DM9fR2Lk9zRhtDvJMpJVD0ICrTKO+fmHdEGut32sf
         f+av7B7LLxtTO1j2CtfpDu/3szcDGF517BYSLehRRTvZya+CODN36YyTgX+HWBY25GyV
         v00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710766680; x=1711371480;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=91nvf3PjawLKSdl1v7VHH49qCH92cS47sWWSsK7c8+4=;
        b=rWnHEmlyFDFuDJe6d44wmA32B36ekGCUbVb0A4mvj24y+5dC3KN5fErY3YvKWdgXx1
         dwY/T4h6wTTLHRgkcyQunT55GnJxEwJmswtu9I2H0E7wONzvff0beHaAFGCNk2+AA4Yf
         d//N94KtoYYQT9BjcfAYZjk177BCS1qGZ4eceRPoVNrdx2t8gLiYdZnYp0Hmv6ritCV7
         IRHxtErNg0WpcPn3gmUNPcboKAaN7hP2nxw9vI3iKSn3VqGLR+hETVgydvZBBI+1vA+j
         tHLoEtV00H6UH1P9Ij12qedHUZ/OmHbu4MpK2iRh+hVuGVkFfQUjSbNln2POkAgBvdTz
         BqHw==
X-Forwarded-Encrypted: i=1; AJvYcCWroAwxZbEb4RbtxamQ0ShBt0Yb9c4Fr24pVQcOjkBvDASbK/AGNvljV541Cw5485rUS03hyfVal5wLQ91i0uEJ94nq4a5oNN42irWeFWU1cQjgobRRukdoBXzfN/CgOl+HX426rHevKPjBsOQh1v438T2YmRLM7QQ=
X-Gm-Message-State: AOJu0Yy5lZqJgGCap2k/ya7pOMSla4TL6VmQ0EO2ZMY7c9yBSw+uR5Zd
	FtXzzD9AwlLX0niwoX/2xSH3pDO70FEbOsRSmah6iLZFSjy4Agqn
X-Google-Smtp-Source: AGHT+IEfFrIFbvLrLZvtZuZGp3sq0hKMKWcdlRgs9E3Z/xL/2UEW01eq5JQ3D9lWNf8WMaqjw+UQQQ==
X-Received: by 2002:a17:902:e547:b0:1de:ff81:f666 with SMTP id n7-20020a170902e54700b001deff81f666mr8229243plf.21.1710766679628;
        Mon, 18 Mar 2024 05:57:59 -0700 (PDT)
Received: from [10.230.29.214] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id y17-20020a170903011100b001db5b39635dsm9119591plc.277.2024.03.18.05.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 05:57:58 -0700 (PDT)
Message-ID: <5514243b-c795-436e-8628-8f421c900bcb@gmail.com>
Date: Mon, 18 Mar 2024 05:57:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fix EEE support for MT7531 and MT7988 SoC switch
To: arinc.unal@arinc9.com, Daniel Golle <daniel@makrotopia.org>,
 DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
 Russell King <linux@armlinux.org.uk>,
 SkyLake Huang <SkyLake.Huang@mediatek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Bartel Eerdekens <bartel.eerdekens@constell8.be>,
 mithat.guner@xeront.com, erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <65f7f17d.050a0220.3c75a.cde3SMTPIN_ADDED_BROKEN@mx.google.com>
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; keydata=
 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
 HGuUuzv+GKZ6nsysJw==
In-Reply-To: <65f7f17d.050a0220.3c75a.cde3SMTPIN_ADDED_BROKEN@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_055801_028713_AB71F24F 
X-CRM114-Status: GOOD (  10.99  )
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



On 3/18/2024 12:46 AM, Arınç ÜNAL via B4 Relay wrote:
> Hi.
> 
> This patch series fixes EEE support for MT7531 and the switch on the MT7988
> SoC. EEE did not work on MT7531 on most boards before this, it is unclear
> what's the status on MT7988 SoC switch as I don't have the hardware.

We've received your patch series 4 times and this was the same thing 
with your previous b4 submission, can you find out what happened? Thanks.
-- 
Florian

