Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ECD5C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 17:14:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D8A60E09
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 17:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 10D8A60E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9p7RVC/BlgMqmPx/34h2W3xsoRy2azK0CwlYlZ89Zf8=; b=p7sTfn96L13Qlu
	KjkZ387nqvYBuveZ7Sm+s15ieM17MFAb/Rt8YztNgNnhCli3VEjy2IGiVWkHfloh2OdBnMqg4mgMu
	3+GdmVucYWM/SYnT6VJ7pe1AfNl9JSbXTkU6iOSKuVcPhOoLv36H9shLpInvJ/Y3JVz4fJHvUkcnd
	WOoSza84OmMC5SxaBhfdCGkbKJ+gKG+atsPPYXgET/rE/DLLulCIRO+2cm42BVZiBGWgsFKyw1Rhb
	bfbBu53zgo9Rjh25KaY5x032Jdw/jVaQJIRprncXxQvfH6zplUf/rehUz12Ifkuglruu2cC2ro3QG
	PrJY1pmPFUZc330/NaMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAxz7-003mlg-RI; Tue, 03 Aug 2021 17:13:45 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAxyu-003miJ-5G; Tue, 03 Aug 2021 17:13:33 +0000
Received: by mail-pl1-x634.google.com with SMTP id e5so24510689pld.6;
 Tue, 03 Aug 2021 10:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=I2bXUkEd46pGN/p5HEpGGRY38cwwH6dqSDlTkP0Mz2M=;
 b=BFDaeMPkkK0eR0sqJZXh0E4uRJBT44zfNMC7MCxZMHhM/7hx6jZF5uellllfEdV8dA
 /b380csIpzQpsxS+euUgDDvqoUXOguS4+exPBwbdRagcrl7o69V20/fwk56s7lveAb7j
 Qfp+KeH0c8L8TSmm0sHwNNmGLSNBu7jSSvdQXecR+fFbrGOa4LJUKt4Zs5W/jBKMXLZJ
 ktUMHvLC9Z+xveQvvUPVyy4Pt9oS++/FBN1Y4YlXCl+jGXfXb7ZzLo4ePxCYkHQBWJrq
 X/Yy/df/X3GbMgeWCb7mes5S+5/6gVGMN/UZRyCMw64i5IUrgBPLsD9urmVW1gt/nT9A
 4Tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=I2bXUkEd46pGN/p5HEpGGRY38cwwH6dqSDlTkP0Mz2M=;
 b=gEU+JhxHLVWotpieP8LGdDhjxEuHkRjI8o87LaN8+TpRPK1e8hpzzzHXOX0byoHxbu
 drqEJOuWczYA0MOAvd8l/ODpoXSB/YqnHy0Rp0rhIUmkFtRomAgT9uu6eOqkXPb6ZNa1
 KgwgCBIZgz4hNqjCWBMQpFfdW6if+rUAe1MgpCz+pHq+mHG4y0j+9WJjpTMo1GyadEx0
 jZ6eisQUuwYyZsSrE/PGZYrTHk6jlZkTyklP9WjZIR1UMbUGwK26RXjZarJabMdQ2UN2
 D6n+Jef8z5zKko0rCu1yTJ0F8CBcU08rm691hk7ZUW9bpDgMHSlbwUhTvAEf+Mu8oeAe
 etJg==
X-Gm-Message-State: AOAM531LTyWIx0BzxrkMiIXRSigmajjbL9HtIbyTVJVKH9a2TDmFoeR/
 dK7RHP2Z8vjWLs1ZmznPJf0=
X-Google-Smtp-Source: ABdhPJwszazw7EW7d5bx/e6FqZLMf1EUKjtsldaoh66ru2HcCmV6kqtSiDkeqgSct6YLp8CN2vgnbA==
X-Received: by 2002:a17:90a:73c6:: with SMTP id
 n6mr1822080pjk.128.1628010811229; 
 Tue, 03 Aug 2021 10:13:31 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id c136sm15983532pfc.53.2021.08.03.10.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 10:13:30 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eric Woudstra <ericwouds@gmail.com>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: Re: [PATCH net-next v2 2/4] net: dsa: mt7530: use independent VLAN
 learning on VLAN-unaware bridges
Date: Wed,  4 Aug 2021 01:13:21 +0800
Message-Id: <20210803171321.3026041-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803164853.gxw4zfxmmgs2kgry@skbuf>
References: <20210803160405.3025624-1-dqfext@gmail.com>
 <20210803160405.3025624-3-dqfext@gmail.com>
 <20210803164853.gxw4zfxmmgs2kgry@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_101332_242327_43963766 
X-CRM114-Status: GOOD (  16.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 03, 2021 at 07:48:53PM +0300, Vladimir Oltean wrote:
> After this patch set gets merged, can you also please take a look at the
> following:
> 
> Documentation/networking/switchdev.rst says:
> 
> When the bridge has VLAN filtering enabled and a PVID is not configured on the
> ingress port, untagged and 802.1p tagged packets must be dropped. When the bridge
> has VLAN filtering enabled and a PVID exists on the ingress port, untagged and
> priority-tagged packets must be accepted and forwarded according to the
> bridge's port membership of the PVID VLAN. When the bridge has VLAN filtering
> disabled, the presence/lack of a PVID should not influence the packet
> forwarding decision.
> 
> I'm not sure if this happens or not with mt7530, since the driver
> attempts to change the pvid back to 0. You are not changing this
> behavior in this series, so no reason to deal with it as part of it.
> 

There is PVC.ACC_FRM which controls the acceptable frame type.
Currently the driver does not use it, so untagged and priority-tagged frames
can get into a VLAN-aware port without a PVID.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
