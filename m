Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908DCC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 19:00:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4AE4560240
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 19:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4AE4560240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RB3Y9NANl/bkjFslG4v/v4fkda4Pvl/+aLQn0bih+zI=; b=T8TEh/+65FxojV
	JSYG1eciN84UwTY25TKFueYJs1QdvWZu4TeEgxF9JKjBlmNiH6ZcHcj8SHtWIe0ZvCbOBR95BiKWz
	gK8yjPwWtWL4H0rmZwDYyugMH969jfZGZ2Hmmu9w3mw442mj7tCc2r/AsqK0koEwWMAnYyouPMwb4
	hQSexcbrAdaR16pxJIG6xvX7mk+7He4We2++CykkEGbDdC8caKoJY4MnU+TxiKag2iyWloXRhQgp+
	zlcES+1tuqNfsvQb6B0bWykbj1jRzDDnC4JjUtxKNFMHH3NDnv0VEz2EuXcgkxWLg7laPcyHkV0Kb
	x1LF65nDq0Nnnvrt+qPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9XkS-00A0Bj-TK; Fri, 30 Jul 2021 19:00:44 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9XkE-00A07L-Lw; Fri, 30 Jul 2021 19:00:31 +0000
Received: by mail-io1-xd36.google.com with SMTP id f6so6837146ioc.6;
 Fri, 30 Jul 2021 12:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=LW9Axg6PO2+fAhkVIielz/2kuUe/8kVjL2M0TRJoppw=;
 b=h7Wff98sS/D3hYcTAQd9yf/JkVaCdiSHAqFI7XGUFgQn0PsjpPMP6lFqvGDPX+GUx3
 tV9rgybUcmKNS1+Im0jIqkUUZsfNKGKTQ9Pb1udvrIdAP6k6wAoZCXF40YOIkDtxRhnJ
 AcyCyYuqEonB/Xfe/i7796npkV50tMNLbPEuN2K2R7BRrMSb3HKS66QYfe/tiQI46E6C
 lS68qjy8vANHhH47BAiRcX72HhDn1oMpfDzGuvAQanZ8ihb7Rl9U6msuPixBqOuGjzX2
 AkKBNhokvZ0rrRJIdp64lpJBKSOkgqX+dC6osTkB7mTvi+XVJduQNDWM3MCeCylnLCsV
 bOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=LW9Axg6PO2+fAhkVIielz/2kuUe/8kVjL2M0TRJoppw=;
 b=Zu4F7i5izYUNby5m6mYVupkNyQoA1G50DGbay8uBSt/1zIRbYKeYBl35X3P6R1Mw3p
 cSjfoFGsXKqPMwRfeHStdKPXVlStkq/k4EkTaXU2/M40bsFvu4qltVMvHJD55oI+DgXO
 Dqixrm5kjp/Fu13J59yPWqUFgQi8l2OmHlAv76FI+fFA77MwlzcuOCoRCEhoFnT6zcof
 P0y9je0toOC7yVUvZ1bTnq1eRDsensczxQxJORqFn6AGhb8UuQdhskIDfm/IdnlPxf18
 jI1CGzx8FB2lJl/urkyXETLlwr/QyWbfGmhXohoIadslHTC1aamsxkIvBK0Q39+Gf3QS
 zgdw==
X-Gm-Message-State: AOAM533xEUKx3opSKGxiEestx/id3c1mvcZkeWYCXl8jEQ/F1wS2Kg4+
 JYWbb3/e5wzkQJXGohZlscE=
X-Google-Smtp-Source: ABdhPJww/+ckhdc92jt2T7e4jkYlM9JINk8XOuefIN5BFo+AtM3w9Tc+bDl5jNoH+2PkQCj9U8jaRQ==
X-Received: by 2002:a05:6602:2d10:: with SMTP id
 c16mr2254956iow.40.1627671629552; 
 Fri, 30 Jul 2021 12:00:29 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id x4sm1336069ilj.52.2021.07.30.12.00.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 12:00:28 -0700 (PDT)
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
Date: Sat, 31 Jul 2021 03:00:20 +0800
Message-Id: <20210730190020.638409-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210730162403.p2dnwvwwgsxttomg@skbuf>
References: <20210728175327.1150120-1-dqfext@gmail.com>
 <20210728175327.1150120-2-dqfext@gmail.com>
 <20210728183705.4gea64qlbe64kkpl@skbuf>
 <20210730162403.p2dnwvwwgsxttomg@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_120030_740690_0431CE49 
X-CRM114-Status: UNSURE (   9.68  )
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

After enabling it, I noticed .port_fdb_{add,del} are called with VID=0
(which it does not use now) unless I turn on VLAN filtering. Is that
normal?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
