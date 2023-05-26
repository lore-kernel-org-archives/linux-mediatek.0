Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E560C77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 17:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQ/mZiE1DDLOAtWwEqQIo9NTpf4yc0wp34Ig/HGhPX4=; b=HCeF5XCL10aL87AhPW1t0edDoU
	USGhsd9uLSsApNBR6fAex3N+rP4AuhK1qv8JpYFEmYXR8sOs+aA7vgBYzR6ZKYOMKI9dsNuZ0uKvP
	gDaQj5mncBjt0UKvfWfqcDI0rswMZE2QaLYk3gN/df7bECJR58BLrlTEQIEYcB85Mw2ftbNt0DeYO
	/awkwBrD8a681O5x0QGqLnwTDwOpoW1OUOzDZ0cX/YkQGj9FsHt4XjEVtjMum27NbMD9ysYUww0PK
	G2tkqVRsftmBDrSy6kZTU0m9bLt+sbsuVxG0mtIUK1AlOg9oylvUBR7LTVSXrWhC50n3a7zoRTGNc
	dlf9dxPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2bXG-003M8m-2m;
	Fri, 26 May 2023 17:47:30 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2bXD-003M6m-2a;
	Fri, 26 May 2023 17:47:29 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-96fbe7fbdd4so178541266b.3;
        Fri, 26 May 2023 10:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685123244; x=1687715244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nQ/mZiE1DDLOAtWwEqQIo9NTpf4yc0wp34Ig/HGhPX4=;
        b=Rx3Q483hiduzAtSQ9xT826hU64MZ3nsv/l1S2d+95mbKEBV4iS1itIFuG1ACAlZ93M
         WTxpNhgOf69JBFqtsBCawVdjXBi0R+joU1vOEz2c9pGRYvmdi/febe0zlTdHeAsntSui
         Pi5x8A37be4zWIdYTRf5/436iKCxGyS9gVJcSPqmaXCIs+56dpyuXT5A7Uyi06NPy6B0
         Hs3ZrbiykGC5m58K4lLlGb519Gkp1eNcB+poVYQK9FGrtVYzPIx65p9Q6bRMJlJdgQSB
         /EIKPBTYbG9JunwvsE4gyapFKG9lP09YCKEbI67AbWYBQ6ul6O6l060hYJo/+RXHaGYN
         sbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685123244; x=1687715244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQ/mZiE1DDLOAtWwEqQIo9NTpf4yc0wp34Ig/HGhPX4=;
        b=QevuGLXOUCuBjI7lqArNvKE1Zz5ijyUuMKfFKmIcEOMEm/FTbFi7eVkZ+XIL2ox3Lw
         DuwVnu0DdTiF9ktdBbSYaIbY3spZY2rf2tYPCCttVbWTwuqHkAaosjIFQ0A2ao2gcYgw
         SYvkbu+W8x9pGwhRvukSM7msh+vnCRvgghQX7f4DboOyHEgqiDaACNNHIerqo5j0Eoko
         p2mwkqPar4au5f1u0Gs1ZDDAWCAsp2EMiaXclxp6e9cE5qhi2c4eP150QRTkI2Ix0Zd5
         Pl7H+ag+4FyVYSQHmxgxertqKlG/TEVrzcZHLRE+oY5TMserws6Z1cFKiwejZjad7O/6
         5Pjw==
X-Gm-Message-State: AC+VfDwpV4RnjZdVn8KmIEMst0rvvj7pDOfo6GA9bpokgIsStq+ZypG8
	AQoaQqC5wgMlCbb9pd9Q9Ro=
X-Google-Smtp-Source: ACHHUZ4e3H4E47OpEJ4FjqZDL4K7u5OZImeOvXQZzOYZaPpmbevgWFJ++QbgFeYcEP/sZ/qITxh2IA==
X-Received: by 2002:a17:907:16a3:b0:96a:928c:d391 with SMTP id hc35-20020a17090716a300b0096a928cd391mr3246692ejc.4.1685123243954;
        Fri, 26 May 2023 10:47:23 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id i13-20020a17090685cd00b0096f83b16ab1sm2394439ejy.136.2023.05.26.10.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 May 2023 10:47:23 -0700 (PDT)
Date: Fri, 26 May 2023 20:47:20 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: arinc9.unal@gmail.com
Subject: Re: [PATCH net-next 00/30] net: dsa: mt7530: improve, trap BPDU &
 LLDP, and prefer CPU port
Message-ID: <20230526174720.q7wsbbauyttu4grw@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230522121532.86610-1-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_104727_842736_FB20004C 
X-CRM114-Status: GOOD (  15.12  )
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

On Mon, May 22, 2023 at 03:15:02PM +0300, arinc9.unal@gmail.com wrote:
> Hello!
> 
> This patch series simplifies the code, improves the logic of the switch
> hardware support, traps LLDP frames and BPDUs for MT7530, MT7531, and
> MT7988 SoC switches, and introduces the preferring local CPU port
> operation.
> 
> There's also a patch for fixing the port capabilities of the switch on the
> MT7988 SoC.
> 
> I have done a bidirectional speed test using iperf3 on all ports of the
> MT7530 and MT7531 switches with this patch series applied. I have tested
> every possible configuration on the MCM and standalone MT7530 and MT7531
> switch. I'll let the name of the dtb files speak for themselves.

As general feedback for the series, please sort the fixes to be first,
to have as few dependencies as possible, and submit then to the 'net' tree,
leaving cleanup at the end.

