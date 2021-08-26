Return-Path: <SRS0=zgIi=NR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9090C432BE
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 00:02:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C271610A7
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Aug 2021 00:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C271610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6Tf2MLMDf5f38IrfhExd2PnOPFoUtEhP9c22k0CB9U=; b=3uJFxVx74tu3Nd
	PNlRezULkXLbPw5GcY1UMOsWvBMmwRmbyBWEZEFcqxgnu0NGdysGnshZ/wBA24J151S4ygHdaHMa/
	laqOdzi4Fnc1H1aqQmt7qzaioVLUXk5SjuHGSOWLVy61kn2VZHLcs2MPJG08ttiDhfjlqyzMPQDHy
	APCI7I0/AfZa1GsoztI3UwlM6QpXMeOCBDAzVlU3vb3oYTwkjHrNDIjX6BviLIDScuam3n//dOfFk
	J06349bA9eeltxIfu+nUgOLH6HVMqnPENuCtzF2pwnDw+/D0/FJA6mWeN6NTJnQZihfKBOwxhSh3W
	+WAsgVk8tNM6eFqWrQFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJ2pv-008jCF-PH; Thu, 26 Aug 2021 00:01:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJ2pg-008j8z-1Z; Thu, 26 Aug 2021 00:01:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 z9-20020a7bc149000000b002e8861aff59so1374566wmi.0; 
 Wed, 25 Aug 2021 17:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gn0+R/7R58c152OdsQfm46+uKGwqkw5R5Zqn3EfO2Pk=;
 b=UWblJmUdrjsPOcnJvcY+zYG8DLWSlVT0cYwkUUWPlQFikm27sqluzhjHlp2KaWzLs7
 SEz0hhFR0DlqHLE7FAq/Iuor8O2E/COWxkLLDEeeMmz4F2jCV4o7Wb+fmCyW+2lJQdnr
 w1KetvDe5p8Tk9j/6eIUI1Xwj7jmhObjKdOjegBhZ3zF8lr1ebKF5p0QmN4yII8UgR9Y
 muxq9I++Iss50UCIP0ORghJdAnac5asNaw0qzTFl39OMZ/ol5/WEryFENRKyDkqzpnHM
 pMaAD1gYgkexorDkVC60yK+uxqzoe30tEAyiZ+YDOOVub7RijQN1NdOmVSqlhpXs1nv0
 YqYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gn0+R/7R58c152OdsQfm46+uKGwqkw5R5Zqn3EfO2Pk=;
 b=hbkwgFKYS1AnMsMrfigQpgJSN6GFuL8vdUcOFJ3Eo+IYUJ8jDfDmXbkVSYV6FtsTRO
 b2WaQF/h4id6NpTZ/AQnu7TrKn7ebXvEGCH/g11+VvfImkkRKs/Jpwwv7a7vYQZh69QE
 yw6ZdeNsi479G3iWulqAwcXGu5wz/aZQE7s4xQsq5ay+3Bo/oklLPqiWP2i/BAV0D3b0
 DQ61Ufnwxj5aE9/I4m+sGGqs1xosMcCjM2FGNd3mHYMykV4PnbvdHqooCVwvcmElA4eM
 djb8UwX+NCP57dBkc9fMIudTziFCCqHiYzsBupNtsT23Ak8k4KtAKLTRQeq4j/AY6qVn
 At/w==
X-Gm-Message-State: AOAM530rkEpYu87HbruHldSBUk3ZWDojj15/Y2+QDGnUlh/dA/ct106J
 I+r/L/YBowaKLF4vUagmFkA=
X-Google-Smtp-Source: ABdhPJxKyb1ON6kX34ngYPEawdE1OTzU9XvKOLg25OBlQqg6Jboa9MJpjBPYcKMAoD38YcmPeLwj4w==
X-Received: by 2002:a05:600c:3798:: with SMTP id
 o24mr11403587wmr.18.1629936082544; 
 Wed, 25 Aug 2021 17:01:22 -0700 (PDT)
Received: from skbuf ([82.78.148.104])
 by smtp.gmail.com with ESMTPSA id x21sm11092wmi.15.2021.08.25.17.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 17:01:22 -0700 (PDT)
Date: Thu, 26 Aug 2021 03:01:20 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: DENG Qingfang <dqfext@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [RFC net-next 1/2] net: dsa: allow taggers to customise netdev
 features
Message-ID: <20210826000120.isvbsdjwpvyszglb@skbuf>
References: <20210825083832.2425886-1-dqfext@gmail.com>
 <20210825083832.2425886-2-dqfext@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210825083832.2425886-2-dqfext@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_170124_160660_EF5966B6 
X-CRM114-Status: UNSURE (   8.92  )
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

On Wed, Aug 25, 2021 at 04:38:30PM +0800, DENG Qingfang wrote:
> Allow taggers to add netdev features, such as VLAN offload, to slave
> devices, which will make it possible for taggers to handle VLAN tags
> themselves.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
