Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE740C7EE29
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Jun 2023 12:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VeW0ngdO2nTxTyDY3vQxZmrgp8rm0aHNbRAt+SY2V/c=; b=il6HaZduD/Wjldf1FzZSUsihNN
	VbdfuQpGxYYaINgE9gZiTCLyc9nzEwY0O++OJkXcY20RtstGmstbUtvoBJ3PNBj68DDP29spuq2cc
	yk7xngtZWBjr99qiD0eZDOpdj/SKLfzRrcFGA9b5DUoWUka3dg/4d0cf1ElKDd0tQs/F0jQRYNDy5
	nC3p6mTy0aO6KbyhA/PtFyns01zwIxVuYeGqxw5bqkbIm82qZdvYdscGTp20tx7+oCfUlDMIR5gXA
	z6wRNNkPYvbba7igLLkTk82qj7xaQSjtYauUa3RsQP9fZQqEkJY+BgG8OEHvFt3SaIvge/zyCUUgL
	Yd+mOSyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5n8Y-00CA2R-31;
	Sun, 04 Jun 2023 12:47:10 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5n8V-00CA1c-1o;
	Sun, 04 Jun 2023 12:47:08 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-514953b3aa6so5159796a12.1;
        Sun, 04 Jun 2023 05:47:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685882825; x=1688474825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VeW0ngdO2nTxTyDY3vQxZmrgp8rm0aHNbRAt+SY2V/c=;
        b=Lc86kryJmUdS3f9KEDgMu8GmU91p6Dl95GBJ5ExBnvRrOK8VynHk7QPTMc4G06DdRU
         Z8oqnLFXJcpNXkChuykZVpbIarl411xL6RYhp1Ol8KVyFucaW7evW/3xYp7ZtfNj26lO
         GLidJGA0HI0JR0njDkii/YD29HrGeku9RdD72dDchpjyUvwLXikL1Xea9xW6IaviiqlD
         GIpZUXianGvPY72xpuLgy5/ngCzuhu+Qegb9xeokCdmrdceUIhw3QxDWI8WLkERX5uD6
         vomPvSMXjbIAG6guy90SLkUIWZQMgeQtrlZn4Oqi3WaBMTCg9eJTwvYTWW4QBdk66L8o
         SdBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685882825; x=1688474825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VeW0ngdO2nTxTyDY3vQxZmrgp8rm0aHNbRAt+SY2V/c=;
        b=keuGq5G0PliqF6Ohsp3C3767bXvHTKVvc9nNNCooV0SBZskU7pVEfDNYgiRwcBmLnj
         KISz6g6mB1am0fHH83VlwNgFAR2gZdXvv+oOzEkUq/2MHou8wNKVOqPvnVRfA4N4T1j+
         P4hQqonhckvZpmwZozBDb0eZQf2CLGltkoNYqDRBNtRTNWlMSM+NQcVBJvhvr8jpOUHO
         WJq1+xLO5g9GG3ccSeHxgLA2KguPLlKByHZvBuq7WTFnjmcolIadGbLy6g+MsQx/AIOf
         R5VKAzZoNxxbAOt6Wo8R9Mr7usyBMbm8FYu2ay7eMGuz9cQxiMPPsLyorENNMeycJWev
         fndQ==
X-Gm-Message-State: AC+VfDyWOYU/8aqgYU9nil//tdMWsF09mOl1ov9TUuyRfKKJIGB9C28T
	U7msPzUanPMSVTDTK1dRXvw=
X-Google-Smtp-Source: ACHHUZ45xevqudBS5Bv4e4mltpxg64iuhAUgQWwQtUKMdW3S5ktWRXJXkJRQ4w5ZtlQdZLCfIHZjmQ==
X-Received: by 2002:aa7:dcd9:0:b0:514:9e3e:4e4e with SMTP id w25-20020aa7dcd9000000b005149e3e4e4emr4992187edu.26.1685882824527;
        Sun, 04 Jun 2023 05:47:04 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id s20-20020a170906bc5400b009745b0cb326sm2985831ejv.109.2023.06.04.05.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 05:47:04 -0700 (PDT)
Date: Sun, 4 Jun 2023 15:47:01 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [PATCH net-next 27/30] net: dsa: mt7530: introduce BPDU trapping
 for MT7530 switch
Message-ID: <20230604124701.svt2r3aveyybajc3@skbuf>
References: <20230522121532.86610-1-arinc.unal@arinc9.com>
 <20230522121532.86610-28-arinc.unal@arinc9.com>
 <20230526170223.gjdek6ob2w2kibzr@skbuf>
 <f22d1ddd-b3a4-25da-b681-e0790913f526@arinc9.com>
 <20230604092304.gkcdccgfda5hjitf@skbuf>
 <cc21196b-a18a-ce3c-e3f3-4303abf4b9a3@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc21196b-a18a-ce3c-e3f3-4303abf4b9a3@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230604_054707_597288_2DAE4029 
X-CRM114-Status: GOOD (  18.38  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, mithat.guner@xeront.com, Florian Fainelli <f.fainelli@gmail.com>, erkin.bozoglu@xeront.com, Russell King <linux@armlinux.org.uk>, Richard van Schagen <richard@routerhints.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Landen Chao <Landen.Chao@mediatek.com>, Richard van Schagen <vschagen@cs.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Bartel Eerdekens <bartel.eerdekens@constell8.be>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "David S. Miller" <davem@davemloft.net>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, Jun 04, 2023 at 12:39:33PM +0300, Arınç ÜNAL wrote:
> On 4.06.2023 12:23, Vladimir Oltean wrote:
> > On Sun, Jun 04, 2023 at 11:51:33AM +0300, Arınç ÜNAL wrote:
> > > > If the switch doesn't currently trap BPDUs, isn't STP broken?
> > > 
> > > No, the BPDU_PORT_FW bits are 0 after reset. The MT7620 programming guide
> > > states that frames with 01:80:C2:00:00:00 MAC DA (which is how the BPDU
> > > distinction is being made) will follow the system default which means the
> > > BPDUs will be treated as normal multicast frames.
> > > 
> > > Only if all 3 bits are set will the BPDUs be dropped.
> > 
> > Right, if you don't trap BPDUs just to the CPU but flood them, I believe
> > the STP protocol won't behave properly with switching loops. Worth testing.
> 
> I've got no interest spending time playing around with STP at the moment so
> I'm going to pass.

You can at the very least move it towards the beginning of the net-next patch
set, so that we can be sure it doesn't depend on the other refactoring work,
in case someone in the future makes a request for the patch to be backported
to stable.

