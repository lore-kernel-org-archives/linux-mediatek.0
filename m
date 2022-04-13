Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93D4C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 14:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bj7h0zPURQVvqxFwO7duJsbxfUp4ANQ/K9h5JRemuDU=; b=HfMm0pNDklN/tn
	5soGi1Kh2AGl5HQ4Jevl0vvqAJK/27CpCTeU7BJ3mh7Yb+ti7JzBTGKmt23wbQODhJkk9bLVBeIv0
	ale6kmt81lKnC7aCmnUJd1EKjTC8DX/L/c3O58AON3r5KODCSVVLdioWFqSE712ZPRs7AdC6sea9W
	RVwRqCJSsW95Dn6v61lqan3E4+k04Me5eccQ3hrYV3wfjFk4pWtxXu+cED4EG817NlAJhVNjR272Y
	aevHJC0qEBEK354I7A/zj/QMuHvsZ9PN1COxogQKeHqN1ssfDP3jDB/WPz22DcMyGBkKgB1KZLCRe
	e9XCJq3sGQRXlugF779A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nee0X-001PL7-Ad; Wed, 13 Apr 2022 14:30:09 +0000
Received: from mail-yb1-f175.google.com ([209.85.219.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nee0M-001PJL-5N; Wed, 13 Apr 2022 14:29:59 +0000
Received: by mail-yb1-f175.google.com with SMTP id f38so4101529ybi.3;
 Wed, 13 Apr 2022 07:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P6HqlanCyPSwncb4shZm76Hg2UdOq2aV2/+OAl9p+/g=;
 b=5A/XEOLnaIgEzgiM2UwIqeYmgyy82AiK6E3lgeTP/J91/GGaPI38b96lj0WFnU2vs4
 QWocboBnS1aPf6rlGIkOW7vYMS4YiA66iHq2ke0oI4OOyVRAwRCHuuJdj3RaHU4G8Iqn
 XiR8BFxAJSYStx6tcmnonwAWSKsPqjyD/G19QinEcQt7RvCGsj5byd+EH03MYc1O+qQP
 4wt5D/eFiv/amXwQSw3K+DZ5uSsbetzXLL/V/we1gBSMyTL3J5h4OlZC4uXEPD4Sk+0N
 pXEU6bSYsA608Zos+Qd0lkczerx984k6QBmWwLjPEMrGfrP3No8OC39CmVXZ9qV+ejrU
 X86Q==
X-Gm-Message-State: AOAM5326VDxEtfgOPiXMj2lQvSBUpZTcJlf8RqCAD5Gj7xC8dyEsjxxy
 yyG8ZGVHXVJ5LzyFE7rDAYAVKynf585UiKvmksc=
X-Google-Smtp-Source: ABdhPJyIEe6g/M5R+wfhGO1Tn2f6GQ9LY3zIVdu915DAN1BxmCSF3smK/dPKs7NrgvevM6qmuH0nezgz/sviDNUop8I=
X-Received: by 2002:a05:6902:1544:b0:63d:d3a7:8cc4 with SMTP id
 r4-20020a056902154400b0063dd3a78cc4mr31215822ybu.622.1649860195288; Wed, 13
 Apr 2022 07:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220321095729.20655-1-lukasz.luba@arm.com>
 <76230a1c-73b8-c471-c62e-3ec9b33461a6@arm.com>
 <55d4a19d-15d4-4d15-8430-8a8ed8149497@arm.com>
In-Reply-To: <55d4a19d-15d4-4d15-8430-8a8ed8149497@arm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 13 Apr 2022 16:29:44 +0200
Message-ID: <CAJZ5v0g5vcC7aS4KS-uN+fHmbrKCmA-MVbJEKOnPgEyDDfqSRw@mail.gmail.com>
Subject: Re: [RESEND][PATCH 0/8] Introduce support for artificial Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Pierre Gondois <Pierre.Gondois@arm.com>,
 Ionela Voinescu <ionela.voinescu@arm.com>, 
 Viresh Kumar <viresh.kumar@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Linux PM <linux-pm@vger.kernel.org>, Matthias Kaehlcke <mka@chromium.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 Cristian Marussi <cristian.marussi@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_072958_242691_F5AF7CCB 
X-CRM114-Status: UNSURE (   7.70  )
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

Hi,

On Tue, Apr 12, 2022 at 8:53 AM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Hi Rafael,
>
> gentle ping. If you need some help with this maintenance,
> we can help.

Sorry for the delay.

Given the lack of objections or concerns, I've applied the whole
series as 5.19 material.

Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
