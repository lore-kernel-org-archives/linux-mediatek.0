Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A792FC77B60
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 08:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYgdpbZjRcMBBZb2pcPFoHc8NfA9uoYOg/WF0eXftpw=; b=SlSB/RT0s3wxbiSn/NDP+OC/5u
	EhWwZ/YL+KhpdB4YFfJhQYSDhrs84wxJIxolN8cw7bttITxdcECtCVpo6HI6ui/iDf+3N3CjVIObG
	TMP18LOqmcQAlpvOnfSQy5AN2P3k8y5yj+QpdtCPhdcAQskvvDa15k2hLFTOX7Uxnorci+t6yDheI
	VXatTAeFlJfROphwGuM0JQrbsSI9jQs4cc9oZ8Qx4LgIVPgkjuM3iSOQLD4fhOlypz2JRGvk3jzmY
	yfr4pwvT5iEoIP0ZZiBmGn8lVsDxHGqyrsS5+aM/Dd7ig6dZxHpEcdV3szHkP8RwtWkSOYrGArt5a
	2RWmGKCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piAax-006XvT-0t;
	Fri, 31 Mar 2023 08:58:51 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piAat-006Xu0-1x;
	Fri, 31 Mar 2023 08:58:48 +0000
Received: by mail-ed1-x533.google.com with SMTP id eh3so86817415edb.11;
        Fri, 31 Mar 2023 01:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680253123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BYgdpbZjRcMBBZb2pcPFoHc8NfA9uoYOg/WF0eXftpw=;
        b=lVKy9HSAOGeFLg+iy7ujKGiGribkgannSjZw89QjDiPB0ZV6BZm9+DizSMM+gX3jEw
         8QIkoiOy2MNkxNZZupbYDoc64yJzb7Zakr4oYn+NZsqx23cfATRwfdyLTql0+IM3dC5T
         9zKB3+Y68Ext8eXLKbm+4W1Mq+WMbsW3LTUkmel8sWJCt88C13fN9xBBvjtKqUosu9Gw
         ucQZhXb/e9f0vPsnfBcOSdQNwVW3hXH1vRu0z/fas0JuC3+hUy/k1KwL7H5IS5+eme+q
         lWNM6p5ohWlyVrBT/8KIVW5ZPpOmzUu9j6j2ZOXYo+84gdkfqnAmrpw7d0uQRaY9JwTf
         NIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680253123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYgdpbZjRcMBBZb2pcPFoHc8NfA9uoYOg/WF0eXftpw=;
        b=a4PHbquAvwpUVvLpkp7vauxQIyekf6HirgLiLaL/Tyt28fn33FwEW/GZpxkWCpHL1Z
         OPhrj4kEoaDQGGaG5PDmBUCvgr14J/8yo4CgD+CcfyurwAGtzLf9Qfh7ax/Ae6DlKyYj
         Z9zPYdTQ+zIWx1LjUTtOQN3baMB2EgM/DfEvtXkRRGlsyW+Z7RRbFgqTamtA9JHUBTx/
         0JURELN6+BJ7b9Yc1JFn1tokwlAjoSJfpPTXWbq86c13IYxsMp9/N/lWGf/DKgWiVq6k
         Ke6uUBkPtDXR8/lyLK4PKhlM3J0VBwkeqJqdtmTpKjBFoWg2zIJZ5Da/Mn3Pk2MJtq0r
         KzRg==
X-Gm-Message-State: AAQBX9cPFnNhvF27WMLCS9NbQhqiWr9jCb6s7/K21LZwz3gzuIjReiyb
	CH8gvLkKSQojyTeTKdxlBEc=
X-Google-Smtp-Source: AKy350aDaFJSJOJ7Uru86M1OtrOcJd6vzXZMOua1Cw1Olv1RS4PYAfP4YNznT2gZtEmV3ghHrGPU/g==
X-Received: by 2002:a17:906:71d7:b0:8a6:5720:9101 with SMTP id i23-20020a17090671d700b008a657209101mr27504694ejk.4.1680253123346;
        Fri, 31 Mar 2023 01:58:43 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id x2-20020a170906296200b0092421bf4927sm764255ejd.95.2023.03.31.01.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 01:58:43 -0700 (PDT)
Date: Fri, 31 Mar 2023 11:58:40 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Hans Schultz <netdev@kapio-technology.com>
Cc: Ido Schimmel <idosch@nvidia.com>, davem@davemloft.net, kuba@kernel.org,
	netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 net-next 6/6] selftests: forwarding: add dynamic FDB
 test
Message-ID: <20230331085840.5wfxsuj6u7hge2uj@skbuf>
References: <20230318141010.513424-1-netdev@kapio-technology.com>
 <20230318141010.513424-7-netdev@kapio-technology.com>
 <ZBgdAo8mxwnl+pEE@shredder>
 <87a5zzh65p.fsf@kapio-technology.com>
 <ZCMYbRqd+qZaiHfu@shredder>
 <874jq22h2u.fsf@kapio-technology.com>
 <20230330192714.oqosvifrftirshej@skbuf>
 <874jq1mkm1.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <874jq1mkm1.fsf@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_015847_662623_A4A265D1 
X-CRM114-Status: GOOD (  16.90  )
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

On Fri, Mar 31, 2023 at 09:43:34AM +0200, Hans Schultz wrote:
> On Thu, Mar 30, 2023 at 22:27, Vladimir Oltean <olteanv@gmail.com> wrote:
> > This is how I always run them, and it worked fine with both Debian
> > (where it's easy to add missing packages to the rootfs) or with a more
> > embedded-oriented Buildroot.
> 
> I am not entirely clear of your idea. You need somehow to boot into a
> system with the patched net-next kernel

You have to do that anyway for any kind of kernel work, no?

> or you have a virtual machine boot into a virtual OS. I guess it is
> the last option you refer to using Debian?

You could do that too, but you don't have to. Debian, like many other
Linux distributions, supports a wide variety of CPU architectures; it
can be run on embedded systems just as well as on desktop PCs or VMs.
I didn't say you have to use Debian, though, I just said I ran the
selftests on a Debian-based rootfs and that it was easy to prepare the
environment there. The Debian rootfs and the selftests were deployed to
the target board with the DSA switch on it, in case that wasn't clear.

