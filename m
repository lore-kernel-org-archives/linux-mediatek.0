Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6187C27C55
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 16:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9nCNK53rTjLnVysfgXoglxvrQ8+xq11LiIZcoNznmu8=; b=hUiQQ3ekT2OJLRWVCvzJDBOyCJ
	l3QV4RgkeQjhjbwLJWXivGZ15zASfjOkkmfEKTvcnBLL7gGXVXY8Hl6WEPgIA5z5fO2T2yAkP0G5I
	NOf1DqpiPkPPTA6wbhaGr8X2IloD6UOaMPHUjsMjMVT/UKPNR1YxrWiNmbaWoowrrTr5nArBUGZKL
	dcYWYjvcl7tpdHLUbU9e46aUk/m/hnhSaXg30Y80bZeLY7CB2wAmXDUMRZASAz8k1bCMrLPF74+Y1
	/Vg5v7BctEPzd//CtZv/Xcjzzc2S9fXtFEHNmGzGwHxKumeRsI/lLpSRbyxuSwf34Xi2bUnnHEjtp
	hgvu9rHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhdb-00000005jgD-0bn6;
	Mon, 10 Jun 2024 16:12:51 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGhdY-00000005jf7-0cHD
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Jun 2024 16:12:49 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6a3652a732fso562336d6.3
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Jun 2024 09:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718035960; x=1718640760; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9nCNK53rTjLnVysfgXoglxvrQ8+xq11LiIZcoNznmu8=;
        b=JzLDm9B5MlhkRREkEPszhzTTE5IC+yvFjItMb5zfQbIS7LMJY6XFnK4ku2Iy7FHxjr
         L8NsvfHdB4UzQZ/s/vaVSv1ia+XInK4W0EUuPzDlnlnvSqyMZwqngf+ngyG/bJgg0n9I
         jNQJReUlwGSTL0nO3+h6ZQWLe8CxCxTcfYkL8OgRh5QU608yhGxi3hs06GYZ54inoXfT
         aaVxi2UcE3kKoVK0RsqxEUFN0Lsjdgssy+8EwHzyEGphndVEMHmpqHm2QOtEHBKeYvvs
         H0PAbQSzr0ZPbl8R0u6EDm1NhoBMB5Ou+ivTOMXD4wxblYXipOWzcGxMZdf3aSxkZdjM
         wljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718035960; x=1718640760;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9nCNK53rTjLnVysfgXoglxvrQ8+xq11LiIZcoNznmu8=;
        b=fRaEHXjPV8EEWwzOZN3GI5gXpUioPwqHC4i6SCKrZ/7J3py6P3QQEu2SXFnI/S9RlC
         dzIFJsr5VQ9LvzbhSZQ8QL7kd8ivNneq5vm+9s/tTPqQUyUDD/eBplP6q99dX+AJOf3L
         Pb4QcGE6feRlZ5G8Q4c9qOVm0KfI+TGDELec9YVS73cyDc3qejfwMS1XtSwROXoMI6mU
         TapA774DJJAfgDPQDHYtr5oZLht4HvFVpLkWwHg7/dFEyS2cyv6nyQAyblErIoHU0sFW
         xT8KerZ/DV1sTtttCG1y/yhVVds81FREg64X9az0L4myvAXBVcmbzh1wzjfUaOf3VXUU
         Fbcw==
X-Forwarded-Encrypted: i=1; AJvYcCWmwcmlTxr4REoypb3pqZS+zwGAjsTdNSMTLNrW0xjd0EGCuhKitGpG0iI1eW/Ql2Nwi+lTXbYl1d8mJD+l8BeHKMvAhglZ24xJbbP8lxn1yjX0
X-Gm-Message-State: AOJu0YxekqXdxG4Ej9qmxHclPTuDA2FKGssRv9Cr7BAivBgUdQfp4UEh
	ckAbHatZ2DBEIulAGV9SY2sn2oQgTpBDMGNJ8BckSR7LL8Do0ykf0qpouKvQLCDIu1j3QMvI6ob
	z2tbaRjIZnsVgt0iq57s1rDGp/Jrf370nArvD
X-Google-Smtp-Source: AGHT+IE/aD6ZkBV1FswWsBDqg8wRi/7F2WLAtCMkHqq3t8Fa1Oct3M1hrEosflrAPoOwmBRuAeSAaP3oUTyhMdZeir0=
X-Received: by 2002:a05:6214:5691:b0:6b0:86ab:fe98 with SMTP id
 6a1803df08f44-6b086ac0198mr11047746d6.64.1718035959939; Mon, 10 Jun 2024
 09:12:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240523112131.31437-1-mingyen.hsieh@mediatek.com>
In-Reply-To: <20240523112131.31437-1-mingyen.hsieh@mediatek.com>
From: David Ruth <druth@google.com>
Date: Mon, 10 Jun 2024 12:12:02 -0400
Message-ID: <CAKHmtrTo0OpsmeEcjOgZ40y_H_unxsYCU_Ym9Oc9Ut+gQgUCew@mail.gmail.com>
Subject: Re: [PATCH v2] wifi: mt76: mt792x: fix scheduler interference in drv
 own process
To: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, deren.wu@mediatek.com, 
	Sean.Wang@mediatek.com, Soul.Huang@mediatek.com, Leon.Yen@mediatek.com, 
	Eric-SY.Chang@mediatek.com, km.lin@mediatek.com, robin.chiu@mediatek.com, 
	ch.yeh@mediatek.com, posh.sun@mediatek.com, Quan.Zhou@mediatek.com, 
	Ryder.Lee@mediatek.com, Shayne.Chen@mediatek.com, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Michael Lo <michael.lo@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_091248_208410_9F795580 
X-CRM114-Status: UNSURE (   4.91  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Tested-by: David Ruth <druth@chromium.org>

