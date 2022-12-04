Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38645C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Dec 2022 20:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKviG0l7TUDz37Qqdid8G/FA6WnhkvY6eNdb5QDsL34=; b=LnDLSSWj5/nurQUalz/cgar1dn
	fJfB8c5Tal3s0CjmLxnkofuh7byTbwxA30BXr5XEu0EfR3Jpob694vwpfKIRsxcCUf2eQ9lclEdP9
	KFRuYp6f6ByHgJYXqZeT2wM/yhKBdVyOc+ucqNH5I5dMk3zVu6+pW6tp7e4A2aMmfZGqDDB4b7H6e
	EFjBydjMj7slSkeFrlmRh9tww6ARem5QJQ1FZJpENRQ6KutqCwemfTxqyeIo5xsgG142TbAAxAxzJ
	E4Sw4Vs/4HFQ2+V01w7hWAO78ZqPhr8C/70SJU9EaBve6bbQHfVFkPSaiDiSzaPIX2rCBE8FSmKA7
	zeUaZvpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1vCM-00B7lV-47; Sun, 04 Dec 2022 20:02:50 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1vCJ-00B7iW-M9
	for linux-mediatek@lists.infradead.org; Sun, 04 Dec 2022 20:02:48 +0000
Received: by mail-ej1-x630.google.com with SMTP id vv4so23212000ejc.2
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Dec 2022 12:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iKviG0l7TUDz37Qqdid8G/FA6WnhkvY6eNdb5QDsL34=;
        b=axNMmq1WXroii/XhJ4xM3ajgD0ifzuAwqYgUr9atJDe02FLz7wapj+u7PgG4rBs8Ko
         13Y+R0EGC1mrdTjvW0Caaj044p8zUPFsE5zRnlHsgp6QG7NZqQlypfM4r3otR4urLAAH
         98OmqCBJVRQVOu7/GqdOZ0h+ZlxhFlZfuwJqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKviG0l7TUDz37Qqdid8G/FA6WnhkvY6eNdb5QDsL34=;
        b=0Hgnf6jdtRVhY6mkmUWDFlgUu6MNxzyonGez6ju73iGSLcmMxMNXx/o3BlxLLAWv1h
         hyazSorribseXZF+8jEL9ZlEf34vriU+lx8Rct3dTs/w4Fdm0XM0+8TrT/g9FrwLqJVD
         TOBV7QEJ0Mqd5OuMJSOv8UCeD7LotS9AAxy3MZJpo3WCSPTtYTGWaP2ZF5uVIEm4tcSV
         /Y5qhOoOyKqE5Q+CnmAUixyg44dyzwpxzLnW8p5MugQvMsZ6DvOmDoJoCMhYoGMMBm9G
         VfviiOm0MiKspXg4r0NLkpjP+EtOWu9spj4hLB7GX4Nx/YuFyVE4fTaVOZojaTLnihpm
         7tOw==
X-Gm-Message-State: ANoB5pl+9+dgZtGnlqfD81FptZRhds3QZB1unEK6jn1wNAYbMwOWW59+
	s9Wg505hXNPJqQHvtMyxXdv7lyBqBBvLY8zNrT+gKw==
X-Google-Smtp-Source: AA0mqf4+NKcRQLFYvmgnlKpsVsDkUIBi/wj0qkGYtGxQl5MMPw8cMu9zqWCLywEvdB/EGoTRXoExZA0rBnq25guVhT4=
X-Received: by 2002:a17:906:c18c:b0:7b2:8a6e:c569 with SMTP id
 g12-20020a170906c18c00b007b28a6ec569mr68273173ejz.582.1670184160925; Sun, 04
 Dec 2022 12:02:40 -0800 (PST)
MIME-Version: 1.0
References: <20221101142410.31463-1-peter.wang@mediatek.com>
 <98bfafd3-c7b7-89b5-497a-aa694d0152dd@intel.com> <5e00ce60-3859-4964-11f7-e036f6dda56a@acm.org>
 <CAONX=-e1NA--3taTmfbUV+hR_LOSqvBqz_=1mPmYZWaKGGR=ig@mail.gmail.com> <c92655563231dd79ed6d4287d7d5bad4de142a18.camel@mediatek.com>
In-Reply-To: <c92655563231dd79ed6d4287d7d5bad4de142a18.camel@mediatek.com>
From: Daniil Lunev <dlunev@chromium.org>
Date: Mon, 5 Dec 2022 07:02:29 +1100
Message-ID: <CAONX=-d1Hiif9WFuGVQaMr7iUFxOpOSE7bkJriTrqh-Pvtdq0A@mail.gmail.com>
Subject: Re: [PATCH v1] ufs: core: wlun suspend SSU fail recovery
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>
Cc: "bvanassche@acm.org" <bvanassche@acm.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	=?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>, 
	=?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>, 
	=?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, 
	=?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>, 
	"jejb@linux.ibm.com" <jejb@linux.ibm.com>, wsd_upstream <wsd_upstream@mediatek.com>, 
	"avri.altman@wdc.com" <avri.altman@wdc.com>, 
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>, =?UTF-8?B?TGluIEd1aSAo5qGC5p6XKQ==?= <Lin.Gui@mediatek.com>, 
	=?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>, 
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, 
	"alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>, 
	=?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?= <Chaotian.Jing@mediatek.com>, 
	=?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?= <Powen.Kao@mediatek.com>, 
	=?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?= <Naomi.Chu@mediatek.com>, 
	=?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>, 
	=?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?= <Qilin.Tan@mediatek.com>, 
	"adrian.hunter@intel.com" <adrian.hunter@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_120247_742393_1BA2DCBE 
X-CRM114-Status: UNSURE (   9.30  )
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

> May I have a question, which dievce you use in this failure scenario?
> I think it is same issue due to SSU fail, and wlun devcie pm enter
> error state. So the cunsomer(scsi lu device) is block in suspend state
> and connot resume to reduce pm_only lead to IO hang.
>
> Thanks.
> BR
> Peter

I don't think it is device specific. I am pretty sure it is the same
problem, for it traces to the same origin and your patch fixes the
issue (though with a lot of log spam which is a bit unfortunate, but
we can live with that)

--Daniil

