Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C55C56202
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 02:47:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C10C0206D5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 02:47:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EkWNqo2p";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lF0N4JHR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C10C0206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XIUzjO3CoStJ/IrDVTWkJMW8PjtzyjSjZ5YOdAWc2+A=; b=EkWNqo2pkJGPSbiaulqopDmyW
	ihb8ywgQP6l1U0/uWt4sjuMnZ6uETZGl0Ae8svw+IlfnRD4fGWxMOaTnjD2IqIPJeopHlIIJPP1IS
	HfnkX0abM7ZVtJ0LIb+gxrBexl+Kqq1siH+1a1fOsVKkauMXd1KeCl54vCKp+isXkCB1dzeTZWjUd
	RAjJgj+xEbbUd1Vi819EjlP7RrUOIHJlz7iAer+HB1cMWyqJExz7qAUAakd+/awmD0c23a0mIsx16
	jJ5uvDETM5/vUHwLYIKzCUrjCVKPbvE2OD8k22wYFKfSmrhcAQAJi/uczLdaxQdQVimkqBK51vwTL
	sOgIUNOFw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khkpg-0005kd-MU; Wed, 25 Nov 2020 02:47:00 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khkpe-0005jc-GF
 for linux-mediatek@lists.infradead.org; Wed, 25 Nov 2020 02:46:59 +0000
Received: by mail-lf1-x142.google.com with SMTP id u19so1008414lfr.7
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2020 18:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KerQ9Iv5uRC8y/oyJ5H9vFpn79bTM4xjZkKRVKH2tQ0=;
 b=lF0N4JHRQSynJbooJkAKI2A7bPU13aiKpsjkPlZxgP6u4rbyjSZ2peN4RjKOQXRjIJ
 j3kFWWmkKbwG3L+Jkh/BV3g1xglRPCydH/R40zQdDa5cXvoDkWeu7r+FvYtVgy4UTd66
 UtSGGBEqbG2G6G9q0pYlF1H0vLnJ+0f8P9UU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KerQ9Iv5uRC8y/oyJ5H9vFpn79bTM4xjZkKRVKH2tQ0=;
 b=rQmYK7eVlzfdmQLa87Wv6b7EzdSxqbzQWgmYqVtO3ojB8ZJr/ytZrfcziRSizPkvBn
 KYTf+Zp+4IJRTG7P4Yl3ovSfNezt86SPTm5Q45YNtdGFKSn+Z448WoqpScuM3SjkYXsI
 aMrLwE/OHXfneiOMzW5G0DiPgwX2HuIhEG4QmjJZA0Rud5J1axNR2TedIDhPWG960RnT
 /lu5oCNLN5NkSxfnbjXybUOPTxptTMZEXWtdGOaHTuYuewgK5D8ZtTrvU2echgN30Ld2
 K+g454Gm2+k8MuUDfGkmrOdFQ8jD1rhXyyLFwmqCy0RaKKq4mlPEzfNCy5ckxtBxEZHf
 F4VQ==
X-Gm-Message-State: AOAM5320cqM8LB9S/jzrpSiLnL7ad8Tin2PKT9w5qQj46GF9LMYYQ6hE
 au9hD3SwkA+4qBf6s5e13+hkFyxa01gGvw==
X-Google-Smtp-Source: ABdhPJwBoMCyQdcne9WA8ttvnzDoved4aUYe0s43OdNnO7Dn8fnpH2nUppGtdbgQ1ES+hb3ElKI7QA==
X-Received: by 2002:a19:ca49:: with SMTP id h9mr421765lfj.602.1606272416759;
 Tue, 24 Nov 2020 18:46:56 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com.
 [209.85.208.174])
 by smtp.gmail.com with ESMTPSA id k11sm87248lfd.3.2020.11.24.18.46.54
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 18:46:54 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id j10so687081lja.5
 for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2020 18:46:54 -0800 (PST)
X-Received: by 2002:a2e:b4c6:: with SMTP id r6mr511760ljm.248.1606272413969;
 Tue, 24 Nov 2020 18:46:53 -0800 (PST)
MIME-Version: 1.0
References: <20201029011721.6705-1-irui.wang@mediatek.com>
 <20201029011721.6705-2-irui.wang@mediatek.com>
In-Reply-To: <20201029011721.6705-2-irui.wang@mediatek.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Wed, 25 Nov 2020 11:46:43 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWGNH180gtmonmO=40dD7fAscTsvvYE=sj8+i5WeR5x1Q@mail.gmail.com>
Message-ID: <CAPBb6MWGNH180gtmonmO=40dD7fAscTsvvYE=sj8+i5WeR5x1Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: mtk-vpu: dump VPU status when IPI times out
To: Irui Wang <irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_214658_598227_26BBE80A 
X-CRM114-Status: UNSURE (   8.26  )
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
> when IPI time out, dump VPU status to get more debug information
>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

Reviewed-by: Alexandre Courbot <acourbot@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
