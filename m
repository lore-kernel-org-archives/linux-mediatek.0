Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D2CC4708F
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 02:55:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40959613F0
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 02:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40959613F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YrgG+WnVmIT4wOhtQ4T0JjSemYRpXMzt00CEnPscZ8s=; b=sG0QSaOWtCad/l
	tmhZkVFlij0ZCewE2LTQe0vI4kHropfdIXm3m2h1GgZqUVr9pcSpeu9/fP4L3tKKCN59QzxMPYetD
	gUIFkjl+E3rAW6FxJrWoqHln/iVNHNXBWfXewn2Sl0YRQ0ol4jTS67BDfU4dJ4bV0WOVheoJuphdc
	97Gb7nmWU0LuRTyDhED+4Lv8GVqhoiojsq7Wxz0VegXkb7CgtJ/HoBHyGnWXMUQv9vF+QRZ0RNaE5
	UouOkt1qwVLjCgwipnmg7f/xkoHnP/hj0oD1nuQ5BvmqhzHHzqGMLHKAKfTnOkogykhy1dYdOI5/q
	DBBRDZW6Deq7gmzlJ6UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lodW9-006sZt-JP; Thu, 03 Jun 2021 02:55:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lodVw-006sVM-9z; Thu, 03 Jun 2021 02:55:21 +0000
X-UUID: 2ac94e8c6e4a42db89e74a0e311aaae8-20210602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pihTp1DwQK+HeV7mk+RNkiNU9/T3ejwlYv/tON4uSVU=; 
 b=ieEmxwKjNUceQFQuAko3dVpAAXfzArtqn9d7A5DL4H4e+OIV+wWWrGWlmAELLRhgPiknOVjBhKGELcdFOqh7C5VEJOIhoB/ZuXGE/b9p40ADMvFtHZ0JBfo8naVIyqgOhX55XzXl/WGWgI/m/72WlVL4IR5Jo8OyI83hy7JXI0I=;
X-UUID: 2ac94e8c6e4a42db89e74a0e311aaae8-20210602
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1599591431; Wed, 02 Jun 2021 19:55:13 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 19:55:12 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 3 Jun 2021 10:54:59 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 3 Jun 2021 10:54:59 +0800
Message-ID: <1622688899.7096.7.camel@mtkswgap22>
Subject: Re: [PATCH v1 3/3] scsi: ufs: Utilize Transfer Request List
 Completion Notification Register
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
CC: <asutoshd@codeaurora.org>, <nguyenb@codeaurora.org>,
 <hongwus@codeaurora.org>, <linux-scsi@vger.kernel.org>,
 <kernel-team@android.com>, Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman
 <avri.altman@wdc.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin
 K. Petersen" <martin.petersen@oracle.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>, Jaegeuk Kim
 <jaegeuk@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Kiwoong Kim
 <kwmad.kim@samsung.com>, Satya Tangirala <satyat@google.com>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Caleb Connolly <caleb@connolly.tech>, "open
 list" <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek
 SoC support" <linux-mediatek@lists.infradead.org>
Date: Thu, 3 Jun 2021 10:54:59 +0800
In-Reply-To: <1621845419-14194-4-git-send-email-cang@codeaurora.org>
References: <1621845419-14194-1-git-send-email-cang@codeaurora.org>
 <1621845419-14194-4-git-send-email-cang@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_195520_384956_ADFC1A0A 
X-CRM114-Status: GOOD (  12.30  )
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

Hi Can,

On Mon, 2021-05-24 at 01:36 -0700, Can Guo wrote:
> By reading the UTP Transfer Request List Completion Notification Register,
> which is added in UFSHCI Ver 3.0, SW can easily get the compeleted transfer
> requests. Thus, SW can get rid of host lock, which is used to synchronize
> the tr_doorbell and outstanding_reqs, on transfer requests dispatch and
> completion paths. This can further benefit random read/write performance.
> 
> Cc: Stanley Chu <stanley.chu@mediatek.com>
> Co-developed-by: Asutosh Das <asutoshd@codeaurora.org>
> Signed-off-by: Asutosh Das <asutoshd@codeaurora.org>
> Signed-off-by: Can Guo <cang@codeaurora.org>

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>


> +++ b/drivers/scsi/ufs/ufshci.h
> @@ -39,6 +39,7 @@ enum {
>  	REG_UTP_TRANSFER_REQ_DOOR_BELL		= 0x58,
>  	REG_UTP_TRANSFER_REQ_LIST_CLEAR		= 0x5C,
>  	REG_UTP_TRANSFER_REQ_LIST_RUN_STOP	= 0x60,
> +	REG_UTP_TRANSFER_REQ_LIST_COMPL		= 0x64,
>  	REG_UTP_TASK_REQ_LIST_BASE_L		= 0x70,
>  	REG_UTP_TASK_REQ_LIST_BASE_H		= 0x74,
>  	REG_UTP_TASK_REQ_DOOR_BELL		= 0x78,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
