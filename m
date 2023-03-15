Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1274EC61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 16:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQVN31/ZG7/x+XeNc2ngdIjnDeQwy3X1IRCFB33ra+w=; b=NSA0qB+A+gvF9/jGsvv/h6L0C6
	5LAfkcJtct91f7TUkKpJuXsMXv0cQl4vKtUzLPFwjE8SigA4jOTrpHxMn6YPjEHjUCGjaJGj9sTFe
	JVcnAGC7WHAY3C1OMvOc4mTb/IoXUGWpbXm1ugDplPLwKw3buyLwpOEkfFhD1dnCo6TGmCI2Lhh4r
	TcCVuIV6JcMeazN5hJusFhyyaLZXVmoDVjoBJwzob6D9SvOc1edF83DgK7ZnjV5B1aQHUTaI81vXh
	gNNqBvZPwKb1cMvIuSHTqJC37+Zl97fILqa1xBtX9LhhloNTaB9PWb6lbwWdFYwA4VzMsQzntyuMW
	XeUjzlyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcTYW-00DyrW-2e;
	Wed, 15 Mar 2023 16:00:48 +0000
Received: from mail-pl1-f182.google.com ([209.85.214.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcTYU-00DyqR-1Z;
	Wed, 15 Mar 2023 16:00:47 +0000
Received: by mail-pl1-f182.google.com with SMTP id i5so20557735pla.2;
        Wed, 15 Mar 2023 09:00:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678896045;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQVN31/ZG7/x+XeNc2ngdIjnDeQwy3X1IRCFB33ra+w=;
        b=dnztRv4/CT0PvRY2osQ5FvuovXC7v5A5By9LccCkMDRaLUZPR3+qoCvfU3oA/t68c5
         QKjAhXQUTy3rgo18xjGV7OaV6sagYFRn3BfAf1+N5rhGR+itp5KJYH5IWKK1sXIhlOeU
         TET26+n0yHFMuqgEICzyYGBj50QiMZon4APAuEybuk95DSn7R8Wfhx7SqiZpfpgdq70Y
         QEaFD3dsPVC1GXElDippKf22PKvpTxx4eUW5zZddoTNEQl3EugyNYm73P8E1OPll0W8L
         T3wc0myAjLfwK5hHFMCvaOSF49SPFs+ximN7U3ZHNK7QdDbEtlk/eHxwgakEN0vd+mVd
         aghQ==
X-Gm-Message-State: AO0yUKVUgHgqN4QPdwAnihAVXN4FjjgkzoMq09Kuxf9/uaz+ARmb+z3J
	blJTJZdSMrtWSkq+QXhEG+w=
X-Google-Smtp-Source: AK7set8BdX8Fe8k85n2Z3jqJ1O0mTTMQsVszTLXokxWqJ5N6GP4tZccoi4JKX9xBmWUbSzZSAQIA9Q==
X-Received: by 2002:a17:902:ea05:b0:1a0:6852:16e9 with SMTP id s5-20020a170902ea0500b001a0685216e9mr53645plg.14.1678896045413;
        Wed, 15 Mar 2023 09:00:45 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:558a:e74:a7b9:2212? ([2620:15c:211:201:558a:e74:a7b9:2212])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902c3c500b0019cb131b8a5sm3831614plj.32.2023.03.15.09.00.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 09:00:44 -0700 (PDT)
Message-ID: <565ed943-ac29-0bc0-17bf-3feb27fbb8e8@acm.org>
Date: Wed, 15 Mar 2023 09:00:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 5/5] scsi: ufs: ufs-mediatek: Add MCQ support for MTK
 platform
Content-Language: en-US
To: =?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?= <Powen.Kao@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?U3RhbmxleSBDaHUgKOacseWOn+mZnik=?= <stanley.chu@mediatek.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>
Cc: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
 =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
 <Naomi.Chu@mediatek.com>, =?UTF-8?B?TWFzb24gWmhhbmcgKOeroOi+iSk=?=
 <Mason.Zhang@mediatek.com>
References: <20230307065448.15279-1-powen.kao@mediatek.com>
 <20230307065448.15279-6-powen.kao@mediatek.com>
 <5d317f56-b1ba-e35a-a558-e462a70a4717@acm.org>
 <15ad91681f8f7981ff0be9702a3026ec6c0239e7.camel@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <15ad91681f8f7981ff0be9702a3026ec6c0239e7.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_090046_525610_E90D74A1 
X-CRM114-Status: GOOD (  10.95  )
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

On 3/13/23 20:29, Powen Kao (高伯文) wrote:
> We did not implement ESI at hardware level but per queue hw interrupt.
> Without disabling MCQ_CQ_EVENT_STATUS, there will be two interrupts,
> CQES (traditional interrupt) and CQ Tail Entry Push Interrupt (per
> queue hw interrupt), raised on a signle command arrival.
> 
> I wouldn't consider it as a bug, but different interrupt design.

I do not agree with adding the ufshcd_disable_intr() call in the 
MediaTek driver. Please move this call to UFS host controller driver 
core and add a quirk since the behavior described above does not comply 
with the UFSHCI 4.0 standard. See also include/ufs/ufs_quirks.h.

Thanks,

Bart.


