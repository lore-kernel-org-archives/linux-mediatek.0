Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 973D1C636CA
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 15:42:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56CAD6115C
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 15:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56CAD6115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bLKMH5Cd88qniKfHSKns6LcO1tzTOsUIXZuy/xNPzps=; b=WIBqTsVegbanDV
	bynIL7a9IyAEBSu+cppVZx7XtmXuYUIEVGzyilE/yG1doqHBxpHf18k19D7ceVRIYDAlkW4lN927m
	G2gQaoOIhemYMROGlYSw0Ko3Q79XFGWbsPYMgNLgKDYqpKsOdMNj3af0lPU0X4xsHLNDPeu084Rwl
	2Mx0zB38EEvTsIZuN9Z6tNrrLUm5Hd/+SWMEFLeSQ0WdWX/xSMj8dfko96WP4ft7uKAXS1PSDquJS
	n1EGihvQ71frGQqqZYNThMNFGN6grpr9af4ECE4+SvWjtfxZOnWxar4H8tU7Kj4dgMXOYqAcxjbuf
	O/4uZqZ/DEa7L2Q86hqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4mRy-006lq4-UP; Sat, 17 Jul 2021 15:41:58 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4mRl-006lp3-54; Sat, 17 Jul 2021 15:41:46 +0000
Received: by mail-pg1-x52e.google.com with SMTP id y17so13304828pgf.12;
 Sat, 17 Jul 2021 08:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=joQ8gEeTx6Yiij5UFZWM2uMjNke7wP9TlqjIUNge51M=;
 b=d8CLmdnIzEpfIgHQZ3lctgsM+Ll9uXpCnw6FK8u2FvmNaciwfEqcae8VPqK0UBwWBT
 F/Tfv2WucvBot95eTUkTEqmM21hV51mCirP2RFQ4dj6i8K/riP6i2VvEpbGErMYtg45C
 MNt2UeRF3x6E0waatVGUyOIl2ay7K0zDZ/h8SHgzEXsERFSjs+1vGXQHAp1+E0REdbhK
 nG/dy11kVfvqCagWSYon64fGT2Hvyz92qk4p3jSiyMaickRqyfdD9ph/r7O/yr+jq7+E
 V3ATxNSj3HTkqckg1jYB/ftOxO1j5MFb+DJaw0NApKBclLYp91uC+YheWkPYu3JWvgyK
 RceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=joQ8gEeTx6Yiij5UFZWM2uMjNke7wP9TlqjIUNge51M=;
 b=ILb/myBqHpY+HboIihlEAV4lEzPjAp06rz+UIhIyJYrYBqFc+PbGUtdsZsi+NJA4A0
 Y3E7s7HDxHzE1uM24XfxS9DoH6ddmBkJKuWA/1OaAXcF2RYWpDICRO64jraB71PWXh+T
 5xCodPMS/vLUueD/5TozcdxR5b34l19ptHMr158mBRv0nLL7FTp+affTA89XUOKMFCIk
 YpIzrlc6C4eCOKHWQmx+m/CC0/cbQ8h0wIJK0J04SSEXpod1MN9BrISUPHO2CEjNPbnY
 G/6EJYgsYa7oR9Au97NMrXyl9Q3Lp2XMR17pvXmuwaopMVIHGoYYVF5r86RL56NjwDRO
 GuCQ==
X-Gm-Message-State: AOAM5304akLh8srczPkWr3TOLXhUGckiYGy8inbN7Ph17WdWTE+xietf
 6T1BgLnqKDlYP341LPNQlD4=
X-Google-Smtp-Source: ABdhPJzpED/z+AzlaCHgvYtysgYgXl0cEeH9cNxEg30LHu8mqrynywd7fdi9wIVfeMVwiYHoKA1EWg==
X-Received: by 2002:a63:d74c:: with SMTP id w12mr15631066pgi.91.1626536501212; 
 Sat, 17 Jul 2021 08:41:41 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id m13sm13461930pfc.119.2021.07.17.08.41.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 08:41:40 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <landen.chao@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH] mt7530 fix mt7530_fdb_write vid missing ivl bit
Date: Sat, 17 Jul 2021 23:41:31 +0800
Message-Id: <20210717154131.82657-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <eda300a2-4e36-4d0c-8ea8-eae5e6d62bea@gmail.com>
References: <20210716153641.4678-1-ericwouds@gmail.com>
 <20210716210655.i5hxcwau5tdq4zhb@skbuf>
 <eda300a2-4e36-4d0c-8ea8-eae5e6d62bea@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_084145_242913_13466196 
X-CRM114-Status: GOOD (  12.46  )
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

On Sat, Jul 17, 2021 at 10:09:53AM +0200, Eric Woudstra wrote:
> 
> You are right now there is a problem with vlan unaware bridge.
> 
> We need to change the line to:
> 
> if (vid > 1) reg[1] |= ATA2_IVL;

Does it not work with vid 1?

> 
> I have just tested this with a vlan unaware bridge and also with vlan bridge option disabled in the kernel. Only after applying the if statement it works for vlan unaware bridges/kernel.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
