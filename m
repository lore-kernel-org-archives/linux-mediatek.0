Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E9E4C4363D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 07:16:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C012207C3
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 07:16:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f3QYrACJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="ULeyzyDq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C012207C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p7hQeD6Dn2quhsGlnycVniwrNabxYRa0HFxKdKYSBRI=; b=f3QYrACJfqam7yJr3wq1sOppk
	NuXUXDuLgRvCpW3zprRB8R2Gj3tV+uUAuTKU2iy4ZdGxcYedNGQ68BUw5303a1i1tiMFtkNdQIsnp
	556xzL47BH4Abr326fieNKGk96AVlKaNV+oqNdNgoqyebV153n1m/fRuwiAWwVG23C1o5kDNlJ7lI
	6MuOtaj0GEsmaPOJpjNTzrzACpuAORPa0fhM0gsmTvCXV4PxQYyWIEqFoLA21k+Q2FH+tjsISzLot
	KfAqcQJTzIXAqcUo7fV4MUV0tjspZBaofUNRviIRP+AurpAy1ijNO2g9YbNkmLfExR/saey8ONdX/
	gihI6dhXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKcWl-00040p-JH; Tue, 22 Sep 2020 07:15:51 +0000
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKcWZ-0003yY-Em
 for linux-mediatek@lists.infradead.org; Tue, 22 Sep 2020 07:15:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600758938; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=Igvi+O1HbdDI2YD9FdU7Tzqyhq3tr6voKpb7HHGUzi8=;
 b=ULeyzyDqwJb/ZoFKqbS/lSRHg9xvwdU6k2XfD3MToa+9Hxyejjj2J35gU/LI6KDewq6gU8Sf
 1lrtNY+tnIvH6bYmoMXzZa4DUDlqt9qa0V08FlPiiukrKTr8rTohtw5m6k4czUzShQ8XmVOa
 K1bOLIvmV39UsdUi2uGph4x6aB0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f69a49acb82ff92d18062c3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 22 Sep 2020 07:15:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5B107C433C8; Tue, 22 Sep 2020 07:15:37 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8AECDC433CB;
 Tue, 22 Sep 2020 07:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8AECDC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH -next v2] mt7601u: Convert to DEFINE_SHOW_ATTRIBUTE
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200919024838.14172-1-miaoqinglang@huawei.com>
References: <20200919024838.14172-1-miaoqinglang@huawei.com>
To: Qinglang Miao <miaoqinglang@huawei.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20200922071537.5B107C433C8@smtp.codeaurora.org>
Date: Tue, 22 Sep 2020 07:15:37 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_031539_579473_5A144E56 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
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
Cc: Jakub Kicinski <kubakici@wp.pl>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Qinglang Miao <miaoqinglang@huawei.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Qinglang Miao <miaoqinglang@huawei.com> wrote:

> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> Acked-by: Jakub Kicinski <kubakici@wp.pl>

Patch applied to wireless-drivers-next.git, thanks.

7f1e215b39cb mt7601u: Convert to DEFINE_SHOW_ATTRIBUTE

-- 
https://patchwork.kernel.org/patch/11786577/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
