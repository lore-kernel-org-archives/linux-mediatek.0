Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D199C25B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 20:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YiqrRPa09XwcSO6dmunATjOVHB3FZKY8V49FUoXNpc=; b=MHIbJvRizspO9dNVH+dV7bnk6H
	Zo171c49ZfxYnUwOl3/3IK+OzNfDVsjJCVanBIF2LSTpwwyKIVDWgglbEt8SRZcxlU2ir35tMEySi
	5YoAMkYgvSAvDnUFtPdf9IXw2rTO2P9gf1izGYKaO4uTX35B3gpaIX8rYJ90PE+rvRpm3qrhRB6LS
	mDN9oxvy8nFL9B2qcXkL2IKHojPKj/fqOWfIUC6LAcBqmRB5kXapMC0XDeteCRslAqhrosWLoaPIQ
	OjlQMiWxGcJ8YC6IBEn0C7zYAnD6EqwqXTPxvaTF/Zxq0+555I2bpxElsF2+jWzKQHm79pzii1Irv
	3zkMspyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwTrd-00HCkD-0O;
	Fri, 27 Oct 2023 20:55:29 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwTra-00HCjl-3B;
	Fri, 27 Oct 2023 20:55:28 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1ca82f015e4so21886855ad.1;
        Fri, 27 Oct 2023 13:55:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698440125; x=1699044925;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YiqrRPa09XwcSO6dmunATjOVHB3FZKY8V49FUoXNpc=;
        b=BimmHIhy88w8/XJYtXTKA26sUPy0rAvdDo786qT3F3FnJ4+5LssKFpvEyj7pzapLNy
         vqcqz0FnDLdAq0fQansCLIyE94iXE0C0fEwTobRE0trZDdIOJPP8FCTZ2JDGgdv40UDO
         RrIYbWrl8sjMSYV8naarQCQEAaiLaV81vsNfxMP4sAv6axCdT86lGT1xRVJKTR8tu/Qf
         +fljHEhrbQqq5ZbqmNChHrSk2aQ1m+DHIDSOUuY7Cc611j+Idx+NdPbKQwf+9VJ5L0ym
         7io3YJig9LyCRuTAY0qB68l2BuuGMLmVI2YSb1NlN/EWBGCXo6cLWIUKkd5FsCAOD9r8
         rUWQ==
X-Gm-Message-State: AOJu0YxGgm1Bg6guSdR7+EZWF8qIM/mgtEk0XQO4FAwms7Lx9oL0Kbno
	cyqO0QCvEOCDcdm66QdA6kA=
X-Google-Smtp-Source: AGHT+IFNnAI4aHBm8o7jUz2CjwqbUusBVaJvM6IjEzdEXUT4v8V/PYR/KGKCPVaC1ihakvXkyE1mxg==
X-Received: by 2002:a17:90a:1954:b0:27d:98f3:21a5 with SMTP id 20-20020a17090a195400b0027d98f321a5mr3469818pjh.24.1698440124610;
        Fri, 27 Oct 2023 13:55:24 -0700 (PDT)
Received: from [192.168.51.14] (c-73-231-117-72.hsd1.ca.comcast.net. [73.231.117.72])
        by smtp.gmail.com with ESMTPSA id 30-20020a17090a01de00b002794fe14cabsm4068946pjd.12.2023.10.27.13.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 13:55:23 -0700 (PDT)
Message-ID: <a16dc8ba-ca3b-4dd6-a8b5-dbb3ac7a49a5@acm.org>
Date: Fri, 27 Oct 2023 13:55:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ufs: core: Add host quirk
 QUIRK_MCQ_EXPAND_QUEUE_SLOT
Content-Language: en-US
To: =?UTF-8?B?Q2h1bi1IdW5nIFd1ICjlt6vpp7/lro8p?= <Chun-hung.Wu@mediatek.com>,
 "ebiggers@google.com" <ebiggers@google.com>,
 "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "quic_asutoshd@quicinc.com" <quic_asutoshd@quicinc.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "Arthur.Simchaev@wdc.com" <Arthur.Simchaev@wdc.com>,
 "keosung.park@samsung.com" <keosung.park@samsung.com>,
 "mani@kernel.org" <mani@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "yang.lee@linux.alibaba.com" <yang.lee@linux.alibaba.com>
Cc: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 =?UTF-8?B?SmlhamllIEhhbyAo6YOd5Yqg6IqCKQ==?= <jiajie.hao@mediatek.com>,
 =?UTF-8?B?Q0MgQ2hvdSAo5ZGo5b+X5p2wKQ==?= <cc.chou@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?QWxpY2UgQ2hhbyAo6LaZ54+u5Z2HKQ==?= <Alice.Chao@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 =?UTF-8?B?Q2FzcGVyIExpICjmnY7kuK3mpq4p?= <casper.li@mediatek.com>,
 =?UTF-8?B?VHVuLXl1IFl1ICjmuLjmlabogb8p?= <Tun-yu.Yu@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 =?UTF-8?B?TGluIEd1aSAo5qGC5p6XKQ==?= <Lin.Gui@mediatek.com>,
 =?UTF-8?B?Q2hhb3RpYW4gSmluZyAo5LqV5pyd5aSpKQ==?=
 <Chaotian.Jing@mediatek.com>, =?UTF-8?B?UG93ZW4gS2FvICjpq5jkvK/mlocp?=
 <Powen.Kao@mediatek.com>, =?UTF-8?B?TmFvbWkgQ2h1ICjmnLHoqaDnlLAp?=
 <Naomi.Chu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?UWlsaW4gVGFuICjosK3pupLpup8p?= <Qilin.Tan@mediatek.com>,
 "kernel-team@android.com" <kernel-team@android.com>
References: <20231025085656.10848-1-chun-hung.wu@mediatek.com>
 <20231025085656.10848-2-chun-hung.wu@mediatek.com>
 <3056c6d8-1e54-4954-9141-e0760a0d935a@acm.org>
 <53d7d12bc12237e5f86522faf09876ab08ef7592.camel@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <53d7d12bc12237e5f86522faf09876ab08ef7592.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_135527_049796_0A6E9E03 
X-CRM114-Status: UNSURE (   9.55  )
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

On 10/26/23 20:27, Chun-Hung Wu (巫駿宏) wrote:
> From UFSHCI 4.0 spec "When the head and tail doorbells are equal, the
> queue is empty. *Nothe that this definition means there will always be
> one empty queue entry"
> One of our platform does not keep one empty queue
> entry for CQ full
> case, that's  why we need this patch to fix this corner case.

The UFSHCI driver should make sure that there is always one empty queue
entry. Does "platform" in the above text refer to the SoC that includes
the UFSHCI controller?

What is totally unclear to me is why the following code depends on the
UFSHCI controller type:

+		if (ufshcd_is_mcq_expand_queue_slot(hba))
+			hwq->max_entries = hba->nutrs + 1;
+		else
+			hwq->max_entries = hba->nutrs;

Shouldn't hwq->max_entries = hba->nutrs + 1 be used for all UFSHCI 4.0
controllers?

Thanks,

Bart.


