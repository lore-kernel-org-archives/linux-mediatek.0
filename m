Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1454BCF34C1
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Oct 2024 20:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AG36nf1rYiXUdbFs0WlTEflFJlj370Ls1XeBc1Zv4x0=; b=LDfCGppWEfH0YL7ta8Xa9mKdId
	OL+MHu6hzK8IL2DufcLfzXhLMeFedZyoTULK2DALQJzT4Fy0V0kCzLWQ/XY5V+wwcIua0MRTmoTD+
	7BQDvCODW5fl+hnX6JVpqFatCBuMV1gqUcMrh8Dz8R0occUT2UOR9rcw2AYNK/4aoNtHgQHt+04jy
	a8ZF+C9fxcQw6eKiUyl5caRCCqkl+Iduewzp8Ynat/3oeQslzwh58tNkrc6HUJyawm4begCsLAP8N
	K0djzw/9AHyN/psth9NxqOf9V99yrmosOaJqCkVEB+8AumbbMQGZy2HSFRy2cX3knkheTbekl8Uq1
	AxI2yq5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swS25-0000000AG1I-3aon;
	Thu, 03 Oct 2024 20:02:41 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swS23-0000000AFz6-17Qi
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Oct 2024 20:02:40 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4XKMzJ4T7CzlgVnY;
	Thu,  3 Oct 2024 20:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1727985754; x=1730577755; bh=AG36nf1rYiXUdbFs0WlTEflF
	Jlj370Ls1XeBc1Zv4x0=; b=jtPM1p8BB0cNb1kg2vcbwn3E+A4342EPY0FFZ/TT
	sD527LYpAH7euUldE3lOkCfqSc28Q3GwHHA/AO6Yd9vHpdS0S3Wuv+vxNeOxW4Sg
	bZsrUrDH2OTMZQOfd2WBnE8WTeOgAsNBr0fdEOs0zqRVAud3NH7hCRfiokPA3r4F
	x75LzDH3OaXZZ44fxCf0sI1ri/igosnC5PSfYd6DZHjASMUlRZ9oiacayf0ODnwk
	nSYmJo1o8gsU1GWj7CwZvDrVobdlPLJk/CuVUa6A9j9jzL61hxviUr9eUpfXqAjC
	BeQ/RPN+4SfFqA+M3JzRzylwuTNr9bPBmNmOvOlNyWp+qg==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id zpEpykOPmGq6; Thu,  3 Oct 2024 20:02:34 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4XKMzF4ythzlgVnN;
	Thu,  3 Oct 2024 20:02:33 +0000 (UTC)
Message-ID: <e6e93ff1-cba1-45a9-b4b6-7dcbd7fca862@acm.org>
Date: Thu, 3 Oct 2024 13:02:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 2/2] ufs: core: requeue aborted request
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
References: <20241001091917.6917-1-peter.wang@mediatek.com>
 <20241001091917.6917-3-peter.wang@mediatek.com>
 <6aba27a2-d59b-4226-806b-4442cc26c419@acm.org>
 <69a77b95da27fa53104ee74ecae4e7da2d1547cf.camel@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <69a77b95da27fa53104ee74ecae4e7da2d1547cf.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_130239_343879_68560123 
X-CRM114-Status: GOOD (  10.02  )
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

On 10/2/24 5:42 AM, Peter Wang (=E7=8E=8B=E4=BF=A1=E5=8F=8B) wrote:
> This patch merely aligns with the approach of SDB mode
> and does not involve the flow of scsi_done. Besides,
> I don't see any issue with concurrency between
> ufshcd_abort_one() calling ufshcd_try_to_abort_task()
> and scsi_done(). Can you point out the specific flow where
> the problem occurs? If there is one, shouldn't SDB mode
> have the same issue?

Hi Peter,

Correct, my comment applies to both legacy mode and MCQ mode. From the=20
section in the UFS standard about ABORT TASK: "A response of FUNCTION
COMPLETE shall indicate that the command was aborted or was not in the=20
task set." In other words, if a command completes just before=20
ufshcd_try_to_abort_task() calls ufshcd_issue_tm_cmd(), then
ufshcd_try_to_abort_task() will call ufshcd_clear_cmd() for a command
that has already completed. In legacy mode, this call will succeed.
Hence, both ufshcd_compl_one_cqe() and ufshcd_abort_all() will call
ufshcd_release(hba). This will cause hba->clk_gating.active_reqs to be
decremented twice instead of only once. Do you agree that this can
happen and also that it should be prevented that this happens?

Thanks,

Bart.

