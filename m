Return-Path: <SRS0=Q+Xe=MZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0E2C4320A
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 15:58:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0D98610FD
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Aug 2021 15:58:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0D98610FD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U6aKi9qr+6gT0Gyw2+8HBegbszRqTyMRQhVMEBQmr94=; b=rj6PsznjW4PCb+
	r442chyAOBqmqNxdcE3Kn3OYBwujwr8LKijCfnZvBzCz0+8gkstDNp64RYTvDe/g8ozdZKFG35E3N
	QW/8I9HqStycFdyrEMILIsThcmNCLtr1nY1uAR1/Dk6yFxQDW5h0HiLg0PJ4Zj7LUn7kF7rvDUmTR
	Nv6UFoKEr7/hDhgxeAqcdBMWMql+MzbpRAo9qSCj5JuU4s1p3pEu0AdNAKH9pOwdIwAdupzHydet5
	2D2v1yC0OjmfLBna2ef18LryRO8ijFQ9u2JrOL8K6jbnZuF6vax2cPHu+dYKaBfbj/PSvJ1uzDr0O
	5LxG09oN8Ek6GftVfKeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAaKp-00H5G4-EE; Mon, 02 Aug 2021 15:58:35 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAaKa-00H5C3-7R; Mon, 02 Aug 2021 15:58:21 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso601242pjf.4; 
 Mon, 02 Aug 2021 08:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=j/6mZKAL/+WSq3mfqkNpkYP79XdM38PqBABGWDQQ3Tc=;
 b=uPu1JMpbUOnujaJMHE3tqoSBZiQu+U+tfiCwG6diQYVG+wnzWcbV5DQ2WMjyVS0Izv
 zxhoEGILr9vgkzsvyCTZEGPFv4rQsXTCVoD2/2+QDoB3Q+IcChScDUviEdgutKRfmmX2
 YQy3IfNrYVD2gbowIC0CxY0Kr6MdS3csAFQhoYYWhPmdOei78hlIz9hTN2yxadbKofaQ
 odBWtZf1n1ur979EDvr/kbt9XXMfieH2r9aDhTT2PRXAc3nfZVosWNxKvbX37xJXpYrs
 +dSl/hvoDI/vemELrP64NgUwyDYCt6rIA2liU8JfBAyUSkWjI1y0EVC/S1ltegIPbxwp
 0v6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=j/6mZKAL/+WSq3mfqkNpkYP79XdM38PqBABGWDQQ3Tc=;
 b=eTOToj85+Kgd/IuBdNNecOnYa3UT3YqWpztPnWBSgq7iAJkOkL5bBZ5x0eWpaygeEU
 6ZpIEyVuQcVysiEkJLNceebuIEk+uQAede0GqQ0nTtlBrLpTQL+gND/hVx1S4XMcsgiJ
 dxA0wNQRWMnN8A2+idG2ns9gF4XTNq4XnYXrsSD2gT0yoOb9w1pQVdEz6oZfPpmgJFFz
 ohUaZxspiA8eCgGYD/Wt8LSOy1i2XjLo8slP7Vpx+WSv+2yGsisDfBHC1ytrCUxf6bBA
 wGCldgdhrEc/Srvwfnh0ac+mL4B8oZb//FQs+lNweIKheM6T50mY8VeoUoMAFWyExzdr
 jKzA==
X-Gm-Message-State: AOAM53307DpXI7uu3W7onvyK908PQ84TuO3VGDqBl8hyRTjzTZSkCbpw
 ey5G0Gs4PvrGMe2kOZPINug=
X-Google-Smtp-Source: ABdhPJxV5fzd9jTejpnEU9RSAAvhHJVdgaNwKVpW8pVdf+bvLYPCkyyaLI/CAHF22yEkkNhAqYlpTA==
X-Received: by 2002:a17:90b:3b47:: with SMTP id
 ot7mr17429240pjb.149.1627919899741; 
 Mon, 02 Aug 2021 08:58:19 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id i1sm12097169pfo.37.2021.08.02.08.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 08:58:19 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eric Woudstra <ericwouds@gmail.com>,
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [RFC net-next v2 3/4] net: dsa: mt7530: set STP state also on
 filter ID 1
Date: Mon,  2 Aug 2021 23:58:10 +0800
Message-Id: <20210802155810.1818085-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802154226.qggqzkxe6urkx3yf@skbuf>
References: <20210731191023.1329446-1-dqfext@gmail.com>
 <20210731191023.1329446-4-dqfext@gmail.com>
 <20210802134336.gv66le6u2z52kfkh@skbuf>
 <20210802153129.1817825-1-dqfext@gmail.com>
 <20210802154226.qggqzkxe6urkx3yf@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210802_085820_315965_D713F212 
X-CRM114-Status: GOOD (  16.33  )
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

On Mon, Aug 02, 2021 at 06:42:26PM +0300, Vladimir Oltean wrote:
> On Mon, Aug 02, 2021 at 11:31:29PM +0800, DENG Qingfang wrote:
> > The current code only sets FID 0's STP state. This patch sets both 0's and
> > 1's states.
> >
> > The *5 part is binary magic. [1:0] is FID 0's state, [3:2] is FID 1's state
> > and so on. Since 5 == 4'b0101, the value in [1:0] is copied to [3:2] after
> > the multiplication.
> >
> > Perhaps I should only change FID 1's state.
> 
> Keep the patches dumb for us mortals please.
> If you only change FID 1's state, I am concerned that the driver no
> longer initializes FID 0's port state, and might leave that to the
> default set by other pre-kernel initialization stage (bootloader?).
> So even if you might assume that standalone ports are FORWARDING, they
> might not be.

The default value is forwarding, and the switch is reset by the driver
so any pre-kernel initialization stage is no more.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
