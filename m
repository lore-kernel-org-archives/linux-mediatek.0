Return-Path: <SRS0=J4iI=27=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 867FEC33CA2
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 07:09:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40A1E2072E
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2020 07:09:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TLNkAdMj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ayGQqiUW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40A1E2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VpzICekRVPnla34NiebhqFIdHyZ3gctJTzR2yUiJyMQ=; b=TLNkAdMj0LTeXt
	msR7QGnYi8LZj4gy3DV4XXgmpoewH5pdW2BM9HeT9+hLcyu/DhfQ53uS+zzwFPfiTisj0ebZ7kBaB
	1JjZtcdJweJtsau9gLce3GVPWzcnS00Ikifkg8kGlkpiyfJmNlSHx+mo2rw3KKs0CxouN0Kz7Buzg
	Dw2aJKtZXtbx3rnV5JHnBDAElC3CfGyFqoZcV8JsoMYiW82IxAe6ZLqNpFiCvF2xIbZS3KgOF28I6
	nDTyMQxOC7GquXdUL9qgha6qJcqYNVTZheBLQq7c6I0levAAcpevSqcRtRfT/+nGuUO6MDcLKTufa
	WdWd0T0rxgnEmxoGI1OA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipoQ0-0007JK-Fq; Fri, 10 Jan 2020 07:09:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipoPY-0006f6-0O; Fri, 10 Jan 2020 07:08:49 +0000
X-UUID: 051adf20a9ad47ed852432d33dddd02c-20200109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ffhcrwjsBwsjrgzkid/yOQ1liD4E9HyfxuER96MEH2g=; 
 b=ayGQqiUWEf6Ot02/A+ME7PCtwFS9rvCN3bTRfL5Ubp5cZC6itfr/vewvWrWfJlv4TTranHZvzva+GLM8V2yVLUcmvNhKFD47gN6joQoTzR/sLn2stuPzhKyaHM//434KpARA/T3FXhHRMdIB4lY+HI0yL1LHn78gVvHkIIKVBm0=;
X-UUID: 051adf20a9ad47ed852432d33dddd02c-20200109
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 618961714; Thu, 09 Jan 2020 23:08:44 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 9 Jan 2020 23:09:21 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 10 Jan 2020 15:07:43 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 10 Jan 2020 15:07:04 +0800
Message-ID: <1578640121.17435.7.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/2] scsi: ufs: pass device information to
 apply_dev_quirks
From: Stanley Chu <stanley.chu@mediatek.com>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 10 Jan 2020 15:08:41 +0800
In-Reply-To: <yq136cnx1yo.fsf@oracle.com>
References: <1578270431-9873-1-git-send-email-stanley.chu@mediatek.com>
 <1578270431-9873-2-git-send-email-stanley.chu@mediatek.com>
 <yq136cnx1yo.fsf@oracle.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200109_230848_107405_8A901C62 
X-CRM114-Status: UNSURE (   8.34  )
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
Cc: bvanassche@acm.org, linux-scsi@vger.kernel.org, andy.teng@mediatek.com,
 jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com, cang@codeaurora.org,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Martin,

On Fri, 2020-01-10 at 01:25 -0500, Martin K. Petersen wrote:
> Stanley,
> 
> > Pass UFS device information to vendor-specific variant callback
> > "apply_dev_quirks" because some platform vendors need to know such
> > information to apply special handlings or quirks in specific devices.
> 
> This doesn't compile. You missed adding the additional argument to one
> caller of ufshcd_tune_unipro_params().
> 

Sorry for this. I'll fix it in next version and try to separate vendor's
implementation and common driver to different commits if this is the
root cause of compile issue.

Thanks.
Stanley

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
