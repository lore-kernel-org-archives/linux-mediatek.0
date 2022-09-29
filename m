Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D233C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 15:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7VI/lNtki3zEef+0LBeBHdkR7jGYNMrvxJja3PqG/c=; b=kRxJ1S3AMZscWxzZgJI49OraFi
	je2f67sS2yuhQZZnRbdSITS1SABAiivB9rwNGF0OWov54KCKu6QCnk+FUWzsjJyvMci2gYrFJfZ9X
	ESSblIU32qAOiDph0Z7suQ6ySZdUgrAfRq/K2rIroZPT3A2VQidDjVHor+mNXr8X/M6jktN6BpZm7
	3ijlQN8YGRvjFCrj94wcV39gRrWAUZyzSMbLXYr9/rBtyNw8Ii3FRuRcd3fPcV7esn/JElow8mFuK
	wiPbFxLtVJM14SX4s1hH75EKT7KQp8nLR64I4r3sPpJsWhCZOO/W6bSf+RBpdwUWn2Jb6El540tD4
	9TVi8stw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odvh0-003w1k-On; Thu, 29 Sep 2022 15:43:18 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odvgy-003w0l-CV
	for linux-mediatek@lists.infradead.org; Thu, 29 Sep 2022 15:43:17 +0000
Received: by mail-pf1-x42c.google.com with SMTP id 9so1779461pfz.12
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Sep 2022 08:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=b7VI/lNtki3zEef+0LBeBHdkR7jGYNMrvxJja3PqG/c=;
        b=Vzksrx3sniIo56OPl72BWHlU0/Df8j/JQCbDZvy1EGrf7kGm7B2aiZfENf5gW44D/J
         gI9Z0IM1eNvyuoepwUgJtEreELCtd/Yi97PNwccOEhM6E0notm+GqKPkHLkR9oYsyKb8
         Yoq/pleXGN8k4RyGciZfN2tWjdiAPNPkdJ0GRF8seENVYF2FOicZ45TlpxCNGouCgsOp
         P0XmWHkJpwHysnW3nZxveeGX+rb2ESXrOcsYARReYp7X/HAFCqXhQu1KdtVjt8W5CRIo
         QDL3OSbkonYl6GqgtkUeoFLMwgh1qC0e+3cPxCbPucD2iWViRSqwTxmu6i6Uq7X8iEVv
         wfYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=b7VI/lNtki3zEef+0LBeBHdkR7jGYNMrvxJja3PqG/c=;
        b=jQmDX9Of1lRHGchA5t9uTMd5ixIjH9GdEpHprXUzVOjRiuZIGRoKsFaN/CYMnxW5t5
         lmQyqH4N8UvAnPcKWzu8VTBQInTEWECczoQsgcslduNctcVb1KfKM2rPAQ0zPnbaP2YV
         R9fQ1L2W98t4CySJFD9HgeidlN76AGOZICIL0YcPgETzE1q+q8enpNjpjS083Q+2viX2
         Ks67pE1G7+Avs5jVLQA0SBOVABbMFJFpx1oYD41Xc1Vbp/X32ZA0qjvsXWCnNbP1VAon
         bNlj63p0PJQpF9g8VsX4oO8ec4B12r1+sQZVAynMrMubYwSMw8Q7vAXnfFq5bU9XpZ+7
         NS6g==
X-Gm-Message-State: ACrzQf0eEUV3MhyOWeISMI/1LmNyGf2nCefmtjl/KkRabYIbsBkdFCEb
	nyjQzsaqNdXHUsA1VdfNJAiqsA==
X-Google-Smtp-Source: AMsMyM5rOGzlC007WW3U9p2PPqvx0IpfKhVuFQ42vcDUakNLelXGGyhbF2WyHTattavi5pSMM7s+ng==
X-Received: by 2002:a05:6a00:1412:b0:557:d887:2025 with SMTP id l18-20020a056a00141200b00557d8872025mr4076191pfu.39.1664466194646;
        Thu, 29 Sep 2022 08:43:14 -0700 (PDT)
Received: from hermes.local (204-195-120-218.wavecable.com. [204.195.120.218])
        by smtp.gmail.com with ESMTPSA id z3-20020a170903018300b001768452d4d7sm56745plg.14.2022.09.29.08.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 08:43:14 -0700 (PDT)
Date: Thu, 29 Sep 2022 08:43:12 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Hans Schultz <netdev@kapio-technology.com>
Cc: davem@davemloft.net, kuba@kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Nikolay Aleksandrov
 <razor@blackwall.org>, Kurt Kanzenbach <kurt@linutronix.de>, Eric Dumazet
 <edumazet@google.com>, linux-kselftest@vger.kernel.org, Joachim Wiberg
 <troglobit@gmail.com>, Shuah Khan <shuah@kernel.org>, Ivan Vecera
 <ivecera@redhat.com>, Florian Fainelli <f.fainelli@gmail.com>, Daniel
 Borkmann <daniel@iogearbox.net>, Ido Schimmel <idosch@nvidia.com>,
 bridge@lists.linux-foundation.org, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Roopa Prabhu <roopa@nvidia.com>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>, Landen Chao
 <Landen.Chao@mediatek.com>, Jiri Pirko <jiri@resnulli.us>, Amit Cohen
 <amcohen@nvidia.com>, Christian Marangi <ansuelsmth@gmail.com>, Hauke
 Mehrtens <hauke@hauke-m.de>, Hans Schultz <schultz.hans@gmail.com>, Sean
 Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Claudiu
 Manoil <claudiu.manoil@nxp.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Yuwei Wang
 <wangyuweihx@gmail.com>, Petr Machata <petrm@nvidia.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Vladimir Oltean <olteanv@gmail.com>, Florent
 Fourcot <florent.fourcot@wifirst.fr>
Subject: Re: [Bridge] [PATCH iproute2-next 2/2] bridge: fdb: enable FDB
 blackhole feature
Message-ID: <20220929084312.2a216698@hermes.local>
In-Reply-To: <20220929152137.167626-2-netdev@kapio-technology.com>
References: <20220929152137.167626-1-netdev@kapio-technology.com>
	<20220929152137.167626-2-netdev@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_084316_622871_B6EFC671 
X-CRM114-Status: GOOD (  11.35  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 29 Sep 2022 17:21:37 +0200
Hans Schultz <netdev@kapio-technology.com> wrote:

>  
> @@ -493,6 +496,8 @@ static int fdb_modify(int cmd, int flags, int argc, char **argv)
>  			req.ndm.ndm_flags |= NTF_EXT_LEARNED;
>  		} else if (matches(*argv, "sticky") == 0) {
>  			req.ndm.ndm_flags |= NTF_STICKY;
> +		} else if (matches(*argv, "blackhole") == 0) {
> +			ext_flags |= NTF_EXT_BLACKHOLE;
>  		} else {
>  			if (strcmp(*argv, "to") == 0)
>  				NEXT_ARG();

The parsing of flags is weird here, most of the flags are compared with strcmp()
but some use matches()..  I should have used strcmp() all the time; but at the
time did not realize what kind of confusion matches() can cause.

