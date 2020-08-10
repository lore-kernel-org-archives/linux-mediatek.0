Return-Path: <SRS0=/jeW=BU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA23C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 00:49:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AE8F2068F
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2020 00:49:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uOaswE5O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Xpd7aI0k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AE8F2068F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tFV7MdoFfBuYcQ/B1cC+R4/4KCE+3yKrXl1FhYKiABU=; b=uOaswE5OAcXB1Z+7186drEBS1
	2qaoFOlOoPGchfVlQmBw7l3cNGX4ksSMLZmAaUcVx0vFsoew6mk42yZLFLQSOsB+ohNJoffzVNac8
	s0wt/veYzqfDdXUWM6RmlAK/FSJ/zjzUbJhsbUZ6HpjNXf1FF2i510vPVyrCKs+5YQBeubW3aUOYL
	61zVRO/NCq8DdHCv5hhbEWPNfx8gGY2lov3uaNP/dJleuwzJzFX7JwdcC6ITkIecHE2tqb3lYNkGY
	+9zZ9B1X1x3d1FVPpGE36lTeiHGFoOVN2KHA+o3nm5kotsVNqq+LheaCjF+5GiLebr6tedqhiImjq
	vO9FYLM3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4vzt-0007tV-TT; Mon, 10 Aug 2020 00:49:05 +0000
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4vza-0007sH-PD
 for linux-mediatek@lists.infradead.org; Mon, 10 Aug 2020 00:49:01 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597020540; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=lyx1K9lvsEfHQhbp6wimBqGRqyqH8L3RTY/INOpfUXw=;
 b=Xpd7aI0k4WaGyF5kPZVvHEL4DDTL/0j6vRqvfbZSHsVZ5SJXHsNu5u3M+NOOZ2h0PRWVt3F5
 RdwdvCc3JepFqIz2Is2cyS1iSqmCoHAxmeMc8jcAW4zMJuLIij9yfiD9v70qJUcPwujvIyCG
 KYUZfst+w6LdBCSz7+q6ZR2k+IE=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-west-2.postgun.com with SMTP id
 5f3099493f2ce11020f58e09 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 Aug 2020 00:48:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 02581C433C9; Mon, 10 Aug 2020 00:48:09 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5A388C433C6;
 Mon, 10 Aug 2020 00:48:07 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 10 Aug 2020 08:48:07 +0800
From: Can Guo <cang@codeaurora.org>
To: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [9/9] scsi: ufs: Properly release resources if a task is aborted
 successfully
In-Reply-To: <cb9dbb7d-5515-0190-d336-be657e1ca31c@web.de>
References: <a752927b-dd9b-ebf0-8c77-e2ae0b2aa475@web.de>
 <fc5c328732792aca1dd451d0109f00b5@codeaurora.org>
 <cb9dbb7d-5515-0190-d336-be657e1ca31c@web.de>
Message-ID: <8082186eed74798a403f3e3cb80a1751@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200809_204900_770093_DAE66A89 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rajendra Nayak <rnayak@codeaurora.org>, Bart Van Assche <bvanassche@acm.org>,
 linux-scsi@vger.kernel.org, Saravana Kannan <saravanak@google.com>,
 "James E. J. Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Bao D. Nguyen" <nguyenb@codeaurora.org>,
 Avri Altman <avri.altman@wdc.com>, Mark Salyzyn <salyzyn@google.com>,
 linux-mediatek@lists.infradead.org, Hongwu Su <hongwus@codeaurora.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Bean Huo <beanhuo@micron.com>, Stanley Chu <stanley.chu@mediatek.com>,
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
 Asutosh Das <asutoshd@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Markus,

On 2020-08-10 02:00, Markus Elfring wrote:
>> Thanks, will fix these in next version.
> 
> Thanks for your adjustment of the proposed commit message.
> Should the corresponding patch be marked with an other version number?
> https://lore.kernel.org/linux-arm-kernel/1596975355-39813-10-git-send-email-cang@codeaurora.org/
> https://lore.kernel.org/patchwork/patch/1285629/
> https://lkml.org/lkml/2020/8/9/87
> 
> Should a cover letter be provided for such a patch series?
> 
> Regards,
> Markus

I am not sure if you got my mails, this patch is included in
a patch series with other 8 changes and they do have a cover
letter. Let me re-send them to you.

Thanks,

Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
