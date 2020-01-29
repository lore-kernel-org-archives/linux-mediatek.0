Return-Path: <SRS0=1JTW=3S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E33BC33CB2
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 07:52:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5238B206A2
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jan 2020 07:52:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZP0XfF7C";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zpEMqlQP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5238B206A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRoTc8Dt06RUZbtsNih73oDMJsvkd7lnaMnky7Xcsxw=; b=ZP0XfF7CrJy0wD
	hKhUWi8qdtlcg8qcntSdkmtZxEaEiN4rxtgFNExMZe/eBuIBFXlcowFiZ9UynFHXFL/vv2oirm0yj
	4p0hz6wLkXMVlWEXjLNdjeG+PDLtUmRyVyLPxGrlTPFMPLiuEBU0p+N2FZXdUOOhvTNOBOIJ4rRt3
	5I4Aryrt8oZDkVioLAMSaKddboY3tzsmAS9PxUG/5oZzVt9Y9INkk/kt4o9wQpABKhVzYzJOwfutF
	l2TBkWaJInRVCyyVm2Ivczsyr5B1ywlyBXl6Ws7SjJsVQmNKV7NARJMkTMPV6SrdM5DLdjTcmBDIe
	tD6DQojO22Dj+SHYGpbw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iwi9Q-00073a-Lr; Wed, 29 Jan 2020 07:52:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iwi9F-0006uN-Vp; Wed, 29 Jan 2020 07:52:31 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0F142206A2;
 Wed, 29 Jan 2020 07:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580284349;
 bh=E2gB8/IVYfzCG8u8xgT7bImHIwd51ldFMW6eqcDAvb8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=zpEMqlQPSjBfOuVeijexexAZ9NASLTff4lkKWYeLMj2eifuhCGX5PwFMaGR4y2CPN
 aNlRnZ8y5WAxFXJQmoS8HZhO5grNJvzsU56p4fNU+DUnOLNCh9A3WQD/SoO3wpnvp9
 VBG3y7lR3zfoDKkVTGQNRu7/EgeGh3GV1ySWfaZs=
Date: Wed, 29 Jan 2020 08:52:25 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Stanley Chu <stanley.chu@mediatek.com>
Subject: Re: [PATCH v3 3/4] scsi: ufs: fix Auto-Hibern8 error detection
Message-ID: <20200129075225.GA3774452@kroah.com>
References: <20200129073902.5786-1-stanley.chu@mediatek.com>
 <20200129073902.5786-4-stanley.chu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200129073902.5786-4-stanley.chu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200128_235230_044163_DEE33094 
X-CRM114-Status: UNSURE (   7.70  )
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
Cc: linux-scsi@vger.kernel.org, martin.petersen@oracle.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, avri.altman@wdc.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, asutoshd@codeaurora.org,
 bvanassche@acm.org, linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jan 29, 2020 at 03:39:01PM +0800, Stanley Chu wrote:
> Auto-Hibern8 may be disabled by some vendors or sysfs
> in runtime even if Auto-Hibern8 capability is supported
> by host. If Auto-Hibern8 capability is supported by host
> but not actually enabled, Auto-Hibern8 error shall not happen.
> 
> To fix this, provide a way to detect if Auto-Hibern8 is
> actually enabled first, and bypass Auto-Hibern8 disabling
> case in ufshcd_is_auto_hibern8_error().
> 
> Fixes: 8217444 ("scsi: ufs: Add error-handling of Auto-Hibernate")

This should be:
Fixes: 821744403913 ("scsi: ufs: Add error-handling of Auto-Hibernate")

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
