Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E28DC43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 15:25:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC95B20639
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 15:25:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iCM2PuRZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sKE0Rk/x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC95B20639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:In-Reply-To:
	Subject:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vd5UEo57MS9nAEG8LDnmF0ZmiCk484SaaEAe2Zyu+Co=; b=iCM2PuRZSqBFWPIKlfMqswl2/
	GW54mfcQDz+pLVM8UD+SImFjVUWiocHKCW4oejn/A00DTpvPGwtXzyx33KgZzkaRbzUNkOENp9bkE
	qb6P/vALa4EYXnNQF/Qo1XMP1FOJHv0IFDF48nxbsnS51d1G/xIXJB0W5TM27bDt19c14MLBNkU7p
	EWH0UcmdG2PKvJZczvZ1q7B8Ct/q2T3MuUs2WHw/A/OQMSi/zSM8DOiKIzy/AlZeJ33/aeblQffuC
	JkHz4vOSFB8+5BeR8gDPxi7NWC4FLYzQFBvwClgHBIxn3Xid0dKhqSqs/vaIc7TnEb0mc/fTmDgM3
	nL4tW4d1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHqLu-0007TC-99; Mon, 14 Sep 2020 15:25:10 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHqKo-0006t6-TB
 for linux-mediatek@lists.infradead.org; Mon, 14 Sep 2020 15:24:07 +0000
Received: by mail-ed1-x543.google.com with SMTP id ay8so17974781edb.8
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2020 08:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ibWutNLRYfpj9cLUsW6mKo/tcn9AM4qWn7Yan42NOHY=;
 b=sKE0Rk/x5fl66u4LCMVVyYLK+ImwzFZNzx5TqZPzWy2yrGyIcYsfeyeHfP5ItAZvXq
 bidOY37f/6tGajZApgg1NT0OZw8cd130iMVPOLx2fSciqTfJ3hfIK55HSE6rMldXmc/7
 DEi31UAEmnn/gl2Gj7ANdF/V3pE3JpD1q0BazD190FHlqGnWT9p/pY9VduYZVWEeSqrL
 weej1czq1D976bYZv+W3ud2nMAw0Rjbzby0wF5+fq6Zrjn/HjaWITc1Xg8bbM7qelP57
 UZcwrwKwBhY3blTgOfAPEPCZUW5Nh0OOlyDL+YYHQn/X54gRJQ+hasyPqBUw9mDDlJkL
 HQaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ibWutNLRYfpj9cLUsW6mKo/tcn9AM4qWn7Yan42NOHY=;
 b=LjOq65C0C75ukYpOSChgE27Pn+n2Ai/lmStofisDMZ9rVSGXZPbdZZSdcgK2InpOuu
 N1Y8+j3a+JP7hiL58MYhB9Lw+0C8YkZ7IqFEO4cPHtui/ihdhjkq8CW6z3D3VqrwroVI
 ckNQeniX22lPtcktVoh0F0PD5KFCA/0HKyWsuMU5Q9y03RjIXSwhxC/H3/ZaZsqHXhNG
 pboiVyLvFErI+xqm5l7d+creCi3eSRLNTqeTvbqrV0Y++GetUJXpTS4yEyGDDak7GQlL
 ZVx44BfccOZKwLOC74GZe4H4Yt/PxsAT/97TDi54txcYUep6ItOZ36tAshGWr/OPb+xa
 jl5g==
X-Gm-Message-State: AOAM530m2Xalw2ioRPR4M4TDyJKxBGrq9tMc3kX8G5Jb4W5WVQeOOVwQ
 IcQXq0+1ojhUlGFR1VMFwJo=
X-Google-Smtp-Source: ABdhPJzmyEdje9c+g8XGhG0iewYFWKhkL1HmaOQ2Fng4S0zg4tjGh4ORre25NR4k4zcLeOa5AvGFUQ==
X-Received: by 2002:a50:9fa1:: with SMTP id c30mr17336095edf.207.1600097040413; 
 Mon, 14 Sep 2020 08:24:00 -0700 (PDT)
Received: from felia ([2001:16b8:2ddc:3000:7936:d9d0:986e:cca5])
 by smtp.gmail.com with ESMTPSA id lo25sm7949146ejb.53.2020.09.14.08.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 08:23:59 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
X-Google-Original-From: Lukas Bulwahn <lukas@gmail.com>
Date: Mon, 14 Sep 2020 17:23:58 +0200 (CEST)
X-X-Sender: lukas@felia
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
In-Reply-To: <f511570405799df421397ff65847e927745dad08.camel@infradead.org>
Message-ID: <alpine.DEB.2.21.2009141717470.17999@felia>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
 <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
 <alpine.DEB.2.21.2009141208200.17999@felia>
 <9c5aaa15-bdd8-ae4f-0642-092566ab08ba@gmail.com>
 <alpine.DEB.2.21.2009141552570.17999@felia>
 <7da64c0975c345f1f45034410c9ed7d509ba9831.camel@infradead.org>
 <alpine.DEB.2.21.2009141615020.17999@felia>
 <f511570405799df421397ff65847e927745dad08.camel@infradead.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_112403_004046_5840F346 
X-CRM114-Status: GOOD (  14.90  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Joe Perches <joe@perches.com>,
 linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Pia Eichinger <pia.eichinger@st.oth-regensburg.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On Mon, 14 Sep 2020, David Woodhouse wrote:

> On Mon, 2020-09-14 at 16:57 +0200, Lukas Bulwahn wrote:
> > Well, I am happy to send any PATCH v2. I guess we, you, David, Matthias 
> > and I, now just need to determine if the list is moderated or not.
> 
> It really isn't.
> 
>  # /usr/lib/mailman/bin/config_list -o- linux-mediatek | grep -B5 ^generic_nonmember_action
> # legal values are:
> #    0 = "Accept"
> #    1 = "Hold"
> #    2 = "Reject"
> #    3 = "Discard"
> generic_nonmember_action = 0
> 

David, I guess if you have access to the ground truth on 
lists.infradead.org, maybe you can dump the actual setting for all those 
lists?

$ grep "lists.infradead.org" MAINTAINERS | sort | uniq

L:	ath10k@lists.infradead.org
L:	ath11k@lists.infradead.org
L:	b43-dev@lists.infradead.org
L:	kexec@lists.infradead.org
L:	libertas-dev@lists.infradead.org
L:	linux-afs@lists.infradead.org
L:	linux-amlogic@lists.infradead.org
L:	linux-arm-kernel@lists.infradead.org
L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
L:	linux-geode@lists.infradead.org (moderated for non-subscribers)
L:	linux-i3c@lists.infradead.org (moderated for non-subscribers)
L:	linux-mediatek@lists.infradead.org
L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
L:	linux-mtd@lists.infradead.org
L:	linux-nvme@lists.infradead.org
L:	linux-parport@lists.infradead.org (subscribers-only)
L:	linux-realtek-soc@lists.infradead.org (moderated for non-subscribers)
L:	linux-riscv@lists.infradead.org
L:	linux-rockchip@lists.infradead.org
L:	linux-rpi-kernel@lists.infradead.org (moderated for non-subscribers)
L:	linux-snps-arc@lists.infradead.org
L:	linux-um@lists.infradead.org
L:	linux-unisoc@lists.infradead.org (moderated for non-subscribers)
L:	wcn36xx@lists.infradead.org


They are all reporting different settings and linux-mediatek and 
linux-arm-kernel even inconsistently. The inconsistency and a poor attempt 
to resolve that is what started this discussion.

I can then send out the patch to adjust MAINTAINERS to your ground truth 
from the server.

Thanks for your support,

Lukas

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
