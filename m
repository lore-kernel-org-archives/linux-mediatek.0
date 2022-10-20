Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE651C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 23:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KSyGYu5mB1+N4wjZMirWYKsm/OR0IsapLyRpo6UTXsY=; b=gAr52UtwrlahxxFvbf/EP2QWV/
	4JOzai58ItQ0Vl4lavXRa10eTz2XFumuFrkMOAIsshnPZBqim8bRqTSqEPc63fBeuMHByQvfrUF5H
	uBGTYqYMvE3mpDmTJbKFA+4XpgcNy0TXFlX0Mi95BoeaszM96fbuy5wqqscfVB5agLNzMLJdFzYCD
	THmqtPuNfJwRd+Y0dngjFaiL4hNB4+RESsLSOcK7MB8cZzrtHsHSxYmC/dATK6kDjl1135VtUvif0
	FP6RjxakTYcyEpbU9Q7Jif1Ia8PL5wmKGJnMDTXSu33wBIKlE9iR4Vp3+iHXsZB6ekWIG1obxxVBR
	uzaTLUNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oleXM-002Scd-RX; Thu, 20 Oct 2022 23:01:16 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oleX6-002SWY-Mf; Thu, 20 Oct 2022 23:01:01 +0000
Received: by mail-ej1-x62b.google.com with SMTP id ot12so3153623ejb.1;
        Thu, 20 Oct 2022 16:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KSyGYu5mB1+N4wjZMirWYKsm/OR0IsapLyRpo6UTXsY=;
        b=Q56oC/qBd5xz35WvyWQaS0SIowWdUGsQJGKXPYPkAnTa/HBtAJArmBFWpYa4LsxwZM
         dRlIx8DC4hBSeGgM//j/8NzY/dw+Mei+dUBUkDFIh3SWNbBNewoDZE8vZ/mFvCJkaweH
         0CKHQ+Vq2hMhLVz/iryTvkBEYh0mrRiBrB4oYDVCPYsjTyYcfL3/8OWk6wBEmwcnyunB
         bfZj7X3bwD0eLmPx25r+dHE2SgvNwcmrhiVxN7WFCmB6G9CggNc4ICHBDYecYO19eAPq
         BVOtx5Sl6l9g0jIebCbhH8xJIrdO3wx8ylyCdfSuAbVFe17RATgQJ8cNesesZpShl+Zx
         k8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KSyGYu5mB1+N4wjZMirWYKsm/OR0IsapLyRpo6UTXsY=;
        b=Q8IyQQZQZUvTmnOtyvVHtzXI2AdOcXP2GIKZGrkrL7YSx5LXIH2C9Hfw6THFXmSS8E
         WcUVRWlq2FujrIUktiaBdglF+gHrewjDaVsEdGakgcyDJ2Owq3aVnq+CVMR+IH7k34FO
         CoATGrOx39UobVZs67MAxDsdzDI7zxLP4g/bo8aia/npoSPKTi2ma/f80RFcuSz6efWZ
         jSMv263eufW+YlqVUmi9TNRLnXxNu2uK9+f36vVX/r2lrdcnSUoAcpoRJJswl3KUlr6P
         lXTfwTOyvWjla0k8aWZg0MwNQDDl7L2LFZ/zpSD84jkupUogUwOGQTOKgoQ8/G42iQ9i
         HTcQ==
X-Gm-Message-State: ACrzQf3HN6xqDb1NFafGIGOVcnacERtWOu0hBETlUTaIr39ZAKHtEV9U
	0cIw3M5N9edWK6ft0h2r4Q4=
X-Google-Smtp-Source: AMsMyM6W8HBBWWLJ65JA6laSIwE+MvNKCBJ9YiwTN1w3VFyEQBNnKUt3QnC4rR1yG5+HdC0wZCFkKA==
X-Received: by 2002:a17:906:fd8d:b0:780:997:8b7b with SMTP id xa13-20020a170906fd8d00b0078009978b7bmr13065061ejb.635.1666306858463;
        Thu, 20 Oct 2022 16:00:58 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id x24-20020a170906b09800b0078d46aa3b82sm10779489ejy.21.2022.10.20.16.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 16:00:57 -0700 (PDT)
Date: Fri, 21 Oct 2022 02:00:54 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: netdev@kapio-technology.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	UNGLinuxDriver@microchip.com, Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Yuwei Wang <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>,
	Florent Fourcot <florent.fourcot@wifirst.fr>,
	Hans Schultz <schultz.hans@gmail.com>,
	Joachim Wiberg <troglobit@gmail.com>,
	Amit Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 net-next 10/12] net: dsa: mv88e6xxx: mac-auth/MAB
 implementation
Message-ID: <20221020230054.542nmf66rvaswr32@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221018165619.134535-11-netdev@kapio-technology.com>
 <20221020132538.reirrskemcjwih2m@skbuf>
 <3e58594c1223f4591e56409cd5061de7@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e58594c1223f4591e56409cd5061de7@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_160100_779955_F4B9C264 
X-CRM114-Status: GOOD (  11.54  )
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

On Thu, Oct 20, 2022 at 11:09:40PM +0200, netdev@kapio-technology.com wrote:
> > Again, dsa_port_fast_age() is also called when dp->learning is turned
> > off in dsa_port_bridge_flags(). I don't want to see the mv88e6xxx driver
> > doing this manually.
> 
> Maybe I am wrong, but I have only been able to trigger fast ageing by setting
> the STP state of the port to blocked...

Maybe you didn't try hard enough? On a DSA bridge port that is up and in
the FORWARDING state and with 'learning' on, running "ip link set dev
swp0 type bridge_slave learning off" triggers dsa_port_fast_age().

