Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5D4C07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:05:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 486A1613D1
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:05:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 486A1613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L7JAlm/pGPHT2+7o5pHNsNO5yKxmow18RKbpSUtAGJk=; b=woM91tnAD3VWWb
	WcJGykdli9+19Fm/psfYxUYWozNwhUnnAtn9dA0PkaOUPy448k4nNQybKUqZMXG/pWFiTQNtaJUaO
	Pav7b8EDxuNj8R624hkXrkCtRAfiJutNG1y8k5TxHLqIPE0K3XWqVjW/cLeZV/zLhY7KBXGAseGjA
	wrKVulZ/K4oYnNk+/B38PuDJNSN5B8Ck6sotTyYXYma2CdOYmh5srHKglQ16eGsP0m/YWHMCvW0Za
	USfBxBnfOj9zTcwmCTcU4+o+SIvrtWsnZf6JuuffELo+3cVOp7apUSOsFuFKhZbO6sJKqczj2ZtP/
	l9zGlJaQ033/xRrssVwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0Gmu-007oiz-Iw; Mon, 05 Jul 2021 05:04:56 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0Gms-007ohv-0N
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 05:04:55 +0000
Received: by mail-lj1-x22b.google.com with SMTP id r20so8312506ljd.10
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Jul 2021 22:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mZVX4eT3B7Nm/OGF+XAiEc62jgHZwkAo/MjUxL1pluA=;
 b=g8FZck8lzNIbA3se1q2+eTbTHf4nnCuhCP4BT1v6H2bb7BifxKIR/oSqx0wBszdMHC
 0FfCGl1PBiPZtngEp3rMd7q5cigS0bBol2V0ySFX9Ps3spfspz83FJj4oMxjratShkYk
 VWQ7obstYPgMbb3Gbrh5PtI9I3Cq4209IdfLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mZVX4eT3B7Nm/OGF+XAiEc62jgHZwkAo/MjUxL1pluA=;
 b=SJv7Wslh0/yxsoSMnIzN0oI5kELHIBlHJ/o40dg9QJaYU7Eulc5gDtfMnqj9BihGq8
 q8SqIF8y87IAv+teTHrli6uuGMY/UEiFjhjLu+C4GlXX48J0ivKcjrKe2RrNB8p0j+XF
 ULEq843DrSR6drDEuiA7ywQsKgTU/GnzylMOtSqRsLSyEdcpuzjZSIQu3n4jGfbxjQpf
 V0+Nw6OIxEjOWoe8XAQKM4Z1FRD6Qp3jmddkjGSaAMppDj2E87g0IbVQosFuQVDlulXt
 KGAI2JDLcshgXw7y2zCUxuuPbf74D5Ww1blkyNxu0gHl8I9GZzBdvGr7N/KikT+ThkhR
 qqFg==
X-Gm-Message-State: AOAM530o8tk/C0yFZLRswcDgXRewDPIiyroKKVP+SPIdOUdNYFFqChyR
 QkZHENIo99lEc/6VDoE+oihIKZN8fJaDeQ==
X-Google-Smtp-Source: ABdhPJyUMZ/5tS7t5bUpkQ0V0oXGSQy6D0yg8FJE91cv5LMsRW2lyYUWlHmkLbKRh6CiJc6o3UX6Hw==
X-Received: by 2002:a2e:7214:: with SMTP id n20mr9993599ljc.408.1625461491814; 
 Sun, 04 Jul 2021 22:04:51 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id p15sm966467lfr.293.2021.07.04.22.04.50
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 22:04:51 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id p21so8440830lfj.13
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Jul 2021 22:04:50 -0700 (PDT)
X-Received: by 2002:a05:6512:3e11:: with SMTP id
 i17mr9353285lfv.233.1625461490550; 
 Sun, 04 Jul 2021 22:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org>
 <20210519143011.1175546-6-acourbot@chromium.org>
 <9b37044d-f909-9169-3d22-fa6c5f788822@collabora.com>
 <082ffa69-1280-f5e8-f8ef-a1bb6d2bc8c5@collabora.com>
In-Reply-To: <082ffa69-1280-f5e8-f8ef-a1bb6d2bc8c5@collabora.com>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Mon, 5 Jul 2021 14:04:39 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXUqwKFRHVC2aBjW=iG66uABrvhx3qCmp012YOF7rTn=A@mail.gmail.com>
Message-ID: <CAPBb6MXUqwKFRHVC2aBjW=iG66uABrvhx3qCmp012YOF7rTn=A@mail.gmail.com>
Subject: Re: [PATCH v5 05/14] media: mtk-vcodec: venc: support START and STOP
 commands
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_220454_078701_76B7933A 
X-CRM114-Status: GOOD (  11.35  )
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

On Fri, May 28, 2021 at 4:44 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
> >> +static int vidioc_encoder_cmd(struct file *file, void *priv,
> >> +                  struct v4l2_encoder_cmd *cmd)
> >> +{
> >> +    struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> >> +    struct vb2_queue *src_vq, *dst_vq;
> >> +    int ret;
>
> I see that the driver return -EIO on the ioctls when in state MTK_STATE_ABORT
> so you should probably test the state here as well.

Done, thanks for catching this!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
