Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E53E7E654
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 18:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xl1U0WnWv7CVK/dI95lm23Xs7owtUtSpF/m8xxdGys4=; b=A6tymTabDYPFWGO6mnldead700
	8Ac8pBAooZerOYCBM6DVVPeJgtXGUcKj6r9F/0S2fbEwfXMdy4XOZuhV4tXVyTMGUfKiSQ4ib1d9y
	6EKwCETplQrZYoyCbiT1ZCBfzceBcdyUj4LO/ntseQx/A/hLvhi4R407gYKHK3wERWtnJJbR4vEVd
	mRmaDcQJGUU/GU6kZsrObzsJZt6S5F8o0tjPLizH8DQ4famLHxnKlXeZIbsvSd6epMSz1vd5lsrKT
	I2pVZzY1q6ICuzhFpOsUiO1pzqx7qgW8hc7SyZG6nYDTxzaBQj7cwiTmAfkZCWX8gjlqpbkaQaPEM
	jnNCc7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlClJ-00GqKQ-1u;
	Tue, 26 Sep 2023 18:26:21 +0000
Received: from mail-pl1-f181.google.com ([209.85.214.181])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlClH-00GqK3-07
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Sep 2023 18:26:20 +0000
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c60f1a2652so39202215ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Sep 2023 11:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695752774; x=1696357574;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xl1U0WnWv7CVK/dI95lm23Xs7owtUtSpF/m8xxdGys4=;
        b=cTmFI/nBMf2nvEeMushzV60bQEaUspd+qG16xldDGSDRtgdIol9xexb+v/goJZEGqN
         nkoxqJR88+1ft4GK5ZedrQ/UsN7/TO6c1dZhNO7LdziPBYpb6W/WEbIR2ir5ayUOKn4f
         aKAszTTFYebiaXi7TsdtP7+EOYOMBgdyskTJ2mKNSDtIhcvb5wF3JASNkqq4rqfjHmEz
         /qaf47E1savNNQvPMJV9w0NlvDF1UgvI3OjMypC85gb1xtrFrAvhucr1SuX1mNZx9GcI
         GSC6rEh3VITqUGX9aojwNhJVCkZG2rAIvi/VNVKHSom4Jjmzt3NDQgn/C4ooq6o/vDBo
         39Tw==
X-Gm-Message-State: AOJu0YwkCPYmOJ5dERXD/w4ZLR4ZEkbRs/LK11VlSa7QQxPBxE7DJN1g
	vHBeTlzDIH7OK0WLv69yw88=
X-Google-Smtp-Source: AGHT+IHYrJdQUDHx73OhSRD/F+JxB8wOjiVoxbN8uwCENvyv7D/uar47pmna4KdPc3Yjpg2msFVYrg==
X-Received: by 2002:a17:902:d490:b0:1b8:a67f:1c15 with SMTP id c16-20020a170902d49000b001b8a67f1c15mr5965201plg.25.1695752773586;
        Tue, 26 Sep 2023 11:26:13 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:a80d:6f65:53d4:d1bf? ([2620:15c:211:201:a80d:6f65:53d4:d1bf])
        by smtp.gmail.com with ESMTPSA id e3-20020a17090301c300b001b531e8a000sm11312541plh.157.2023.09.26.11.26.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 11:26:13 -0700 (PDT)
Message-ID: <b89fbc92-987a-4a08-95a3-060b26393097@acm.org>
Date: Tue, 26 Sep 2023 11:26:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] ufs: core: wlun send SSU timeout recovery
Content-Language: en-US
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>
Cc: "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
 =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>, =?UTF-8?B?TGluIEd1aSAo5qGC5p6X?=
 =?UTF-8?Q?=29?= <Lin.Gui@mediatek.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, =?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?=
 <Powen.Kao@mediatek.com>, =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
 <Naomi.Chu@mediatek.com>, =?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?=
 <Qilin.Tan@mediatek.com>
References: <20230922090925.16339-1-peter.wang@mediatek.com>
 <10bf17cf-8a92-469b-bc5c-1f0dba0ed5ed@acm.org>
 <39e0a8b6d6f235dfa7dd36a4436c9eac5ab5210e.camel@mediatek.com>
 <98f256e3-72f7-48cf-8d25-58781d7051fa@acm.org>
 <93ea4b18ddb010547d3170c73403b3e9985795f4.camel@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <93ea4b18ddb010547d3170c73403b3e9985795f4.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_112619_095113_B56CE442 
X-CRM114-Status: UNSURE (   5.49  )
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

On 9/26/23 03:23, Peter Wang (王信友) wrote:
> Yes, but ufshcd_err_handler will wait runtime pm resume to actvie if
> concurrently run with runtime suspend or resume.
> (ufshcd_err_handler -> ufshcd_err_handling_prepare ->
> ufshcd_rpm_get_sync)
> So, if runtime suspend or resume send SSU timeout, scsi error handler
> stuck at this function and deadlock happen.
> The ideas is, if runtime pm flow get error, do ufshcd_link_recovery is
> enough.

Thank you for having provided this clarification.

Bart.


