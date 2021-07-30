Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4975AC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 19:26:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1378560F01
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 19:26:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1378560F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b9rWCgWELrG699foX4MQ8hNg4HLdJYTF+wDBEX0T0kM=; b=sNpCvIwxkXZVid
	hsGfmNykyAbokd4k07ArR9lvaLGF+bz2K708JcSELoCk9dglQrs666IPc+0NOg3MSHpJg/7yTrDLm
	tjdU3n/ttZxqSJ3gyM35M/RukYzpLAjKLqTxZKa0U97UvMvEkN0v9UFHwHd6INEpDP9wNCcIyXYcW
	P0sLDNykEnMD7rrc8Re0qQcKuxFwM/DRc+QzEbKH0ZZLuE4nRYbrYP1KMLcCsXYHUBkJfAXBD4BSm
	okGGI/xtLx6tG8xoxYY4fBNHXVCrCSOWDU6SlwbHNQUnFUBrzvTn24pgLyzt/kjGWn3hE4PJkYo1C
	1WfVs4/851cLthYO8b+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Y9D-00A542-VE; Fri, 30 Jul 2021 19:26:19 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Y90-00A51k-QA; Fri, 30 Jul 2021 19:26:08 +0000
Received: by mail-io1-xd2a.google.com with SMTP id l126so12741621ioa.12;
 Fri, 30 Jul 2021 12:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=1SdEFlqROmHFj3HUxGkbmgw79mMP1UfAqtIWtIV0eqU=;
 b=W6tcu9NK+555WyEu62p2gwpE4VYEJHwTEMZ9/HW2fUxTg0eiytjtEpoPXP/R07aJO9
 0DPVPVRpKTN6fkcgM6/yvBFBHh4BWDZhzn8O8UhXhnz/bzO8pyVW88vPdpSUYe0aG/IQ
 7cw5Y0I09DAKCf5BxKIP4ZISJtVpcvi2PvA7QqqgDqYoG/9DiYMSLrj/N8LrQX6qW/c4
 SVZXEchoKYK8ahbnBArRAO0XnvqbgrsIrEUztQBeNDC5VqOSquCgz1RjD+sxUKQ/jdh8
 b4DKnWNBf0T4CNEzjBpd44goVeksoNOGkEXO3+wg/JNaMQvoQ+GAN4amyxHHG2lf+78X
 C15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=1SdEFlqROmHFj3HUxGkbmgw79mMP1UfAqtIWtIV0eqU=;
 b=s+UdhbVk24oaYEKlGqhYOeo7c4VXujlRVTJccV5RQk8Rk+e3uee2GIVt2lMOeAKVYv
 WBZvgGkyeMo3VNZ4xoELIEg5piXhX5YcISbPWTI8kbzND0TNZnHCt4ArsDbYCPrEK8JP
 0Et4nt5juKiLMqTw+4OcSVm67GXJh9z8Ui331P7tyn0W44xPP+G8QEmhJqrcxPQkpxHv
 ZJwEoG7jvJmNalaM2zxuk0wTX8cRn2mNpZzAgjDR99AvEJdobzyzUbOH2pKcm3r8ez7x
 /zsBtlT37+5CVcNwYsnJ6O0yiLx+6EEj2hjCa5uRp8g9SLWVAVnlrlepFnoB+O0IANHB
 CcFA==
X-Gm-Message-State: AOAM5320s296SBTBjfKCJUcXwxdG54LdSKGJBYuHRvTnfOcApZUDXYBA
 Z4O+U1gqT4lbN4D3pHsy8Yo=
X-Google-Smtp-Source: ABdhPJw3AWyzwHYgQ8HIQ55jKCF389gducqMMPWDj1GfbausUMakuP31ZENQC9HQut62412HBjDN+Q==
X-Received: by 2002:a6b:f714:: with SMTP id k20mr773833iog.148.1627673165677; 
 Fri, 30 Jul 2021 12:26:05 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id s21sm1560756iot.33.2021.07.30.12.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 12:26:04 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [RFC net-next 1/2] net: dsa: tag_mtk: skip address learning on
 transmit to standalone ports
Date: Sat, 31 Jul 2021 03:25:55 +0800
Message-Id: <20210730192555.638774-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730190706.jm7uizyqltmle2bi@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-2-dqfext@gmail.com>
 <20210728183705.4gea64qlbe64kkpl@skbuf>
 <20210730162403.p2dnwvwwgsxttomg@skbuf>
 <20210730190020.638409-1-dqfext@gmail.com>
 <20210730190706.jm7uizyqltmle2bi@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_122606_912675_08FD1589 
X-CRM114-Status: GOOD (  12.63  )
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

On Fri, Jul 30, 2021 at 10:07:06PM +0300, Vladimir Oltean wrote:
> > After enabling it, I noticed .port_fdb_{add,del} are called with VID=0
> > (which it does not use now) unless I turn on VLAN filtering. Is that
> > normal?
> 
> They are called with the VID from the learned packet.
> If the bridge is VLAN-unaware, the MAC SA is learned with VID 0.
> Generally, VID 0 is always used for VLAN-unaware bridging. You can
> privately translate VID 0 to whatever VLAN ID you use in VLAN-unaware
> mode.

Now the issue is PVID is always set to the bridge's vlan_default_pvid,
regardless of VLAN awareless.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
