Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FFBC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 15:59:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2343B60524
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 15:59:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2343B60524
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zcTyFdY71n4SgqijJSguFSiJemaJxghyX/5r8ddrs7A=; b=HY2p6ad0RAnBJ7
	kV/Gnw+1Wd2THJQ4zKxJElBawQVsJQpGCqhVs4fCWTQmaH+KI1jjFDYEKIhDUUeGNSlPU49uUfcp2
	fg99zi7JEPGkc856kzDbNVU/tRuADMwGiieJNowBNVIfhKxsLESa0M7/EfP5vbRXgAkepRbMtOjfd
	tAWjb5G7YI6hnGuE0uJgMqUt7pS9ufELSKvR4snH3l6YAWquopkZMqeHtJRPumBxafZ1qkjV01Q5U
	Q1p/YOn2kH9Sb9BeGNc6RPiTeZhcDiWveDK2PbWA2QWTQVxuHqiKgDde59qCSM747ciHrg/mqfVDA
	Kc7CeLhiqrIm1k5hycJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Uum-009PJs-0v; Fri, 30 Jul 2021 15:59:12 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9UuY-009PCW-4Z; Fri, 30 Jul 2021 15:58:59 +0000
Received: by mail-io1-xd33.google.com with SMTP id m13so11982057iol.7;
 Fri, 30 Jul 2021 08:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=v7wLcGraIB7+Os2DeF31Wd7h/jOBDQcFefcKYyZX/aM=;
 b=LTjGwVLhmYVkOKvJsuihzVCRtdsA9rdixkg8UIrZltd8odZNdgZ4Plx7wV3e9F70+q
 mcN2HD29RnVlI0+xN2cD66zdkNSQMwLngcupdSaJ2YAu9F/I3YNVL0qmAQyxUpi7qlnz
 0vWu3lPVG+LKX3+E6zK+aGDSL7PbyLQ4BM0TJ5o4cdA5MBtgQTs4+Bk5jRBIVdxp/qWj
 If36pFoYpJ6BPLHFoJjcjXpY1/5CgbKBhc2aDAeVr2CaSMjdbYohnqfyZVSAPRWS6o+q
 5xhul5npMk3+twS3V+3P/W/Y6+ecy1ci603XC98j2Qre9poqqTuOSeGdNJVWLpBdV00r
 ZWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=v7wLcGraIB7+Os2DeF31Wd7h/jOBDQcFefcKYyZX/aM=;
 b=JZzxduXMQwC0yfpL5QUgbqgGPYVk/XUK8ndFawoiEUeeTjkUM+M6VjtbTueSJ73Nj7
 dlhGJIFzTYql7if1gY7KgH4tN3zWInyBVYS3C1yTltPxLQGm/8oLd03xDBTH0Y5Bni/7
 SjSW30R84JNO042gYdgKTQxhLjm0tXfW/Tefh4SqPAHmUxTzgoLpoJYcVMG2ecY8sU49
 X2s4fKaFLPtxHENlcAFPE08orv5bDmhNaCKpy9hCXdoc++KYMucpnQozWxnggbchc1Ah
 0s8CmNS6pRtt2xPew98EB5rylBpEbwKsZ9oda53yi3KrJ7TD3Qp519WzqxxGHYv3kllo
 7pDQ==
X-Gm-Message-State: AOAM531aOK4gI3IsnSp75ppdcUfiyHDb3j37mt3QjZi3HPNdRiL3X25/
 KUK+SKd8T9gEIJI8LJLvvrc=
X-Google-Smtp-Source: ABdhPJwLaoFNDAcQsEfM5PN4POvnt4KhHYxRAqUmS/3631qr10ReGC3b5vtcVuWXDzR5kbVdXJcxuw==
X-Received: by 2002:a05:6602:2e11:: with SMTP id
 o17mr348963iow.55.1627660737073; 
 Fri, 30 Jul 2021 08:58:57 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id u10sm1292627iop.15.2021.07.30.08.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 08:58:56 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [RFC net-next 2/2] net: dsa: mt7530: trap packets from standalone
 ports to the CPU
Date: Fri, 30 Jul 2021 23:58:46 +0800
Message-Id: <20210730155846.290968-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CALW65jYYmpnDou0dC3=1AjL9tmo_9jqLSWmusJkeqRb4mSwCGQ@mail.gmail.com>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-3-dqfext@gmail.com>
 <20210729152805.o2pur7pp2kpxvvnq@skbuf>
 <CALW65jbHwRhekX=7xoFvts2m7xTRM4ti9zpTiah8ed0n0fCrRg@mail.gmail.com>
 <20210729165027.okmfa3ulpd3e6gte@skbuf>
 <CALW65jYYmpnDou0dC3=1AjL9tmo_9jqLSWmusJkeqRb4mSwCGQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_085858_242913_5136DA1D 
X-CRM114-Status: UNSURE (   8.38  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 30, 2021 at 11:45:41PM +0800, DENG Qingfang wrote:
> So I came up with a solution: Set PORT_VLAN to fallback mode when in
> VLAN-unaware mode, this way, even VLAN-unaware bridges will use
> independent VLAN filtering. Then assign all standalone ports to a

independent VLAN *learning

> reserved VLAN.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
