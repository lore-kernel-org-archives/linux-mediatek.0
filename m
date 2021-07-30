Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A435FC4320E
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:32:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DA3E60F5C
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 17:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DA3E60F5C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zCU00tVCKl18XkFqxc1prNtQINc9emINqybHqW0ofgw=; b=jEOBQY+EXpRfrT
	xVrgyPLAAE7huqDTNU8cWR/nVEegBRGaxlmvX4Unab/PsnocMcI1Y0t83Vu5RgXkHtgRW/LpyD2d0
	qv5CSDgWyabHAerl8REFKq+r2fEmpAd35xm8+VykEf92EuUj1oawSmXYxa68bg98n9nqR6ndjda44
	u5grPmRkvy5SiBpJ49taHpIUlZQ9hBK7oW6v34ohkg09vQpDhJHrvQWRWw/L1dSGwGsGfKFVABqED
	UDb4x8Sjq1tEW5cuC82UZrgZmvLbPQRnI2vhvpxFmzafwEkTlZC+G2WUI8QV4xiPa7lPuJzMgKlNj
	7GRVdlo7wMPSuJcDyVTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9WN0-009hKL-TJ; Fri, 30 Jul 2021 17:32:26 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9WMn-009hID-Fq; Fri, 30 Jul 2021 17:32:14 +0000
Received: by mail-io1-xd2e.google.com with SMTP id a13so12365401iol.5;
 Fri, 30 Jul 2021 10:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=B8zL+1qEXUiyhytb1znuh6gn0RRcTrCNxC66xqLEJ2M=;
 b=XPp6ZGO91Rb7e90Ovm8SWrrU4CdL9lQZ/5cZWVw6TXHCt5dwQ71FDZFH1oZYbn557g
 obTqqr4Kx7ReoyX7lZAxPdTp7YZEBXcHJND+JX3rxG9knyEL85L2UJr8pNvPmR2NFXVz
 VYiW5yKFNZee9HCT2hKXkXX669jimeI0ganqZdEz649nH70wCQYLv2pvhgravJXFnlfD
 ZbUj7NFmQQwKE/myDhnSrwauThxqb07/a86C/9ixMlIZy9g4m9ndcsxj4tMq5GqirJu6
 KqHqFmagahVRc6Xot69XUs9WpZZqWnoTpaPdkzbfy9DxsAgyLQidumdhLkIs8vh0jaHb
 ge2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=B8zL+1qEXUiyhytb1znuh6gn0RRcTrCNxC66xqLEJ2M=;
 b=TTMoRWGVUXPywdp+TlRXlQuDFHo6+V8bZqQiUbXR6TNRk9TWl8OEczUoPx7fH+cQFh
 gjV7Uj0hipEfu08JP0aCD7MhXaIRviGlb3i0dAm1VuRjoy3UHqDxIyk5a92jEpvJPOY3
 9/Kmxllle683NW0esM++8EXnpT4DAVd5MPNgyOgcpWJySheVKrvoBgMivMXfl80N3HA+
 QNTq1vuP7wE1Bo3jbIWDf4kxr7LuPoVoNMdGk1fn+NScuhjD4uqDuybk+oWTeB6KKxTD
 6/vKG+WG+OYX/1uJI1r3tbnUyqVquGGR7lyb5pHoIvmtbZUUiu8pFiYXD6SoWf9BY4uV
 FbEg==
X-Gm-Message-State: AOAM531GyxpE4kc/vm1aMsEPBPjd1d6fPmkMoI4SWalk8wnK5xAtQzah
 r95OPA/12039tfqK3OyshCY=
X-Google-Smtp-Source: ABdhPJySqKOIiujFAu9fj7/f5VnXJ3qIZVovsQHfHWytr2kYzmNRDmtj8MyJLQFiOujKYaEgo3l4hA==
X-Received: by 2002:a6b:4f16:: with SMTP id d22mr880154iob.15.1627666332729;
 Fri, 30 Jul 2021 10:32:12 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id l12sm1142444ilg.2.2021.07.30.10.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 10:32:12 -0700 (PDT)
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
Date: Sat, 31 Jul 2021 01:32:03 +0800
Message-Id: <20210730173203.518307-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730162403.p2dnwvwwgsxttomg@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-2-dqfext@gmail.com>
 <20210728183705.4gea64qlbe64kkpl@skbuf>
 <20210730162403.p2dnwvwwgsxttomg@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_103213_574709_CB4559CF 
X-CRM114-Status: UNSURE (   9.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 30, 2021 at 07:24:03PM +0300, Vladimir Oltean wrote:
> Considering that you also have the option of setting
> ds->assisted_learning_on_cpu_port = true and this will have less false
> positives, what are the reasons why you did not choose that approach?

You're right. Hardware learning on CPU port does have some limitations.

I have been testing a multi CPU ports patch, and assisted learning has
to be used, because FDB entries should be installed like multicast
ones, which point to all CPU ports.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
