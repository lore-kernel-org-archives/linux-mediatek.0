Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253E4C5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 08:53:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97B85241A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 08:53:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yvExRoOx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="kt4lAFIl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97B85241A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Wr02Rj0pOhpsnX72Qb4O2AXbyB4CLlyIRsfZ4nc7ssE=; b=yvExRoOxfdYM2eg8VgdjeB12R
	ItZzbIQIWqt5XmMllHLwKXT3yBak8A887PLSxWG+n+R8xVc5FpGsjPWW3n/ssmMqaUTE8iOZtSG9D
	V6wsvzFdqmiP4LlkY7g6oUD0eu9L2Ez6N1gzTU5Ak3oDIll+5T6bmugxVoMntWadg6kzHdThFYVZX
	YW8+W1SFoYVJhzhl/1ay7szHphqpM81GeoRsqpKfKHnpN7B/VEdQQe1d1U4gMqok+zRURCsna51ad
	uaTiGCnVgstb9GJFNJ+T8bKcVQCaejueq/M0UO8wXAnGpqnpO5Bh3rM3tc4ZDvj3fWqP7MMgPzpZ8
	fRwnMvi2g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJDf-0002FX-RY; Wed, 18 Nov 2020 08:53:39 +0000
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJA1-0000Re-2c
 for linux-mediatek@lists.infradead.org; Wed, 18 Nov 2020 08:50:02 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1605689390; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8ubPeUbv9nGA17bHuaYj4qnBJnm2N8KJxhb4W1TPD4Q=;
 b=kt4lAFIlhIAV/BLCURWuhUdgeTZLDscj/156/6RVmlBycSq4pF/gkr19kG10IhJqqRNUwcY4
 j/lV0RkIqkNesWjK9Xp0bnfK6NUfbAhK3HKaGZxt/XGZF8KblHkNHCUDq98iZmpk0tD37Gqx
 PQlyQgpqddA+FjHYS9c3Ww50ivk=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5fb4e02df34fcfd5e592f4ca (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 18 Nov 2020 08:49:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id CFCE1C43461; Wed, 18 Nov 2020 08:49:48 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 05AF5C433C6;
 Wed, 18 Nov 2020 08:49:47 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 18 Nov 2020 16:49:47 +0800
From: Can Guo <cang@codeaurora.org>
To: Bart Van Assche <bvanassche@acm.org>
Subject: Re: [PATCH RFC v1 1/1] scsi: pm: Leave runtime resume along if block
 layer PM is enabled
In-Reply-To: <6d774277-b055-6924-cf2d-01e874ac3f7b@acm.org>
References: <1605249009-13752-1-git-send-email-cang@codeaurora.org>
 <1605249009-13752-2-git-send-email-cang@codeaurora.org>
 <97dea590-5f2e-b4e3-ac64-7c346761c523@acm.org>
 <20f447a438aa98afb18be4642c8888b3@codeaurora.org>
 <6d774277-b055-6924-cf2d-01e874ac3f7b@acm.org>
Message-ID: <3d58c7a1971bbb2895a30122255ed2e1@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_034953_301566_F8B06547 
X-CRM114-Status: GOOD (  15.40  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, linux-scsi@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, nguyenb@codeaurora.org,
 ziqichen@codeaurora.org, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, salyzyn@google.com,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com,
 hongwus@codeaurora.org, asutoshd@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bart,

On 2020-11-18 12:38, Bart Van Assche wrote:
> On 11/15/20 5:42 PM, Can Guo wrote:
>> Actually, I am thinking about removing all the pm_runtime_set_active()
>> codes in both scsi_bus_resume_common() and scsi_dev_type_resume() - we
>> don't need to forcibly set the runtime PM status to RPM_ACTIVE for 
>> either
>> SCSI host/target or SCSI devices.
>> 
>> Whenever we access one SCSI device, either block layer or somewhere in
>> the path (e.g. throgh sg IOCTL, sg_open() calls 
>> scsi_autopm_get_device())
>> should runtime resume the device first, and the runtime PM framework 
>> makes
>> sure device's parent (and its parent's parent and so on)gets resumed 
>> as
>> well.
>> Thus, the pm_runtime_set_active() seems redundant. What do you think?
> 
> Hi Can,
> 
> It is not clear to me why the pm_runtime_set_active() calls occur in 
> the
> scsi_pm.c source file since the block layer automatically activates
> block devices if necessary. Maybe these calls are a leftover from a 
> time
> when runtime suspended devices were not resumed automatically by the
> block layer? Anyway, I'm fine with removing these calls.
> 
> Thanks,
> 
> Bart.

Yes, I agree with you. Let me test the new patch (which removes all the
pm_runtime_set_active() calls) first, if no issue found, I will upload
it for review.

Thanks,

Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
