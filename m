Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB160C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 06:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9Sei6I41qwaNDpvUvee9z5C91oyEDGNKLdeZYKLxNI=; b=cObqSLLtFt3lrYTYPnDsN7+CSm
	aUyuHIC85Av3nDrvuKrjvehQM+WUwutvuxk1WRKriHzV+0HLuHMEiYGFDA8LUOn5AupIAaMLuPmRp
	R1jAoZCOdj4nu3BSn12QjG4pMumtn9laAIOtiBsfCJFyLSW2TikeopL5dkhw9Btu0bpMsAqj3+nIe
	Gx3/gzsbCqylg7hElQc4D79eno/jb6H0WfHpbcEZxkIL0FT1feRTFu5QQlbH9TT1YxbPOslOeC30x
	mqBHn8EtatjWuuHAmvJo0qcsr9Cq+pZTSYcCNrIztiwteBGu1cliMpNZaARdqmbKIZHQ1uApSvVFT
	40BBB8mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pat2x-00HLV4-NJ; Sat, 11 Mar 2023 06:49:39 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pat2m-00HLSs-W0; Sat, 11 Mar 2023 06:49:30 +0000
Received: by mail-wr1-x434.google.com with SMTP id h11so6977348wrm.5;
        Fri, 10 Mar 2023 22:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678517365;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=t9Sei6I41qwaNDpvUvee9z5C91oyEDGNKLdeZYKLxNI=;
        b=edANvY7i593vAONZaHOUC5NiTyvSEIOaEbRI65vr3O9TxYv0ucfrHbTN/3kKRE+Tkj
         kTzD5JZupdMhbGi/9AnNNPmHiuE08jI/tDmN55s78utBRjPSG+l0RbEZnCYPcGD+Tz1T
         70SRtuq64yUALwEsep5xNXJc6oI5P3t6w/o40wW1OTAPugx9zilfGYPK0knap2c0m2im
         5Z/9gQAteGMZ+0W210gckbP716ypWMyoR+YjhAkCz7XgEa42CNrLjViIRviq6sj4NPdo
         QyuS+vIB0RIRQYRmiUSeCbnb6/CwiOy5Ih0xqHu+CFxbOLzMgGWScerqv1Gusqg8th2l
         zYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678517365;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t9Sei6I41qwaNDpvUvee9z5C91oyEDGNKLdeZYKLxNI=;
        b=Ufo9NBrmmatWT1/oe6TQNJLws6pjwmNdLTpq4TWSWJFJFCkHFv0D8PFTsc0QLu31kQ
         HY022n6NqZFbPY8wCfgKTvsz5qYkK8yatTPj3wkNVCGaMQfmvpsINKsiKrLAC1hIFHqx
         JYT0sx4cPYj4HRc2jq2T5CZU/uTuZ0y7W5vqe/vQkPLv5nN85mBIOWzQvriHV2MJg/9K
         hXjKiD5L/9Gy3rp+/5VTRIuGXTMsr0wnjWzaBZdbEpQR3FvChxBV5eXTvtdv26AFYA0v
         IDIG8ZvR+/N+vq05VlOUiPrN6wdx2DHcATyuvlCO8C/8gy4t8RPFqjWG+uZgE8TMDbRC
         WC+g==
X-Gm-Message-State: AO0yUKV3hcZngmGdaFbFMhpdOShA8x4KFM2W9qhdSI4+UveSwI8REeop
	4AUXXLABisz3AkREc8zhbHo=
X-Google-Smtp-Source: AK7set/JPr6Wq2tfBtyFn0d5vMSSusNpNT1n3m5tdIocxlx8YgFkE6JLYZ5AoEW5KjyXe2yJU0ieQQ==
X-Received: by 2002:a5d:4a8c:0:b0:2c7:d7ca:4c88 with SMTP id o12-20020a5d4a8c000000b002c7d7ca4c88mr18447829wrq.55.1678517364619;
        Fri, 10 Mar 2023 22:49:24 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:c51d:786:86a8:fd19? ([2a02:168:6806:0:c51d:786:86a8:fd19])
        by smtp.gmail.com with ESMTPSA id l2-20020a5d4bc2000000b002c57475c375sm1584656wrt.110.2023.03.10.22.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 22:49:24 -0800 (PST)
Message-ID: <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Michael Walle <michael@walle.cc>, Heiner Kallweit
 <hkallweit1@gmail.com>,  Russell King <linux@armlinux.org.uk>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau
 <nbd@nbd.name>, John Crispin <john@phrozen.org>,  Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 UNGLinuxDriver@microchip.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,  Jose Abreu
 <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,  linux-aspeed@lists.ozlabs.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>
Date: Sat, 11 Mar 2023 07:49:23 +0100
In-Reply-To: <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
References: 	<20230116-net-next-remove-probe-capabilities-v2-4-15513b05e1f4@walle.cc>
	 <449bde236c08d5ab5e54abd73b645d8b29955894.camel@gmail.com>
	 <100c439a-2a4d-4cb2-96f2-5bf273e2121a@lunn.ch>
	 <712bc92ca6d576f33f63f1e9c2edf0030b10d3ae.camel@gmail.com>
	 <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
	 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
	 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
	 <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
	 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
	 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
	 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_224929_051979_3699E98E 
X-CRM114-Status: UNSURE (   8.76  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 2023-03-11 at 00:49 +0100, Andrew Lunn wrote:
> > Yes, that helps. Primarily, because mdiobus_scan_bus_c45 now is called =
only once,
> > and at least some things are done in parallel.
>=20
> Great. Could you cook up a proper patch and submit it?

I can give it a try. The commit message will be from my perspective,
and the change Suggested-By you.

Best regards, Klaus

