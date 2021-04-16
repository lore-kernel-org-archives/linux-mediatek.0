Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0568AC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 09:10:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2E8A6113B
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 09:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2E8A6113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ERNLMBhL7KxAAi742pQ1+bxg5UgYuuAmcB4rRqmuT8s=; b=bySZAf8HeOcckeWKa6jVI6zGj
	hA3d2Ga5NvBnGSBDyvn5mJbjOOsGfVaaw2mUFpty5SCt7GbjkSq02gA9GACY7MfuKvseovw2hBbvk
	AglywxYdbArpop0io0YepbyaFvv/ihdXacPNgxCHyLwfdYnczoOAmxftePIUEtYqbbZOlXcRydmAC
	7a3WBo4VOG/NN/xDCqZrhTL9aPhxTmA/O8C9f7GRUWJtI1zlLzESUw67ABnnze0T1l3Y9fwPDCy1+
	WyfEpjp8f2AGbZ2eZOfTBnASD/O7Xz92q5awJjqwOCWCS6QF1c5KI5eHDZWKpmY/E+4/A+IlA6IaN
	YnENbY+rw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXKUM-001UbK-8J; Fri, 16 Apr 2021 09:10:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXK6o-001QMG-Jh; Fri, 16 Apr 2021 08:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hCKXjUHUPAyf45wnAsMpCP6D5beOeU9GECgSJ/13C7s=; b=2Cc+B6m4iUU4/TuN+rnBDXf2+t
 EUXAAmDjMDcDIEySvnwdy/aLYzuTABo7zZec9YyLAsztkVfTbmvqtoGRTF3VCu2JjGz0/gAYbENYW
 ye+xoKFP+3FKrEymAcpMnmSm+U46fiWOht1HrQNFoA/OgzPDfAAPqzRpFCFVWoeM/YzLwTiCOA6fH
 YzVuIKroINxG3J+/IIKTJunELzF0Lh1QcOkc7zFwlGql2coY9MS2v8AlVr3mvCbStYNHbIp7SFjIn
 lCp7gxXYiK0s51/GhHuF1jH/VFrpwlvpYqegFoLZo/l/V17+nGP4o4MlDgCbBJcL/jbq6p+ZgvPsd
 i9pdODsA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXK6m-009Cvl-5C; Fri, 16 Apr 2021 08:45:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C8196115B;
 Fri, 16 Apr 2021 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618562747;
 bh=hCKXjUHUPAyf45wnAsMpCP6D5beOeU9GECgSJ/13C7s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=htdCqZ6wfjndMFgb8WAew3IkIluieTP4Q/9P4rXkM85GUltahHXOct+oC94HZNm31
 bwkNPuqbtPtzjcJLb3JwI3IBRjSL1ngxafBLGGJjmcl+RaQpv8MqbIQUC7MPfBefjl
 CKuNYgfcZoo1pQiTbMWFMugJQ+JS5WlGUA81oqfvbZjVjaoldv7t+lO6x5/eXVO9t+
 YVtTgY3dMhl5QLTY2a7BreAtgOOFQ49YhI54zt6kDwlUGlx09spL2bVUShjZjSw9u5
 g4kYi5wwhJ8kSIw7xVGKhIkXJ7t8Y1QPz7g9MjM9FCc68rzdl+JxONB0gc7K3TWAcZ
 xwoyR96bpsQhA==
Received: by mail-ej1-f48.google.com with SMTP id e14so40948221ejz.11;
 Fri, 16 Apr 2021 01:45:46 -0700 (PDT)
X-Gm-Message-State: AOAM532288a3zFvqaepF3tJp1A4nILojAE3EpySyWUR4nemRmMV3Ch8O
 dKjcWWmtRcKGQTbVshDFgpRpmmj3PO3/R2GIUPI=
X-Google-Smtp-Source: ABdhPJyUdDY1GQvKomVNa7nqkZMOnakaL2C4Hh3p9QW9Gq2XkHNgYsyN8U6zoFkRAmMIZocoiOhmenRVIl6j9BDV+Uw=
X-Received: by 2002:a17:906:ece1:: with SMTP id
 qt1mr7479973ejb.385.1618562745621; 
 Fri, 16 Apr 2021 01:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210416034712.7891-1-zhuguangqing83@gmail.com>
In-Reply-To: <20210416034712.7891-1-zhuguangqing83@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 16 Apr 2021 10:45:33 +0200
X-Gmail-Original-Message-ID: <CAJKOXPe+eK-2cZ2h-WUUrfPwkXrHGopaEmx0Kwjsa4Nqq0DyeA@mail.gmail.com>
Message-ID: <CAJKOXPe+eK-2cZ2h-WUUrfPwkXrHGopaEmx0Kwjsa4Nqq0DyeA@mail.gmail.com>
Subject: Re: [PATCH] regulator: mt6360: Fix missing IRQF_ONESHOT as only
 threaded handler
To: zhuguangqing83@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_014548_273652_C0B54EA8 
X-CRM114-Status: UNSURE (   9.23  )
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

On Fri, 16 Apr 2021 at 06:30, <zhuguangqing83@gmail.com> wrote:
>
> From: Guangqing Zhu <zhuguangqing83@gmail.com>
>
> Coccinelle noticed:
> drivers/regulator/mt6360-regulator.c:386:8-33: ERROR: Threaded IRQ with no
> primary handler requested without IRQF_ONESHOT

This should be tested. There are several patches like this all over
the tree so it looks like "let's fix everything from Coccinelle"
because you ignored at least in some of the cases that the handler is
not the primary one. I am not saying that the change is bad, but
rather it looks automated.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
