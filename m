Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46D39C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:58:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A19B60F6B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A19B60F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myvdeiWVnFFJ0/6jjurLJRlz6aTpxIAShxsA6AkrVVU=; b=0x7Pp8JIQDW6T6
	O29I5tlDHryZnFd2m45vqPjRnPqaRJvnW9r2/3nmGE985LnfrOg4Zdqd4nZeoO+ianol3fkB161qa
	lz/xMbldORMUOnyeVqwF+VeKK6wbx/wA4ntnFc/q9NJcX2GAUYlxjnqGvmXQO2ngvHNEXrXlcbhqs
	CroqcskpsYIq/mhln425heyTkesmZvQOsqW9h8WeHT/NBt9hk3e4b4MYHQ1YI4KBQNaALaIgpGK0K
	5OIUOmJz8kgg2p+RSL8ab4kLeeH5b0nsF6FFCbMqyW4bowfmYL2st9z+r8nOo19EpvSCSzwDpxI5L
	CSdapdQ/8ljQjwKj6tug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9WmS-009nwL-L0; Fri, 30 Jul 2021 17:58:44 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Wm9-009nr7-Vf; Fri, 30 Jul 2021 17:58:27 +0000
Received: by mail-io1-xd2f.google.com with SMTP id l18so12436128ioh.11;
 Fri, 30 Jul 2021 10:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=smUmS4A5+CXS/HJDMygkL2oSX82xvdw6bpNEbjAr0g0=;
 b=K4VFhrT4ZJWkMoYBKLQwOrJwd4CM0g3hIDd5OGCuLem9lBMfphfAvJ8sDqq2luZ020
 BywmILMIBiR8Rz2Joh29r9XsMhNfuNo31ObvgSh15TRocExL6rhmDy5jw6JKiHpPMqIK
 guH6LxRqlIqMZ13SfQdrHJMSF3U8Qb/G3TsG39S+vXypP7bUicVKDv8sN8ntpRfN8f98
 nM9qh7xhGczJ9HRvB9VzmEpPZakz8rHRnMXEejEhE5QJvdXRml8XdGeWjzBgMW1zhb4h
 cqU6PsdF6Fs/PsU4gl2arfL7crgfRjDmBrfHDnrcVIWL/bDZNQ6LQG3webpSghf2XPFJ
 bW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=smUmS4A5+CXS/HJDMygkL2oSX82xvdw6bpNEbjAr0g0=;
 b=RGCWDii2xysPBF5QRXAyY9PmFKdX16V/INl8nftV7UKLSUuP1RYKpCPq/O31l/2X/H
 N+ZNGdxwTh83kQobaf3hnNYGWCZW1di89151UwfSDy89iD7KxD444ICxJgt2KWo2ebuB
 h/iV3wno8BLkN6Lpzc1Afff0YpPHz98RCmjmRvLtBgJWKuZZEHthNsu+TggkooeBuXd7
 HHgFqrmj12AZ6TFBdJFxoBcmSeCuogGRC4Pm+0KLFKWsH2rwAXvv6qubZ0oMvVVDoufp
 gvYNIWdsLlcFs7P2odNhizcMXTGVh7KffBNaXfGWM/ZDHJjbpjKIiO/04Uq1DcawfY4A
 Bh4w==
X-Gm-Message-State: AOAM531AwX5zFIJnnR0p7icAqFPyJbxW98n7TT+8CrGV+3RHhcHOUzMh
 VqPcpxgIGgPxtZthAEHqNEA=
X-Google-Smtp-Source: ABdhPJzUYNA+Nyqi5PlSkrfzgZvODSW95WRszog3RzVQePF0cdu1D8Hum6pg5yO1Z51aSH2Xmo6jtQ==
X-Received: by 2002:a5d:96da:: with SMTP id r26mr3316616iol.47.1627667904024; 
 Fri, 30 Jul 2021 10:58:24 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id m26sm1448320ioo.23.2021.07.30.10.58.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 10:58:23 -0700 (PDT)
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
Date: Sat, 31 Jul 2021 01:58:16 +0800
Message-Id: <20210730175816.519109-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730174135.ycsq3dhpr57roxsy@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-2-dqfext@gmail.com>
 <20210728183705.4gea64qlbe64kkpl@skbuf>
 <20210730162403.p2dnwvwwgsxttomg@skbuf>
 <20210730173203.518307-1-dqfext@gmail.com>
 <20210730173902.vezop3n55bk63o6f@skbuf>
 <20210730174135.ycsq3dhpr57roxsy@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_105826_120465_F5D31596 
X-CRM114-Status: GOOD (  13.34  )
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

On Fri, Jul 30, 2021 at 08:41:35PM +0300, Vladimir Oltean wrote:
> On Fri, Jul 30, 2021 at 08:39:02PM +0300, Vladimir Oltean wrote:
> > Ah, mt7530 is one of the switches which has multiple CPU ports, I had
> > forgotten that. In that case, then static FDB entries are pretty much
> > the only way to go indeed.
> 
> I forget which ones are the modes in which the multi-CPU feature on
> mt7530 is supposed to be used: static assignment of user ports to CPU
> ports, or LAG between the CPU ports, or a mix of both?

MT7530 only supports static assignment, by changing the port matrix.

MT7531 also supports hardware LAG, but I don't think it's ideal because
its CPU ports have different speeds (one 1Gbps RGMII and the other 2.5Gbps
HSGMII).

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
