Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC2DC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 23:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3iFAM+GnyX6r4cvrGUC8lHicqwkHTYezPzVa39Vp7Y=; b=C72kJS6Y2dbkj9AuWbaA28YfOd
	E/Yu5bkaHywsLm55M8vAriskX2waExPJ9jtYzfoakbC8t875ASW+binX3r39eIhBE4AS2STosFXB6
	FORZ62aMJU0MTfuwKHQjEPpZN/rw2vKbDKQwb6MfsCIcl/f3ZjYSQKaVCdAdrgF2bJAE9Fp1BFBy0
	HKcB7iWl/pX/atuBiu5rGSRPM64yA2754hg7rG7luXbW3GmBa5CibTUez8d9syhZPPBMme+0a9sS1
	5xFLWcgXEgTEBWSo8e2Y4nj9fVAO7L09bzVHvlPdAuGzWYeEDd8fNoySYbo6d3mCIWx2xIzzLgew4
	HKPM6u6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9wrs-008Fte-1P; Mon, 26 Dec 2022 23:26:52 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9wrp-008Fr8-94
	for linux-mediatek@lists.infradead.org; Mon, 26 Dec 2022 23:26:51 +0000
Received: by mail-qv1-xf34.google.com with SMTP id m12so1734746qvq.13
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Dec 2022 15:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P3iFAM+GnyX6r4cvrGUC8lHicqwkHTYezPzVa39Vp7Y=;
        b=d3Ld0ygPlxxUti1hCMp2GmpWH8tyzD8WCkabG/sCamJ+Ts18002WhAomvaLG+k6BKn
         comiM1gVWfJN8SqTtUtMPj8p2ZfW/nl5vT8p2bJCWFrw/MBJmlNjSG4egl9Vlxho2Xc5
         bOk/iwLlruUl3ftXNa9ot6wNeiOIrLvPSYWZgGrA6UHi4yhg3BVWwzSrAoqeps1ZPInF
         dxEGmjb0qOS5cXQI+35l08C1QledwnQ22LruAaq68gd7DX8L2dVSwGesn8AQXeQjBai7
         IOCeWFi7TWVlV3tmLSZDYnGK629l3FZygtpF2isMCQJ4lmJR6cEZJM4RQ9opoiLWZSw9
         7YXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P3iFAM+GnyX6r4cvrGUC8lHicqwkHTYezPzVa39Vp7Y=;
        b=IG3C9nIbOovQB+3Z+BRKiGm6OawKRTSdmyaFlf4JRrDYPW4qVkL3BJuJLvrXWhy0yg
         p6W6LDaL63adICTH1uHd4se++89G2RMJaiG0Xbl/ZPLatkDHtwG12CDhNaXowU0cyRot
         WMxQ5P3T0OIcqWOMqt6PKPKZJYqfCCoxFYGj2GmonuSk9jCr1fgd/xBjmzRaGWtzRkKU
         0wM1j93HASwvXpZzqu+xyyZ1MmIqiP3vVyo7xC/HDdp5/xlIJI44tmCovq13HiAOQ18J
         7ScSHYQFi915VDzWigMNg/KKEiTXxFzWJKnxxMQ7qtL5At5ZNREgvLuh1gQz2fvGz3oy
         NkCQ==
X-Gm-Message-State: AFqh2kpBa3uNoI5M+CQPjnVceJTLfmON6WNm/XWixiS62g0kXyXGstiw
	4Y7kQINDGWCeHHmQONrWS5brOL8QuFVzj5b0nQ==
X-Google-Smtp-Source: AMrXdXsbqkPHOy+T6frU2y8Jnt5iC/XfCam6oRV+wa/TwXlhAE8BKPPB3Qc3blNMaP9U8bhcAtWdz34BQ4WxEBNmCus=
X-Received: by 2002:a0c:eecf:0:b0:4c7:6648:a2c4 with SMTP id
 h15-20020a0ceecf000000b004c76648a2c4mr1119448qvs.12.1672097206548; Mon, 26
 Dec 2022 15:26:46 -0800 (PST)
MIME-Version: 1.0
References: <CAFktD2fRnSbNgWRRoGbQzG5_Mw7=zFJKTVBHS_3D+mNUYcv9hQ@mail.gmail.com>
 <Y6Y3wzSxbTG2aLAo@localhost.localdomain>
In-Reply-To: <Y6Y3wzSxbTG2aLAo@localhost.localdomain>
From: Nick Morrow <morrownr@gmail.com>
Date: Mon, 26 Dec 2022 17:26:20 -0600
Message-ID: <CAFktD2fbpUv9X5MY1jozyXoxvNXW=4OfaJ3B1KcZtdrBfiG4NA@mail.gmail.com>
Subject: Re: [bug report} wifi: mt76: mt7612u/mt7610u - 6.1.x hard locking systems
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: nbd@nbd.name, ryder.lee@mediatek.com, shayne.chen@mediatek.com, 
	Sean Wang <sean.wang@mediatek.com>, deren.wu@mediatek.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_152649_464642_20F7023A 
X-CRM114-Status: GOOD (  24.00  )
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

> > Starting with kernel 6.1 rc1, mt7612u and mt7610u are hard locking
> > systems when connection is established. From a report this morning:
> >
> > "So I'm using a MT7610U based adapter and updated to 6.1.1 in Arch
> > Linux and it's a complete lockup a few seconds after connecting as
> > other people have said, I'll use the LTS kernel (5.15) in the
> > meanwhile but this is probably going to get a lot of people that use
> > distros with newer kernels."
> >
> > Background: Problem first discovered with kernel 6.1 rc1. Bug report
> > was seen on linux-wireless around the rc5 timeframe. This is an
> > additional bug report.
> >
> > I don't think additional info is needed as I have tested on several
> > distros with various RC's of 6.1 and the problem is 100% reproducible
> > and unavoidable. This is a show stopper bug and will result in
> > widespread reports as distros upgrade to kernel 6.1.
> >
> > Regards,
>
> Hi Nick,
>
> Can you please try the patch below?
> https://patchwork.kernel.org/project/linux-wireless/patch/20221217085624.52077-1-nbd@nbd.name/
>
> Regards,
> Lorenzo

Lorenzo,

Today, I downloaded kernel 6.1.1, applied the above patch and
compiled. Once installed, I tested with an Alfa ACM mt7612u based
adapter. I no longer see the problem. No system lockups at all. iperf3
is showing a consistent performance of around 387 Mb/s. dmesg is
clean. The patch appears to have fixed the issue. I can also test with
a mt7610u based adapter if you think it is necessary but since that
patch was not to mt76, I decided testing only with the mt7612u adapter
was probably good enough. Let me know if there is anything else I can
do.

Nick
https://github.com/morrownr/USB-WiFi

