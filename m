Return-Path: <SRS0=HZpZ=FM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CEE2C4361B
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 06:23:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B51323A63
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Dec 2020 06:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B51323A63
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a3t2NxHGnv/bYLlXTHVh5dgegONk0KM48T16PWQTQIg=; b=DqBQKVsRoasaEK7zuTX3ADCKQ
	mSBCGYtZb5JYOdsFyiNiAG2boaIdU89J1wz7JgZsqVvI8Xhki8qHUnS9hL8Fx75oWxSmpOXaU6BoT
	gAmf+HsfSMus8nq/xiPifR6gVWN4SAEIKKqvg8jhZ+1iMigHQlts2sK2glmDH6qP1O3F5U2QWPrn+
	y/ncXu482qpaF3rx/3KxseBulZDXYhkJ16WvY4nM8LQpcIeooUmAyTOy1UQuDRe7dfYMjfVhEu1DP
	p6zxBHuNJtJNDV0ryO3IANFSu1PQWptrIWfwMtYM3t/XVHIZaRKaemYKC/LoTfW8aB0eTkhgwRJ2M
	nbh3NZZHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmWPV-0001U4-ML; Tue, 08 Dec 2020 06:23:41 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmWPS-0001Th-HY
 for linux-mediatek@lists.infradead.org; Tue, 08 Dec 2020 06:23:40 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1607408619; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=MY5jl5iQhbaMKsCtcmqzUA41XPaUXL7dxhgq0JknUYg=;
 b=W1iD2TuNdVLwYNOQiErQGKDbMU0av2rlqeHy1IhnNA+Yavp/mkFLu166pKipr2J5NZxHSKe6
 GAJQsSg8q/Bm+T2d7984vVD2SQoVW3wVB92gW8j78NYBRk7Uqvle4zh7KNLUbjpUHuD8xwjb
 tCxhl9GZ7AKM8u6dyzo4O/4EI0Q=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5fcf1bdbdc0fd8a3173bb4a5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 08 Dec 2020 06:23:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5C92AC43461; Tue,  8 Dec 2020 06:23:23 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 35094C433CA;
 Tue,  8 Dec 2020 06:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 35094C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Subject: Re: [PATCH] mt76: mt7915: fix "defined but not used" compiler warning
References: <20201203113210.16354-1-shayne.chen@mediatek.com>
Date: Tue, 08 Dec 2020 08:23:16 +0200
In-Reply-To: <20201203113210.16354-1-shayne.chen@mediatek.com> (Shayne Chen's
 message of "Thu, 3 Dec 2020 19:32:10 +0800")
Message-ID: <87im9c4y0b.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_012339_544142_4BF045F3 
X-CRM114-Status: GOOD (  12.13  )
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
Cc: linux-mediatek <linux-mediatek@lists.infradead.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Shayne Chen <shayne.chen@mediatek.com> writes:

> If CONFIG_NL80211_TESTMODE is not set, the following compiler warning
> appears:
>
> warning: 'mt7915_mac_tx_rate_val' defined but not used [-Wunused-function]
>
> Since mt7915_mac_tx_rate_val() is only used by
> mt7915_mac_write_txwi_tm(), merge them to get rid of this warning.
>
> Fixes: 3ac860a ("mt76: mt7915: implement testmode tx support")

Fixes line is wrong:

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches#fixes_line_is_incorrect

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
