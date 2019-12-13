Return-Path: <SRS0=P2Dl=2D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BFDC43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 02:48:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 295FC2253D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 02:48:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Rdo2VwIS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Pa6pK6OD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 295FC2253D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RxKhHF+2XtjxR2GG+w4ZF26cDh1Ux0xe12lnNjTF5AM=; b=Rdo2VwISGTaEP5
	QcdbVdwfb7rEem5Pl4JfLqVZ8i1lFM0JkHcOoJPlib2lmvjP4+1jwSCkDWFGK/bPFhJPF6tLzQOQ1
	gx9M+LuLIyRxc6MUDn6Kq1u8bjmQCAK98AqJinOchJBC+AVMMpsyHCPddd4sMK62s6cfwXHDio4av
	0XJMtf6PTYv8qdMsqZ/NAYYzxIT4zYfFlHSGfHPzudzt/z1Szghu5Zdi/Q6BPMzGEmeGqqMuipD+S
	eD60nt7sejOlCBvqyms3dcEJ2GncvaivsqzEgV6tnMbLF66ElY5xva7Q8K+obCLitPPyULi4zDO7w
	Hf633KXd7FpCa/HkVcbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifb0C-0007hR-0l; Fri, 13 Dec 2019 02:48:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifb09-0007h4-Gf; Fri, 13 Dec 2019 02:48:22 +0000
X-UUID: 31dfb38d9d51427097b7ab674c1359e9-20191212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1mh7OPQCgMOBR1dvjtbiL2hG+rXyscvDOnW/uspS6Jg=; 
 b=Pa6pK6ODz4CZP0vPhpwf7QPrL+CysndJoTOGcw5+gVlbVxo5xLwIHVeS9gTek2XrE4N93R6TlMXZhiArWDall1mgvloG2emzEL0zE8TtuK/nHnqegsla0MLUV3Ujh/H2DJYLR8jaap1kk97tMYd9+6PgddmmYIIh3CWJAUgZ6tU=;
X-UUID: 31dfb38d9d51427097b7ab674c1359e9-20191212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 172248405; Thu, 12 Dec 2019 18:48:18 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 18:49:19 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 10:47:49 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 13 Dec 2019 10:47:36 +0800
Message-ID: <1576205295.12066.5.camel@mtkswgap22>
Subject: Re: [PATCH v1 0/2] scsi: ufs: fixup active period of ufshcd interrupt
From: Stanley Chu <stanley.chu@mediatek.com>
To: <linux-scsi@vger.kernel.org>, <alim.akhtar@samsung.com>,
 <pedrom.sousa@synopsys.com>, <avri.altman@wdc.com>
Date: Fri, 13 Dec 2019 10:48:15 +0800
In-Reply-To: <1575721321-8071-1-git-send-email-stanley.chu@mediatek.com>
References: <1575721321-8071-1-git-send-email-stanley.chu@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_184821_559898_F82A6118 
X-CRM114-Status: UNSURE (   6.16  )
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
Cc: martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear reviewers,

	Gentle ping for this patch set.

On Sat, 2019-12-07 at 20:21 +0800, Stanley Chu wrote:
> This patchset fixes up active duration of ufshcd interrupt to avoid potential system hang issues.
> 
> Stanley Chu (2):
>   scsi: ufs: disable irq before disabling clocks
>   scsi: ufs: disable interrupt during clock-gating
> 
>  drivers/scsi/ufs/ufshcd.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 

Thanks,
Stanley

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
