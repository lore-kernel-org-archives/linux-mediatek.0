Return-Path: <SRS0=aqSI=ZQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E688C432C3
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Nov 2019 00:15:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6317B20706
	for <linux-mediatek@archiver.kernel.org>; Sun, 24 Nov 2019 00:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mmkSEzPo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=netronome-com.20150623.gappssmtp.com header.i=@netronome-com.20150623.gappssmtp.com header.b="ez1B5uRp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6317B20706
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=netronome.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XfrlJsjJCMmjusGPnLiuexH/WEONfhdY2lpfvHXldOA=; b=mmkSEzPotwKgUa
	fb/3zORWnq7V5UyX8hdUiw0YUN+APf1GrjLjytIcQTWIFl7++SsaJTMPgCpI4yLfcXVQjtBSS1QBf
	c/4hb61b2lxW9r1GMXmeA+dvn1UWrddh7xaVxmh2TinsSmGyHBXeXERDli7tHZRHMOrfi0EZcJ8nK
	7B+TYhOHEMzhxCh/sZeuHlVf5nCCDEa1T31kn6STo25VBHFSrJE3bjYRxyPL8Pnpz6GMEG9NstUJW
	HnEUzgmYtw5m2g8AREImByKh7j3OkZeEgqKKwlJ1okQ03rAFQs4c4pL+HZ0BZJ2ckj02TXu6tUDMN
	yFy9ONphZIPQ2Qnpl2RA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iYfZ6-0005to-Hu; Sun, 24 Nov 2019 00:15:48 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iYfZ3-0005tC-IQ
 for linux-mediatek@lists.infradead.org; Sun, 24 Nov 2019 00:15:47 +0000
Received: by mail-pf1-x442.google.com with SMTP id s5so5447679pfh.9
 for <linux-mediatek@lists.infradead.org>; Sat, 23 Nov 2019 16:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=netronome-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :organization:mime-version:content-transfer-encoding;
 bh=MlWS2/07rbosC/qFv8QznfdONMvmj2+tW0igi1RVjQw=;
 b=ez1B5uRp4nlPeh7zDZUaqIVVmrQ4cZEVBD5bsp25+yTSzwX0wZswNSbOeXN8t70oOV
 FhG3p9KcCqjRhUWAOhf9cIb4WzBxbNKgGGFTdVHV7T7k9O0I4DmQNzsXLxBV/RYAfKAX
 gK/yPAbsjh2G5dH8n+2uSvTFKA62eoxD3IDcRAAqRD2Jyv6oss8RUpg1qf4z7CulEAma
 kOse1mK1qWQWI+p75R/WmpEQPeJAapr7LevBTLdqssAYGzqAkEZr18I/1jO1vXtTw9yR
 7DZisviaEICwTsNIeLinkfoWU6qMGJi4KwhUeUuXlvVe2D9lF0JNatKeHjQQjdS/U0kC
 tHgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=MlWS2/07rbosC/qFv8QznfdONMvmj2+tW0igi1RVjQw=;
 b=ubwBNZDoFmmA3vS/brMQhA9eS1//2zZag7LSeK4OR7kmB/LM+y2+QqTwjvViwp4/pE
 +yor5gnsHVcb39y1rJaZBJrGAJcah8W9MsBViCp3LsxyESpxHNZ8PVUVE1OrBvpEti1i
 SZ6yzucTAbHhBSt3myVvJqM/7mSUJ8Hbd9NQ/KgzANC5M1wweeyzay3FqVWk5+eeZv16
 4Az4YIK1LSuIveqp1XlgQkpphf6+Q0kam6J43HGzFQVrSMlhfm2aV87ehf0q03hK42j9
 i+SnlfcxntOM/GcNVQKwB+bd3qQj2Va+ChFFWFI02BYnPlb5D5s7ZXav+SDlNDezTfXX
 bWaA==
X-Gm-Message-State: APjAAAVGRS0yGYd9EZMdgkA6nxV42wfvzRNRAWtdJ468Smgm3cUOzZ89
 vX6tiJrWy8YToM2aMpRvxK99cg==
X-Google-Smtp-Source: APXvYqw7Fx4pGQM8XweJFPGKswwjFyRrs7WCWKH+T4ZIjjDmS8RS/eqxt3iliLVPz19POH3ZRMTHyA==
X-Received: by 2002:aa7:954a:: with SMTP id w10mr3614854pfq.187.1574554544026; 
 Sat, 23 Nov 2019 16:15:44 -0800 (PST)
Received: from cakuba.netronome.com (c-73-202-202-92.hsd1.ca.comcast.net.
 [73.202.202.92])
 by smtp.gmail.com with ESMTPSA id i13sm2782483pfo.39.2019.11.23.16.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2019 16:15:43 -0800 (PST)
Date: Sat, 23 Nov 2019 16:15:38 -0800
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Russell King <rmk+kernel@armlinux.org.uk>
Subject: Re: [CFT PATCH net-next v2] net: phylink: rename mac_link_state()
 op to mac_pcs_get_state()
Message-ID: <20191123161538.482313ef@cakuba.netronome.com>
In-Reply-To: <E1iXaSM-0004t1-9L@rmk-PC.armlinux.org.uk>
References: <E1iXaSM-0004t1-9L@rmk-PC.armlinux.org.uk>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191123_161545_637083_28CFBB79 
X-CRM114-Status: GOOD (  11.83  )
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-stm32@st-md-mailman.stormreply.com, Felix Fietkau <nbd@openwrt.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 21 Nov 2019 00:36:22 +0000, Russell King wrote:
> Rename the mac_link_state() method to mac_pcs_get_state() to make it
> clear that it should be returning the MACs PCS current state, which
> is used for inband negotiation rather than just reading back what the
> MAC has been configured for. Update the documentation to explicitly
> mention that this is for inband.
> 
> We drop the return value as well; most of phylink doesn't check the
> return value and it is not clear what it should do on error - instead
> arrange for state->link to be false.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Applied to net-next now, thank you!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
