Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B92CC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 06:31:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 097BA205CA
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 06:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 097BA205CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZbOB0QBE9yu5fhN1K0oADOBgdoD5dZSVg/pTdZokgMk=; b=ptJtyLeeHWOmR6n2OzsJChNI7
	6EbzZvg/gy6hQ1uGtU7wkdaOfCoCD30uMgzhEzGPZKlAUVB6M/Yt400PGJZjSH+ZhhpOw7mhJpMLr
	mRM3iZqVLMc7mtmVstiUYniiBPvXJGiGvmyL+LAKwdoDHd9Om+pVRiO2hSM7ECJxEMMJl0X8PTHy9
	XyAgyNCpHGPPXyRiDTT5gVyKQ903Zy9pKFXMRi4A3PyyVLb7FEr5RK8h+X7ZL7jy4FKe2gU1BUmdE
	5cPeb3G/54EHcAHiU9zybhcEBu74v9OuLtKVDFQYpHC1yeSJ4NoOlway/vFLipI2KJnNelTZMxU2D
	dbMBx0kCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krxgL-0006h9-Ir; Wed, 23 Dec 2020 06:31:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krxgG-0006g4-Kv; Wed, 23 Dec 2020 06:31:29 +0000
X-UUID: 5ec34a9f9ec24bc0a98ffe15f0f077a3-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=lTRXf7HghnKJkYxV77mITDuIuRXMYK+T/YA/4yN896Q=; 
 b=XTmUCo09n6SoZOkkVc7fWw4ya4HUsF/8zmzUs7UjgBXq7YffdnWquyB1JsCYn7HMs7w0f3p8QRYxU6N4y96Gj504R7YZch+SPPILIqnSk8sI2G0WZUePaTGxCGDKFMCxU5A3WbQNg71fJ81lrqN9DKimTBP8QVKL73i+ge8nrhg=;
X-UUID: 5ec34a9f9ec24bc0a98ffe15f0f077a3-20201222
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1099478513; Tue, 22 Dec 2020 22:31:22 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 22:31:19 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 14:31:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 14:31:16 +0800
Message-ID: <1608705077.25719.66.camel@mhfsdcap03>
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
From: Qii Wang <qii.wang@mediatek.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>, Wolfram Sang
 <wsa@the-dreams.de>
Date: Wed, 23 Dec 2020 14:31:17 +0800
In-Reply-To: <765c182a-5c68-b408-85ca-f757e891090e@ti.com>
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
 <20201202153543.GG874@kunai> <1606958735.25719.29.camel@mhfsdcap03>
 <629d171a-0e77-3d74-ae23-e6439dcf17b7@ti.com>
 <1607326431.25719.33.camel@mhfsdcap03>
 <a9cb5ba5-f3ce-3f82-15cc-30419bb70f4e@ti.com>
 <1607565387.25719.43.camel@mhfsdcap03>
 <e83ab23b-81f2-620c-039b-9cadd84a39fa@ti.com>
 <1607935685.25719.49.camel@mhfsdcap03>
 <765c182a-5c68-b408-85ca-f757e891090e@ti.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 69890E8737225DC682D784A8471C838BCED96D5F5DC6F27F7EEFAC0FA20E67972000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_013128_875660_4B872A9A 
X-CRM114-Status: UNSURE (   6.42  )
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
Cc: srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi sirs:
	If there is no new comment, I will resent it in 5.11.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
