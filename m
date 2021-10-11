Return-Path: <SRS0=oOjZ=O7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FDAC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 06:53:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C63260E9C
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Oct 2021 06:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7C63260E9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0hghDdDl8jxYgbUJR968dYUdLRofurZKDfShcEagU3w=; b=FSlBN82CxKhJfN
	qHwZ+5CTdWbMeA8yVifJZOH6y9UPMl9gP7ygdDV0PavjSGi0xg3zZmpHuGoEHo+JwQ4cNVPgwXowE
	GNzZ6mf2wH+dOl4BY4WPXLNXMKb9kx6IkLoiFvVAxzxw6jIfLX2z2m13e0flvMitq1bSAEjWACTpM
	xkoXGn04rccafK3pwZx0OSwlYi+rcmUjtGDo6l6gduWDucVd8tXGvYHs6wcO65F6nJDuoBMt0UdjT
	RuVpjk/Sq8bFd00u2y7M/tcxEZC774KMs0oYT1ABS7XFEBlzsRatbYAoyomHqfBL7sJBvvk15kDmo
	QqaCdgzjTpHbgfrI82gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZpBI-007zf7-IO; Mon, 11 Oct 2021 06:53:04 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZpBF-007zdw-Iv
 for linux-mediatek@lists.infradead.org; Mon, 11 Oct 2021 06:53:02 +0000
Received: by mail-wr1-x42b.google.com with SMTP id t2so52652950wrb.8
 for <linux-mediatek@lists.infradead.org>; Sun, 10 Oct 2021 23:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=xkZFpz7blKJwekeS5LX7/rnU72HuU26i3y9yTfo5Kts=;
 b=kjNBjwSb5adVo8P4uwzULmtx4hw83x8NoW1e3YyWwvnlWN5OsnTT31ZA2OYN4fEIgx
 bRAKLg7dVfvukvEcdUCexQtGL7ZiyDkzUlWxHGkGmnMCKxfenS/FIt0nEXN7IlEKGAq6
 2cDKb/Mb6H9lCR/FcEmBWQTMrqNRPFSqgjkL25d7C9XDREHLFR9GuucExIfKajv8+34E
 qPVj1z1Td6+Mp6PhVf2HO2aLn+i2aNiiLMPVCgxWShbZ1CuDEgnPI57d3IgeRRJBKS+1
 OcvKLIXCifC/6m8ZqPUd8hJ0IhSO7uq3A7IdjECS8roWKBkBkyYsTpTXRXnxbnDyQmQX
 fOcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=xkZFpz7blKJwekeS5LX7/rnU72HuU26i3y9yTfo5Kts=;
 b=x5T3FZvKCtGmnjBXhpwl/zW+q4jknJUGg+m2QYTuwZ+Gm9rVqvw8EIUKz98An5NPSj
 KpBG+SlUhPmAcS9zGNv2lEfYpHwC3G7P2WI6zEtAwB+7qfDPQ0/YCNLvRFyjNfQFIGFI
 6z94flvviCHkBYqwMApzCnRCWWv9R3Om/HuEQjRe7JxBirHJ9wSnkL6EzBiDFU001wq8
 eh5dHF2EBeGd41V191pQAbOrsvjJupCZljXDAi5OKiCjhiQ7fe4RZ2Ru0v81uDjwCI8Y
 KpsZqOwjAMCUFE3EudxHynMEQyZS6juzlhPnIeRTJJALpCIXfoGLecBnMSeMa8OGv9DK
 bcjg==
X-Gm-Message-State: AOAM530mSsDJS1ZX2G2+BmH80NPXKcxPgoejM/ZWOupkrTPz1wO6ebRQ
 RiBo/ghOCMBbOg+yUHU+avQ=
X-Google-Smtp-Source: ABdhPJw+jD/NjVISlPmQDNU5/YwPQ0nkzynUY3ux9uH2wt4zBsF0ppC/kgLSyvUV7U4zo9RQ586C3Q==
X-Received: by 2002:adf:a745:: with SMTP id e5mr22323297wrd.406.1633935179553; 
 Sun, 10 Oct 2021 23:52:59 -0700 (PDT)
Received: from p200300e94717cf90f2d50f07879b9054.dip0.t-ipconnect.de
 (p200300e94717cf90f2d50f07879b9054.dip0.t-ipconnect.de.
 [2003:e9:4717:cf90:f2d5:f07:879b:9054])
 by smtp.googlemail.com with ESMTPSA id l2sm6979550wrw.42.2021.10.10.23.52.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Oct 2021 23:52:59 -0700 (PDT)
Message-ID: <9786cf49c8edaf9b298c26a057af39865374c9d5.camel@gmail.com>
Subject: Re: [PATCH v4] scsi: ufs: support vops pre suspend for mediatek to
 disable auto-hibern8
From: Bean Huo <huobean@gmail.com>
To: peter.wang@mediatek.com, stanley.chu@mediatek.com, 
 linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 avri.altman@wdc.com,  alim.akhtar@samsung.com, jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com, 
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 powen.kao@mediatek.com,  jonathan.hsu@mediatek.com, qilin.tan@mediatek.com,
 lin.gui@mediatek.com,  mikebi@micron.com
Date: Mon, 11 Oct 2021 08:52:58 +0200
In-Reply-To: <20211006054705.21885-1-peter.wang@mediatek.com>
References: <20211006054705.21885-1-peter.wang@mediatek.com>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211010_235301_684231_06282E13 
X-CRM114-Status: UNSURE (   8.80  )
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

On Wed, 2021-10-06 at 13:47 +0800, peter.wang@mediatek.com wrote:
> From: Peter Wang <peter.wang@mediatek.com>
> 
> 
> 
> Mediatek UFS design need disable auto-hibern8 before suspend.
> 
> This patch introduce an solution to do pre suspned before SSU
> 
> (sleep) command.
> 
> 
> 
> Signed-off-by: Peter Wang <peter.wang@mediatek.com>
Hi Peter,
Looks like the older version of MTK UFSHCI driver also needs this
patch. Probably fix tag is needed. 


Reviewed-by: Bean Huo <beanhuo@micron.com>

Kind regards,
Bean


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
