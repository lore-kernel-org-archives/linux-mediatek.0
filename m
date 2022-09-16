Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF00ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 22:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gVWdEjZuPErV3h1kBfQaK5huy+7TX0Zb1YdIFGYCgGY=; b=snxz/4b1Wy6j+Wap0kOmYrq1C3
	NKRqnx4bPgHpp9pAWq2a7eY4/DQ3Vxnyh98LpHD6EdF0JXpmi4ZcJlPPL4NTC55dRyGK4x3th8L/G
	YKFsuK0u6elXivTTOuNpDl8uzhtFLVNY3jull87xZDEFpxXCsT96GEXyOAk95L2FrKCyaYvJlK0NQ
	wbY5nbMYtXYLl3rAex6ZKEsEw/Noye3TzQgRMD4QQdlQ8O7b6L9T/KmNOZBCYs/6oPVoQKYodDXMK
	X0t/LflgVYuPToa8bjeqyPy1ofxvJcHblmgc0+iwO0yoW0uX6eDEMbEqwFmwECTPsfuQBQRnVcGfZ
	nvNgtAIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZKFa-000DLR-A9; Fri, 16 Sep 2022 22:55:58 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZKFW-000DJi-QF
	for linux-mediatek@lists.infradead.org; Fri, 16 Sep 2022 22:55:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CA707B82699
	for <linux-mediatek@lists.infradead.org>; Fri, 16 Sep 2022 22:55:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F50C433B5
	for <linux-mediatek@lists.infradead.org>; Fri, 16 Sep 2022 22:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663368950;
	bh=CxePb5gSHUo+VC915HSKvQFTvB1YDl7G7mETr2pEKdM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bQLRcpJO4wQpxuKyGPt8hrvOCf0+UCyiCoUTiiNwv/aIhNN2dBjfLe9+QF/vrP3qz
	 yETSihoSo2NYig77KvTY3XH/HlCWIokQfpFPLYX8Qv2gyRTME+saS6Ot3RD4E39+2u
	 ZbzrYBduaPFhF8M4EDAqy/Ag9+IysO1rAr4ocN5mjDDjZk2rQaERZC+Ey8RuAkZcv8
	 jATd6s/+YmiMLcTLj/AGvyq1gL5PLUo0akM3FuoXQ9eliemMvzjswZ1xUJIzWfcw+o
	 xxagVoK8vIdeTEZPhRw3QtjglIMZbew9OpEnnDlG0PTcC4PqVIy8GEhcI3ffi/x3hM
	 3UtsVZcy30L4A==
Received: by mail-wm1-f47.google.com with SMTP id d12-20020a05600c3acc00b003b4c12e47f3so665154wms.4
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Sep 2022 15:55:50 -0700 (PDT)
X-Gm-Message-State: ACrzQf3Af4Fuizrg4HHt9X9fT49nPAsYd1r9fVf/k0svsFaaDlnq14j+
	sv75xRyiCHCSHWkTFqfHxBGjG8vj3qgmLeFObO8=
X-Google-Smtp-Source: AMsMyM4DdIs0+/VNJIbbOCv56yQxPrcSrae4oNrMbcWmbPGfpBk1PqD5XW8+CRbBoA9out17hpCehWfW1Yb7zoW8xm0=
X-Received: by 2002:a7b:c2a2:0:b0:3a8:4959:a327 with SMTP id
 c2-20020a7bc2a2000000b003a84959a327mr4772463wmk.50.1663368948773; Fri, 16 Sep
 2022 15:55:48 -0700 (PDT)
MIME-Version: 1.0
References: <404d2f5ec663128342541fa392a47226a46e5634.1663219530.git.objelf@gmail.com>
 <YyRCtrOtPqu2oEPj@kroah.com>
In-Reply-To: <YyRCtrOtPqu2oEPj@kroah.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Fri, 16 Sep 2022 15:55:36 -0700
X-Gmail-Original-Message-ID: <CAGp9Lzqyd0c0Aw6XSjsepKw_RsTawvbF512DvzaXisRxdYbMZA@mail.gmail.com>
Message-ID: <CAGp9Lzqyd0c0Aw6XSjsepKw_RsTawvbF512DvzaXisRxdYbMZA@mail.gmail.com>
Subject: Re: [PATCH 5.19] wifi: mt76: mt7921e: fix crash in chip reset fail
To: Greg KH <gregkh@linuxfoundation.org>
Cc: sean.wang@mediatek.com, stable@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Deren Wu <deren.wu@mediatek.com>, 
	Johannes Berg <johannes.berg@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_155555_019724_832FC29D 
X-CRM114-Status: GOOD (  13.29  )
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

Hi, Greg

On Fri, Sep 16, 2022 at 2:39 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Sep 15, 2022 at 01:32:35PM +0800, sean.wang@mediatek.com wrote:
> > From: Deren Wu <deren.wu@mediatek.com>
> >
> > commit fa3fbe64037839f448dc569212bafc5a495d8219 upstream.
>
> This is already in the 5.19.9 kernel release, right?  Do we need it
> again?

Ah, If so, we don't need it again. It seemed unavailable when I
submitted the patch. Sorry for bothering you.

    Sean

>
> thanks,
>
> greg k-h

