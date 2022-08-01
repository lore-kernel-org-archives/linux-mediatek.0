Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E436EC00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 17:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4AGBIvqYGEc7iz46/rHoisPzKl94Z4nXzpK7XzD4ejo=; b=yevcKFVDxRO9Ax2IUh5IYMJzGb
	Fxh7zgullymylgtmMpOutGwGPR4Dq2Cje6OCew9XTYw+tXkvT44svPKFjA2Yz7KJNQF3m+2//2UN2
	ojeZXzGMDGRbJ23hbkpzC6hCQLCNKTmn5mYpQnn60RYFbHrh/ZXA3ygwDzsw/aEXRYhejvk/xUs6E
	ad+BOggNRun/nJay/lmkfwQtm1YHUPkqoe3Nda7DkEBGPLmWO+fx/8neEyuV4y/sJCgYWjzv0IR6x
	AwRr5xIa2QOj3KJoiQ6BoOYNOiGLq2f35YwvG033IsOQPOkXnqQGQAg16YcUC9q3L99H+GCbFN3h7
	YkE9vCng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIZf7-008R0a-5J; Mon, 01 Aug 2022 17:57:05 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIZf4-008QzX-Us; Mon, 01 Aug 2022 17:57:02 +0000
Date: Mon, 1 Aug 2022 10:57:02 -0700
From: Christoph Hellwig <hch@infradead.org>
To: peter.wang@mediatek.com
Cc: stanley.chu@mediatek.com, linux-scsi@vger.kernel.org,
	martin.petersen@oracle.com, avri.altman@wdc.com,
	alim.akhtar@samsung.com, jejb@linux.ibm.com,
	wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org,
	chun-hung.wu@mediatek.com, alice.chao@mediatek.com,
	cc.chou@mediatek.com, chaotian.jing@mediatek.com,
	jiajie.hao@mediatek.com, powen.kao@mediatek.com,
	qilin.tan@mediatek.com, lin.gui@mediatek.com
Subject: Re: [PATCH v1 0/2] ufs: allow vendor disable wb toggle in clock
 scaling
Message-ID: <YugT7jfkMGGvH7hO@infradead.org>
References: <20220728071637.22364-1-peter.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728071637.22364-1-peter.wang@mediatek.com>
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

Please fix up your wording.  A vendor can't do anything at all in Linux.
A driver might be able to disable things for a specific device, though.

