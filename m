Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75805C4363D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 12:27:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F527206A5
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 12:27:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YT4NGVQS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RsjZ75sv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F527206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FBF3GyU9HAWtXTilY2yW3vaREXrl2fmiurFeWfTh76g=; b=YT4NGVQSujXSH9q3lCA3IsYqG
	ZNUoKgYp6p5ZEmqj66Uh/l06Hyidsog1ll7cajRLcbyqv4Mh13tlRstLgL4qFPGQRJrHTT/5Lv6j/
	x79HPpFrFWdiL/Ffy1X/QrDXTR06BfaFYNg+a13ghoduFa/c2Nevgd/XrZVvzDs1D9cCUaZO5X7N6
	BkqS76xDWgmkuULcq22YSYf5Cr+1gYsF86OAVDlUIg3DF4K5RI8kXP+AT+0+4ed3D1GbAPS1Ng5J/
	m/FjWDydeU2Fd9B16ge8ZBfHpnZ/AOqbNBWXLkedew91YQUT6Ggn8JhjHnqRXTJ7vDFg9CmpaqmqT
	cjFAhMjsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLQLO-0007rH-5h; Thu, 24 Sep 2020 12:27:26 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLQLG-0007nL-Fw; Thu, 24 Sep 2020 12:27:20 +0000
X-UUID: 95dec31be3a64716b85b0f8381bc6575-20200924
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=oEQqIT87UU1+x8zERr/VFYRlzuHTWeays79SiUEYuMQ=; 
 b=RsjZ75svAwDKdF3bN2RFz2hobMgKpNPaKJ6TJ1LX+qyEObEQM1bUBWVN0y8i/TUhD1fkB/ox4IujBpaANw9dek+Z0I5rM6nGs0cGcl8Yu2aVPZJgjIXaBXWLxsvr0ulzGNe091ytqTti+N9fRyCKn3JW1/JjqOBbEjY2eikdV4k=;
X-UUID: 95dec31be3a64716b85b0f8381bc6575-20200924
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 836819781; Thu, 24 Sep 2020 04:13:39 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Sep 2020 05:13:36 -0700
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Sep 2020 20:13:23 +0800
Message-ID: <1600949604.11746.27.camel@mtksdccf07>
Subject: Re: [PATCH v2] net: dsa: mt7530: Add some return-value checks
From: Landen Chao <landen.chao@mediatek.com>
To: Alex Dewar <alex.dewar90@gmail.com>
Date: Thu, 24 Sep 2020 20:13:24 +0800
In-Reply-To: <20200919192809.29120-1-alex.dewar90@gmail.com>
References: <1600327978.11746.22.camel@mtksdccf07>
 <20200919192809.29120-1-alex.dewar90@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_082718_762640_ED2B24CB 
X-CRM114-Status: GOOD (  12.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sean Wang <Sean.Wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Alex,

Thanks for your patch. By linux/scripts/checkpatch.pl

On Sun, 2020-09-20 at 03:28 +0800, Alex Dewar wrote:
[..]
> @@ -1631,9 +1635,11 @@ mt7530_setup(struct dsa_switch *ds)
>  		mt7530_rmw(priv, MT7530_PCR_P(i), PCR_MATRIX_MASK,
>  			   PCR_MATRIX_CLR);
>  
> -		if (dsa_is_cpu_port(ds, i))
> -			mt753x_cpu_port_enable(ds, i);
> -		else
> +		if (dsa_is_cpu_port(ds, i)) {
> +			ret = mt753x_cpu_port_enable(ds, i);
> +			if (ret)
> +				return ret;
> +		} else
>  			mt7530_port_disable(ds, i);
CHECK: braces {} should be used on all arms of this statement
CHECK: Unbalanced braces around else statement
>  
>  		/* Enable consistent egress tag */
> @@ -1785,9 +1791,11 @@ mt7531_setup(struct dsa_switch *ds)
>  
>  		mt7530_set(priv, MT7531_DBG_CNT(i), MT7531_DIS_CLR);
>  
> -		if (dsa_is_cpu_port(ds, i))
> -			mt753x_cpu_port_enable(ds, i);
> -		else
> +		if (dsa_is_cpu_port(ds, i)) {
> +			ret = mt753x_cpu_port_enable(ds, i);
> +			if (ret)
> +				return ret;
> +		} else
>  			mt7530_port_disable(ds, i);
CHECK: braces {} should be used on all arms of this statement
CHECK: Unbalanced braces around else statement

[..]
regards landen
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
