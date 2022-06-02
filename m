Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DF3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 06:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6GrCUjybPwuRwxGdGWv0ASfA7MTmneDPYUR8ftJqc1I=; b=RiFbtpAXPrIcQd
	kJRnDrHS0/W+lv2rMax3zq7+l/bt2VqMgfvKsK0m//xp7gbuOPnjZ/jUp0UC5HD9TCSRc2PokB054
	NjmyXPnRQNBa7ds0a/KWeP4ZALuWarZPmHij4jQGSIjyOQw04QsiQ5Pt8VZsci1tcpsLlo/X4Uka0
	O6XnlsJorwwV56PwNj6Dd4aXZhrR03/+PAlO6TTGwV9kUmglBLSrZ9NTUz2oCZxb2GfsXZZl+q78Q
	qMbyhAdACLi2Gax+enVk0JU3iZNlsA40KoAXnmUUdLDzg5bvKY7bHKiCfebvHzriMZ4xaEkFpWssw
	nJJNCqv9v4hvxx0CBNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwej9-001uCg-3U; Thu, 02 Jun 2022 06:54:39 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwej6-001uBT-3b
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 06:54:37 +0000
Received: by mail-vs1-xe36.google.com with SMTP id c62so3740166vsc.10
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 23:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hlIwxPeW006bY340NSBO3uX67HdfP5KYaInja9t5Jdw=;
        b=zSYaSzSXSOohCB29IiDwFnX6SeGkhoWOYd5Kk0jN+zUsx3AJIsX/BLVWOxQvIR5EGS
         pgptu0Jmn6hyjosrlBwz8EVK1Xg+y+3Wcd/PJIHfflRoyVfuMnb+2XNfvIedLoKti8WV
         YxbKCT8pqX2ArUq+xe57dU0wtdKi8MFlyZJd6/ZswOEpHxSYJ7ea/+C4mYvJNpt/JXTA
         LOMPvqkV+I7plEiRsqbAvDJLjdBWTkpJM0229rpLj3G1DBG3mAuRre229PgwPrHo1lmz
         u7ML0iQbo3h+Oo3sqLx0auJbyHs+Q8ZXZGWKpcahgscYgq9ma6OCEBbXO9Qac/OfpTpT
         gq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hlIwxPeW006bY340NSBO3uX67HdfP5KYaInja9t5Jdw=;
        b=mDtptQK1VmfqWzJdsUu62d4qK1oGNMu5852koj/iVaKnN1F5OFAjue1Wm3uXAU9TFZ
         EFvJMWeUuAOHAne4QOSx3Oz0RPIq2CsySeigp5gFVao1p3LCrKRGDXrNMfzdLdPr8KuK
         rAMjwqHzHRXyv3rNNEPYfoyxehJhJEHKTyhiWQWnfcQfoazWp1jpbwfVkaTQ1lKd7JhJ
         hjPTYpiBJfxmUaNQTRD3Okq+aIyXa0A7ljCCcE8jGrzM8zxqcQJEy/NyQTaq8BJZ33vb
         7LjmYDkzf6EpIeuo47y0gx8bgGMVq+UvZE97zG8sH2kAiEsDR1rSuHoWpUJX+D6AMBha
         mXbg==
X-Gm-Message-State: AOAM532O5nonqpJ+BAPHKERi3qzBpywF8hJaLjB1/GtyooJbiX70tjg3
	TkJ+t4RzMRCE+WqOnbOsduRY1J7CzqqU9f0NP1jgvg==
X-Google-Smtp-Source: ABdhPJzZDP+92yKh+HvVhjL2bgkmdnKMCOmgxYpMm3UYhBbvzzJhD3zGolsRDEE8/VTEu/+83qeqDGThDdoVtGXAYt4=
X-Received: by 2002:a05:6102:3126:b0:349:f1a7:fe32 with SMTP id
 f6-20020a056102312600b00349f1a7fe32mr1536566vsh.55.1654152874335; Wed, 01 Jun
 2022 23:54:34 -0700 (PDT)
MIME-Version: 1.0
References: <1553841972-19737-1-git-send-email-andrew-sh.cheng@mediatek.com> <1553841972-19737-3-git-send-email-andrew-sh.cheng@mediatek.com>
In-Reply-To: <1553841972-19737-3-git-send-email-andrew-sh.cheng@mediatek.com>
From: Viresh Kumar <viresh.kumar@linaro.org>
Date: Thu, 2 Jun 2022 12:24:23 +0530
Message-ID: <CAKohpom625zOdWvvgsbnAe1EfzWABvdxHzjn2KVb0x2tftJnqg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] opp: add API which get max freq by voltage
To: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	"Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, 
	fan.chen@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_235436_188421_DEC06DEC 
X-CRM114-Status: GOOD (  12.66  )
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

On Fri, 29 Mar 2019 at 12:16, Andrew-sh.Cheng
<andrew-sh.cheng@mediatek.com> wrote:
>
> This API will get voltage as input parameter.
> Search all opp items for the item which with max frequency,
> and the voltae is smaller than provided voltage.
>
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> ---
>  drivers/opp/core.c     | 55 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/pm_opp.h |  8 ++++++++
>  2 files changed, 63 insertions(+)

This patch added dev_pm_opp_find_freq_ceil_by_volt() but I don't find anything
in the kernel which uses it? The patchset for CCI never got merged ?

I will remove the API now.

--
Viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
