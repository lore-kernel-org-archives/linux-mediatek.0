Return-Path: <SRS0=EyWE=O5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53CFEC433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Oct 2021 19:05:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E9D860F6E
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Oct 2021 19:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E9D860F6E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OuD3SZhhOQ/g3jIjfmFbJCL8FoqkS3lhBVd/+GkMiNM=; b=F+zMU8hhw4oXLd
	7Pap41e71wJrMJc/SRDA0sa+MX6MZvR5iTMpaijlxpqXEXEr351xn57x/Q14QY1ZRwS6OC8Q9bws0
	+b3vNEZ+CkAcLSpCjrF5cutOUMrh0jChot0omfQcsmYvvRzb9pqlk/EvpB+5kxn2IhXXI+6walV+F
	ttJLZZSoimdc0e4mAM+Yyz3eDu29yqWp26r8/Fpa8A5+vuQCBAR89Dy5gFMCt43EMHlwYHU/oK8wF
	/YgxSEvxwPJhgwczHnc4gUKp6Gcvlgxn/xdTGY8nC+1CJpEGUQ0jq4QOayLkaxUMXJeeHljRBHSNZ
	KLtT+rjF1mRtDptdXvhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZHeU-0061UP-Fo; Sat, 09 Oct 2021 19:04:58 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZHeL-0061PI-TR
 for linux-mediatek@lists.infradead.org; Sat, 09 Oct 2021 19:04:56 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633806294; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=gnNNeRV6yuM2PnnQ2KoPRyYnD88mgagT1XjcGE1UiZg=;
 b=oA+T+aIUv1V4roYuQzUe975sk/xMvsxfwoYwXZDzigdmUKLKWKpHBIBA4Utvzz2lCQjPncsA
 ItnFcaFt7iYclayAf618cidX3/6GPOxkQn0jfRVn3tOgmcnbMcDixqN6WKU+PQb2ktMkmbsT
 mljGCKe8BrWQfScW4Wjg4La9xZg=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6161e7c306052396891bf82d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 09 Oct 2021 19:04:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E088BC4360C; Sat,  9 Oct 2021 19:04:34 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EC053C4338F;
 Sat,  9 Oct 2021 19:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org EC053C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Shayne Chen <shayne.chen@mediatek.com>
Cc: Felix Fietkau <nbd@nbd.name>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Ryder Lee <ryder.lee@mediatek.com>, "Evelyn Tsai" <evelyn.tsai@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v5 6/8] mt76: mt7915: fix muar_idx in
 mt7915_mcu_alloc_sta_req()
References: <20211001095355.10598-1-shayne.chen@mediatek.com>
 <20211001095355.10598-6-shayne.chen@mediatek.com>
Date: Sat, 09 Oct 2021 22:04:30 +0300
In-Reply-To: <20211001095355.10598-6-shayne.chen@mediatek.com> (Shayne Chen's
 message of "Fri, 1 Oct 2021 17:53:53 +0800")
Message-ID: <87tuhq2f5t.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211009_120455_673886_5EBF4BD7 
X-CRM114-Status: UNSURE (   8.66  )
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

Shayne Chen <shayne.chen@mediatek.com> writes:

> For broadcast/multicast wcid, the muar_idx should be 0xe.
>
> Fixes: e57b7901469f ("mt76: add mac80211 driver for MT7915 PCIe-based
> chipsets")

Same here. Fixes tag on one line, no line wrapping.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
