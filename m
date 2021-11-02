Return-Path: <SRS0=eBCQ=PV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4317EC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 14:05:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1807F60296
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Nov 2021 14:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1807F60296
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gbUdUX66vFKo/PsANQ34waQkz8kmSkQ1qRnFNnAYn1U=; b=ufPGpLPDHu/RL7
	AoiHuWGJUQYxqhBmTOZaSAXRTozjxtC5ULI68OHi30upucT/MMdWT+n+NDFx7XaUsHGQCMtSfVZAz
	Rt5DtC8ftlvFeYABMqjKC4IN6orQ0QCSFGOpep64/kYhSRTMuFGAFQEE7lJit09rMddKD+xxSYSAn
	A4mPoRDLV7QnmsiPbGFmzXYT4ydqrLt1U8cE+6xE5DuIZa8ilf0yezFxANoGwdjDqsffpSJ/TqBKS
	vfh01E2TMiAIBgGZw2sUKgwDfBVjw28nj9fkVucTauvs7A8fZw0OemH88THnKfD4hm1MLFDHjF1f+
	IieLeYgvcBSHg5bEY5yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhuPD-001tc1-86; Tue, 02 Nov 2021 14:04:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhuP1-001tZu-2Y; Tue, 02 Nov 2021 14:04:40 +0000
X-UUID: 639a5a6243764a9bb6f456db6fb4d488-20211102
X-UUID: 639a5a6243764a9bb6f456db6fb4d488-20211102
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1406835223; Tue, 02 Nov 2021 07:04:36 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Nov 2021 07:04:34 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 2 Nov 2021 22:04:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs10n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Tue, 2 Nov 2021 22:04:33 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <linux@armlinux.org.uk>
CC: <bjorn.andersson@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-remoteproc@vger.kernel.org>, <mark-pk.tsai@mediatek.com>,
 <mathieu.poirier@linaro.org>, <matthias.bgg@gmail.com>, <ohad@wizery.com>,
 <yj.chiang@mediatek.com>
Subject: Re: [PATCH] remoteproc: use %d format string to print return error
 code
Date: Tue, 2 Nov 2021 22:04:33 +0800
Message-ID: <20211102140433.28170-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YYErBcJlkTi0sJ/N@shell.armlinux.org.uk>
References: <YYErBcJlkTi0sJ/N@shell.armlinux.org.uk>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211102_070439_141355_A0F28529 
X-CRM114-Status: GOOD (  11.24  )
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

> On Tue, Nov 02, 2021 at 08:08:05PM +0800, Mark-PK Tsai wrote:
> > Use %d format string to print return error code which
> > make the error message easier to understand.
> 
> Even better, if you use %pe after converting "ret" to a pointer via
> ERR_PTR(ret), when the kernel is appropriately configured, the kernel
> will give a textual version of the error code, which is even easier!

Thanks for the suggestion!
I will use it in v2.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
