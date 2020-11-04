Return-Path: <SRS0=xu2G=EK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11F5BC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 16:39:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91FBA206D9
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 16:39:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1wiNJnHv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="R4k8pyrW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91FBA206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PaeynItjuRMQD4OB038FUVkfw+oHYW1ZJjVg0ca9DBI=; b=1wiNJnHvZJttCA8pi8nWPMoaO
	d35cUPYyRNBuy6BPYu4J0O7d8r1Ld6r7yptMlMFqH+JjcRAwsrIPoyeWQfjoNXadWy4f1R08Df47Z
	xkk42ny6Da2xy+LKyu4lkmrEVd0ykgnE1XcpsltLlWe1zwqWWDTfyip2Xufr+hTKoPMDpuXKaPDz1
	hQISGa+//Dls3lwKJE6H1uez22MboNNNrndY8RzlRNJhp2bkdvK0KgqhYI9RjcvtI0JTdD9xu2LYq
	9fJPu4iOmZuVem3Fsz5XzAiPMoPpboGYHMAzcQ7dmGlG8ES6PzfbRrEqxEXQ/FpDR5GR63hQ+zgot
	htGNXIFnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaLoT-0005at-Tw; Wed, 04 Nov 2020 16:39:10 +0000
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaLoO-0005Yp-Gr
 for linux-mediatek@lists.infradead.org; Wed, 04 Nov 2020 16:39:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604507945; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=9g6+PXG13MEnsnoHHUbWgt0A55tQ4uzH4x5CgIksaFs=;
 b=R4k8pyrW3lfAjzZTEpOeCNDMSdwHPqI13KKae2P8AkR+2IEp/I4OdlqsbilEGEnUgEolNLvk
 v+tFXl8bLIM6FkK8V+cHC3aOdhGhBh8T84ezADuxMHkC/5fxr2sobNMG932IQG+9PdfBIqCB
 Cpl++j0kYh2CC3UCjLQ8UWcKH64=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5fa2d926644f5c1b9488ecf7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 04 Nov 2020 16:39:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B6A77C433C8; Wed,  4 Nov 2020 16:39:01 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5F387C433C8;
 Wed,  4 Nov 2020 16:38:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5F387C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Allen Pais <apais@linux.microsoft.com>
Subject: Re: [PATCH v2 0/3] wireless: convert tasklets to use new
References: <20201007103309.363737-1-allen.lkml@gmail.com>
 <c3d71677-a428-f215-2ba8-4dd277a69fb6@linux.microsoft.com>
Date: Wed, 04 Nov 2020 18:38:56 +0200
In-Reply-To: <c3d71677-a428-f215-2ba8-4dd277a69fb6@linux.microsoft.com> (Allen
 Pais's message of "Tue, 3 Nov 2020 13:05:23 +0530")
Message-ID: <87blgdqdpb.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_113906_474711_1DF0C68B 
X-CRM114-Status: GOOD (  13.89  )
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
Cc: ryder.lee@mediatek.com, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
 davem@davemloft.net, lorenzo.bianconi83@gmail.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org,
 ath11k@lists.infradead.org, nbd@nbd.name
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Allen Pais <apais@linux.microsoft.com> writes:

>>
>> This series converts the remaining drivers to use new
>> tasklet_setup() API.
>>
>> The patches are based on wireless-drivers-next (c2568c8c9e63)
>
>  Is this series queue? I haven't seen any email. This is the last
> series as part of the tasklet conversion effort.

They are queued in linux-wireless patchwork, see the link below. I have
lots of patches pending but hopefully I'll tackle most of them soon.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
