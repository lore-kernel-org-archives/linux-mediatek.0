Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3909DE7716E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2024 02:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HTd3s3aluN78Fp6JU1KrhtNeKWaky7LzzZMIynAmPTU=; b=VM6whw4o84xK7RN2ThjklU0JQH
	6IcUA+A4TGiG0FafOnxcmgaU8tfDluigHSPiydJJmyTx0cUnkY171NSNMZ0XnpCz9h5bj8H6NgJ5q
	HJXACsBsHYyzV9zmD4cvxQmgjdUjjfM3or1DkJNQOjYB/8uI8JnyiMEzIiGYkm7ne7yeMkS4sDeS+
	yFpcuOgMDuUTLczcPj2sIgRvR6hPero4Y9eBsv6ya6djfZxlPkBwNGopn9pwlYu5RMCAjTliwUinr
	eU7knXmSAuLnC+fJIVDF6KDo2ryu8f/Q4zCYCDkBGDpmDdht9pG27sKaqIKOJ8F+XKVu+r1OW/z9f
	ZYxcSkpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJO5u-00000000KQJ-2ARq;
	Fri, 06 Dec 2024 02:29:26 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJO5q-00000000KP5-3Mw9
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Dec 2024 02:29:24 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-724d57a9f7cso1476196b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Dec 2024 18:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733452161; x=1734056961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTd3s3aluN78Fp6JU1KrhtNeKWaky7LzzZMIynAmPTU=;
        b=IJJcf8JMWdtx4/Tm7wv8PK10aBRAeor/Wi92i5EDCqKVLkywUVknV+4L2pk0kebN2b
         3cVQgvbfzzugqT95OL4IREgrB4WsW5t8S1HJZEH7pmPjsGeIR7R5bR4Z4ZpBkBYpg0YN
         9qOHWtyH4lcsLXZmljhitYG/uh2mJkNOjIyKYqwHIgkuQ54IrNVc5oYvGwVMHdhdMPDv
         OWsSNbba9LCyw6eR0Y0AWBhThng6nCg8g/X9soiiPISkqAHdxBcB9ij3VskTu3lAaWTf
         kgZoz44sr8ZmeT9xCy7YLEOOiUrDZS5Y9yysagkjFO2cIjY6HR6GHjVGBQDr6XVpPAzB
         6N1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733452161; x=1734056961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTd3s3aluN78Fp6JU1KrhtNeKWaky7LzzZMIynAmPTU=;
        b=mABNFpmD9cx4CcPnlwncOt9klf7CMYn9OSJ8E4XXvI/ldkSc94SK5s3rB6+bnosiPt
         QbuKHn7CganEmg9bR7QznLR5r58sEJQaRgwweXq9TGbPhBt3N4d7O44pfBdJgxCdwj6k
         Z1LXPNK77ihdzSu/ZT8Dk8tb1Vp0kdQPd1KEY+fGrc8wgVFPk2qeXm5TpygNI0a7om4z
         YkjJ/XIoxiBrVyrn7mytqopdLTEgdo/zwwVK4f4OE2CPy/6mna79Fq4caP26cuEA2K+Z
         dYPg397tHcnq21HVf69j4A7xqh6zs/WUBinw1Y+xXzIWI1Q0UDGh0tQTNiya/q1Ihdeb
         3nng==
X-Forwarded-Encrypted: i=1; AJvYcCXYooCqbREc1EOSfzvu4NAYY3iHr0MOBBH9GzQWSqHvUMYt091stP0LZ85xl6/pE4D50X9OkDU7OqC01CjZRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsL/Xqt8lxJwhNnSB+nikMD/xNDxsUp/ckISTyQwXcyliLkuoY
	liEYR0mPMclWVJJBlxDY82MVmt2yjfv+/HxwWuOzkvla6lWy9JGs3I9Oy0hr
X-Gm-Gg: ASbGncsqSmjumBnD7fCwwN6x5ffUwKsymi0jyAB7aPfIhUcmmER6lu/1GvaxiVtSGak
	CDTvkT/pNSmSCLg3zYyMW4bKe+aavV+2C5ojibwzQg7LwVi/1GW7EwI7csF8uqtYZ/Eqy7ErCDH
	jwHV+nMC5ZcgtEEWIuaoZK74ZkNiYL+0lOOzrOvkJPzHv+mcqo9Xni70BYW+IpfXsLEg3X9xobk
	CAriVFrwlh2sHt5xJx9ATpp/cAQlfBtYnwbGUWDhe414mCV1t9xVV16TPumjdzKXfj4jGXxsjqP
	ln4GHZwO
X-Google-Smtp-Source: AGHT+IENADZamiqnBlD27UzquN0EcS+uEssM9SmnMSUyaY3tEGzNq20fxMu9PeMax023yYnyI0hAAA==
X-Received: by 2002:a17:90b:254b:b0:2ee:fd53:2b03 with SMTP id 98e67ed59e1d1-2ef6aadb46dmr2207449a91.25.1733452161282;
        Thu, 05 Dec 2024 18:29:21 -0800 (PST)
Received: from amdora.. (c-76-146-136-228.hsd1.wa.comcast.net. [76.146.136.228])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2eeffcdd432sm3180613a91.2.2024.12.05.18.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 18:29:20 -0800 (PST)
From: John Glotzer <jglotzer@gmail.com>
To: sergio.callegari@gmail.com
Cc: Aaron.Hou@mediatek.com,
	Chris.Lu@mediatek.com,
	Deren.Wu@mediatek.com,
	Hao.Qin@mediatek.com,
	Sean.Wang@mediatek.com,
	jglotzer@gmail.com,
	johan.hedberg@gmail.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	luiz.dentz@gmail.com,
	marc.payne@mdpsys.co.uk,
	marcel@holtmann.org,
	regressions@leemhuis.info,
	regressions@lists.linux.dev,
	steve.lee@mediatek.com,
	tiwai@suse.de
Subject: Re: [REGRESSION] bluetooth: mt7921: Crash on Resume From Suspend And Hibernate
Date: Thu,  5 Dec 2024 18:29:19 -0800
Message-ID: <20241206022919.183292-1-jglotzer@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <ad78ad62-ebd2-40d7-8a6d-623ae947584c@gmail.com>
References: <ad78ad62-ebd2-40d7-8a6d-623ae947584c@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_182922_858150_4E94B165 
X-CRM114-Status: UNSURE (   5.65  )
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

Sergio,

My apologies, I neglected to mention that my setup is PCI, and not USB.

It's an AMD Ryzen 5 7600 CPU on a PRO B650M-A Wifi motherboard. For completeness OS is Fedora 40
with any kernel starting with 6.11.x.

    $ lspci | grep MEDIATEK
    0c:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express Wireless Network Adapter

    $lshw -C Network
       ...
      *-network
           description: Wireless interface
           product: MT7922 802.11ax PCI Express Wireless Network Adapter
           vendor: MEDIATEK Corp.
           physical id: 0
           bus info: pci@0000:0c:00.0
           logical name: wlp12s0
           version: 00
           serial: 0e:80:32:35:2c:9b
           width: 64 bits
           clock: 33MHz
           capabilities: bus_master cap_list ethernet physical wireless
           configuration: broadcast=yes driver=mt7921e driverversion=6.11.10-200.fc40.x86_64 firmware=____000000-20240716163327
           ip=192.168.139.211 latency=0 link=yes multicast=yes wireless=IEEE 802.11
           resources: iomemory:fc0-fbf irq:103 memory:fcf0300000-fcf03fffff memory:f6c00000-f6c07fff

What I am struggling to understand is given how easy this issue is to reproduce -  an AMD CPU, Mediatek MT7922 wifi/bluetooth chip,
and a 6.11 kernel, you suspend, and then wake up, kernel panics -  I would have thought that the interested parties would
make this a priority.

I think that a logical first step would be for SW owners to confirm (or deny) the anomalous behavior.

Thanks,

John


