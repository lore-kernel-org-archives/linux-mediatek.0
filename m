Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F6DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 14:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lmwon3whKue/CVr8WrW952+rwBDr0RPAb1kYusMk964=; b=BzLW1Av22ZnBzgyYo9oJGz0c8y
	oSo0vG9qMFUo4G1mH+bj4uqNz6WivLLUJdJXgYEcv8Ip6O8zJP8FGIYOpw4+mhupJ8DRqFuyZBKmd
	AAhuEpV9EuOFpE9T2Xv34U/QBQ1Qr6nQkXnTI6X+CcldspGJ4Ml6LI5+kDPYuZ3b79UIjXspPge9x
	G/USkzfYhNaY81hM2ZqwxEU8wG83wgx/JOGRUNrFKOEWfk8ZL89SxiB5ZKzimkQcqPOaBDa8fpiOU
	hGJBhT3QuvfFr9RG7O1j1PNlhjOWWvQr7jO0iEpC9QZmsvlmJVrHJPF4iUifajcuhg4Myhq3dNMu6
	EL05df4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWUV-00G7lr-67; Thu, 20 Oct 2022 14:25:47 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olWGO-00Fv4a-FX; Thu, 20 Oct 2022 14:11:13 +0000
Received: by mail-ej1-x633.google.com with SMTP id 13so47628979ejn.3;
        Thu, 20 Oct 2022 07:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lmwon3whKue/CVr8WrW952+rwBDr0RPAb1kYusMk964=;
        b=h80IgPyAct7MK5zRLczRsF/1fG3PBVUcnjpRONux/l7QMniZAgQZF7KLJ/b8Xb57nV
         eNAHIneSfPVRYfQcjBU3UbTc8pcRnTz9EZFVSA2Wme8B885eczCZhwaStsn2GzrZ+2Yh
         enoURpRTuzQsVnhi3X9wa5HCqzTl9P29ZaZd/6G3Bqi5N6nREPYEZxVqPLjXeaVZq0Ps
         fqwmyJ29Jjtsc72JKjktuIL9cU5LUimNJgQZFh2PNUR3x6l8gj7g9UKGLd4ZQxSomeBp
         sbCQCd8BswmIENyTJcTrmwGkm6PzlkR13ILiaHEOGbZjT+4lhpa2zKxGvQ6fu5DKQUUB
         em4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmwon3whKue/CVr8WrW952+rwBDr0RPAb1kYusMk964=;
        b=QFLoreANs0SXDhY2iBUDn+Jrzz3c9ZpQkC27DmAWATjnFiuf57Y9YOzzi33pGpd9ss
         VTMEIGNGk5RsNFXyMph3j8Lk6PvR+Z4FfiPCu7+7fd1HehsMAll7qUu5jjRGWloQ4rnX
         2DDyTXE9npLpc1zH1qs6q1+bJBzMAhRAHfwUcyLsO6iwElwcwtsIhpGyjrhBrf+9Z1rY
         mP+4bzpllLx5KzJfjszF6DpgMYZghJLi09ehqjYQynx3JJteQUGdBuaYupkeCGLVtpFQ
         AQVRj/GXHsGg23qgRVcW3q31b2j7G8fTeXfFZXAxZREVytPDpWFg+dJtre+TFMsh6xu9
         l0HA==
X-Gm-Message-State: ACrzQf1HUyhLrT1z1y7ejpsXjB77EceycqSaAa6GLk32EfNw/Sch3mkY
	02IGTuP8+E/iHp8lk9d6+So=
X-Google-Smtp-Source: AMsMyM57aHXW/RGGiBVsB52ziBQZJfs8YnrGc+aSU1SEGc3QC4xsLDheavS6ccxJp971i10kW+FYgA==
X-Received: by 2002:a17:906:a4a:b0:782:686d:a1b6 with SMTP id x10-20020a1709060a4a00b00782686da1b6mr11023934ejf.232.1666275069320;
        Thu, 20 Oct 2022 07:11:09 -0700 (PDT)
Received: from skbuf ([188.27.184.197])
        by smtp.gmail.com with ESMTPSA id l17-20020a056402345100b0045cba869e84sm12232510edc.26.2022.10.20.07.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 07:11:08 -0700 (PDT)
Date: Thu, 20 Oct 2022 17:11:04 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: "Hans J. Schultz" <netdev@kapio-technology.com>, davem@davemloft.net,
	kuba@kernel.org, netdev@vger.kernel.org,
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
	Florent Fourcot <florent.fourcot@wifirst.fr>,
	Hans Schultz <schultz.hans@gmail.com>,
	Joachim Wiberg <troglobit@gmail.com>,
	Amit Cohen <amcohen@nvidia.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bridge@lists.linux-foundation.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 net-next 05/12] net: dsa: propagate the locked flag
 down through the DSA layer
Message-ID: <20221020141104.7h7kpau6cnpfqvh4@skbuf>
References: <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-1-netdev@kapio-technology.com>
 <20221018165619.134535-6-netdev@kapio-technology.com>
 <20221018165619.134535-6-netdev@kapio-technology.com>
 <20221020130224.6ralzvteoxfdwseb@skbuf>
 <Y1FMAI9BzDRUPi5Y@shredder>
 <20221020133506.76wroc7owpwjzrkg@skbuf>
 <Y1FTzyPdTbAF+ODT@shredder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1FTzyPdTbAF+ODT@shredder>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_071112_581183_B1858448 
X-CRM114-Status: GOOD (  10.16  )
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

On Thu, Oct 20, 2022 at 04:57:35PM +0300, Ido Schimmel wrote:
> > Right now this packet isn't generated, right?
> 
> Right. We don't support BR_PORT_LOCKED so these checks are not currently
> enabled in hardware. To be clear, only packets received via locked ports
> are able to trigger the check.

You mean BR_PORT_MAB, not BR_PORT_LOCKED, right? AFAIU, "locked" means
drop unknown MAC SA, "mab" means "install BR_FDB_LOCKED entry on port"
(and also maybe still drop, if "locked" is also set on port).

Sad there isn't any good documentation about these flags in the patches
that Hans is proposing.

