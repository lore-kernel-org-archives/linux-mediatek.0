Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD64C636D4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 17:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S+OnE5Otl4cKLCCRZAM92RTBgDsnX7rILCqnw0jQsUQ=; b=SLIWqBNQWVJi/64RrecAx9djwx
	t5CSX/JCP54wSSLt4L92noDvJC1XtEFersvMz89NKqfBSbcOhLPDMyVrYzu9moGvxXa/TW2d6hBwM
	vcGO/oxIaJZlkmddKj33QIjI5aiCq0Ef4+MqIlcvdfYVPNcP2Pkd1i8NTiqBe8LfRiTrGh9+C1A6O
	qmMkpHwtC+kMRJ3o6oc2wY2dbhxE2lH7vo1igNLKfjQ8P9DNZClSMrZQRPuRveDBMREQrna/9wC9h
	HquRO3I3wcKS3PzMGH/+x+ueMJ8eRwAYJ3XpF5IQ4ECE2jMIJObvp+kRfPDKQDRQ9eGZurJP7wxYo
	Gr547yew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLxn-006lb0-Tu; Wed, 15 Feb 2023 17:53:03 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSLxd-006lZh-P7; Wed, 15 Feb 2023 17:52:53 +0000
Date: Wed, 15 Feb 2023 09:52:53 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Po-Wen Kao <powen.kao@mediatek.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	wsd_upstream@mediatek.com, peter.wang@mediatek.com,
	stanley.chu@mediatek.com, alice.chao@mediatek.com,
	chun-hung.wu@mediatek.com, cc.chou@mediatek.com,
	chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
	mason.zhang@mediatek.com, quic_asutoshd@quicinc.com,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] scsi: ufs: core: Export symbol ufshcd_mcq_read_cqis()
Message-ID: <Y+0b9d+InjhKi7+H@infradead.org>
References: <20230215123750.15785-1-powen.kao@mediatek.com>
 <20230215123750.15785-2-powen.kao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215123750.15785-2-powen.kao@mediatek.com>
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 15, 2023 at 08:37:46PM +0800, Po-Wen Kao wrote:
> Export symbol for driver module

Which one?  We don't export symbols without an actual user.

