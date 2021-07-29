Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2978AC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 16:51:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFC7D600CD
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 16:51:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EFC7D600CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hX1mZA0p/AZscnkZLcnDu2ruXG2/vqF18QgvFocRnqY=; b=yiYb6ls96vL7pg
	k93EAuBUczJcMWf/Yw92uA28M68kU3FnyQdKs15wn35TPz+M1HDru3jGk7dq77WdRstdI/K3eXLbR
	iAJLPCQebeRpGhLEXwJpJEHYKGOd9l9o6HPwa7141pDzDFWn1LAeNEpLtvugOuVlphtiOVFRrnfAe
	NxgvJzfV0bgYjFTyVKL1eoU9rW51562PatRGlPNlj9VUouFggzXaAHdFH/1av/2M/4Vqn1PH2NR36
	aJxIBXHTGq0vXwb55II5kn4EDkvC8l0Lq8w4wfn9sf0Vp4CcB7xwMvQMgfXIKQDPwa5G34wru1J8j
	ggn+zow2RwJPDstjpQrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m99F7-0059Fk-NQ; Thu, 29 Jul 2021 16:50:45 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m99Et-0059Bh-0w; Thu, 29 Jul 2021 16:50:33 +0000
Received: by mail-ed1-x52a.google.com with SMTP id x90so9068941ede.8;
 Thu, 29 Jul 2021 09:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ge2c2dD+EBmDmaGN5nupteoqdj28OTIbcgEuzsesBTw=;
 b=qL2Rj3JukTZAxtcWyetmk0LTL3hs8/mi9vn+JdDmSkmyeRjbMqR9jXg8gFWsv6kGdz
 O0mVq9BBHW+9GVS+YDVrhRf0mXLlO5vCDryASFucgvyh0dkAlvrfzd/ieoXEO75YfthV
 P3NThxNT4ZFkznm+Tkruy0vS3BJakX4rGnzOqjRuyu1qC9V8Ydx9GUQnjJbXIy+Y6DOo
 Jwx+w1uqo7G9P/fIIdEpYI81sGJQaMfU4fn1MlNIs6Uh8wlE1YenINqJN6SFKeF6cmN6
 l1l0o1orLp4On4m4sET2NN461fgFveISmPlIFkRWIAH9vXEz16WarCNbpNHwG+kNT+SC
 a2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ge2c2dD+EBmDmaGN5nupteoqdj28OTIbcgEuzsesBTw=;
 b=S9cyyWjON8Pg2NqD2u3qTfWwqXrk5uDmyPE5gW5Ny7dVhuSwhZgJ9ncTaaQXAF1Jju
 Qm6BhYCsQ2A3y5rGFMBgqKFRzxrejBVJ6/WjUNg7+Bd3Ml8h8poAqy48bvcxjtTCz/ey
 H+FGwK5HQohSKAG4mbzn8pUvIQ1sJwQni+7Nh63n4+3nayFItw3g17CKwDF6hR1zM2ns
 yszVFHxexsWVe2k90ZhUTLcQShDGo8rw9PPRlYi6ffLgHZIWAhDE5otV1EMHYRA3SR9e
 2UOmfNKDkbGrquSCFD9nmJCD35RN4St79W5aij0ih96jBPCnicl4KYQDezVMoMCREbQm
 KePw==
X-Gm-Message-State: AOAM531hZnEbECkxuVrmfPEeELGsQFsPn0teSDmFYyZWA7iUlgTmIXYT
 BwJez/wCy/TszChxCaNx+Ys=
X-Google-Smtp-Source: ABdhPJw3QV3+/J7tiE+JZbeIL/dUyVkeZkd4O2CYoDmctiP9takCqIOmAAt5RBeHoxF+m8qK2doyCw==
X-Received: by 2002:a05:6402:d63:: with SMTP id
 ec35mr7069658edb.347.1627577429163; 
 Thu, 29 Jul 2021 09:50:29 -0700 (PDT)
Received: from skbuf ([82.76.66.29])
 by smtp.gmail.com with ESMTPSA id la23sm1155008ejc.63.2021.07.29.09.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jul 2021 09:50:28 -0700 (PDT)
Date: Thu, 29 Jul 2021 19:50:27 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev <netdev@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [RFC net-next 2/2] net: dsa: mt7530: trap packets from
 standalone ports to the CPU
Message-ID: <20210729165027.okmfa3ulpd3e6gte@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-3-dqfext@gmail.com>
 <20210729152805.o2pur7pp2kpxvvnq@skbuf>
 <CALW65jbHwRhekX=7xoFvts2m7xTRM4ti9zpTiah8ed0n0fCrRg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALW65jbHwRhekX=7xoFvts2m7xTRM4ti9zpTiah8ed0n0fCrRg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_095031_113300_6B72298F 
X-CRM114-Status: GOOD (  20.38  )
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

On Fri, Jul 30, 2021 at 12:11:45AM +0800, DENG Qingfang wrote:
> On Thu, Jul 29, 2021 at 11:28 PM Vladimir Oltean <olteanv@gmail.com> wrote:
> > Actually, on second thought...
> > If MT7530 supports 8 FIDs and it has 7 ports, then you can assign one
> > FID to each standalone port or VLAN-unaware bridge it is a member of.
> 
> The problem is, there is no way to do that..
> 
> According to the reference manual:
> Filter ID is learned automatically from VLAN Table. 0 is the default value if
> VLAN Table is not applicable.
> 
> So it is always 0 in VLAN-unaware mode.

I have the MT7621 GSW, and sadly this reference manual isn't the best in
explaining what is and what is not possible. For example, I am still not
clear what is meant by "VID1" and "VID0". Is "VID1" the inner (customer)
VLAN tag, and "VID0" the outer (service) VLAN tag, or "VID1" means the
actual VLAN ID 1?

And the bits 3:1 of VAWD1 (VLAN table access register) indicate a FID
field per VLAN. I cannot find the piece that you quoted in this manual.
But what I expect to happen for a Transparent Port is that the packets
are always classified to that port's PVID, and the VLAN Table is looked
up with that PVID. There, it will find the FID, which this driver
currently always configures as zero. In my manual's description, in the
"Transparent Port" chapter, it does explicitly say:

	VID0 and VID1 will store PVID as the default VID which is used
	to look up the VLAN table.

So I get the impression that the phrase "the VLAN table is not applicable"
is not quite correct, but I might be wrong...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
