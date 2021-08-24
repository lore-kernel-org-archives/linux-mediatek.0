Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6440BC432BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 19:11:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3098061151
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 19:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3098061151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qhpjb+J/msk+KYb/KHIbniF63fubWyXml1zn8mUhFUM=; b=LBOATYijo5tMJG+ReiAmVliZoz
	j5Vz67cocOByvXK2JKMXzJjj0zIQgoMl7B50mtvraMzgwO9iwYa4J0/yCqIXwkm1t3ceAHqaGWTD6
	WiUttoeUCoMs6551NtdHRzt2Fd+3iKS+D2K507G9V7RBvc2TK9gepCutRbYURcBAaLp2NX0RN4dWx
	1mu9XIyTO0e9tHHIT0ESab1SrW9CFdyBp+An4MNsuB0w/beyZvpqB+fxx1ZFUpY4/qscSdQykIQf2
	WSMVZE1FUm17Kw/rve2Bt1BpHmnFOjF6ZVo7dKeVW9pqtgWcj1JFaJXQwqhwyxaAedIm/6HfILdzJ
	pfB0aJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIbpU-004UT1-L4; Tue, 24 Aug 2021 19:11:24 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIbpI-004UOH-3w; Tue, 24 Aug 2021 19:11:13 +0000
Received: by mail-pj1-x1035.google.com with SMTP id
 om1-20020a17090b3a8100b0017941c44ce4so2473378pjb.3; 
 Tue, 24 Aug 2021 12:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=6cBUiSOtd7GLWQqjZBxYFQzvcsAy6/iPF7YIUaVMAQ8=;
 b=IBpYAYLpwmg1DARBdeXPfUPxWCZuQLSJbZBpClIL79ZCdist2koSowVt1Iaxqswk22
 w3QTxmwBDaWWKZiI0z5qlr8k+4pYU97C8LxrJuk6dicTuypC7OQLl5XJ5HDKF+ViZQmx
 GMriFtvdBR2u2TkA66P3c4GBHsB7SDvosH4IfJSu41cq4C1If2fFk/YI8sb2gc1iyBcr
 qDsT5jEwraH7RxeLzvYeGabg2eWIiI9cjrLVVOvROpSt7z/O8u1sulOnjrpaxVY3JUhf
 gDgxWlDfpfqcWZLFItoPmHmT0GS0qpnVEj3cOebj5tBrE38ePlw2LyD2YRtYc8lay6xS
 tX1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6cBUiSOtd7GLWQqjZBxYFQzvcsAy6/iPF7YIUaVMAQ8=;
 b=bBRFbwKw2PNUDKTsjl4EuaEM7eIrqabhHr4o8TCgLSS/8n/xe0ZXZP0K/ewlDKgUJK
 zw3hbMHHc8Yr22dJwBQJtGTb/c4/m7LR6N10l/mAqdVSQAYGKOMf9JkTrcNGgNwYXwte
 YjU/7JvOMMZFqER+1OAqYkWZNq2kpNymb6ACdavEaHElgaTXaTy0ZFxgrFoiBAwteNOD
 bpms+dpks73SBWPmM5yJNfUhNA4EjpYk0C/jJkG7wLNv5WiLrm4e40ILz4ObUG97X+yB
 8kSdfcyfFripPXQFupGFdhbEoy976ghr+PH7vK2Nmud3KwEaL19WSDOrxE+/OnnU4bCq
 L8Iw==
X-Gm-Message-State: AOAM530fs/T0x6jgQ+ZcAHdJi87/RkzTToug8RSGldZXccZiPGSy43T7
 EBi1+v3I2ortuvMyKgghhN8=
X-Google-Smtp-Source: ABdhPJwC4xMBis5/hy1NZQsWk/mciUadCOIB6uuUXtUb8GxGjEiF8HGW5zTJuSbbxtO35uYjUhqG3g==
X-Received: by 2002:a17:90a:5147:: with SMTP id
 k7mr6122884pjm.73.1629832270282; 
 Tue, 24 Aug 2021 12:11:10 -0700 (PDT)
Received: from [192.168.1.22] (amarseille-551-1-7-65.w92-145.abo.wanadoo.fr.
 [92.145.152.65])
 by smtp.gmail.com with UTF8SMTPSA id x16sm22848098pgc.49.2021.08.24.12.11.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 12:11:08 -0700 (PDT)
Message-ID: <92f006f1-bcd2-1d27-3f46-491242565e0b@gmail.com>
Date: Tue, 24 Aug 2021 21:11:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.2
Subject: Re: [PATCH net-next] net: dsa: mt7530: manually set up VLAN ID 0
Content-Language: en-US
To: DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Russell King
 <linux@armlinux.org.uk>,
 "open list:MEDIATEK SWITCH DRIVER" <netdev@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20210824165253.1691315-1-dqfext@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20210824165253.1691315-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_121112_211784_6A656B31 
X-CRM114-Status: UNSURE (   7.65  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 8/24/2021 6:52 PM, DENG Qingfang wrote:
> The driver was relying on dsa_slave_vlan_rx_add_vid to add VLAN ID 0. After
> the blamed commit, VLAN ID 0 won't be set up anymore, breaking software
> bridging fallback on VLAN-unaware bridges.
> 
> Manually set up VLAN ID 0 to fix this.
> 
> Fixes: 06cfb2df7eb0 ("net: dsa: don't advertise 'rx-vlan-filter' when not needed")
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
