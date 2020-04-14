Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B49AC2BA19
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 09:15:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEA3E206E9
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 09:15:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U2TbGKJg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DYqOHGZh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEA3E206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X38I3kKWIys91cF2uyhI8JsJYeNjt/+5YmrKnZd0YtE=; b=U2TbGKJgOkwkfi
	j5S7yzKtfQE+Kt+hGCCBxCG1KmXy0XjBdvUmoUuo/ZP9X8po6hgzfTYGL6qHo8WyZoUh0jwYtUS/7
	kATdHfJcfpeP8F/q/BQaX3/AzZDSI81TjXhtGSvjmPi+LC188FPrstD5NaUmksEc/FvFNAMrU+Ulg
	539EhaFvzgHSp12CVW3c2rfbcwJdVodbf4D6j4osqhCgaHDXKo2+7dVebUcFEEnSj8Y/CCrqEPUZI
	0Iq5ac28lPS7dA3fcCi7JrdeEbXDHRQoMqeRFEv+/NhQXd5IM6Oln8RrQWLc5KdGnQBeCmUP7m5kC
	oIhZ6hQMuhR4lodfSmcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOHf4-0005F7-4T; Tue, 14 Apr 2020 09:15:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOHf1-0005EZ-HC
 for linux-mediatek@lists.infradead.org; Tue, 14 Apr 2020 09:15:16 +0000
X-UUID: 487c04750d864b7e84289b999a8e0332-20200414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=E2YXqcVUBYLwN+oDjZ+Fv4snODg16/Q+ovfIm0S+RF8=; 
 b=DYqOHGZhVkS5P4p6+0edpcRtwvwmjvygIHhcG5w41LLXajFjzxuEmICYc2EED8JDa1YAhNw6ig6peArHy9nepPDP51E+xWEUegwhWOMSJzfc4kYXikkXl56zZ4mlxNpEMbxRyAnVCgH5jWT6Z3psbrnsC1NEJsx6IuJhA2VxVKk=;
X-UUID: 487c04750d864b7e84289b999a8e0332-20200414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 169596375; Tue, 14 Apr 2020 01:15:35 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Apr 2020 02:05:06 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Apr 2020 17:05:06 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Apr 2020 17:05:04 +0800
Message-ID: <1586855106.32428.5.camel@mtkswgap22>
Subject: Re: [PATCH 06/16] mt76: add mac80211 driver for MT7915 PCIe-based
 chipsets
From: Ryder Lee <ryder.lee@mediatek.com>
To: Kalle Valo <kvalo@codeaurora.org>
Date: Tue, 14 Apr 2020 17:05:06 +0800
In-Reply-To: <87mu7elgi1.fsf@tynnyri.adurom.net>
References: <cover.1586507878.git.ryder.lee@mediatek.com>
 <3d9a74111aaadde7be00ec7c8c53d095daf4f9d2.1586507878.git.ryder.lee@mediatek.com>
 <87mu7elgi1.fsf@tynnyri.adurom.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A8D0975846BF9946481E93089F5434300BF55617E9FB1178178E68882C03D45A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_021515_581049_5E95D995 
X-CRM114-Status: UNSURE (   9.76  )
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
Cc: Sean Wang <sean.wang@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, YF Luo <yf.luo@mediatek.com>,
 Chih-Min Chen <chih-min.chen@mediatek.com>, Yiwei
 Chung <yiwei.chung@mediatek.com>, linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-04-14 at 09:37 +0300, Kalle Valo wrote:
> Ryder Lee <ryder.lee@mediatek.com> writes:
> 
> > Add support for the MediaTek latest generation IEEE 802.11ax 4x4
> > device MT7915E, which supports concurrent dual-band operation at
> > both 5GHz and 2.4GHz.
> >
> > Note that this patch just add basic part and will add more HE
> > capabilities support in the further patches.
> >
> > The driver supports AP, Station, Mesh and monitor mode.
> >
> > Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
> > Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
> > Signed-off-by: Chih-Min Chen <chih-min.chen@mediatek.com>
> > Tested-by: Evelyn Tsai <evelyn.tsai@mediatek.com>
> > Acked-by: Yiwei Chung <yiwei.chung@mediatek.com>
> > Acked-by: YF Luo <yf.luo@mediatek.com>
> 
> [...]
> 
> > --- /dev/null
> > +++ b/drivers/net/wireless/mediatek/mt76/mt7915/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> 
> Same as in my earlier comment today: mt76 is ISC, why are you using GPL?


My bad. I copy/paste this from another driver. Will fix it.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
