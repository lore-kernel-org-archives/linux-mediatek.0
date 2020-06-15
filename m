Return-Path: <SRS0=oIsV=74=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91E6DC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 15:54:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 681EA206DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2020 15:54:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t1wShur/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="qfbrfNL7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 681EA206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sPOFQD4XsDQes9eSLsI94r1oNhpgHy8c6ru1DS6P1Qo=; b=t1wShur/e5xSh1
	/2qAAnerEp3N8ZbjPEFOX05owX+1O1hxfuZdx7t4JuL/fLfJcBjcCvOfaKxqPshMToFiVE3+AbYMc
	pw8zIOjfTI7KhtSo+b2m8ciy+awVAvBnghBH9ezT3GHfyIhri+fZ5GDcORiq5gkyDH+NU3l8O722L
	hitQGEvjLcggq/7sk4PRSzlHRqYpPuoGXli9GrSME6tXg02J7ryd54vKCg5LJZlFJ6kXnJ1BlCOSS
	dFiox5+knMfB/7BvqMz4HzVGzGq3LL3dWo7IU7u2gOamzShkAQ+h23JUvXflXBkEXiuZebDmpTuPM
	UpOs5+hZiTPEPM359New==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkrRC-0000t9-9x; Mon, 15 Jun 2020 15:54:18 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkrR8-0008Kr-09
 for linux-mediatek@lists.infradead.org; Mon, 15 Jun 2020 15:54:17 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1592236456; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=vNGYViHvKwfV4DkQQ2FXTX/yCQmCfjasXlwoTH4y68U=;
 b=qfbrfNL7rh+ZGbYTcmuFiw9Jaj9v5mtPavRNEDyT1J4Rq4ixQNdjlDrWjTofHVcHpWtrjhbf
 owJjBFUm/fyqyvrmzGZl4k/ev2YbsqlEGm9c3kfFDIQ8tFIeFgH9rjD4hOkk0Hz5NSuvQyzF
 hQFEA9ISw3/oq5wwSkYTCwRduU8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ee799a1356bcc26ab4d8f48 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Jun 2020 15:54:08
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 48CA8C43391; Mon, 15 Jun 2020 15:54:08 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3879BC433C8;
 Mon, 15 Jun 2020 15:54:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3879BC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Re: [PATCH v3 1/4] mt76: mt7915: add missing CONFIG_MAC80211_DEBUGFS
References: <cover.1592158312.git.ryder.lee@mediatek.com>
 <2863c9a7e14c791202738597184f4a6b75d5bc07.1592158312.git.ryder.lee@mediatek.com>
Date: Mon, 15 Jun 2020 18:54:04 +0300
In-Reply-To: <2863c9a7e14c791202738597184f4a6b75d5bc07.1592158312.git.ryder.lee@mediatek.com>
 (Ryder Lee's message of "Mon, 15 Jun 2020 02:23:33 +0800")
Message-ID: <87sgewe34z.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200615_085416_263808_82CDCB2D 
X-CRM114-Status: UNSURE (   8.19  )
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
Cc: Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Ryder Lee <ryder.lee@mediatek.com> writes:

> Add CONFIG_MAC80211_DEBUGFS to fix a reported warning.
>
> Fixes: ec9742a ("mt76: mt7915: add .sta_add_debugfs support")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>

Same comments as in v2:

Fixes: ec9742a8f38e ("mt76: mt7915: add .sta_add_debugfs support")

Should this go to v5.8?

-- 
https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
