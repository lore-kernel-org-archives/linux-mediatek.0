Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAB1C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 22:43:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAC6761244
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 22:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAC6761244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:References:
	In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tSe7SdDyJz9sFYuV3vtorgop98Y5dkK+AJ3VEG5Qyx4=; b=B94RwqM5P9Ev6MUKnP7Jwuzwm
	luKNLMRiZLXmBo8GvCIROhzo71nLIAD5CrrKgPCrYPwC74CmozJfqxCsL455lUgeqJFTEY19iWqJd
	MPKfpKrVEYAR0GxX/mFWDvj/9O5qAm92hm9jUGncOOL4MWvOYJ8A5G1M12U8zknfrxx9q/9AT8wAg
	cpeInjoX5yY/cleJaUuVPoF5lUzEnwSkF+AECGNbNa1tGsAc/1x8MjclKRmDgZ8CE/4vqix+h4qdG
	5erIpKNmJK64KWGt+jy+xMMdZBkv+gflpwAavpML0CZzUBl5r0392yRFqhtTPltw8A2kpdJZnjF1n
	+D0TKnqKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lilxP-00GKeJ-TR; Mon, 17 May 2021 22:43:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lilx4-00GKZb-6T
 for linux-mediatek@desiato.infradead.org; Mon, 17 May 2021 22:43:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:References:In-Reply-To:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qIX+t1YKWWujAYO4RKswTYxIn2MPzDzLJIB7Mq7c8Zs=; b=Zi4xuSsWLD+eJ/x9+eJ/Ct6xcD
 TfUyl/ZFk3PsputeEqxV2USU0r+Hap4qU9NJ6oh3ZC9U11X7TLGEeArKJ7R/amt/cjYjkUdIoBYAt
 qekVEEOdydVwXqsRhy2V6y7sn9QlNW40cxCxyr9mwRULkf6CPC0oTAMO0zsyUPr7BcKePFbXc1PeB
 BnNWEvk7JhFVdirtLDLUy/KSjF3/htCi1zpsgGkFrKKc9079IwRVbkjp4PGW9IpBpR8fz4HL5yOqs
 6RloucToFmimOrZ1kYc9uxcISJzB52plET57Vg8yVXyzBS7/9i3vRJqYFDTHlder5zv2xyYxfhhSa
 j2gNuWeQ==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lilx1-00EC4B-Q8
 for linux-mediatek@lists.infradead.org; Mon, 17 May 2021 22:43:04 +0000
Received: by mail-ot1-x32a.google.com with SMTP id
 69-20020a9d0a4b0000b02902ed42f141e1so6989493otg.2
 for <linux-mediatek@lists.infradead.org>; Mon, 17 May 2021 15:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=qIX+t1YKWWujAYO4RKswTYxIn2MPzDzLJIB7Mq7c8Zs=;
 b=b+W4cpgVKx3kWrlVef2M79/pgvOqXNvJl3FbrPV3bSuaY1bLFGkxN1+GcNoMVH+93w
 K7FowwMRI9xBrgzzz/+eZX/ezkLOspMSXjuh4YyY1vuXB9vKtmGVYeVTqVmyeL9vu8su
 qsJoEdef0PkAAbO7LQ1c6oX2FstQ+o6WWyMro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=qIX+t1YKWWujAYO4RKswTYxIn2MPzDzLJIB7Mq7c8Zs=;
 b=fLIV5CuenRTgJBDNh2CkWRAxKljeLGgJJykRepRxlxEvz18W6f7TzlPtiLD4m3qU+W
 06m05DFpV/6BBkYJNKTdj//handdMGKAWj1O7xGI+Yf/wQLTEG5MicjBziZLR3olfiWm
 PXP1iV77Oe+XmmU1R8gP+ePRf7/YekGUXcy+At0FDfR23zxftQtNWplQ7Rof4RBMLEgD
 vohrjjluPPmU54XxJbe83Roc23vI9oIMIcjCcIvJzi8v/AmMLYpJ7kpfwiWKnyJUsWDB
 G5FfGqvKMZnX0HZeiL/CccDaALDdaO95NGyqiv1dCo0EGBHP4U21ACpHr63ySlmWYrTC
 15rQ==
X-Gm-Message-State: AOAM5328vso9OtQXBeVXlY/aSG8UT2p1ykWGZ2oWH1WUFglkzDvRwzGL
 RoVnAKcL6tMnoK8cSRq3D2KsWKbHiSmqatZNYDIKyg==
X-Google-Smtp-Source: ABdhPJxcjBpwmNvcCV5pFmHQfODx320xdu80rVlOUvrDwd+0Se/xR8dkiiavxISQU1Ht/wA9YwYeHRfkcR0QHJNanMI=
X-Received: by 2002:a05:6830:1556:: with SMTP id
 l22mr1576626otp.34.1621291383035; 
 Mon, 17 May 2021 15:43:03 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 17 May 2021 15:43:02 -0700
MIME-Version: 1.0
In-Reply-To: <20210514122051.266169-3-ikjn@chromium.org>
References: <20210514122051.266169-1-ikjn@chromium.org>
 <20210514122051.266169-3-ikjn@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 17 May 2021 15:43:02 -0700
Message-ID: <CAE-0n521WWMmUs4oPxpc7kGC1pxZygdjHkU_ULa665-6kf469w@mail.gmail.com>
Subject: Re: [RESEND PATCH v7 2/2] arm64: dts: mt8183: add cbas node under
 cros_ec
To: Ikjoon Jang <ikjn@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Guenter Roeck <groeck@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Jiri Kosina <jikos@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_154303_853585_B20DA1C0 
X-CRM114-Status: UNSURE (   5.53  )
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

Quoting Ikjoon Jang (2021-05-14 05:20:50)
> Add a 'cbas' device node for supporting tablet mode switch in
> kukui devices.
>
> Kukui platforms with detacheable base have an additional input
> device under cros-ec, which reports SW_TABLET_MODE regarding
> its base state (e.g. base flipped or detached).
>
> Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
