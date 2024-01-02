Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FC5C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 12:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6zV12XTifi7kUx3OOAHC6KwNMFaqKkolPFrVGczEkk=; b=U5eH/cuuo8BZbh
	S8UjhX2IbtLOn/9XV9LbA18ihwUCXRu8cZrGwrBVnSX+n26vgl2Hq2EbCAGceqp9ETeOWI82qJj7E
	kZVZ5GrOFKZ/lyvnusk5u/0CFJ81RtulEosRgpyWcOSaT9zgrwG1jNBkEXszfzYtDhOVA00m5xuIa
	keL0BK3lBGNF4MxyHmj5CMCKujJO0rVEXSMJ7565srT7geSwwzcfPdj6bA8YHay1EJxEq//xEkYV4
	edZ39wBcicNot1MuXlVxdIXYmEiN6DMAINqK3p7GNFUwUogjXvrxAMSu60lorKQBZ3csJPbMej+3F
	+Htgb9BkV7r+7FMbc2Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKeJ2-0082dH-0Y;
	Tue, 02 Jan 2024 12:55:40 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKeIy-0082bc-2a;
	Tue, 02 Jan 2024 12:55:38 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6d9c2db82b0so1761365b3a.1;
        Tue, 02 Jan 2024 04:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704200135; x=1704804935; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+6zV12XTifi7kUx3OOAHC6KwNMFaqKkolPFrVGczEkk=;
        b=UFXBpBxKOX199AIfHUfu1LCL5/oBoQZOWaNquLBjWO6rpRg7ktiNAP+DvZLve4YSww
         HN2g6uZz0U93pHUNpNVQMVGBUeBHnNpiJC2RkQw1cnbfCIubG3qUxtCkuEiGZuKqyvql
         oQFxEuo/6e68sLaQdYQJKbp6J2MdEOR6vUNynoxeiNOz3otMguI6y7niOfelD9Hg+zlk
         VasW6ryJ8lglLZfTXGOc3CGftAx/Rasg4ipTtMvhsu1uaVhh0an18S8tDfhvgA6MB65o
         OI5OxfGSK3BpBtGwptwqYzKe+l2SkuHT0vxTiWLwkHcGvHjBbQfJhR2QfpBnK13Zn6Dj
         owpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704200135; x=1704804935;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+6zV12XTifi7kUx3OOAHC6KwNMFaqKkolPFrVGczEkk=;
        b=c6ZgzqfumzZ9fKKJuwmBYacQfn3mQo2SBAihkbc+NgKLVQcjLafMi6AhS9dySV7t6Y
         X3qab7NF5xtgX+4VWqOq24PrsOs6YsDEqeNH7BYaWCWd8wkDOE85aW5d8p1umkQdnPpv
         qolH9PVHKl75/l3crVzbbRDNE967nFlxm4SCq9Y/qbgDalRl6enf+3XtAyCRqpiupr3V
         HYMsDZFkFSqnI4rcpPWFZ2c9NRaAtsf3Fim8LJC9nHkHBLQdh28xmYkYzCazIkvbGZbN
         7ieI12dWsLVnOKrtpeQCDGsD2D/CkPbEO7V5bw49JLZXDUMddocbYways0ssLB3qzM/B
         cmJg==
X-Gm-Message-State: AOJu0YyT5bOioVhZ28HKzCuhb2GtWczQseV16n6CoQnsl3ZSH2JmluRa
	LI0dqCqdqqSBSCf0sEMAHl0=
X-Google-Smtp-Source: AGHT+IFRCZojliga3N9ozWGn5Eayce7SFrQ/owylc0cKJuk3qq2nb7v1hWLetkyhKqOrD4ap5xRY6A==
X-Received: by 2002:a05:6a00:4505:b0:6d9:a0da:4fbc with SMTP id cw5-20020a056a00450500b006d9a0da4fbcmr7360079pfb.36.1704200134866;
        Tue, 02 Jan 2024 04:55:34 -0800 (PST)
Received: from [127.0.0.1] ([89.205.132.224])
        by smtp.gmail.com with ESMTPSA id w37-20020a631625000000b005cd8bf50c13sm20655512pgl.58.2024.01.02.04.55.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jan 2024 04:55:34 -0800 (PST)
Date: Tue, 02 Jan 2024 13:55:33 +0100
From: Eric Woudstra <ericwouds@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RFC_net-next=5D_net=3A_pcs=3A_pcs-mtk-lyn?= =?US-ASCII?Q?xi_fix_mtk=5Fpcs=5Flynxi=5Fget=5Fstate=28=29_for_2500base-x?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ZZP9GR15ufDbjGAJ@shell.armlinux.org.uk>
References: <20240102074408.1049203-1-ericwouds@gmail.com> <ZZP9GR15ufDbjGAJ@shell.armlinux.org.uk>
Message-ID: <92190426-3614-4774-9E9F-18F121622788@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_045536_836178_9F7AC1B5 
X-CRM114-Status: GOOD (  16.58  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Heiner Kallweit <hkallweit1@gmail.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

>Please describe your setup more fully=2E What is the link partner on this
>2500base-X link?

I use a BananaPi R3, with the oem-sfp2=2E5g-t module=2E It has the SFP qui=
rk that disables autoneg=2E I was trying Marek's rtl8221b patchset, but fou=
nd that even with unmodified code,  original net-next unmodified, I could g=
et link up, but no traffic is going through=2E

On the other side is a=2Erock5b with rtl8125b=2E

Only after applying this patch, it works and eth1 reports link up with 2=
=2E5Gbps instead of unknown speed=2E

If you need more debugging info, I can supply it at a later time=2E


On January 2, 2024 1:10:01 PM GMT+01:00, "Russell King (Oracle)" <linux@ar=
mlinux=2Eorg=2Euk> wrote:
>On Tue, Jan 02, 2024 at 08:44:08AM +0100, Eric Woudstra wrote:
>> From: Daniel Golle <daniel@makrotopia=2Eorg>
>>=20
>> Need to fix mtk_pcs_lynxi_get_state() in order for the pcs to function
>> correctly when the interface is set to 2500base-x, even when
>> PHYLINK_PCS_NEG_INBAND_DISABLED is set=2E
>
>Please describe your setup more fully=2E What is the link partner on this
>2500base-X link?
>
>In PHYLINK_PCS_NEG_INBAND_DISABLED mode, this means that phylink is
>operating in inband mode, but Autoneg is clear in the advertisement
>mask, meaning Autoneg is disabled and we are using a "fixed" setting=2E
>state->speed and state->duplex should already be initialised=2E
>
>> When the pcs is set to 2500base-x, the register values are not compatib=
le
>> with phylink_mii_c22_pcs_decode_state()=2E It results in parameters suc=
h as
>> speed unknown and such=2E Then the mac/pcs are setup incorrectly and do=
 not
>> function=2E
>
>Since Autoneg is clear, phylink_mii_c22_pcs_decode_state() won't
>change state->speed and state->duplex, which should already be
>correctly set=2E
>

