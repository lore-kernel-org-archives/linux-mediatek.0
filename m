Return-Path: <SRS0=Skuz=LT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D115C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 05:11:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07B81613F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jun 2021 05:11:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07B81613F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZiqQbCAlBgmm4taA9y3HPrsORKY/F/SdYp0Ojo3SHKU=; b=gLObqqIfpHrD6Q
	tv7YYsyqWDgWmxrZ7Skmrv7L/U0DIpCC+YaSkoXwwAkJjLOWns5wo0tfoeBG4UzmpB9b9+5QSw/AA
	X5kfJXq4W8n37Cvf/noug5Od8SADYpnIehZhwAcIW+6zcW9n4GQkpYr+4q3Mb69aKW63GCBkj4N8g
	HwX4guZGpHtVZPdyKzKAi6r2LwbEgFga6CsMJdsDCQLIbXza8Di++Qk7ypNNjOLYs/Brlrk0UaL8o
	LZDm80DJ2PD+hytsicwkLSUzfpvb2Xsp2+0bWLmoUjYeQDQM74U/OTAjlzRQsKZ/Hbg3hemQDBKl6
	pDhc+7cak6hKgE8Gak+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwe7p-00HILS-Nc; Fri, 25 Jun 2021 05:11:33 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwe7c-00HIK8-Mh
 for linux-mediatek@lists.infradead.org; Fri, 25 Jun 2021 05:11:22 +0000
Received: by mail-il1-x12c.google.com with SMTP id i13so4441071ilu.4
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Jun 2021 22:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=57iRP0TyZJaJvCo9zaWn65f6DCvfYNmLe//EEF6wtFI=;
 b=G6+6+qUtWHt/mqMvaRgc+Gqz00z1xMlxhpRYQaYaJeWU6yyTNZO7do743gVv4jHK7c
 Cf5fa4oH+l8dQtBujIa2tJFrQRypUsbuJ2g8w6/YNwhK2cvn75uo+BnD2640X3Jfvh+o
 wFfQo/c1oKk8n/1bkCxzeyTec06Fcim6K/v6kY42xxpa7N4xaoLzFD/9k8in9l1u6iTD
 O55APOWGyjaWFYwJ584SyR2fdNogeMoVGUqYZX0zNBFYopgk0bB5ZB+CItgZTzzguukZ
 /tesrwRM2nHhFov0bwkPo49Sx87WDir775v9FI0XrjZc4u5WWKqhO8YiqyaFfgqmthnl
 vbZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=57iRP0TyZJaJvCo9zaWn65f6DCvfYNmLe//EEF6wtFI=;
 b=Q1szgElq4dcLzbpE8ZKB5MQeVXWmPvRQEhjdOncl4sCkQWM/9cZrF1bausmpT5CfdF
 7ctzaLJPE1k6AiTU61B586FWESN+u3HnqSsjmUEpNusfxvWy39VGUAw8j4dC4MSbRcsy
 TONxIf+q6XRv+F74YeaIwAZJs3yCYMAtgoEN/t1CNwYcWmncPfXdXnOtt0RBQ+JidFVu
 aq48VwR4BH/RMIOmlB8hXg2xJ/P98ANWmUHF71B28JJVxk5thUVWk91mK+pDRw0V5l/s
 ireuNAHPpI69gp9yyCniXqCv66HiWGAxwHdJ7Giv21OZgfVmdtlUBgLTt81Yd7b4+4gN
 EMfQ==
X-Gm-Message-State: AOAM531++J39u2beca/acVX8lg/o3C+ZTRzhkQ5KIt1foUTXbuy3GQFc
 IewcEqMUEFyKDik9nwQhIVG9zrGgtAqnAfoDsn4RWA==
X-Google-Smtp-Source: ABdhPJwzLav6Dz0Iv39Al05WGPtRKLaG6fOQ1SvXRk6WVJyGlBBTuVK9ecDEQXceJq+eiH2V6GoNaWQum484UavOJCU=
X-Received: by 2002:a05:6e02:1064:: with SMTP id
 q4mr6269901ilj.127.1624597878160; 
 Thu, 24 Jun 2021 22:11:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210623123854.21941-1-Christine.Zhu@mediatek.com>
 <20210623123854.21941-4-Christine.Zhu@mediatek.com>
In-Reply-To: <20210623123854.21941-4-Christine.Zhu@mediatek.com>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Fri, 25 Jun 2021 13:11:07 +0800
Message-ID: <CA+Px+wX7yBvuzj=KWf0MhLkTQOi4Rfn8F6z_+g-T66K3iMfb=w@mail.gmail.com>
Subject: Re: [v4,3/3] watchdog: mediatek: mt8195: add wdt support
To: Christine Zhu <christine.zhu@mediatek.com>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, robh+dt@kernel.org, 
 matthias.bgg@gmail.com, srv_heupstream@mediatek.com, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 devicetree@vger.kernel.org, seiya.wang@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_221120_808477_77601FBE 
X-CRM114-Status: UNSURE (   6.48  )
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

On Wed, Jun 23, 2021 at 8:44 PM Christine Zhu
<Christine.Zhu@mediatek.com> wrote:
> From: "Christine Zhu" <Christine.Zhu@mediatek.com>
>
> Support MT8195 watchdog device.
>
> Signed-off-by: christine.zhu <Christine.Zhu@mediatek.com>
Still missed this part per suggestion in [1].

[1]: https://patchwork.kernel.org/project/linux-mediatek/patch/20210623092917.4447-2-Christine.Zhu@mediatek.com/#24270619

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
