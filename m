Return-Path: <SRS0=AnEI=KU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB02C2B9F7
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 03:25:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A41C61417
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 May 2021 03:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A41C61417
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SAt7Q9HDuh+uZYQbvN6AzK0TNN4aEyg4SKwNXAiAnuw=; b=cCSPD9mDh4ObIzFgVxaX8oi/U
	r+tWWUMSSb48vODaam/me4Do/c7hK08ky8SkLF7viNj/c8I66wYgpJmG+B/1hm/ztle/+1G8Yg4Z9
	WL2xjl1o4b3AElp/9Suk55EZfntI4uakvRhNOYGCw2BIIc1bfd1s7AaQ7yCr/Qv3HnPX/DPLF2DR0
	9fLiMxKHqZrh3EZ3/7h8xyC1bALUiUxnfv1xRNt8+u1FlT/fXJTvneyHyt6OXx7BYL2yxkHOSIEWD
	OWeFBhFGLZ820RgiyhitS65oPyMZ0254wpgY9w4Kco6GCi+8H4Oz44fyxfrE9GEaUUfdHYtuEI8wL
	CN2M0YqFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llNgu-0037ww-Pa; Tue, 25 May 2021 03:25:12 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llLxg-002m53-53
 for linux-mediatek@lists.infradead.org; Tue, 25 May 2021 01:34:28 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621906466; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=SXw/U+AQC0nvjNPVGNJlJ4LRDlKV1Sc2Sljl57kUfes=;
 b=Cg8vTfJ64xfP/QZvg+aVQgF0yzRPEJYZqu0kweztsW3aafPkghTpoQ2RjyO8Ab3ufrI0fV8G
 N3Te78crn9F/JUFTPCl7r/7Rtl2UtRrSw8B1bbj/si13Rob2sh+4QuFlebtU9tLOpmrXwFkX
 FPdg7/I09m4m0aS4SElm/nT3kBA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60ac541060c53c8c9dd6e755 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 25 May 2021 01:34:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0DD87C4360C; Tue, 25 May 2021 01:34:06 +0000 (UTC)
Received: from [192.168.8.168] (cpe-70-95-149-85.san.res.rr.com [70.95.149.85])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: asutoshd)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0DEFBC433F1;
 Tue, 25 May 2021 01:34:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0DEFBC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=asutoshd@codeaurora.org
Subject: Re: [PATCH v1 2/3] scsi: ufs: Optimize host lock on transfer requests
 send/compl paths
To: Bart Van Assche <bvanassche@acm.org>, Can Guo <cang@codeaurora.org>,
 nguyenb@codeaurora.org, hongwus@codeaurora.org, linux-scsi@vger.kernel.org,
 kernel-team@android.com
Cc: Stanley Chu <stanley.chu@mediatek.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Kiwoong Kim <kwmad.kim@samsung.com>, Satya Tangirala <satyat@google.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>
References: <1621845419-14194-1-git-send-email-cang@codeaurora.org>
 <1621845419-14194-3-git-send-email-cang@codeaurora.org>
 <41a08b3e-122d-4f1a-abbd-4b5730f880b2@acm.org>
From: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Message-ID: <d4ff8e1a-f368-6720-798a-a2a31a4d41fb@codeaurora.org>
Date: Mon, 24 May 2021 18:34:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <41a08b3e-122d-4f1a-abbd-4b5730f880b2@acm.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_183426_594811_22F32FD1 
X-CRM114-Status: GOOD (  21.03  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 5/24/2021 1:10 PM, Bart Van Assche wrote:
> On 5/24/21 1:36 AM, Can Guo wrote:
>> Current UFS IRQ handler is completely wrapped by host lock, and because
>> ufshcd_send_command() is also protected by host lock, when IRQ handler
>> fires, not only the CPU running the IRQ handler cannot send new requests,
>> the rest CPUs can neither. Move the host lock wrapping the IRQ handler into
>> specific branches, i.e., ufshcd_uic_cmd_compl(), ufshcd_check_errors(),
>> ufshcd_tmc_handler() and ufshcd_transfer_req_compl(). Meanwhile, to further
>> reduce occpuation of host lock in ufshcd_transfer_req_compl(), host lock is
>> no longer required to call __ufshcd_transfer_req_compl(). As per test, the
>> optimization can bring considerable gain to random read/write performance.
> 

> An additional question is whether it is necessary for v3.0 UFS devices
> to serialize the submission path against the completion path? Multiple
> high-performance SCSI LLDs support hardware with separate submission and
> completion queues and hence do not need any serialization between the
> submission and the completion path. I'm asking this because it is likely
> that sooner or later multiqueue support will be added in the UFS
> specification. Benefiting from multiqueue support will require to rework
> locking in the UFS driver anyway.
> 
Hi Bart,
No it's not necessary to serialize both the paths. I think this series 
attempts to remove this serialization to a certain degree, which is 
what's giving the performance improvement.

Even if multiqueue support would be available in the future, I think 
this change is apt now for the current available specification.

> Thanks,
> 
> Bart.
> 


Thanks,
-asd

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
