Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E27C388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 12:57:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 575E120757
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 12:57:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gQY7rr1t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="we/SNQIk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 575E120757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LjEE6hoM0EhkWbPjdRDXwqJgCmeZLfqcYh3H8/EMKhw=; b=gQY7rr1t1CzYif7CKBz4ZRYZL
	uLev9fE6peukIrYUZAYfFNXK3l88GsDh03sHLZyLffDbz1vtHQiUH2QHsP1yW+L7hzfWrZEGux9pQ
	Lqt1qbo1RMLqC5kHv1wlUinYamhsuurAxTWJ8veykWmw2MaPMmpt1rmS27eAYiE/Z8UhE8PEsZEZ0
	L7SjrDbsscUb14JfmluPM96F2ELTi4TIYf8URaXfRoQ8J0vbwjW6S/V0R781uGLXo33I4yKUP3B3o
	mMrft1CSmUafH9zcmPWNm7mbMq8QVr+hHuVqrBXu9uXSqQz2SFkHFAcfDLl7TffzPVIVDt4Pechw6
	S/Uxx3xOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXOXm-0000m9-C8; Tue, 27 Oct 2020 12:57:42 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXOXi-0000kx-92
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 12:57:39 +0000
Received: by mail-io1-xd42.google.com with SMTP id p7so1385967ioo.6
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2020 05:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iFiKV/id+bhp/OGyzJyPrVgrZf8FoY0fdLp5S5yqHuk=;
 b=we/SNQIky5YrQh0PzXP6Tgc1eIaMm9E+w9wS9WP1wIMyhXLi3Qc00UqUJ/rWulxl4X
 S0JMd/4I7MEy/gjBu/RmJEcSkF2lNMRaW5JzUPodhWNlaZb0uE9J8JtBsqctVxmW9IVO
 U2xNQ12PzyVLQYGwQ/dPySIq6lOjMsSQZpy1iMxR7rqztopW9wJvIZTcihhNHq7gUD4Z
 PB8BoQcOle680zaF9ywOl0YyvTcQoThDF7oTv0LWEsxHIb3q3cKxsT97yu5gM8Jcnt49
 ALDxk41xIvjj9e5eSaDMrHteCxC8C1h8wF9vVBR+H/FbrvTnfX5bU9Sfn2K9m9x+Alx1
 vHxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iFiKV/id+bhp/OGyzJyPrVgrZf8FoY0fdLp5S5yqHuk=;
 b=jmPWk5I/jhGF3Fzw8oCE1K4YTyCSX/Rzo9uBMvYUr388+7pYrSJpNK0a9Dg1r1hMec
 2oknaO+4TLGmf4EDksmX2QYIZGhNUitKNV4KP0cluBNcYUBF6z/Wzd9yKvGJOUGtVx9y
 g7FHC87OGTM6Z7MMAUStaIBKqCREp3QA0GntesUfsAfukgaQmyt7o55WEnz837sIAKVv
 ygFq6o0Y10eSW3Tl+6gqrYldXCsQmkNYft4epL6eR1y2yVDMJCJEn8y/8xpeL53cwT0d
 7l3uwI0gPgAOt6pvifMVd6/Sac3eiV5y2quudafV+3buWZsIhminPNosxshTYfPIAlTf
 G1jg==
X-Gm-Message-State: AOAM532XnbhxX6yL+IhzR7UBpFxyw0viHpvxnIICSKemhCmauTbra6J7
 taI494WIDRIt/HtIR35o6kNh4LfHwAVsntxfs/5Nyw==
X-Google-Smtp-Source: ABdhPJw80+MpzHK/ilur7RHbshltPyxr4dvaxh10InBIwhnvQNFGY94xAJejcWr/D8nBiTS/x4L28Z23strGJkwwj8s=
X-Received: by 2002:a02:b812:: with SMTP id o18mr2137454jam.55.1603803456107; 
 Tue, 27 Oct 2020 05:57:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201026175526.2915399-1-enric.balletbo@collabora.com>
 <20201026175526.2915399-6-enric.balletbo@collabora.com>
In-Reply-To: <20201026175526.2915399-6-enric.balletbo@collabora.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Tue, 27 Oct 2020 13:57:25 +0100
Message-ID: <CAOwMV_xJez8WB=XjBSWfRmQ7x6265+2iJ+nLN4BR5YjoQzingQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/16] soc: mediatek: pm_domains: Make bus protection
 generic
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_085738_395962_DCE3BECF 
X-CRM114-Status: UNSURE (   7.39  )
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
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Miles Chen <miles.chen@mediatek.com>, Matthias Brugger <mbrugger@suse.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Joerg Roedel <jroedel@suse.de>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> -               ret = mtk_infracfg_set_bus_protection(pd->infracfg,
> -                                                     bpd[i].bus_prot_mask,
> -                                                     bpd[i].bus_prot_reg_update);

[snip]

> -               ret = mtk_infracfg_clear_bus_protection(pd->infracfg,
> -                                                       bpd[i].bus_prot_mask,
> -                                                       bpd[i].bus_prot_reg_update);

Since you got rid of all the dependencies to mtk-infracfg.c, maybe you
can also remove the "depends on MTK_INFRACFG" in the Kconfig.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
