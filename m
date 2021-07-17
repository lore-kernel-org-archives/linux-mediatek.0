Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28EC1C636CA
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 13:02:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3CDE613D0
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 13:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3CDE613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IaHhalzf4VXOM1ghDjD6t2Sy+kZDMpcPRiRhu3+bJH4=; b=xuThgmb1GKHw2F
	Q8CFqhvql7FZGRCqOaFf30k+3H4kcKNCeRDMzu1JpvYfCgWe/Lsu9R1yS5QztcpaDUhgzYdDbzFna
	Rxdi2xr9i90KZcyZUYZv+yp5mzgtgbon38umTEmFUa4WTbMfmVeFwiJb2VA6/MW6CQAjcbn9/WbPw
	+Et/UtSTp4qEkDG97lyowr/QiDMhC9l7595xUSsBXhDWJEzM+BpqY2Oqru+sThYYvV+0j55/p3oBu
	k4zKU7SZMjnC4Ed9D+kWKbIhydYIdsMx4XMzHTuOapwlxekvOr3SW+X6fWFgAYvw5c3JxbyjlWG3+
	xpRh7M+NwD/jDGvx///Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4jxB-006etL-HB; Sat, 17 Jul 2021 13:02:01 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4jwy-006es3-Lf; Sat, 17 Jul 2021 13:01:49 +0000
Received: by mail-ed1-x533.google.com with SMTP id ec55so16649155edb.1;
 Sat, 17 Jul 2021 06:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AE0vk+OWuD10Z0EqVPnQQ5x0ytDuchGXP77/oS4iF8w=;
 b=Gg1y0YAKvo0Fc2m2o1vuYshTnVDoA7AEjImeWOohdIoi86RJZkQ9EGTCNygubW7UC0
 iWF3gHPbv+OvaA6L/VxSeru3cY8xFDX3AQtEzr2W30cIN0JDF1Uo/IwO1AgZQ6unYQet
 /v5mHaAhdST8LsAcNoSt42YKdWLMXQAad+TtwKNhXVcfyXqu5b2j61dWRNxGJt4WuEb6
 /aRUj2nfjXLymb/CFQuNKmrCZ7jx45a/CvHxfyDCpHPpoV3diEvtmPCDIOc5J/sRnhhL
 89gECpkCFWK78McK6kEm3b+FdUvprUsVT7BaoKBMHDxdwAHArqlB/wzFq5l4Nv0j3r8g
 iRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AE0vk+OWuD10Z0EqVPnQQ5x0ytDuchGXP77/oS4iF8w=;
 b=j84aDqm7sEfh325705f/mQTkhw1ejQ/HFwKVm7szbioL8pETcuaea/4hfmjbSRmyn2
 9hpK12eE8HKc1/n5y1r6OsJJYTgrOdEv4IU60BjAxEJss9L8QN9PsM99piN88gFKBI2P
 VxsU88G/JteuUnPj6EqxFStV703C20i8CIlIbDwwbYlNrF9B49ebSevVRTrAhF9LdLPc
 TwFNM8V42pFbm6DgJs8RyAP4Kg/nbPxGkDjkeBK+DvczEjA7Gjbf1KKOziXyBpeX92/j
 rteal2/7jcLv2UPWN5BIsKNhJqvcsVW/yHxPmYHOZQWjeTzR7VW77kLCcWHR6cXdTJzf
 LIhg==
X-Gm-Message-State: AOAM5330hkCWv8VoM7jo5UqcDAB6TtB+7u9cLqqVho/xTVj1aHLPQCoz
 9u4ZhfATyazsbisVK1lB1JU=
X-Google-Smtp-Source: ABdhPJwwTfY3aDydN4vgqwZ+1IdTA9/4VbUMf3AZZ5O7FnIURRVd000FJGicxnOWF91vKjlOHvQaQA==
X-Received: by 2002:aa7:cfcf:: with SMTP id r15mr21810760edy.161.1626526905205; 
 Sat, 17 Jul 2021 06:01:45 -0700 (PDT)
Received: from skbuf ([82.76.66.29])
 by smtp.gmail.com with ESMTPSA id e24sm3857192ejx.100.2021.07.17.06.01.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 06:01:44 -0700 (PDT)
Date: Sat, 17 Jul 2021 16:01:42 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Landen Chao <landen.chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 DENG Qingfang <dqfext@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH] mt7530 fix mt7530_fdb_write vid missing ivl bit
Message-ID: <20210717130142.xm7ect5sc6i6hrii@skbuf>
References: <20210716153641.4678-1-ericwouds@gmail.com>
 <20210716210655.i5hxcwau5tdq4zhb@skbuf>
 <eda300a2-4e36-4d0c-8ea8-eae5e6d62bea@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eda300a2-4e36-4d0c-8ea8-eae5e6d62bea@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_060148_751985_3381B008 
X-CRM114-Status: GOOD (  12.41  )
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
> You are right now there is a problem with vlan unaware bridge.
>
> We need to change the line to:
>
> if (vid > 1) reg[1] |= ATA2_IVL;
>
> I have just tested this with a vlan unaware bridge and also with vlan
> bridge option disabled in the kernel. Only after applying the if
> statement it works for vlan unaware bridges/kernel.

Ok, make sure to read Documentation/process/submitting-patches.rst for
how to add a Fixes: tag to your patch, Documentation/networking/netdev-FAQ.rst
for how to set the subject-prefix to "PATCH net" in your git-send-email command,
and send a fixup patch.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
