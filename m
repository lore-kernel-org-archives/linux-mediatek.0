Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1578C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 08:23:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2F0D60F70
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 08:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B2F0D60F70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3uINlqL78ZLezsgzgCsjilUH7JYdmoa60h9bENwsKG0=; b=Z8aZoI0z8YuA8C
	lWn0DM00lELV8gnRvOxHcrJ6G8fCYbwMaMX7iCu+9s9rBOad6zWAwG1SARlldqv6Bsh9tCHgN1Miq
	ijsm3UtmUE0j8hFSZ8V4Qx0ZgcHTTU+W2mtJy1OgrYaAb19xGHTryRjVDb98drE/aAXdO8FaXjnff
	lnDkSROX4EQdlHU79bPfoNqSkqlg3rfvxGkiULMyIlGXsKnRQN7E5RuQaMe3XKtd81UXRlxwEs4ON
	VpdlSTtTji280ne5IyQ/aWv87r33fH3T0W/eTVQqV7KLW9qQLKfIQSmq6dZcMAiI+ca9WJMYoHTNg
	MaslCQbB3aURPAAcjCTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mApi9-001bVI-SV; Tue, 03 Aug 2021 08:23:41 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAphu-001bQB-5a; Tue, 03 Aug 2021 08:23:27 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so3673390pjb.2; 
 Tue, 03 Aug 2021 01:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=fDhSpWOSrYcVlwun8gKdxsTr1lzh+svxX3HU4xChX8k=;
 b=IUdeMuz+/AS3Ep+u+FgMmD8Ox6TBlMgruYzD3GGNU7o1g1ERcVRhhBK/QgocRFpo7f
 gGYBlsGd8+5pZWrW+mPMa6aLOPBpiqUczPgvHyUp7nupFcyHo88cpDA8ALjYMj2MNSBR
 DksADRmnQIYXtjsXZ9VhqjkF2z41KTxb7dyjY8zmj4YjawVdan1jzzdNpWbHA7JxPlSg
 ob28eHXI6oKEsKT8LSQapasliDnnsiI9A2CyTXaAUrrdOQUD266AOm/FhAMtLP0h8vPC
 hm4Dhxxh/vtAOkfy/GRGihnbs+beU56rmS0jeAX9YOqjoCWqXBAXYGvjMJCijGx/GP6I
 Px3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=fDhSpWOSrYcVlwun8gKdxsTr1lzh+svxX3HU4xChX8k=;
 b=OuAqMaQeKw/V8nkUx/RXYGV5UODoNxomJBKWXp7Ew2jZQfentYe3nBZRzJ3FUraCbf
 TF8t5nxlXTOFjj4Xf10XZ2AtJzo1BpU/Z4E6rOifoBYGa0cOB2mXC1WiRPG8rTY2Cr7V
 WIOcdxnvVl60mdXUZOoDOh9cYo+q7TdOPRef3Eqrd66IqpE6kQiycLXMKeH283kIfN+F
 5ZEii97iC2iRqVGIXl9QPzJQm7jGv7O/di6OCNeTARfnFLNrziUC+OmnrkK6mihP+oRW
 TIMGCV4oQ21VSkhc0cA14b/thiWSX5QN2kC22R83CWBiYgwVJIw6LD9TWreg1Ns90PVN
 M9+w==
X-Gm-Message-State: AOAM533zRv5un4x1hW3zzCNZGNY0J802REOt21YB67L6j8cvHmITt+2Q
 bDk+zDNwbAfS8s7PbQdbGd0=
X-Google-Smtp-Source: ABdhPJzNZWth+D0i4tKa/kdtzaQkkuP562QJnrg5hpFwhUMJpx6kbamQt1Vc91d9ILTlZ3M1XGaMmw==
X-Received: by 2002:a17:90a:7106:: with SMTP id
 h6mr3208328pjk.222.1627979005366; 
 Tue, 03 Aug 2021 01:23:25 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id h16sm13815443pfn.215.2021.08.03.01.23.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 01:23:24 -0700 (PDT)
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
Date: Tue,  3 Aug 2021 16:23:16 +0800
Message-Id: <20210803082316.2910759-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210802210006.fhmb5s6dsnziyk7d@skbuf>
References: <20210731191023.1329446-1-dqfext@gmail.com>
 <20210731191023.1329446-4-dqfext@gmail.com>
 <20210802134336.gv66le6u2z52kfkh@skbuf>
 <20210802153129.1817825-1-dqfext@gmail.com>
 <20210802154226.qggqzkxe6urkx3yf@skbuf>
 <20210802155810.1818085-1-dqfext@gmail.com>
 <20210802210006.fhmb5s6dsnziyk7d@skbuf>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_012326_259295_B1979A23 
X-CRM114-Status: GOOD (  10.45  )
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

On Tue, Aug 03, 2021 at 12:00:06AM +0300, Vladimir Oltean wrote:
> 
> So then change the port STP state only for FID 1 and resend. Any other
> reason why this patch series is marked RFC? It looked okay to me otherwise.

Okay, will resend with that change and without RFC.

By the way, if I were to implement .port_fast_age, should I only flush
dynamically learned FDB entries? What about MDB entries?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
