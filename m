Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DB3C55182
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 20:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wX+bqNXzbUvOFq+BzRqzbHoTdraqMXAamIS5FpWS7aU=; b=cqCsp50Y4LxQTO77LqObzl2veS
	oNewQO4O8jLLIn3EtK02o2a2JTbugARGaFV6qI9+Zz3tTMwBOuWb0pfJoD/Xijxc1C4aorzmw2mdo
	eO8qrx74n2RiN+op0AQjlIZxCwTzeLvaoKa4UEAaGIJSTdB5Pz8M5FYTfIp1mmnjSyYDBielt5xXZ
	6ejveB/0K+rylTkcowzrjmgGhjqoN1/5TP/C8/UMSHrFL7rZW+ceK5KIoLkhMxp7Bck6DrvyKOHNz
	nnulUR7YT+QeYWULFiNAjA+qIVCsXX/9SAu3DzHyMn0k7pQiSNd1T8gzY6wRnlH4Z1JcGPwYezXL3
	ypsR3iMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqzGm-00000000VBI-2u2V;
	Mon, 03 Aug 2026 20:28:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqzGj-00000000VAI-28a6
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 20:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785788896;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wX+bqNXzbUvOFq+BzRqzbHoTdraqMXAamIS5FpWS7aU=;
	b=e6vHidd4YJFy43TlJgizNUHEOXAOcjmvwFBMAotbavFFKYkQe3UmCc+OpuFY4gLAXBbkyl
	PqjjHDNjThfyInas7KHHj2PhL076XV3mK5LgDPmfUOOOC91gtSKMNDCEnHxMvRLzZgsgPI
	SEFzBkfgiL3v7YArC0wrGr84/hMipbk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-4F7th8YAPQOkAz9rq8-GvA-1; Mon, 03 Aug 2026 16:28:14 -0400
X-MC-Unique: 4F7th8YAPQOkAz9rq8-GvA-1
X-Mimecast-MFC-AGG-ID: 4F7th8YAPQOkAz9rq8-GvA_1785788894
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e53b8a302so373094685a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 13:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785788894; x=1786393694;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wX+bqNXzbUvOFq+BzRqzbHoTdraqMXAamIS5FpWS7aU=;
        b=Tu/TTTLHWoHXYgPRMCOa8ixmKV+oNJBbo1M//iolCh/kZHg0lRAdqsN1steHLR4aN+
         IEJfI+1JT/eEKpSO2e+uTRT30Q1dPPE7ZuIpegeWBMIrltd66Ul3D1BJj3ZwX0gp8PI5
         VK43Q9vSLwLC7GnPpQhbVQz2ntFX++mm2GgiouSCzFxbJAvi9MB7PHxnETmK/TSJj9ea
         iC2Q3Ql3r30BszKmP8nAPK3oyfNHpG0/8oNR/53DcQ1XEwNpFW1CM9hOQpkPMzZqV+4/
         iDV2y/fqMIm3d5OqUUDTvUYAAPuOnTkaFJ5CD5VIIS9y8v9ZYtsSVCT11ILMv0b27tyc
         xJQA==
X-Forwarded-Encrypted: i=1; AHgh+Rru9SRhkD/6uDyfhopt3jUDdMICFPr4kC4eaXNzKtirfI2bkj57GM9NdsvbuC2Or+Z1vl0Q452+ZZ5yqUrT2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFaINp3a+CA6cizj/LB1mi5jKkTNxljwPdVg+lNZgyiuy9jRLh
	1xim3LV+brpT2IV6ury7mtK7xw4gtAjRnlynnojhbngq2P9FnwrIrXYYiJoEDG6+0o13qDhw4J9
	0yZZFzMdQOyWXybq3soxKW96QrQNBJ89VFf1xBejPR+NbD5qSYCIqSDCC9xI/ZMXJ4scFzlgaRg
	==
X-Gm-Gg: AR+sD10XKtqjJEcfcBEn4DCULWJDIyEulKhqXr4Y2qjhpletwYICzJl2JInDlhZLFRy
	EjlzxumXPoF1IoVprmBoeUZV751CuZVPCPWYhyq3P6Sf6fwvjHkA+lLYVztViKPnHhImTfB7k4r
	hQHH3wLDax/RsQAkPGlhC/00NMdDM85WHx7a93vuIDTyKZmnD68gjg/vq7vkkbJlFm95W+lgBUM
	Y2OgiQ0d74qH0/kX2NIM2tUWW8X6rtLM9RIUVL/n7+jS4sTbTs7KbrYm3ksyEreCf/ao0T1DSfg
	Bj2D1VSS1ZXknpWfGr45vkRJWjeBmUzCzhH+yOcjbHwFlA6R0/sNRhoX1hRE0WXEGV28rRsvsA=
	=
X-Received: by 2002:a05:620a:a0db:20b0:914:e3dd:17ea with SMTP id af79cd13be357-934a07873b9mr1716840685a.12.1785788893655;
        Mon, 03 Aug 2026 13:28:13 -0700 (PDT)
X-Received: by 2002:a05:620a:a0db:20b0:914:e3dd:17ea with SMTP id af79cd13be357-934a07873b9mr1716836085a.12.1785788893100;
        Mon, 03 Aug 2026 13:28:13 -0700 (PDT)
Received: from redhat.com ([2600:382:8125:3ab5:9f4e:536:3d0c:6b89])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9349bc25410sm737190485a.7.2026.08.03.13.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 13:28:12 -0700 (PDT)
Date: Mon, 3 Aug 2026 16:28:07 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Akari Tsuyukusa <akkun11.open@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Haotian Zhang <vulab@iscas.ac.cn>, Kees Cook <kees@kernel.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:b|_)ptp(?:b|_)" <netdev@vger.kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH 00/32] clk: mediatek: Migrate to common probe/remove
 helpers and fix memory leaks
Message-ID: <anD518s51UBvJHj4@redhat.com>
References: <20260803141659.559129-1-akkun11.open@gmail.com>
 <20260803125034.49055f62@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260803125034.49055f62@kernel.org>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9JaFjGhacLtETkz1Vw6FonHZNediMf6cAXpbeFdrcE0_1785788894
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_132817_637864_CD35CA77 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jakub,

On Mon, Aug 03, 2026 at 12:50:34PM -0700, Jakub Kicinski wrote:
> On Mon,  3 Aug 2026 23:16:27 +0900 Akari Tsuyukusa wrote:
> > This series migrates most MediaTek clock drivers to the common
> > probe/remove helpers provided by the MTK clock framework.
> 
> Why are you CCing netdev on this? None of it touches networking

I saw that message from you about two different mediatek patch series
from different submitters. This series has 38 files, all under
drivers/clk/mediatek/. If I run get_maintainers.pl on each file path
individuall like this:

  $ cat filelist | awk '{print $1}' | \
  	xargs -iblah echo ./scripts/get_maintainer.pl blah

Then netdev list doesn't show up.

However, if I look at it as a whole, then it shows up:

    $ b4 am 20260803141659.559129-1-akkun11.open@gmail.com
    $ ./scripts/get_maintainer.pl \
    	./20260803_akkun11_open_clk_mediatek_migrate_to_common_probe_remove_helpers_and_fix_memory_leaks.mbx

    ...
    netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_))

I think it's matching on this entry in MAINTAINERS:

PTP HARDWARE CLOCK SUPPORT
M:      Richard Cochran <richardcochran@gmail.com>
L:      netdev@vger.kernel.org
S:      Maintained
W:      http://linuxptp.sourceforge.net/
F:      Documentation/ABI/testing/sysfs-ptp
F:      Documentation/driver-api/ptp.rst
F:      drivers/net/phy/dp83640*
F:      drivers/ptp/*
F:      include/linux/ptp_cl*
K:      (?:\b|_)ptp(?:\b|_)

I think it's the K: for the ptp that's matching.

$ grep ptp 20260803_akkun11_open_clk_mediatek_migrate_to_common_probe_remove_helpers_and_fix_memory_leaks.mbx
-static const struct mtk_pll_data ptp_plls[] = {
-	PLL(CLK_PTPPLL, "ptppll", PTPPLL_CON0, PTPPLL_CON0, 0, 0, PLL_AO,
+static const struct mtk_clk_desc ptp_plls = {
+		PLL(CLK_PTPPLL, "ptppll", PTPPLL_CON0, PTPPLL_CON0, 0, 0, PLL_AO,

Brian


