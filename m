Return-Path: <SRS0=F7c8=NC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A02C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 10:06:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C260C60D07
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Aug 2021 10:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C260C60D07
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=up7jA4d3PpmwOQoEJ+5omt3jHW88EEymMHtZyzc/3lA=; b=UKPfFfTfpTrC33
	VgUzQs5Zv+f8c0+bgCipeuTEl3tgm9O9CRwy5n04DqifuiY5uH/9X2UvcFm2c7fncsaKCE8rRJLXN
	FQKU+aCmk3j5VlMj2YzxLak1Yb4ghekEwCyvDy09T4s4Iyxsa0nP7N1ARwjJB7kgCRtFYvr0hTggP
	AEo53vMmgGsvQgxVEBIw+LbjHPCmpGz82J2nABGrZZVcWXGQpbCSke1GjWWBsbTQsn+WrY5B3KNTh
	/Gc9mZ0oRLzrvmUW6BygMNwHtDvaaUibnRSu73pGBYtn6przOzBovzgcQrsNExklaNF8EE7+0M2VU
	Ac8yiOqsBI9w86SNdSKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDl86-006X5i-M5; Wed, 11 Aug 2021 10:06:34 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDl3A-006V33-BM; Wed, 11 Aug 2021 10:01:29 +0000
Received: by mail-ej1-x630.google.com with SMTP id e19so3119017ejs.9;
 Wed, 11 Aug 2021 03:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=t8sJsXG1L+yGCSNJaMEQAUetNo1GZzFfdSMSXPDTu2E=;
 b=PPudw5ZgG0aCGpmGeDrDKZ/ZHM3K/7UqkCEiBQFKDtRj4weR3ZrcL+WJhalo7r8kS6
 12GeBqpaX0H5Q3GTSOy5xAWrDn7pwuaYmJR3K34wzYAlcqIzMTCw6ImMcGBrtvCDS6L7
 dbzBnXspZjflJ+ovhtjtlCVA7VBSGMao1AKGnyC5xH11+CTqJTUzTOcwRVC9oMFHEHoN
 MmwWMVQrzYHBHGWIiBBgSmlVT/o1JbP7LD6KYRy03LF+KIKkBB4WbHqz7bnd6CXeXJJg
 rgW5ZO1YkNjgYO+Rj/q5/aaYbCGdiaSq/M+NrVGhkDHOhIHb+J2jipve7aFh0MezQ4CV
 xijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=t8sJsXG1L+yGCSNJaMEQAUetNo1GZzFfdSMSXPDTu2E=;
 b=X2BzDO88owDVbc8OuaCEpRBmD61/iUADLLfZS62YQtkNrEt18+4gdwX4UPBmkj5GUR
 QE7DMKOHHfV+jAH7AgBfynAgMsSfCI+RzMh6Lta89241tbLRIgU5wxzzOR1uhMbMXGQz
 mexQ8vPk5Qh48b4NdRK7sEFfORsrlXDtX19+ar4fDfO2N9MPGHD3B3tWDGDO/9ziUkxa
 ivf7EGsmoWP5s89/szn5zoRodeRTG4XH2UFg17JdxoTfFn4NNKJG9dUnGxzMbxHbNaY/
 owM/QECuMEQJUOjEWx6i3pcJ3KbM2YDoM/vN4P3SlKYmcUb991MybH96ItLeTiYNd863
 NFXg==
X-Gm-Message-State: AOAM533Tqm3qkYuKMLE8g5U5LVnrboGB8KBd3ddFgPnf5cXLPdiK56LN
 3L5JSmeoonsd6JWAw2jblHM=
X-Google-Smtp-Source: ABdhPJz6CsfiRG/zGTl51wJCCX5mI5lhmvKxJB40wv/D8tnS2ztUadRA6z97LpY3pSMzT1Ms1cuP7A==
X-Received: by 2002:a17:907:1c01:: with SMTP id
 nc1mr2772945ejc.504.1628676086179; 
 Wed, 11 Aug 2021 03:01:26 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id z10sm7889853ejg.3.2021.08.11.03.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 03:01:25 -0700 (PDT)
Date: Wed, 11 Aug 2021 13:01:22 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux@armlinux.org.uk>,
 "open list:MEDIATEK SWITCH DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] net: dsa: mt7530: fix VLAN traffic leaks again
Message-ID: <20210811100122.hntia6od6qdc6dvd@skbuf>
References: <20210811095043.1700061-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210811095043.1700061-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_030128_454430_92BD7909 
X-CRM114-Status: GOOD (  13.01  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Aug 11, 2021 at 05:50:43PM +0800, DENG Qingfang wrote:
> When a port leaves a VLAN-aware bridge, the current code does not clear
> other ports' matrix field bit. If the bridge is later set to VLAN-unaware
> mode, traffic in the bridge may leak to that port.
> 
> Remove the VLAN filtering check in mt7530_port_bridge_leave.
> 
> Fixes: 474a2ddaa192 ("net: dsa: mt7530: fix VLAN traffic leaks")
> Fixes: 83163f7dca56 ("net: dsa: mediatek: add VLAN support for MT7530")
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---

That hunk looked indeed very strange when I went over it with commit
'net: dsa: remove the "dsa_to_port in a loop" antipattern from drivers',
so I'm happy to see it go away.

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
