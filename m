Return-Path: <SRS0=m4qr=PB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979BCC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 07:48:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53F6C60E97
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Oct 2021 07:48:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53F6C60E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ccq0ELrcnCO0H4mPthIkdugCfifN/OWtXsL4AhHWnHE=; b=L5alk3xeEcUgUj
	eTiDiZ5DOb/qu/qSGPzjbkawU98FmSmCx7sQxr8FF2fIqSDnPk1ualquF1JC8HE0vLge3plW25Hre
	+Shw4FGnsxoXeYwcySbCSMeTXwIfkdpG8TUBG1yqV+MnD3TytNN5AI6TQow+m0hopmxD5uQ00UmPc
	hG2VO/WUlEm1Wt7inVsSdPzQByIXyetoLgJJI9FBeRKWJmNAnyXxwiAy2h4tzYHIJ5RZjXvMF35OK
	B7J6pdj4BijuKUyVRVVewEEzMMu1q/7/S7SrAgua0o3opwwMFd2mujHay91rhgkN60Oqo6HatyKFt
	ZE/dnu0i1bBhO8XcL6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maZ01-00FRdf-O3; Wed, 13 Oct 2021 07:48:29 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maXdp-00F8EM-Fu
 for linux-mediatek@lists.infradead.org; Wed, 13 Oct 2021 06:21:32 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634106091; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=V2OPHckyobktWQtuAc5EG+B1zGNtGj5+Sq6WwRx60r0=;
 b=WKBEh1qn0r9c03vtAAz+nlBeBrmqKDFbhnh62BSw8oBa8nXOSIG0MA6IVW+BDwkbgeK2QMwo
 0G/EFJGq2idbeNcCYk3qjWzSIn9i7BolCFICNVLKKO1ON5ICRP9U/at0P3zdvXlF0d9bhen+
 bIgaghipgmNr+Z4IuzFymt8Uyhc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 61667adfab9da96e64b59d92 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 13 Oct 2021 06:21:19
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B7C8EC43617; Wed, 13 Oct 2021 06:21:18 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 84B05C4338F;
 Wed, 13 Oct 2021 06:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 84B05C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] mt7601u: Remove redundant initialization of variable ret
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211007234153.31222-1-colin.king@canonical.com>
References: <20211007234153.31222-1-colin.king@canonical.com>
To: Colin King <colin.king@canonical.com>
Cc: Jakub Kicinski <kubakici@wp.pl>, "David S . Miller" <davem@davemloft.net>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163410607355.12983.9788871417859723671.kvalo@codeaurora.org>
Date: Wed, 13 Oct 2021 06:21:18 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_232131_448554_650F0DF5 
X-CRM114-Status: UNSURE (   9.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ret is being initialized with a value that is never read,
> it is assigned later on with a different value. The initialization is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Acked-by: Jakub Kicinski <kubakici@wp.pl>

Patch applied to wireless-drivers-next.git, thanks.

3e4beec5e679 mt7601u: Remove redundant initialization of variable ret

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211007234153.31222-1-colin.king@canonical.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
