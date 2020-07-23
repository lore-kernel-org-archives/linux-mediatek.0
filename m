Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72AB0C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 13:25:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4058320709
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 13:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rgnIgwFR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BoW1bFcG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4058320709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RsMLXQYeZgK28qrHGbib3XEdlG4S8iz0MggcH4kOVnM=; b=rgnIgwFRLpRqrqu+v0RV4cvxC
	k96tbsi4ooawGgsy4Yk40ueUj6Z9nzZZcwMeKZfgcOfAeX6Ti6AN5QMYxE3qfgQu1SZu4yQZBMTPL
	gVvxSqyLNzY92Sn2+u+KgNg47lJKw7gi22M/zlL4VNfhBgMbvotKTXC3DuOk/FC8T6wCi5/axJxR+
	Lflsk83NMNOs2TmBxGdlw8LwCVTpy1xBs+n3D4b7WgT1rplGHlDVuGaCIlIY3Xe13lnpHxoZmdPXE
	FSmu3Wb+FrTwwxuGNfxKwUSNsckERo4ikHHCuWOEf7kLhxOpvxHBP+XgYj0TRJ9ihv0eqfBwv0qGV
	Ohv1vcDxQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jybEF-0000TM-N2; Thu, 23 Jul 2020 13:25:43 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jybEB-0000SI-Is
 for linux-mediatek@lists.infradead.org; Thu, 23 Jul 2020 13:25:40 +0000
Received: by mail-lj1-x243.google.com with SMTP id f5so6301287ljj.10
 for <linux-mediatek@lists.infradead.org>; Thu, 23 Jul 2020 06:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2jjczOP4Lu1g1g+37UpjSnjuQvuguh9yOBVIpR976oI=;
 b=BoW1bFcGpf/LlOR4kSOBJG1m7T+jcsunaRyHsL8EB/e2knW65BpxDja3LsDLvW7Qcm
 jNnz1b3vfrvntrH3tGiUXf8ZZHvGRBITtk55iELblRP0m6HLFf9OLb2RyYzt08ChugCT
 X/KDqfD8XGrLH8eWFB7OszJp1DVqVt2k3V7EUfNmgn8XSD3U0JV1uFr6cIV+dUGQNDlf
 flxfM+WKMBJhFqVj0DUj58OQ+I2Gvzoa21WgkBqkA/+IrE521qeIdQNz2on2ORONwzy+
 pwY71KYBX5V/XZsffcKvTCzrHro4la1KU1YNGt0cXf8cFUXnW8Bv6YV5s96whl1txExf
 UFHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2jjczOP4Lu1g1g+37UpjSnjuQvuguh9yOBVIpR976oI=;
 b=ARjhU/ngjKhJ2/u616Zb9Klqph/dE0RugukqN5PwwQvTrV5vDM44xtTU0PZRMlRbZk
 YieDLb3Rt0bFnNHF7JAIAqJU23noamgUJ9gJHpJKJG55+mFbuxOf4ex8covWzHcvDpcq
 h6q77htP0/wlKYjFYQOylyYoIWDQaGAU6Y0GwhIu6KNRfC+vcgXQiS0zJ/b74ax0xeTk
 sRtmdIr7fPmlIOYX1Yh8tYCg2jfPjVtXkZaOUHjbGAGkcpnkDQR8vf6U2E6fV4DnL/4l
 cLRd5DO5jMBSnJUrrqGMfOo3PQhG6ez6KiHhi+Pbu3Kmp+Rsyojy21iwWvEy7A1qOAyr
 7yKA==
X-Gm-Message-State: AOAM531yhJ58AsfdZ17JZ5ziTUrKuWoiMrpryd4jv2G55xZH/xI/1dtI
 SqxFOKoKLjtC/BbF7ud9pYPJTyv+P4Y+Pq8M8IVTGg==
X-Google-Smtp-Source: ABdhPJzqK3FsqJ/H+gx22NXh9P4EXchoYK6Pz+NCpDzWteC77pBDLWy2/y3svYjnTm9rqrlHC7uEUexi0eAqcq5BB6Q=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr2133642ljg.100.1595510737599; 
 Thu, 23 Jul 2020 06:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 23 Jul 2020 15:25:25 +0200
Message-ID: <CACRpkdYpMWHKNe_jOHJxLvLC=H_yVSJfhNp09ahy-dh9qJC+gg@mail.gmail.com>
Subject: Re: [PATCH v9 0/7] Add basic SoC Support for Mediatek MT6779 SoC
To: Hanks Chen <hanks.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_092539_666774_9FAF5524 
X-CRM114-Status: UNSURE (   5.38  )
X-CRM114-Notice: Please train this message.
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Sean Wang <sean.wang@kernel.org>,
 Loda Chou <loda.chou@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Hanks,

I applied patched from v9 1-5 to the pinctrl tree again for test!

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
