Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929C1C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:52:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ED0C60230
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:52:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5ED0C60230
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMQSsEagkvr1rFRxIYUMx+wWxvUUY+lPnr/Q0bjgFUs=; b=3wd2JKcMcJqW74
	cIHpiWY2rtnppj4GOQs0QHBhlUkgjTFuwsX/1hGchBLnXACxAu0savN6kBPGNpxypNGZ1al0Pixqc
	5SlDKnmdcbv5k7Yr8u8zo7kQT6/Q5lswozs6ckVK+VnzvINITwGUu9W9iCAoZoPbd81qznQ9TcY+o
	ocyXwCH/Z08vwacLjYP0vvwU8c3DK17a/0TYp0tiaWq4Xx6eNmNkhGWmiwoRF2DsaM6kU4abnsPGg
	4XRJDNO1Io7UqAUIBgNGdUm/pYI+XxKHgK/gL8nPOGSvyEByRSYptgT9gzRbGtyaNPKrJdn70vgwm
	a04dd+bAbrFc4hWjbicw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAxe0-003ftE-2q; Tue, 03 Aug 2021 16:51:56 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAxdl-003fpm-QG; Tue, 03 Aug 2021 16:51:43 +0000
Received: by mail-ej1-x62d.google.com with SMTP id go31so37254343ejc.6;
 Tue, 03 Aug 2021 09:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8+umZScsOZjOsyO3Wgd5I6k6s08z12UwqmKO/ZSDzWU=;
 b=G+XrZz7H5KnPA/nVBuuIkEaI21RE2FQpOo+vC0IjPeng/+qXv9H0vBR0xGr+AuuAvv
 6QgZe8g1nMyJ32bUEf2+qyjh/V/+sUbDv8tb1osloY+UpXTrJ3SrhRhyD2Dsa5lbvGCP
 Gq//U3+Oi7lesf96t/OrQVtfKYtKKcYmF0fLoClgGbrjZ4AIx1YbP3OlXConq267zcl4
 DS/VnBRnAB6eHStgvc1oGx7dVrC5w3uSQd4wEW92f3eILcHMuXRWlLqhKG7uRv331h1a
 y2QX9qRtOgOCJNzd4S3qhZGL+We3J+jNOppctVY1AXUbEv/nLn/GUD6a1Tc/tIqORDfU
 56Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8+umZScsOZjOsyO3Wgd5I6k6s08z12UwqmKO/ZSDzWU=;
 b=JDvuUmNEchU4zgYizl2ZQSSLBdbKpAJ9PGj8lOby7JAqxqB2i7CbMOop4J9RerZ1TC
 PqQSos+vTQBeyNdPbRphQaOHlxJF2/ShqN/21gHWTa9kkLq6kmbIz9WlkANttPg6JhtV
 kHY4VBXwn3PhvGMp4qmwbBch9zDNHVr1rVYriid36m0uRuuDlEYE3l/r/RqfvSCVJbb3
 jRXNle4wfSMIvjwEPgSiecK4YMH0Rbkr31xm8ICYams6z5qenlt2NojyoIdMMqb7YdCI
 6l+lz74gi1IousosPx1BTMkUmnZhHD/YUWwQtNlr/iDPr7mkOQ147vZG/Viv4qNbN5vU
 Yg/Q==
X-Gm-Message-State: AOAM531U3bX6bqJZAgCiLS+Z5sBb3m6XPBNtiVo5z/mFcvAwjsB+m6pt
 UOaSMld9u8VClyZw8evZS3I=
X-Google-Smtp-Source: ABdhPJzOeuhc7RhMVyEW4bwBTNsbiGz/zk2oNpxReoCzfanmHcb+Hs0q5HvBCcSEdVlFIYLwg6PVyw==
X-Received: by 2002:a17:906:c1da:: with SMTP id
 bw26mr21664503ejb.253.1628009500105; 
 Tue, 03 Aug 2021 09:51:40 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id dh8sm8406135edb.14.2021.08.03.09.51.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 09:51:39 -0700 (PDT)
Date: Tue, 3 Aug 2021 19:51:38 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Eric Woudstra <ericwouds@gmail.com>,
 =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: Re: [PATCH net-next v2 4/4] net: dsa: mt7530: always install FDB
 entries with IVL and FID 1
Message-ID: <20210803165138.3obbvtjj2xn6j2n5@skbuf>
References: <20210803160405.3025624-1-dqfext@gmail.com>
 <20210803160405.3025624-5-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803160405.3025624-5-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_095141_918039_11CB1684 
X-CRM114-Status: GOOD (  15.58  )
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

On Wed, Aug 04, 2021 at 12:04:04AM +0800, DENG Qingfang wrote:
> This reverts commit 7e777021780e ("mt7530 mt7530_fdb_write only set ivl
> bit vid larger than 1").
> 
> Before this series, the default value of all ports' PVID is 1, which is
> copied into the FDB entry, even if the ports are VLAN unaware. So
> `bridge fdb show` will show entries like `dev swp0 vlan 1 self` even on
> a VLAN-unaware bridge.
> 
> The blamed commit does not solve that issue completely, instead it may
> cause a new issue that FDB is inaccessible in a VLAN-aware bridge with
> PVID 1.
> 
> This series sets PVID to 0 on VLAN-unaware ports, so `bridge fdb show`
> will no longer print `vlan 1` on VLAN-unaware bridges, and that special
> case in fdb_write is not required anymore.
> 
> Set FDB entries' filter ID to 1 to match the VLAN table.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---

The way FDB entries are installed now makes a lot more intuitive sense.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
