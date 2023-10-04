Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A77FE8FDCF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Oct 2023 06:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOJx+H1H2eQIUUKPhGEI4mBNNDbxIWiRZ/E3j6WDqrk=; b=CxRy/kpIYTYTM/NoMB7Az+Fup4
	DK8xCu5B1x1Rkhyaz9xcPI9lXN770BkvfkHpNPRF3R4FR4+QSshe05nQFXE6R2xJ9VKBKesCJ6Ceq
	27oz8sVtvzG827gFZHBug06G2eZgp1/5TWKdUeHuaSdWKfyaN/lGha72y/89lE82MWB7IoVGCwA47
	Vw6uVAGsCREK4Jbut9gwWWu014gkVDjolWA9FqAZGlyXCy+x/L8TCB4enstdCS+ZUqg3jhXYhDk9O
	cQYAbgBFmozlrhvpHwkdTmkTl5v7N96NRO4q+B6JZRBkSEkFuzWoIxB+Au4Edy4LycwCFP5D2Ww7T
	6L36xcjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnvWN-00GRPF-0O;
	Wed, 04 Oct 2023 06:38:11 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnvWK-00GRMx-2c
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Oct 2023 06:38:09 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c012232792so20416871fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Oct 2023 23:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696401483; x=1697006283; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOJx+H1H2eQIUUKPhGEI4mBNNDbxIWiRZ/E3j6WDqrk=;
        b=QxqFumUqPUFAuI39V1zXi0e4XBhMVdFUOseG+E8qbHtPyg1vZlsXR7Xe4OxuZV3hfR
         iZM8dVHQ4NrX3/ZJZjYxxbC1dP+Cnh9lvnrXtGOTdyPABEituziOjlaM+PBhGfHhhtj6
         57IFLXHzp2CkyFk1UppbB/2l/VXnHMZrw7S8oOg6PVUI0tJ7PMCM7wzo4zJ9m8LtyDZ+
         UC2AD5vXoLb0FWN0hpRTRHb7ORwnvb8/kney7xDsdMc5oCOh7Yq/uWAyzm90TrttlwE9
         IUzMs5P0cuG6v4eC4po/E0Lq2CZtgFgMmVjm61h7lotubRgp3DqkkV/4OTtMWYZ7Je4/
         obMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696401483; x=1697006283;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOJx+H1H2eQIUUKPhGEI4mBNNDbxIWiRZ/E3j6WDqrk=;
        b=UIKhREvvWxp0c8Cj2L9t0sRuzbQSMHmoc+5iYf1gL6eM+ooTQ+Uh6FsDZ1I8WDZnDn
         qj21ri+4OzOBTt2gSfhhYoMfG9K108rJTcCtF4RKIlVdXJwITLTTqjiJf+38tkg31Mtq
         rp2qkT3YmLt2ReBrkg7MdRATZcdZtrqEV8QpxcO0pVHdfEG7nwvODfCs9yVyqcETb4r5
         kAxXkGCz6u10buThPgRNceo7rxpANsGpj85nHkMJTem+ZrEhlsiWCX4i8YK57pA6KL75
         1itxrQhNyD5NdnvpUojaLnIrmjEJlqGOVQpa8jR5ZWZ2Z9zynD34CTIw6YF0Aflim1MJ
         qkJA==
X-Gm-Message-State: AOJu0YwlRX2QLtAg9M55chSVoMMKsGydyDwDhRgCT2c5v9Mc0US+nnkL
	OlZutvNazM8UiILs+rwdrII2bvvdm6MPgXXoig==
X-Google-Smtp-Source: AGHT+IH2rF1H3sCtyzo1RkT1zubW/4tZ4l6ZuAUULlwrtkHa0e5Isl4qNXiWmy7mZuY/p7Ip2JDcZ4N+kPtWQ2r7lro=
X-Received: by 2002:a2e:8895:0:b0:2c2:bdc2:af77 with SMTP id
 k21-20020a2e8895000000b002c2bdc2af77mr1153824lji.33.1696401482561; Tue, 03
 Oct 2023 23:38:02 -0700 (PDT)
MIME-Version: 1.0
References: <20231004062454.29165-1-peter.wang@mediatek.com>
In-Reply-To: <20231004062454.29165-1-peter.wang@mediatek.com>
From: Stanley Chu <chu.stanley@gmail.com>
Date: Wed, 4 Oct 2023 14:37:50 +0800
Message-ID: <CAGaU9a_nv2-k93wBjs_LDfLEXd14L8LagNTqFsmmT+0AH4qE8Q@mail.gmail.com>
Subject: Re: [PATCH v1] ufs: core: remove dev cmd clock scaling busy
To: peter.wang@mediatek.com
Cc: stanley.chu@mediatek.com, linux-scsi@vger.kernel.org, 
	martin.petersen@oracle.com, avri.altman@wdc.com, alim.akhtar@samsung.com, 
	jejb@linux.ibm.com, wsd_upstream@mediatek.com, 
	linux-mediatek@lists.infradead.org, chun-hung.wu@mediatek.com, 
	alice.chao@mediatek.com, cc.chou@mediatek.com, chaotian.jing@mediatek.com, 
	jiajie.hao@mediatek.com, powen.kao@mediatek.com, qilin.tan@mediatek.com, 
	lin.gui@mediatek.com, tun-yu.yu@mediatek.com, eddie.huang@mediatek.com, 
	naomi.chu@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_233808_845238_8602A541 
X-CRM114-Status: GOOD (  10.03  )
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

On Wed, Oct 4, 2023 at 2:25=E2=80=AFPM <peter.wang@mediatek.com> wrote:
>
> From: Peter Wang <peter.wang@mediatek.com>
>
> If dev command timeout, clk_scaling.active_reqs is not decrease
> and cause clock scaling framework abnormal. But it is complicated to
> handle different dev command timeout case in legacy mode or mcq mode.
> Besides, dev cmd is rare used and busy time is short.
> So remove clock scaling busy window for dev cmd is properly.
> Same as uic or tm cmd which doesn't update busy window too.
>
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>

It makes sense to me since clock scaling is aimed at balancing
performance and power consumption for different workloads, which
should be data workloads rather than device commands.

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

