Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A82C77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 17:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXAfU4krUfQItxKONERdy0UnGwuPi9mhVPa4tKH3xW4=; b=unm6vJY9yWGZfM22XVZ1V6E9W7
	ilOyQnfuWe6g3YJ0NSVNXZY2fwvEl6PjXMen0+hGEZf0cLmDtj5TsOmLQ46rfFKXRgVrXQXwmI+yQ
	1f+OLn04nPNSKj4hYb0BgQPEaranvpGmxI6r9J2A7+2ezgwfgGGxNjs6EkHSozFZhH8dH1NSBSedz
	LD9HCkOKRMM652IZIFWdi9DGI6kru3Fk2eJnwPgJMimJ4II+P4mAYKhZH5fb9AFPKY4dz1jVjiULH
	1MP6/T8UO6dR/zGUidhtiaI/oKoXHuxh90kM3XweDVYtmUPQEf13NZWq+xzt869YZTM/BUT8x8MUm
	oLFlTpzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2b4o-003H6L-30;
	Fri, 26 May 2023 17:18:06 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2b4l-003H5D-0X;
	Fri, 26 May 2023 17:18:04 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-969f90d71d4so137509966b.3;
        Fri, 26 May 2023 10:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685121479; x=1687713479;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rXAfU4krUfQItxKONERdy0UnGwuPi9mhVPa4tKH3xW4=;
        b=blT6VhBS2mX05s5wK3U4WHJiAAhqRpdhqtpQnhde0RcdR3Z9PVGwJ+60BHw26bot3m
         +MD3e5vekpWGhzpB9kMSAh13hs30iC6kdknWyrV36JwWcEfxBtzduGUfatSI5WNNxceC
         lJXiA1WOxGJiRvpUH9FfKpyG4OMDw+tzzsY1YHVSGWYmlkj1fGpxyTjgvcJmf1FKbAs1
         Lq5nbnIvcifvXWLQP4TcDSylXxYlUBssE540Sr7QbfgBb3C0DwmROamC7xzgYG64VIWo
         uYuSdmgJ9M0od8/63dOnwHogZajZA8/QzcnOPlvwNXCnMY3dd07SFvN3eDbYjIJSjKiP
         bXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685121479; x=1687713479;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXAfU4krUfQItxKONERdy0UnGwuPi9mhVPa4tKH3xW4=;
        b=dSo31Igmk9MQxYgxPWUEcnI4pcZzmPs9tCHX2QZPdrhO6IqUGJlNzNYQosEIlryZwI
         gVyZDssU0Voim59EriXWwgRzWFW0OJ6buuQU7TUcYU9cIua90LHiroNmZ2AY5cVrnfdx
         iSUAvwWFwhzONaGhqheuXOU7EeTB4Y7QBnKE0Zen9fewt16vG9H7oisEvGgFvnv1FcIV
         QwDz00yOk+4Ms5FpymjujlXohABE0Uz/PGg81C8vfRodSTS+4GspJq13tUW183sAIn76
         zz4lbcdRiTwZiT0YOv46sPiAzC7yiDowMPwyNSihIIa0srv8eDQPfzy+vXnAErF6ea9V
         jMlg==
X-Gm-Message-State: AC+VfDzvtKTFhnfYZPF8rsfudWHcOfekyYBHRHfJxXQX8vFXASrwDhBL
	Vc/Ul4eRZjMCfvu/S5Lb1iY=
X-Google-Smtp-Source: ACHHUZ68f6SeRUgo46bYThmj4j2ets/qH5kJd72OCPkCJgENbXUwPSZg0P94z960AlvESDfW1LPHfA==
X-Received: by 2002:a17:907:6e8e:b0:955:dcc9:d101 with SMTP id sh14-20020a1709076e8e00b00955dcc9d101mr3392414ejc.18.1685121478956;
        Fri, 26 May 2023 10:17:58 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id dk24-20020a170906f0d800b00958434d4ecesm2440881ejb.13.2023.05.26.10.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 10:17:58 -0700 (PDT)
Date: Fri, 26 May 2023 20:17:55 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 29/30] net: dsa: introduce
 preferred_default_local_cpu_port and use on MT7530
Message-ID: <20230526171755.nk643aphoojvhjpg@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-30-arinc.unal@arinc9.com>
 <20230522121532.86610-30-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230522121532.86610-30-arinc.unal@arinc9.com>
 <20230522121532.86610-30-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_101803_210103_7F7824A0 
X-CRM114-Status: GOOD (  25.12  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 22, 2023 at 03:15:31PM +0300, arinc9.unal@gmail.com wrote:
> From: Vladimir Oltean <olteanv@gmail.com>
> 
> When multiple CPU ports are being used, the numerically smallest CPU port
> becomes the port all user ports become affine to. This may not be the best
> choice for all switches as there may be a numerically greater CPU port with
> more bandwidth than the numerically smallest one.
> 
> Such switches are MT7530 and MT7531BE, which the MT7530 DSA subdriver
> controls. Port 5 of these switches has got RGMII whilst port 6 has got
> either TRGMII or SGMII.
> 
> Therefore, introduce the preferred_default_local_cpu_port operation to the
> DSA subsystem and use it on the MT7530 DSA subdriver to prefer port 6 as
> the default CPU port.
> 
> To prove the benefit of this operation, I (Arınç) have done a bidirectional
> speed test between two DSA user ports on the MT7531BE switch using iperf3.
> The user ports are 1 Gbps full duplex and on different networks so the SoC
> MAC would have to do 2 Gbps TX and 2 Gbps RX to deliver full speed.

I think the real argument would sound like this:

Since the introduction of the OF bindings, DSA has always had a policy
that in case multiple CPU ports are present in the device tree, the
numerically first one is always chosen.

The MT7530 switch family has 2 CPU ports, 5 and 6, where port 6 is
preferable because it has higher bandwidth.

The MT7530 driver developers had 3 options:
- to modify DSA when the driver was introduced, such as to prefer the
  better port
- to declare both CPU ports in device trees as CPU ports, and live with
  the sub-optimal performance resulting from not preferring the better
  port
- to declare just port 6 in the device tree as a CPU port

Of course they chose the path of least resistance (3rd option), kicking
the can down the road. The hardware description in the device tree is
supposed to be stable - developers are not supposed to adopt the
strategy of piecemeal hardware description, where the device tree is
updated in lockstep with the features that the kernel currently supports.

Now, as a result of the fact that they did that, any attempts to modify
the device tree and describe both CPU ports as CPU ports would make DSA
change its default selection from port 6 to 5, effectively resulting in
a performance degradation visible to users as can be seen below vvvvv

> 
> Without preferring port 6:
> 
> [ ID][Role] Interval           Transfer     Bitrate         Retr
> [  5][TX-C]   0.00-20.00  sec   374 MBytes   157 Mbits/sec  734    sender
> [  5][TX-C]   0.00-20.00  sec   373 MBytes   156 Mbits/sec    receiver
> [  7][RX-C]   0.00-20.00  sec  1.81 GBytes   778 Mbits/sec    0    sender
> [  7][RX-C]   0.00-20.00  sec  1.81 GBytes   777 Mbits/sec    receiver
> 
> With preferring port 6:
> 
> [ ID][Role] Interval           Transfer     Bitrate         Retr
> [  5][TX-C]   0.00-20.00  sec  1.99 GBytes   856 Mbits/sec  273    sender
> [  5][TX-C]   0.00-20.00  sec  1.99 GBytes   855 Mbits/sec    receiver
> [  7][RX-C]   0.00-20.00  sec  1.72 GBytes   737 Mbits/sec   15    sender
> [  7][RX-C]   0.00-20.00  sec  1.71 GBytes   736 Mbits/sec    receiver
> 
> Using one port for WAN and the other ports for LAN is a very popular use
> case which is what this test emulates.

As such, this change proposes that we retroactively modify stable
kernels to keep the mt7530 driver preferring port 6 even with device
trees where the hardware is more fully described.

Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")

> 
> This doesn't affect the remaining switches, MT7531AE and the switch on the
> MT7988 SoC. Both CPU ports of the MT7531AE switch have got SGMII and there
> is only one CPU port on the switch on the MT7988 SoC.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

See the difference in intent?

