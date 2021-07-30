Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6A9C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 15:46:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B160160249
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 15:46:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B160160249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f1PYFgAy6RUkHOVI/tHyDZHrDDR/Vg+M6XSCuutCShs=; b=zCxFXPLSNFtlmJ
	7YYOmPuzCobhnda6GqfliJr/bHS2dej/QwGrzqcIZ4akH0fgYGu5GW1kclpFgehxKh2CMCh7BkuP7
	THCaS25uoyvQnnfnlnxFzwO1yCikp76egUIKpMLixYSipdXWRLMIGdgNXbH15i5RUcYqQRrDW3/2a
	MhMSfAHdmwDStJTD81+XsvJo5bIRu/PcbHUwbeZjj6qOK10+Faha2i60tCoRtNVkJ2/cIBqVMT90m
	GxyxkeAAAmEFS1XqHb5cYieQhJq16w+g+PCGHrMFvYLjssICmv3L7LFr0b7hkowm6S+seyZzmpOua
	NWiMducm/1/vSZ9UYoaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9UiA-009MKE-I7; Fri, 30 Jul 2021 15:46:10 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Uhv-009MEW-J3; Fri, 30 Jul 2021 15:45:57 +0000
Received: by mail-lj1-x22e.google.com with SMTP id u20so13030934ljo.0;
 Fri, 30 Jul 2021 08:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fawJYldHWdolrAXivi3QZBGiBpcFEP0a9w0quyUwKgg=;
 b=Mw3YNdZqALvcqSSDyfJu3hRXiVJIQ2Nw4EEYPsD/NtQ4uui/gJ19vEbXkqspQPXWxJ
 pHHLDl0O9qdQT7bpST4PYSMbOvIT9W8FD/vghqRkndNEOeS9j6FQ/RgQbW2uXF0lOBg9
 6nmQ9RHZ1/KyA15CW+htmxqFO9p9qr2oEFiSh12xGBNMyKEcEE/8zz6AECB+P4g8KR5P
 Yi5TFhF2EBD69uf1RqHkm9d9htaWhJuBHoaKWO2Ok4l/ENProie48WcdWtqoIPOEAB20
 2NLOgBXXPvGxQv/vrfFB6xrAIkagxumIsTarzdY1W0FaNS2VYJddsI3N+mAAE1cLKfk0
 2j+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fawJYldHWdolrAXivi3QZBGiBpcFEP0a9w0quyUwKgg=;
 b=jbKIYnEcLBjHcO8hxHv160kXXqxebOputqJMOe6q3Yth7VjeyjaRG047x2Dkk6sOpG
 boeKSPKy3OagkdFYtduZa4GR1MYjavW7+O05nFeZ0zrbIQBOfrgIhIz4BGCuXJzpfZCS
 bFZ0fJheVGgZVs6Fl2cxcwFDM+Z/HzpWdezKSxS1sdW5r0RpkOes+uTKCtDv45+jvScD
 /iTD24cDhXARqTMs17g7FDGlRbs1RiXXrPk94Zmc7bNFZnEErsKx1dxN54mANgtpBATi
 uPDgNtWsrRMeI4Tr4v1Kx3MOOeVUySXheDYOXOMzDtyaChwb+wv5GKMIsVPEqsVguyAE
 mDMA==
X-Gm-Message-State: AOAM531NjyxGtTNTkkX/ZMuqUb/wQbOvHBbwmh0E3SuxJRX8pUaed6lu
 TPPgzwMfgit98SpqfqC81sEIUwHsns8W4empTZg=
X-Google-Smtp-Source: ABdhPJxz/WdjDi4lGXhyCZtm24i63rrHi90X5+zc4DeLWMG83ZlGAInQMG/QwUP6GwNdDdJSBSf107Bte0SF5U6V1MU=
X-Received: by 2002:a2e:98d1:: with SMTP id s17mr1956928ljj.457.1627659952804; 
 Fri, 30 Jul 2021 08:45:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-3-dqfext@gmail.com>
 <20210729152805.o2pur7pp2kpxvvnq@skbuf>
 <CALW65jbHwRhekX=7xoFvts2m7xTRM4ti9zpTiah8ed0n0fCrRg@mail.gmail.com>
 <20210729165027.okmfa3ulpd3e6gte@skbuf>
In-Reply-To: <20210729165027.okmfa3ulpd3e6gte@skbuf>
From: DENG Qingfang <dqfext@gmail.com>
Date: Fri, 30 Jul 2021 23:45:41 +0800
Message-ID: <CALW65jYYmpnDou0dC3=1AjL9tmo_9jqLSWmusJkeqRb4mSwCGQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210730_084555_692674_283A97A8 
X-CRM114-Status: GOOD (  20.81  )
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

On Fri, Jul 30, 2021 at 12:50 AM Vladimir Oltean <olteanv@gmail.com> wrote:
> I have the MT7621 GSW, and sadly this reference manual isn't the best in
> explaining what is and what is not possible. For example, I am still not
> clear what is meant by "VID1" and "VID0". Is "VID1" the inner (customer)
> VLAN tag, and "VID0" the outer (service) VLAN tag, or "VID1" means the
> actual VLAN ID 1?
>
> And the bits 3:1 of VAWD1 (VLAN table access register) indicate a FID
> field per VLAN. I cannot find the piece that you quoted in this manual.
> But what I expect to happen for a Transparent Port is that the packets
> are always classified to that port's PVID, and the VLAN Table is looked
> up with that PVID. There, it will find the FID, which this driver
> currently always configures as zero. In my manual's description, in the
> "Transparent Port" chapter, it does explicitly say:
>
>         VID0 and VID1 will store PVID as the default VID which is used
>         to look up the VLAN table.
>
> So I get the impression that the phrase "the VLAN table is not applicable"
> is not quite correct, but I might be wrong...

Alright, I think I've made some progress.
In the current code, we only use two combinations to toggle user
ports' VLAN awareness: one is PCR.PORT_VLAN set to port matrix mode
with PVC.VLAN_ATTR set to transparent port, the other is PCR.PORT_VLAN
set to security mode with PVC.VLAN_ATTR set to user port.

It turns out that only PVC.VLAN_ATTR contributes to VLAN awareness.
Port matrix mode just skips the VLAN table lookup. The reference
manual is somehow misleading when describing PORT_VLAN modes (See Page
17 of MT7531 Reference Manual, available at
http://wiki.banana-pi.org/Banana_Pi_BPI-R64#Resources). It states that
PORT_MEM (VLAN port member) is used for destination if the VLAN table
lookup hits, but actually it uses **PORT_MEM & PORT_MATRIX** (bitwise
AND of VLAN port member and port matrix) instead, which means we can
have two or more separate VLAN-aware bridges with the same PVID and
traffic won't leak between them.

So I came up with a solution: Set PORT_VLAN to fallback mode when in
VLAN-unaware mode, this way, even VLAN-unaware bridges will use
independent VLAN filtering. Then assign all standalone ports to a
reserved VLAN.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
