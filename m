Return-Path: <SRS0=F/ID=6V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39FDCC35280
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 22:57:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE821208CA
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 May 2020 22:57:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mqYlTLSp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfWvMsu2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE821208CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ed7NgPrtsSjwRljwWHpBP9r+GECw74jfHp3T9NRzsPc=; b=mqYlTLSpQqba/e
	x75yAheSDk8Mu1rhQ0VEluz7S8I/65qzIvHNdP0gF/9d07Uj7RQmikIpxb5ztrHVC7dDeWGGgcyjB
	jF72JOu44MOFzpozFSCWpbDp5bf87s0sVyGJq6VZTM8Q2A75NBTfM/5N/9tehUF3aqXWcylr4ZQ5b
	AiNz9TTsV5zbmNkbj4/KRiO7p4NavIuQMYc0no2S0wbg4B5jGMCfWSA7Z3zM7oBGFl6Bhc7W2Lo6K
	dH3wxvXCzlh3sN5RBsHP8S4Opi5cTCrugZesBrxYGRI8cmHZw0jlObPT63qMdlHeMxKlyaRsCo/cy
	fAit9WHJ277L8zcvD+eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWpRt-0002IN-AS; Thu, 07 May 2020 22:57:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWpRk-00029L-Of; Thu, 07 May 2020 22:56:53 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B888A2083B;
 Thu,  7 May 2020 22:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588892212;
 bh=DFVZVtjOy5Zq82K7JozE2r2KIIrkXMdk+V1nGag44c4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cfWvMsu2a/TSPk7q/+Zmfy29Q+AC9QWezN1eQf99G/LyIFEochDHBbNGHvRrHDHwd
 SZglIFhyk6ytKrqx4WYehFbADUTk/TTe7OKAqe6BCfjM+R6c6vfSj6H2Ogxrf/0GT4
 qWEFvrGtflMZ2XaXUvIx5uz56muVQ9+ZoWAD9EJ0=
Date: Thu, 7 May 2020 15:56:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 05/11] net: core: provide devm_register_netdev()
Message-ID: <20200507155650.0c19229e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <CAMpxmJUEk3itZs4HujJOXUiL80kmEvGBvLF0NFc2UQoVDVTWRg@mail.gmail.com>
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-6-brgl@bgdev.pl>
 <20200505103105.1c8b0ce3@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMRc=Mf0ipaeLKhHCZaq2YeZKzi=QBAse7bEz2hHxXN5OL=ptg@mail.gmail.com>
 <20200506101236.25a13609@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMpxmJWckQdKvUGFDAJ1WMtD9WoGWmGe3kyKYhcfRT2nOB93xw@mail.gmail.com>
 <20200507095315.1154a1a6@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMpxmJUEk3itZs4HujJOXUiL80kmEvGBvLF0NFc2UQoVDVTWRg@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_155652_819767_05B8D6C6 
X-CRM114-Status: UNSURE (   6.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 netdev <netdev@vger.kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 7 May 2020 19:03:44 +0200 Bartosz Golaszewski wrote:
>> To implement Edwin's suggestion? Makes sense, but I'm no expert, let's
>> also CC Heiner since he was asking about it last time.  
> 
> Yes, because taking the last bit of priv_flags from net_device seems
> to be more controversial but if net maintainers are fine with that I
> can simply go with the current approach.

From my perspective what Edwin suggests makes sense. Apart from
little use for the bit after probe, it also seems cleaner for devres 
to be able to recognize managed objects based on its own state.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
