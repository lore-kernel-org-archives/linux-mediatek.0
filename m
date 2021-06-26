Return-Path: <SRS0=XU5C=LU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0039BC49EA6
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 11:42:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E2BE61920
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 11:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E2BE61920
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tv2OQsbc+jBRpCd48L8OxyFZ6h3j+XdbPGdJoAAvlgY=; b=02SO4aH8JRhkZjbp0gIkoMEUZv
	xz6dIcsUtIwifbfiRWxOiAeOOdqZo9EAUHLh6GSIackrR+SgKP4yD4PUY2T/rCzbFW4TzM5qDejvT
	d5RNnEwEjYMhNnwZsslqVca5ZLOATctLJ8fFgfe1z9nqs50jlR57gMOCJ9toI/aWFpJ9U/QqYg7+n
	lm+XWVPMN5/32q4ICDDi6Ne2qAK7EiCXfbO/aznn2VNhnkAbn60cQXL439EVcaPDb/4/hvQE9Moqb
	VvZ5nI9fVL3Z+U7jKoBIu71nT28ioeDZQFFI9zh7zgBua2xReRPtIA/xOBbXDoKQVYUv2D7f7FsBi
	EPZ3bwwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lx6hu-00458s-Tq; Sat, 26 Jun 2021 11:42:42 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lx6hs-00458P-2J
 for linux-mediatek@lists.infradead.org; Sat, 26 Jun 2021 11:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iD6UlxSttVDb7EnnXFsDzZvUfsf4FN2OlXfYInO/xiM=; b=QUKM7wPYxpTXhF4K113BV9uKig
 vy/mfLFlUvvZlUZLmvM19dnH0+1gb0UW8ezI/0ce2I6sNUA5RFeYh4Usc1NEsEANS4WukSF9GIz/5
 fRCDK2V4Pvya7C5EPD61oIH7snvK5BDGP9TiCXluv1LkP0RWcgV+G560x3a1SG6nhZTY=;
Received: from p54ae93f7.dip0.t-ipconnect.de ([84.174.147.247] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1lx6hk-0001tR-Ki; Sat, 26 Jun 2021 13:42:32 +0200
Subject: Re: [PATCH] mt76: mt7915: fix info leak in mt7915_mcu_set_pre_cal()
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Kalle Valo <kvalo@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Shayne Chen <shayne.chen@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <YNXvLvrvllpXgCIn@mwanda>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <cb2177fd-8e22-3286-c524-a727688a9ebe@nbd.name>
Date: Sat, 26 Jun 2021 13:42:31 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNXvLvrvllpXgCIn@mwanda>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210626_044240_371125_BDC48F07 
X-CRM114-Status: UNSURE (   5.75  )
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

On 2021-06-25 16:58, Dan Carpenter wrote:
> Zero out all the unused members of "req" so that we don't disclose
> stack information.
> 
> Fixes: 495184ac91bb ("mt76: mt7915: add support for applying pre-calibration data")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Felix Fietkau <nbd@nbd.name>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
