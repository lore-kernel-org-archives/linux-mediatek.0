Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89C4C4828D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 23:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqOCCFMzBcZ2VL5Z1Pts5v3IryEZHh1IG9XimJuKSKk=; b=U3Rr3QZB4cQ6Qwo5J3UFfMCxpD
	m+XFX3k81rJ9b8H/3FM9w8jJMUmcY9dYiz1605q+x9/hiXizEkhArg1TiLUv9CnmUbWJ9ipQP9qkL
	ZG7p87GfVUSGdmKGoB9OSo0EwODYctFfQfyGGR9MoovwdHrVhaQy9QBr/83ENYeHPjxf7CEF1WNoG
	BlecWdeUt0BGDNhvyoDexHTH2eFPTgw2TcKUTi+JUt0chTuWsqNPsIkkodmOP6nsVgePQL0nSiKnX
	yc9kTRsrZEwa42EI1LkDbPPMzZmY1L9k6Z0M/ki98dbpGgoQVjD0a1On1f7PsZsptFYzl4YxjG7Dg
	9R/yN2qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVgRw-00000009e5S-158r;
	Thu, 01 Feb 2024 23:26:28 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVgRt-00000009e4y-1Pzb;
	Thu, 01 Feb 2024 23:26:26 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-a358ec50b7cso46370566b.0;
        Thu, 01 Feb 2024 15:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706829983; x=1707434783; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uqOCCFMzBcZ2VL5Z1Pts5v3IryEZHh1IG9XimJuKSKk=;
        b=M+wK9b8K98DYnaTUiayL/zsDlFt8LoLHKTnGjc7dHhC2KQdTc7Mi9J5tx2UiBbgMmu
         xtcwgh0DxXaPgEQgkLHIPaLwMlHT/xuI+tgNRpAy3pKN68txsiKSd40qhQSjTE4sCgWI
         EHHwQh5qFKUorPBok2OO/fRKbroz81O0o4iyWk+VMHFOyaRU+lrr/af/IthFopOxJpND
         aMgu5FdTX2znPO+RVRMND6nlXJ819HG0CZP23Iso9vlzu0yfZJK891AA4MhFlk1sDM59
         yO234GkKIB9OvpLQlu3+veWvFQ5gVhKM9bg5SMXnl/+WeA9wbEaGd5h78LGToaPBEiSo
         q5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706829983; x=1707434783;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uqOCCFMzBcZ2VL5Z1Pts5v3IryEZHh1IG9XimJuKSKk=;
        b=vHvUFKeHjNftQSIZFOeuixNjMffAUXYXYgsW5YXn9yiI9ckzk5CPx7L3byGh+4WXDl
         yeccbEZLPg0klW0ULvvNaON/34TI+WqFZCovmyDcRfHmWrSOeQUcfiHXzpHNw8NGR6NY
         QYkiq2UsE7f4u6EW25jj5rWcUyw1gi5Gcuk+XmA1PDN7sxM7s0vkVrSpUYipguma4tn5
         j6NIVHfKF4yCu2/z4Q1AYxQgBdlogNBy70PKGOe66TW9U7l31cqbUwRoPu+uFKJ9ZIp6
         BGxONSuF56wpQ4Ro/lKHyKh11Es4f/Q4lfhMCQO5/cUk38c6kaTNye93rPiuImx8jOjt
         yIIg==
X-Gm-Message-State: AOJu0YxC1qRBISyO2PZO+Q1sev9s7MqOuWthStUuARBMd3Ol1xW+SR5b
	cgTUXnB/iynD8v5TrvU6uouYn+sxjTGE70vyU/tY9NCiQO71c7y1
X-Google-Smtp-Source: AGHT+IFlrCxvvGTG0ycgv+W52pIwYEVlf4h1Tfg/JJ6vHxl/5vIGyFMylIp7dWVzsKX6fEKWC/DX5Q==
X-Received: by 2002:a17:906:553:b0:a36:f672:5dab with SMTP id k19-20020a170906055300b00a36f6725dabmr386277eja.16.1706829982626;
        Thu, 01 Feb 2024 15:26:22 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWf9289hy9yd1LiVZoV/ca+hZT4+cy+waP8Oy6do+fAz/MsGVbV6hbPTCBaKrvJGoSy+zYREmdkv+XfqXuB85+aaU+n8WHC2ieU/OdQ98Xr8/e1lXR4BgwBcO/biw67hjdzzzbRmcSh4GAnJ7uFmd/jSBe0XHg+neiXfNF2v/VunmEkb6CTDrW7FG9upTbyxLo9qnbt/wTDRYEDx99huRNMIQO3SkEX6092jqyOPcNYaC0sPOyUF0H4d3/zrxfSGOG96nMQc6zrnX+z7n/fbprIqM1sDp9i2UT6xnnr8MSZAeeEQfot4lx5J01me2Pm26lgyBuxCDKBveGhy7JIVo2qb3ESGE7HzCpFaf72OAH4CqasqkviUFaiHqkuF45mje0O51iouslEwIo4eDqIKKn3y0aFkq+ewLDxr8TbBJVR/XikgvclpPoZswh8B2CC/Pt9acUKY8owqJQeHsdr2PU5xOFlIueZaQ1Aqd5vQhC6BTP3gy0n+3a17UPlshj3v5o58Ca9lJQaRCsH1JWyOrGwuJR93mQSDU5wToSMBkgke57yaVQ2ppru1pR/27j0EgjhI+MD3v6VjsmHtUPCOaaNkPbn9b1Oo4XHf57wQgRojIlIqGczt8e3n/DWEMfiVqs/fUzuj3M1OEIn0m2uNNzyTIGRCWj+HXApPUIJNo3oPdtlY8qAy1O5t5vhsK3W
Received: from skbuf ([188.25.173.195])
        by smtp.gmail.com with ESMTPSA id vi4-20020a170907d40400b00a3702ab71f6sm56765ejc.206.2024.02.01.15.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 15:26:22 -0800 (PST)
Date: Fri, 2 Feb 2024 01:26:19 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc.unal@arinc9.com
Subject: Re: [PATCH net RFC] net: dsa: mt7530: fix link-local frames that
 ingress vlan filtering ports
Message-ID: <20240201232619.nsmm7lvafuem2gou@skbuf>
References: <65bbf40d.170a0220.a87f4.becdSMTPIN_ADDED_BROKEN@mx.google.com>
 <65bbf40d.170a0220.a87f4.becdSMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65bbf40d.170a0220.a87f4.becdSMTPIN_ADDED_BROKEN@mx.google.com>
 <65bbf40d.170a0220.a87f4.becdSMTPIN_ADDED_BROKEN@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_152625_403248_C115EF7B 
X-CRM114-Status: GOOD (  17.63  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Alvin =?utf-8?Q?=C5=A0ipraga?= <ALSI@bang-olufsen.dk>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, mithat.guner@xeront.com, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Feb 01, 2024 at 10:13:39PM +0300, Arınç ÜNAL via B4 Relay wrote:
> One remaining limitation is that the ingress port must have a PVID assigned
> to it for the frame to be trapped to the CPU port. A PVID is set by default
> on vlan aware and vlan unaware ports. However, when the network interface
> that pertains to the ingress port is attached to a vlan_filtering enabled
> bridge, the user can remove the PVID assignment from it which would prevent
> the link-local frames from being trapped to the CPU port.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
> I couldn't figure out a way to bypass VLAN table lookup for link-local
> frames to directly trap them to the CPU port. The CPU port is hardcoded for
> MT7530. For MT7531 and the switch on the MT7988 SoC, it depends on the port
> matrix to choose the CPU port to trap the frames to. Port matrix and VLAN
> table seem to go hand in hand so I don't know if this would even be
> possible.
> 
> If possible to implement, link-local frames must not be influenced by the
> VLAN table. They must always be trapped to the CPU port, and trapped
> untagged.

Isn't this, in effect, what the "Leaky VLAN Enable" bit does?

