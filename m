Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8754C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 06:34:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59F0D206A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 06:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aX3cB12U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="GLCirnJ0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59F0D206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fxq2b52Xq5/AGhDukP4xM7UaNAxYW5D61GGHeJcYhjE=; b=aX3cB12UUdiG+xB+wfOHKKUon
	HX4bS42FVj53AQlhDaDq85a+cJQzrRJap4YNWqUZ4ndc1coYs3XJepP4SzQDdr6j3PqJ77CiksyQ5
	VYzD2ofij1d6QeE5+OwJCeYgdmYl4tyR+BpxE6C2x2QzLsaeSzMBsmiSnmAHUi12TmU05fXir8+e4
	g1SYTqL8JJBuZQUJbtfFZnN4LZOA7A5AZE9pPwkfS3ti3GOCHqXEFnBxF4PwXb/NFtw2mCrcib/eI
	eSSf6nPzxJtwO7y+wGHCny7IpXl/WJ8xUh06pyFglCB2uu0oT0WFu+m5w4EmhqDps5o8JpShUpTh1
	mS2wP1W/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIR1J-0001Rj-Fz; Wed, 16 Sep 2020 06:34:21 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIR1C-0001P3-KQ
 for linux-mediatek@lists.infradead.org; Wed, 16 Sep 2020 06:34:18 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600238057; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=prCtKq1R1zy4yEQC9e7arLt8v2FySSHVYD5hW893oqo=;
 b=GLCirnJ0kfuUnnyt7/f8LmtLMct8W60uLFKE66nekNUXfLDPj1BSOFZz5wrSUkKfNEEyQsgm
 c17hKmdOQr3E0uciG1/9S9f9DmUVDT/G5ZwdfVIMKi8+XhsZhZx0/mRfE/maNL7+pfIq7ANm
 nCMYxL0ymO6MdLemNDJGiqYrB8I=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5f61b1e2d2819a18464f19a1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Sep 2020 06:34:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 71B26C433C8; Wed, 16 Sep 2020 06:34:10 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B3651C433F1;
 Wed, 16 Sep 2020 06:34:08 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 16 Sep 2020 14:34:08 +0800
From: Can Guo <cang@codeaurora.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH v2 1/2] scsi: ufs: Abort tasks before clear them from
 doorbell
In-Reply-To: <yq1wo0u6bdw.fsf@ca-mkp.ca.oracle.com>
References: <1599099873-32579-1-git-send-email-cang@codeaurora.org>
 <1599099873-32579-2-git-send-email-cang@codeaurora.org>
 <1599627906.10803.65.camel@linux.ibm.com>
 <yq14ko62wn5.fsf@ca-mkp.ca.oracle.com>
 <1599706080.10649.30.camel@mtkswgap22>
 <1599718697.3851.3.camel@HansenPartnership.com>
 <1599725880.10649.35.camel@mtkswgap22>
 <1599754148.3575.4.camel@HansenPartnership.com>
 <010101747af387e9-f68ac6fa-1bc6-461d-92ec-dc0ee4486728-000000@us-west-2.amazonses.com>
 <d151d6a2b53cfbd7bf3f9c9313b49c4c404c4c5a.camel@gmail.com>
 <4017d039fa323a63f89f01b5bf4cf714@codeaurora.org>
 <yq1wo0u6bdw.fsf@ca-mkp.ca.oracle.com>
Message-ID: <149974f6d7073dae363797874fc088bf@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_023417_426525_151F369B 
X-CRM114-Status: GOOD (  12.18  )
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
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <huobean@gmail.com>,
 saravanak@google.com, linux-scsi@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, Bean Huo <beanhuo@micron.com>,
 nguyenb@codeaurora.org, ziqichen@codeaurora.org,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Avri Altman <avri.altman@wdc.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, salyzyn@google.com,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, rnayak@codeaurora.org,
 Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com,
 Bart Van Assche <bvanassche@acm.org>, hongwus@codeaurora.org,
 asutoshd@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-09-16 04:21, Martin K. Petersen wrote:
> Can,
> 
>> Do you know when can this change be picked up in scsi-queue-5.10?
>> If I push my fixes to ufshcd_abort() on scsi-queue-5.10, they will
>> run into conflicts with this one again, right? How should I move
>> forward now?
> 
> You should be able to use 5.10/scsi-queue as baseline now.
> 
> For 5.11 I think I'll do a separate branch for UFS.

Thanks for the information.

Regards,

Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
