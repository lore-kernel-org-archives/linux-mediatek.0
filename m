Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C55BCFB424
	for <linux-mediatek@archiver.kernel.org>; Sun,  6 Oct 2024 22:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Date:Subject:To:Message-ID:From:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sc5r8MHJVUIehGKNe2oMI6+sEV+3yZ1UqhmlGV+6ivw=; b=cfFeaoZ8dU2/9qmiYJtYfg8rZC
	+vzYSQwagA6WkbuyMXzg5boTruc11ilcxZ8EBU/4e/sxpgi5O5hUx+7ImYsho5Tl0UFcMOGlcE+SI
	XaNRz1zxjuXICuxzADSWLVtBuFlyxSMTv58serAJqiaIsxbNR9M8AHqNxQKZMIi6VrSYcCOiD30Hq
	t8O8URJaGKlRxk9YbQwMEZeDAAPH1DiSvlbVr4Fox4k5QYLwyO85DbnW7bkT/rNDAS5eTnPOvrg4T
	NASRXB2/LBJLABlNMVLd8CnjjVX+alWC9M+q8G+KlOi9FzMOecchTojiwqn0uKRkTMscCREasLKeX
	iiGcBICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxZeV-00000000jMp-0Uk8;
	Sun, 06 Oct 2024 22:22:59 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxZeS-00000000jMT-1hoZ
	for linux-mediatek@lists.infradead.org;
	Sun, 06 Oct 2024 22:22:57 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-71dec1cf48fso1931598b3a.0
        for <linux-mediatek@lists.infradead.org>; Sun, 06 Oct 2024 15:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728253375; x=1728858175; darn=lists.infradead.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sc5r8MHJVUIehGKNe2oMI6+sEV+3yZ1UqhmlGV+6ivw=;
        b=EDmLi152oPzW6/wSo2IA+wIhEaZhsqJ60pWHurTR8wy/4V8MK8td8ID7DVClCdA3zP
         fvkG0q2WFf6ogKizWN6oOHHv14O50B5WpA4Lt777F2p/1R6VaWZK77ah+GqN9LUTdEMO
         M8YkH178JZu2q9DFbR/pGEE0Y1yUgf8DjcKNZCA9bsyD2utTRxNE4D1KuECIhiySX1RK
         g60wHSX0/fuqsGRRJ1+FapJH4CRbOlDraEsKfN3KxieJIsPWoLl9jsaU7g/vvXVgG0cX
         elIXlsDKoMy62EK8iltP4Wn5rUFfii504JVzswAWDbKEHBTmaMfuLiFiuQ/L5ZCoAxxQ
         Ydzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728253375; x=1728858175;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sc5r8MHJVUIehGKNe2oMI6+sEV+3yZ1UqhmlGV+6ivw=;
        b=M+4TOWVPXYbZP0PTYltVrtLGp9ce043HYWYf9opTOaOvjfV9P6DMhBpitGUAO+pLdh
         3LfSfc5zHpgPGrvWUkW92Zltw3LaeVJOO4qBrq1ew82ked0SNUaBpYsvHDaIEzmzfiBM
         xKAEhCJIug8YAe1uBd6hs3uIBVKLdTgTYSSkWJj6m/vAV6hvmORENKg2qnpD+BB8XjS+
         ySoSDu/nbaqiC0BB13p2T0ubPnAGRQC3ka0GxRy5WNCapykxROdJpMvQxtB6+M1xEsuC
         Q6czWHGb2Btram4QOfay0pcjcQUyZKT6Unh+SklN6DybChWzAW4XCk9Ul4Md13pdpmV1
         Ev9w==
X-Gm-Message-State: AOJu0YwTktWjMY8gk5aGckKgsShkhYpWv6/2PIP0nF62tpO6ZpC4A3ll
	jzsaxldPIOsNZMjz7E+NTEMGxae5lRIdCv7lRF5zJy90M9HsB3P1FoefjRsK
X-Google-Smtp-Source: AGHT+IF6DDh9UVM/p+QBut55D+/NEtQHqsnO9OqqphZaqBLjOGzXTKhdUdbchS1AbsohT7FUpZnSfQ==
X-Received: by 2002:a05:6a00:1405:b0:71d:fc19:a9d5 with SMTP id d2e1a72fcca58-71dfc19abecmr6642321b3a.28.1728253374902;
        Sun, 06 Oct 2024 15:22:54 -0700 (PDT)
Received: from [103.237.86.105] ([103.237.86.105])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d4a2fcsm3173977b3a.125.2024.10.06.15.22.54
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 06 Oct 2024 15:22:54 -0700 (PDT)
From: "Mrs.Elle Dridg" <ccchuun1212@gmail.com>
X-Google-Original-From: "Mrs.Elle Dridg" <castillom551@outlook.com>
Message-ID: <2e16592fe37dec01b02a61fabf5c24370a582799e16cad74701925fc980f27e0@mx.google.com>
To: linux-mediatek@lists.infradead.org
Subject: Gifting an Acoustic Instrument
Date: Mon, 07 Oct 2024 05:22:53 +0700
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241006_152256_466941_FAEBC60E 
X-CRM114-Status: UNSURE (   1.86  )
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
Reply-To: eldridg84@outlook.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


Hello,

I am offering my late husband's Yamaha Baby Grand Piano to a passionate instrument lover. If you are interested or know someone who would appreciate having this beautiful instrument, please let me know.

Thanks,
Mrs.Elle




