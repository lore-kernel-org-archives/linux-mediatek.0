Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D598DC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 16:15:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D7CF604DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 16:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9D7CF604DC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I0TuVlWlK6uphtAeFdpqGZa/z1KYklQB92sBG3yDVMQ=; b=TTfUejehp8Bqp9
	tMq9vh4Cf/UJcuqRxtW3zpX1Cb2qOdaVmr4UCCXYDEXu06uGO9YGK/ALNMPC5tFm2L7sM5YGI5raP
	uJ4nqhhUAZB+e6W+G7OUJ+dPuNG6xsNd5Ys+hhwDbQKtdX3oY4TxPkLCfjBq9hTVWYAv5TIQ3foVk
	DrqWea/rOqRLxI4cQH3pHfc2lyanEr3qqtVjTfI/P64F7uS7wpJS+KujQsO7okiMbFmX50brXBDmV
	6d9fPsjw4gRsNPaiiU3RXpKJaY2U4Z8tH89q98KGOKvKGI7w5Q4XQKl7z4DCtkXCe1AYt69lC8jP8
	ddjgeDwDd0rnL62AyDnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m98gM-0050tI-Al; Thu, 29 Jul 2021 16:14:50 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m98dZ-004zcG-Ou; Thu, 29 Jul 2021 16:12:00 +0000
Received: by mail-lf1-x131.google.com with SMTP id f18so11990919lfu.10;
 Thu, 29 Jul 2021 09:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N/ukz9Nxovf/wu6f2u5vCaEbaJjcjA44qpNIta3Aiwk=;
 b=Qw/ib0YrQysCpDvVZE3IzXPLC/imDhK/VxXHvnOOthIj1PRxXYA6+vexaM47HToVoA
 tTETxJbo3lLqGZKs6DB2vebtNnLp0IUDdbcm5f/Uvm1VdwuYwcCjqhwZddHqSu63vP23
 DVVWLBUwnPtdtGpCE7RH6RNe9sYe11mmVHuagF1lsJuFu/PBS9JQedVLgUWmUS1BxVu4
 rBNTbSIWrpyNoKx7THwvlCyIvvupKo4hF2bC2PXeKOJ00q9temZJhrNsalW2ZTYTj5jV
 Fs5OhQ3VRC93qLEu2YF4tIwz+h9Pt84HoNL3+eHXhD2r8r8NDCm3Bs6okrzCMBA23Rk7
 pr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N/ukz9Nxovf/wu6f2u5vCaEbaJjcjA44qpNIta3Aiwk=;
 b=FDzR82gOqyjKUayDq1BNuqdZKPEM8M0fUNC72dY5NGp+jtXvzuDiSKxArI6kihnv5G
 /MCeiw9ducThkDNTyUeM9H5Z65QLVxqtI18/ZXBKqqvOr1eyOmsjBlNZR5nfikdxhmjK
 MIrmN9rrnvaQOQhmOhoGI6lfFpdaoMi9WPA88pF/F2gw5VKm9UJwv1y0qTefqdQY3GeJ
 irva3MdiyRfTn53DxHNdlAo3IND2+BMyN8yWWcRLeIcUx83Pqt3ng5uAtsOMkmHmTJvr
 2XWFb8rfTLDx1yuFxp9psezkaCxVBWHF5DRNZV8kjfG0bE6dwZyDGCIzvQIwFGr/trTg
 uptg==
X-Gm-Message-State: AOAM533eSQCC7h8GcHuaBcOhv+IVmvvfiqF+MAe5B9Vkah08ldvbqAOj
 pvr0vq0UxWcl6RXgZRnkKKGuvFuc+829GvVUARw=
X-Google-Smtp-Source: ABdhPJx8Sflz71gf1mhhsuMz8oCEiGzHhbGVCNN3UMpN5Pi+BQfxX6fNmF2Fo+tsOPc1VWB60X/9nAL2qJZgLb2fc5I=
X-Received: by 2002:ac2:4341:: with SMTP id o1mr4177642lfl.360.1627575115559; 
 Thu, 29 Jul 2021 09:11:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-3-dqfext@gmail.com>
 <20210729152805.o2pur7pp2kpxvvnq@skbuf>
In-Reply-To: <20210729152805.o2pur7pp2kpxvvnq@skbuf>
From: DENG Qingfang <dqfext@gmail.com>
Date: Fri, 30 Jul 2021 00:11:45 +0800
Message-ID: <CALW65jbHwRhekX=7xoFvts2m7xTRM4ti9zpTiah8ed0n0fCrRg@mail.gmail.com>
Subject: Re: [RFC net-next 2/2] net: dsa: mt7530: trap packets from standalone
 ports to the CPU
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, 
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 netdev <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_091157_883790_DEAE3CBB 
X-CRM114-Status: GOOD (  10.02  )
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

On Thu, Jul 29, 2021 at 11:28 PM Vladimir Oltean <olteanv@gmail.com> wrote:
> Actually, on second thought...
> If MT7530 supports 8 FIDs and it has 7 ports, then you can assign one
> FID to each standalone port or VLAN-unaware bridge it is a member of.

The problem is, there is no way to do that..

According to the reference manual:
Filter ID is learned automatically from VLAN Table. 0 is the default value if
VLAN Table is not applicable.

So it is always 0 in VLAN-unaware mode.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
