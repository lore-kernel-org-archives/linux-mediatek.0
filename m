Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87A0CC4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 08:49:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C77460FA0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 08:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C77460FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2pkWPsuujSylo75QZhn1p4qJdm2pVdZBomy0RhkuU0=; b=OHCtRtSEqchWP6
	UO63RgKrgj0EUBoNjmINCEzHPEAvPKIyseCuobEU6dRLCTaT0lqijCJQrT/h0+rhpkd6Va93ShHoe
	+ySnA/1WLZgzGfDqufz/3g3xLyNPuiwOgLUzi1J4e3sMr/dRKf0tM9SH2I2F4QaRJvCPs+/Dh+F4g
	wySaGXK8fHD1IMVv8YmclkbNrSTkpmUmXXscqAPqBguLkzWkgRLp5/HeHL3fPXl1JR26TF+l8wxwp
	C71+rW7uXx079hilSarbNRPNJPzAUwLQ9bgmMyG5xA2/6JpwgXPOLCoZk+r5zat9nf4PL9pm0QOB0
	n1bdeQxHXLblNZH4LIxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAq6k-001eIw-N2; Tue, 03 Aug 2021 08:49:06 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAq6X-001eHf-Q1; Tue, 03 Aug 2021 08:48:55 +0000
Received: by mail-ej1-x631.google.com with SMTP id e19so35222643ejs.9;
 Tue, 03 Aug 2021 01:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=J4jATVkZ/USm62T2iGvuiu2c8duC0ne3ndhK/cNQVSc=;
 b=n6hJ+k9Q2YTp5upYnoq+ceszi9gr2JVEy0tSNXk/SoHDzKfQz4bBEZQHEQi+IV5npO
 yephuSH97FFPxZNlFCWVuBW5hkQ1B1+T1SnNs8AUuU9LWdgWesk0Ojko5enHuokIKZDD
 OzPE+QvbBl3tc7yS+nJlqB6W3CYAgseweuR6EA4Y7j1ipPY6atsaijeF+3HPst+8cpIr
 0cV7r/6StY2VZkKxWhDLKkZUZEGWhyR3xArxlb2pvQkSyoS703YKH8ziWfPwZKprB6+b
 GI/FMdrXyprpbH0Z/X1MK+fSKqf3RBSEL6EIw8Av4CSlVwuvrSpims/wJW/7CeYWp7Qx
 S6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J4jATVkZ/USm62T2iGvuiu2c8duC0ne3ndhK/cNQVSc=;
 b=riqVky8U0DE1sUpOFYt5o7AppocYl0nyDKQRNKgJOwcuf8mQlWNEo37S9+O7tr/kFC
 R6Tgi/VA4JE5pJ5qb2/QUXFPemMgJVM9iZygKwlTHp9+UhMRq/95HKtX1wpvU7949Ghf
 +HdVsnH1Tiy9IyO6lCUR7JXLZ+dlF1X7vSXHVra9lHav/3VNVmJSijE16N+Xz9mtW7UK
 BUT4JeRDvbT6Ho7bqNZSTr1dixAhxIXCljIZULt4ZdpVj/t3WO+Z8TYJKFvUEORcjfZJ
 5SrQi3DycDJ6Qnx4xPmyWMLYwMBiI8TCuNrs5bXLE3PSSAsRZ+pdg2Q5BAxJtgj8xI0q
 gZWQ==
X-Gm-Message-State: AOAM530kLHNKZdCknY8JwyCxP4HYLJz8kf+H4h6jeufpgEX5iUF7TpCd
 iNqDr9dhzOOBc1l6QtY5By4=
X-Google-Smtp-Source: ABdhPJwrJu/cOeoZOifSuOW4DtEVHlePqIG5oXstLiIoWH7izVOl4JlfeLo2q7D7ls4/11Lo/cpfJQ==
X-Received: by 2002:a17:906:7191:: with SMTP id
 h17mr19952376ejk.330.1627980530726; 
 Tue, 03 Aug 2021 01:48:50 -0700 (PDT)
Received: from skbuf ([188.25.144.60])
 by smtp.gmail.com with ESMTPSA id z10sm5809224ejg.3.2021.08.03.01.48.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 01:48:50 -0700 (PDT)
Date: Tue, 3 Aug 2021 11:48:48 +0300
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
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [RFC net-next v2 3/4] net: dsa: mt7530: set STP state also on
 filter ID 1
Message-ID: <20210803084848.cdvc5qxseott54yy@skbuf>
References: <20210731191023.1329446-1-dqfext@gmail.com>
 <20210731191023.1329446-4-dqfext@gmail.com>
 <20210802134336.gv66le6u2z52kfkh@skbuf>
 <20210802153129.1817825-1-dqfext@gmail.com>
 <20210802154226.qggqzkxe6urkx3yf@skbuf>
 <20210802155810.1818085-1-dqfext@gmail.com>
 <20210802210006.fhmb5s6dsnziyk7d@skbuf>
 <20210803082316.2910759-1-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210803082316.2910759-1-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_014853_902565_6D0DCADF 
X-CRM114-Status: GOOD (  14.71  )
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

On Tue, Aug 03, 2021 at 04:23:16PM +0800, DENG Qingfang wrote:
> On Tue, Aug 03, 2021 at 12:00:06AM +0300, Vladimir Oltean wrote:
> > 
> > So then change the port STP state only for FID 1 and resend. Any other
> > reason why this patch series is marked RFC? It looked okay to me otherwise.
> 
> Okay, will resend with that change and without RFC.
> 
> By the way, if I were to implement .port_fast_age, should I only flush
> dynamically learned FDB entries? What about MDB entries?

Yes, only dynamically learned entries. That should also answer the
question about MDB entries, since a multicast address should never be a
source MAC address so they should never be dynamically learned.
The bridge should handle the deletion of static entries when needed.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
