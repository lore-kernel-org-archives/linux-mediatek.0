Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6113C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 18:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0G9IXPR6Tw9u4K90d7Qyi37Gnq89rkjK88M8sdp4wcE=; b=0vIyK+sAcaEKHnE9wAKHdKinAa
	j2N/junO3UpjHOxgB6i1GD//TXAwTdnardDgsmyIAjOC9UvYG/DKpbLDaH1y7zaxPzRiJCPRsAUwI
	wmk3CUkCCm9StGHeumLlg6vXNxKGJZ/TIe2lG12+2MpGSXkvxIVfbpXoBAf6WfqcT4FT/L0x8ARbH
	Y30lYR9kf8gex3vwF3AJoFbRIDECQONawcaUyMEGO6FUTbnpm8RV2G9sLJTtyLNVCSdZ9GT7KLAIH
	GVUl7wFWYZYdvrGt9xzoYFmsRjPTwLmbG2SMphDMjag//RKvyb/RqEWMj9cnJ5Qe3LhNn0gD7U9g/
	FKXpeOPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEx0a-008ig0-3I; Fri, 22 Jul 2022 18:04:16 +0000
Received: from mail-pj1-f51.google.com ([209.85.216.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEx0Y-008ibe-50
	for linux-mediatek@lists.infradead.org; Fri, 22 Jul 2022 18:04:15 +0000
Received: by mail-pj1-f51.google.com with SMTP id b10so5007231pjq.5
        for <linux-mediatek@lists.infradead.org>; Fri, 22 Jul 2022 11:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0G9IXPR6Tw9u4K90d7Qyi37Gnq89rkjK88M8sdp4wcE=;
        b=OuA70JYG+lp4Rhe4njmgaLR927thedHJEOmlrcR3zGDRbmCppRZ5XWjY5lpKjLOqKu
         kZujpWrbi89XDp5KeDrmAVmecuOAq5kzVOpdKB81TbM/rzMWvz8PJRXbPPUZEhwMK4iN
         D6z6fVyGA3IaTfSxBELnjHHTGaHhFK2lIL7ec64RZ7js2vVt1XKNPUtnyPq7xeZYSuwm
         DXi5Wu9w5LlQyvpYlfp0ByZZUNhvVOhHDWipThzDY2K/USJVq+klKbkAiR69AvKg04DX
         N6+xiiLudmP7YMRHvzzchQKRqb29iAtzHN+oyyrzr1yYS8zsy6HeE9wnwGAKXZKatI5j
         Qqog==
X-Gm-Message-State: AJIora+pQnzIIhXupy7iupSdo9w5gBRNy3o2uGjN0/JRyr74KrFwE73L
	ATiTz6I6h+cp5dWxOyhuTBQ=
X-Google-Smtp-Source: AGRyM1tyRlpOkC9LR1tUTjXTsRZQTZG0ZPjBQfuTav4mfXobli6INpnif5GO02jqRhEpYNzQEGR3dQ==
X-Received: by 2002:a17:90b:4ac1:b0:1ef:c1ba:e73e with SMTP id mh1-20020a17090b4ac100b001efc1bae73emr18674775pjb.47.1658513051184;
        Fri, 22 Jul 2022 11:04:11 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:9cf6:7e29:d977:6fc7? ([2620:15c:211:201:9cf6:7e29:d977:6fc7])
        by smtp.gmail.com with ESMTPSA id a142-20020a621a94000000b0052b433aa45asm4247935pfa.159.2022.07.22.11.04.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 11:04:10 -0700 (PDT)
Message-ID: <54727af0-dc4b-fadb-5193-13ff4ecc48ef@acm.org>
Date: Fri, 22 Jul 2022 11:04:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1] scsi: ufs: correct ufshcd_shutdown flow
Content-Language: en-US
To: Peter Wang <peter.wang@mediatek.com>, stanley.chu@mediatek.com,
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com, avri.altman@wdc.com,
 alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com,
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, powen.kao@mediatek.com,
 qilin.tan@mediatek.com, lin.gui@mediatek.com
References: <20220719130208.29032-1-peter.wang@mediatek.com>
 <afb8d403-f8f5-5161-4680-ce2c3ae7787d@acm.org>
 <a71af42f-3b66-c0a1-c79d-a4573d0376fe@mediatek.com>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <a71af42f-3b66-c0a1-c79d-a4573d0376fe@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_110414_219207_E9610BFE 
X-CRM114-Status: GOOD (  10.89  )
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

On 7/20/22 21:30, Peter Wang wrote:
> On 7/21/22 5:40 AM, Bart Van Assche wrote:
>> On 7/19/22 06:02, peter.wang@mediatek.com wrote:
>>> From: Peter Wang <peter.wang@mediatek.com>
>>> Also remove pm_runtime_get_sync because it is unnecessary.
>>
>> Please explain in the patch description why the pm_runtime_get_sync() 
>> call is not necessary.
> 
> Because shutdown is focus on turn off clock/power, we don't need turn 
> on(resume) and turn off, right?
Hi Peter,

I think that removing the pm_runtime_get_sync() call is safe because the 
device driver core already performs a runtime resume before the UFS 
driver shutdown callback function is called. From drivers/base/core.c:

		/* Don't allow any more runtime suspends */
		pm_runtime_get_noresume(dev);
		pm_runtime_barrier(dev);

Thanks,

Bart.

