Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 654B3C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Oct 2022 18:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IWT32hn/5on9JQFLZ9CdZqyFkNpfjrGX5X1sBaET02U=; b=WN3DtOBlC8sh1zlGoWKbEDvWZN
	GFWgLYuuGhxPMFR7N1AZpTjt05kZWjicgTdIPZH16lq4nssLbfQfwIXEwxO35+q7fEjmYh8VSBLTO
	1wKbkqtt1ebVGhF3fDkyI5Qqz/+23fL9XnA+M2/IUqN0BGtEvEI2DfcdPJ8tPOQcUMdFUzQS5x7I2
	wCNH8JHCsiJJK8i99PRboDbR5v26jiab6Obae89YIOYiWe3bgHyAyDERAgxCCLVCYhcn+uODqO5l7
	NCrbNw53RGFQVc7mcegLHH05DP/cqE1GYLgnaZdrExcOYYETCWDu8oNP20ecgqI/+KvVbaAAdlJrB
	Cg8VfuSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olwXN-009Oy0-Oh; Fri, 21 Oct 2022 18:14:29 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olwXC-009OvD-22; Fri, 21 Oct 2022 18:14:19 +0000
Received: by mail-ed1-x534.google.com with SMTP id g27so8884810edf.11;
        Fri, 21 Oct 2022 11:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IWT32hn/5on9JQFLZ9CdZqyFkNpfjrGX5X1sBaET02U=;
        b=P9hSCaa39i9JGj/5fhpGAGKqV0qNaEhqet8DmdqurbIDP+fWwaBweSZJ3/S6bAi2DE
         p+eq7oKJ/RDCYh9wf+nabFJSnwsdceArXMizkG598uRi7agL1PsnxpKJR3QOGe9LGUsr
         zmlp8/3/NqI+V1i2nDa+LoUbsVbsT7TecGgNHY9btlLCVLiBhuGwippKH5FV3uy6EKQf
         py5P3IgoKNZRscRUy9euAQkfpmI26lMxdGlz6ZIjmzgrS22NPAK4YVPfYhIgDowxprq/
         ViQgGv3cTTio2/IhXMiDB1cCyYpWLgr0OA+yXjiHyGL9TQD3FZitvAZZYL5w3Dv4WD/K
         D/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWT32hn/5on9JQFLZ9CdZqyFkNpfjrGX5X1sBaET02U=;
        b=RapgEaCCLAgGSjG2y92kHngJNTulZoMyhkRlR/zCa0QPgzasfKk5C9M0iFKrrlQ1G1
         Tvyh0/2AuoeMGu6QsglnJelDbxeqnCUwaj/loIuCLZij0doUJXmjj6R/5B7F62HkNEIQ
         AmBx+22vxLBZYDxJgtMWMU6BAlpgxytqxBgS8oDIDHNemc0ET69fWmArGXuMNaHTpwvS
         xppuPAeCir56QPUoF6GmpblH6nWMqCgjUfwA167gMwd+nOoMTUWsBmhvd+4mbD3imeUn
         EVgCBf/Xfgk/3kI1ZxuuPBYi9uGyQDylwSfWogA0rda03JsYLNyfMJRhoBvF6IkYWyM+
         pVKw==
X-Gm-Message-State: ACrzQf17/B9y8N4D3KQg5b/jCcg8omwovJVVp2fWvWeXmso4UYKiXQrX
	n0ST626XTra9hhgIy1Is/UI=
X-Google-Smtp-Source: AMsMyM7EHFMooNaoQGzQ5R9JFO+S5r0igTZjt4d8ThXihB+ZZ0Av9ErxITHmAdRMMZTwcRJFugdAAw==
X-Received: by 2002:a17:907:b05:b0:78d:9bc9:b96f with SMTP id h5-20020a1709070b0500b0078d9bc9b96fmr16306095ejl.468.1666376056317;
        Fri, 21 Oct 2022 11:14:16 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id kw15-20020a170907770f00b00741383c1c5bsm11797572ejc.196.2022.10.21.11.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Oct 2022 11:14:15 -0700 (PDT)
Date: Fri, 21 Oct 2022 21:14:11 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: netdev@kapio-technology.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Oleksandr Mazur <oleksandr.mazur@plvision.eu>,
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
Message-ID: <20221021181411.sv52q4yxr5r7urab@skbuf>
References: <20221020132538.reirrskemcjwih2m@skbuf>
 <2565c09bb95d69142522c3c3bcaa599e@kapio-technology.com>
 <20221020225719.l5iw6vndmm7gvjo3@skbuf>
 <82d23b100b8d2c9e4647b8a134d5cbbf@kapio-technology.com>
 <20221021112216.6bw6sjrieh2znlti@skbuf>
 <7bfaae46b1913fe81654a4cd257d98b1@kapio-technology.com>
 <20221021163005.xljk2j3fkikr6uge@skbuf>
 <d1fb07de4b55d64f98425fe66156c4e4@kapio-technology.com>
 <20221021173014.oit3qmpkrsjwzbgu@skbuf>
 <b88e331e016ad3801f1bf1a0dec507f3@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b88e331e016ad3801f1bf1a0dec507f3@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221021_111418_130269_B03142D5 
X-CRM114-Status: GOOD (  14.16  )
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

On Fri, Oct 21, 2022 at 07:39:34PM +0200, netdev@kapio-technology.com wrote:
> Well, with this change, to have MAB working, the bridge would need learning on
> of course, but how things work with the bridge according to the flags, they
> should also work in the offloaded case if you ask me. There should be no
> difference between the two, thus MAB in drivers would have to be with
> learning on.

Am I proposing for things to work differently in the offload and
software case, and not realizing it? :-/

The essence of my proposal was to send a bug fix now which denies
BR_LEARNING to be set together with BR_PORT_LOCKED. The fact that
link-local traffic is learned by the software bridge is something
unintended as far as I understand.

You tried to fix it here, and as far as I could search in my inbox, that
didn't go anywhere:
https://lore.kernel.org/netdev/47d8d747-54ef-df52-3b9c-acb9a77fa14a@blackwall.org/T/#u

I thought only mv88e6xxx offloads BR_PORT_LOCKED, but now, after
searching, I also see prestera has support for it, so let me add
Oleksandr Mazur to the discussion as well. I wonder how they deal with
this? Has somebody come to rely on learning being enabled on a locked
port?


MAB in offloading drivers will have to be with learning on (same as in
software). When BR_PORT_LOCKED | BR_LEARNING will be allowed together
back in net-next (to denote the MAB configuration), offloading drivers
(mv88e6xxx and prestera) will be patched to reject them. They will only
accept the two together when they implement MAB support.

Future drivers after this mess has been cleaned up will have to look at
the BR_PORT_LOCKED and BR_LEARNING flag in combination, to see which
kind of learning is desired on a port (secure, CPU based learning or
autonomous learning).

Am I not making sense?

