Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 031C1C0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 06:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wpRPsRseawRNMEQyVyymjJ3tqvGUqABUcHLZuDbCtO8=; b=mrVJ4IsuSeFhpjD5T5BqoYlpUq
	49+/s8RwuYruv/w0CAilPOzZvnEMstWFPsL6p53Pyii0vbpC6OimB8aULVDHrN1tif6vgnY7PhxSA
	Nf2SkRrPmGeMK2IVXWWktTPSOtqD7v+s6RfauzQnoqMwlJ1+mUcqPkCGLgPomJe3nvNh6RyHmVD0i
	I6Evtr72M83fQSsC/FhxS1xhZHX4m7Z6SrA4uAMz+DAEX0pRi8pROobhcnmk9onfFJtFvGYWudy8T
	yYPzEa3hML6RN9lzUfWQS2HetOJUjTHt/cabFE0dkiblTOhAlveJEzs2LXMg9i2mXZ3NeJNJgzyjH
	EyW4gO7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0WP-005esz-0D;
	Wed, 19 Jul 2023 06:18:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0WO-005erh-0v
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wpRPsRseawRNMEQyVyymjJ3tqvGUqABUcHLZuDbCtO8=; b=QD/mr/LQnvpp9OiZMqYgUQcmMU
	cLY3O+cmnoo2nYcTIuYmNope03wRSTt4IY02emF7BWUoMuZ1iRdIa026Bh/Gtwp2eyzhhUOQSo2Yl
	zTvX8mb6QxWD9MrUEGuhGhn/JyxlSYYE0yORUBL3qqMViZPQK3qARZxzPw9ss8BFg+RyDaZWzg1k/
	7fdaQnuPy4v0AIA18A8IpIiRgFKUgTMQAqf/f64xIi3+feASrCduHDtlkxHoA8/FjuD+665uZm0Pi
	+9bOgKBXts6Og8gh9ZxLKO08a8hrP4UsHSrcr50N/8tYH2c2FesTCXQkhVv2xfvI4JNzBo7F2GDZb
	JnwQxx2A==;
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLegA-00BF1X-18
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Jul 2023 06:59:28 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-785ccf19489so264706839f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Jul 2023 23:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689663503; x=1692255503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpRPsRseawRNMEQyVyymjJ3tqvGUqABUcHLZuDbCtO8=;
        b=Q4/4qDlhNSNl6YqVtNydAbvj1kvj9nztkRAX3BAXPcJ07mF43fSGyEMpIguB7DGvHW
         ZvCfHeHEyezt1+u5i/8rs9tCjSmOIpuhhWGCDYzydPwXI2qSnD3+81ifWMqd0DoSFCVq
         0ndrzN89uud5yzkFwMcLKGDp7m60iSg0pexv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689663503; x=1692255503;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpRPsRseawRNMEQyVyymjJ3tqvGUqABUcHLZuDbCtO8=;
        b=I9qWog/qXK/tlplUOnlK49UBwlTu59H+F64gcxNHEF3rgv1iovlb4M9eUGPKYScM8Z
         78gduRPZhaZ5SefE/27eC/eIs/Rg1PAthun/iycLnOTm9Ny9aq3hjNmeTVKyvVq6tPgj
         twF5DmTrtyvYNJCntqEzpugYqDD2FvMneNl5ZaDSXwwDXt+drLyu8MyzPHD2ZPGInAbL
         hfxLnb2bFmVP1ogEXlvpvHBCVtpzI8ttUwGs9L7lceYy1ssNRhTQDdS/LQbGo5GYKAEF
         hbeJnJVAujf475solGpBDF11c73z8JdaL2p/H57KfRNPbhfbW5IqBucqROQA3f1eV4CY
         yYGg==
X-Gm-Message-State: ABy/qLZBx0/NEHKY/J6NLzkSCX23yU3Ft4pL5FiJzauifCty8jBjFjgm
	KgTtOI29oGAcA8t4O4aU+wVmK1LWoN4ZCn9Lvsc=
X-Google-Smtp-Source: APBJJlEAmL7SmbE/Z7Pr3lrneEeOntSRL7RelOeMlepCPcL1+wEg6ZasGa07qhvsD7dvW+6VNPnLhQ==
X-Received: by 2002:a5e:a709:0:b0:785:cfa1:fcac with SMTP id b9-20020a5ea709000000b00785cfa1fcacmr1549363iod.20.1689663501983;
        Mon, 17 Jul 2023 23:58:21 -0700 (PDT)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com. [209.85.166.50])
        by smtp.gmail.com with ESMTPSA id ei2-20020a05663829a200b0042036f06b24sm356793jab.163.2023.07.17.23.58.20
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 23:58:20 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-785cbc5bfd2so264062539f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Jul 2023 23:58:20 -0700 (PDT)
X-Received: by 2002:a6b:f60d:0:b0:787:1a8f:1d08 with SMTP id
 n13-20020a6bf60d000000b007871a8f1d08mr1573813ioh.15.1689663500438; Mon, 17
 Jul 2023 23:58:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230717173934.1.If004a6e055a189c7f2d0724fa814422c26789839@changeid>
In-Reply-To: <20230717173934.1.If004a6e055a189c7f2d0724fa814422c26789839@changeid>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 18 Jul 2023 14:57:44 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhFP6+fo-OU86PzCMtK77x+X23C1O4Bt=hxOsC+xzVGig@mail.gmail.com>
Message-ID: <CAC=S1nhFP6+fo-OU86PzCMtK77x+X23C1O4Bt=hxOsC+xzVGig@mail.gmail.com>
Subject: Re: [PATCH] spmi: mediatek: Fix UAF on device remove
To: Yu-Che Cheng <giver@chromium.org>
Cc: James Lo <james.lo@mediatek.com>, Stephen Boyd <sboyd@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_075926_584629_9648DD3F 
X-CRM114-Status: GOOD (  12.01  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jul 17, 2023 at 5:41=E2=80=AFPM Yu-Che Cheng <giver@chromium.org> w=
rote:
>
> The pmif driver data that contains the clocks is allocated along with
> spmi_controller.
> On device remove, spmi_controller will be freed first, and then devres
> , including the clocks, will be cleanup.
> This leads to UAF because putting the clocks will access the clocks in
> the pmif driver data, which is already freed along with spmi_controller.
>
> This can be reproduced by enabling DEBUG_TEST_DRIVER_REMOVE and
> building the kernel with KASAN.
>
> Fix the UAF issue by using unmanaged clk_bulk_get() and putting the
> clocks before freeing spmi_controller.
>
> Reported-by: Fei Shao <fshao@chromium.org>
> Signed-off-by: Yu-Che Cheng <giver@chromium.org>

Reviewed-by: Fei Shao <fshao@chromium.org>
Tested-by: Fei Shao <fshao@chromium.org>

