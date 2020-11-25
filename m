Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BFAC2D0E4
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 02:47:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47619206D5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 02:47:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eWS5GabG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="is2GV9Ek"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47619206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0/hvlYhnOC034mT9aA4zzVdojAR3fsplLfUnWn9jRnY=; b=eWS5GabGPJL5FHedyCpF+H7vP
	r3cAmc7d8l2xC4Q88uRh9Z6LUSmSNX3aXN6lnnE0lUApqO/wmHNe1hhayEI/qLEulyQU+oWWuxxan
	LR7H6hVv0DvmCphtrkzpLC+umcUnbR9M0exmp5NnV1yWEiWDqvqNQQngH3aaD5VOKAi8Zso//rwgN
	qNAAzLxBnME9HZHdvt7Pb2TzLCdTWkmcWgauUEc/fB7I2gVvnGDmkvEEbCHG+hMlSEzCyJqqaiU4v
	E8he6qCXUTm3qtTTCpwUBI1bXizFkkv/UlhXbQ9VQ2mxuddgHyTpHQWuAg+KoKDqzN5mRjrLypBNh
	LJdgre4xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khkpb-0005iv-Fh; Wed, 25 Nov 2020 02:46:55 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khkpa-0005iK-75
 for linux-mediatek@lists.infradead.org; Wed, 25 Nov 2020 02:46:54 +0000
Received: by mail-lf1-x142.google.com with SMTP id u18so996907lfd.9
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2020 18:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7dQmAVJ9OckwzlsSurqMxYhM29m2a8+zop97yPgBPXE=;
 b=is2GV9Ek/3+TGGREZr6N5mvtJvamdlWs9daD92dvW95+w6beQEyLcxiISgdLMGkXgy
 5bMZ+gwNfMqbTv08fpW4D3FqybduxqI/zRiy2q18DN5f7QWmDIY308p4r4X8YuGc+WJ+
 VUn7mq2EvDUHE4BE6O9j4CulfiId7FWuYBkD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7dQmAVJ9OckwzlsSurqMxYhM29m2a8+zop97yPgBPXE=;
 b=OaDzKtX+Bv1Deej5CvOkhq3bVM7yCWkkFBHgbHm4ZKpvRqgVTgKI/UH8W1FRFSizBs
 T0WTvUzaFLXYsBCIkf8CsX172shnQdEhA7FAbDdyMGGzKFKQ9e6X9D7bA0FjYUVcSIE1
 hTzLHBv7L8v5q8I7LSAsuHWBQo+v/pPFQJFXQF46DUFi/PyJ108dAGV5mEqLeFGtEZId
 TWt32AmKNYA+Xmqk1aRMjD/CcU3XdcQK57gzWE8LYwvTDqhviOQlMx6k0CEXXKoxPbua
 r/JZAc+bRoooUqM/oaGFof+GUqLDUd5ScO0E5nD0jAEXHUOhi2Yz3y+ccvG7EoEmDY0X
 GPEw==
X-Gm-Message-State: AOAM531MM/6PeBlHRKRxK7scteFMhs1apUSP3eq3DVmyCHfrzpzDwmKk
 bRh9jrOwW1p0s2W61lH8h2V5twQoLITMAA==
X-Google-Smtp-Source: ABdhPJw6hgUiBpJyjk1On8MOzgMwgIW9ZKg1XxZF8SGLi75g16uvyUCOWyCcTq70aBIuM0aZoSDJmw==
X-Received: by 2002:ac2:53ab:: with SMTP id j11mr475497lfh.86.1606272411049;
 Tue, 24 Nov 2020 18:46:51 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com.
 [209.85.208.176])
 by smtp.gmail.com with ESMTPSA id y81sm89436lfc.100.2020.11.24.18.46.50
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 18:46:51 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id o24so679363ljj.6
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2020 18:46:50 -0800 (PST)
X-Received: by 2002:a2e:8115:: with SMTP id d21mr434973ljg.379.1606272410338; 
 Tue, 24 Nov 2020 18:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20201029011721.6705-1-irui.wang@mediatek.com>
In-Reply-To: <20201029011721.6705-1-irui.wang@mediatek.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 25 Nov 2020 11:46:39 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXQadf+0xP3VXAWwaew-OFrFGu-yPZfjXNtMqcfpjzQGg@mail.gmail.com>
Message-ID: <CAPBb6MXQadf+0xP3VXAWwaew-OFrFGu-yPZfjXNtMqcfpjzQGg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: mtk-vpu: VPU should be in idle state before
 system is suspended
To: Irui Wang <irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_214654_302317_E34C6632 
X-CRM114-Status: GOOD (  10.63  )
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
Cc: Andrew-CT.Chen@mediatek.com, Maoguang.Meng@mediatek.com,
 srv_heupstream@mediatek.com, Yunfei.Dong@mediatek.com, erin.lo@mediatek.com,
 Longfei.Wang@mediatek.com, linux-kernel@vger.kernel.org,
 houlong.wei@mediatek.com, hverkuil@xs4all.nl,
 linux-mediatek@lists.infradead.org, PoChun.Lin@mediatek.com,
 matthias.bgg@gmail.com, hsinyi@google.com, mchehab@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29, 2020 at 10:17 AM Irui Wang <irui.wang@mediatek.com> wrote:
>
> VPU should be in idle state before system is suspended
> or it will work abnormally like VPU program counter not
> in a correct address or VPU reset
>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

FWIW,

Reviewed-by: Alexandre Courbot <acourbot@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
