Return-Path: <SRS0=SroS=L6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039D1C07E99
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 02:34:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF7896196A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jul 2021 02:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF7896196A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kmUtKUlVsa1HD/Va24CYxFdGAqH/f10cDOitgUftWwU=; b=oKOyzkw+GAox5N
	GiSewiVKJNvEJpzjvN/7D6Rw8B8hBYAGXCb50DT7PLPfZc5NNmB71Yd7QLyhTmvJoEeiRL3DFtvgR
	Uo349iJ87vMTlzWh1WETOtedrZQT35KJsJWIVTuS4FneaXPwT3mIfTlPBZ6YKfmh7vTuuhGwh+xes
	B6OJLgeJHYafH08vZi5ZleooaqXr+zPyrkgBooCJqDoLmZLGHHw96Hp1Vgd5xdWsX9ZRwcggFbDuK
	WLijNsANJWWbjzA40w6p2JWry9brn+v1trVGfs253Y8q7g8NMFOXUgz6DWCOjbUfK0CSVfU9RPz+H
	GBtpsIyHSrSwVaTTMf8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0auL-00A9tz-Ab; Tue, 06 Jul 2021 02:33:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0auI-00A9t5-O9
 for linux-mediatek@lists.infradead.org; Tue, 06 Jul 2021 02:33:56 +0000
X-UUID: cdf832d1465e4a98bda10e264c163d92-20210705
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=S5q2VFppu4KoAu2S+UaRDV/ckuPmh1QtZnSnhK3+8RQ=; 
 b=ALeqrIWrRmdlfB0I8jHhdb8JoQoBJ1KiEtfdE5BH0rzIIZRmuz35NlaTb6rhHvGhJGUEmeaRD+QZ9dtu8PDAyf6N4bVCyYrJAFHsfV0e4+UGiZFSssyI/pA2CLvNmycHg6+ABjaASJZdwNWjYAv/i+X0cvgxfknBuE6JyT2eoks=;
X-UUID: cdf832d1465e4a98bda10e264c163d92-20210705
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bo.jiao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1482428965; Mon, 05 Jul 2021 19:33:50 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 19:23:48 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 6 Jul 2021 10:23:44 +0800
Received: from [10.19.240.15] (10.19.240.15) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 6 Jul 2021 10:23:43 +0800
Message-ID: <1625538223.21641.1.camel@mcddlt001.gcn.mediatek.inc>
Subject: Re: [PATCH] mt76: mt7915: cleanup miscellaneous errors and
 redundant codes
From: WCDSE <bo.jiao@mediatek.com>
To: Kalle Valo <kvalo@codeaurora.org>, Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Ryder Lee
 <ryder.lee@mediatek.com>, Xing Song <xing.song@mediatek.com>, Sujuan Chen
 <sujuan.chen@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>
Date: Tue, 6 Jul 2021 10:23:43 +0800
In-Reply-To: <87sg0sgbov.fsf@tynnyri.adurom.net>
References: <20210702083949.4431-1-bo.jiao@mediatek.com>
 <87sg0sgbov.fsf@tynnyri.adurom.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 477F0D29A4D6719797CFD3710DFAC2E470CF6F177F235CAC9C0B684527F33AA92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210705_193354_831140_61D5D6BC 
X-CRM114-Status: UNSURE (   7.45  )
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

On Mon, 2021-07-05 at 15:57 +0300, Kalle Valo wrote:
> Bo Jiao <bo.jiao@mediatek.com> writes:
> 
> > From: Bo Jiao <Bo.Jiao@mediatek.com>
> >
> > cleanup miscellaneous errors and redundant codes.
> >
> > Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> 
> Please split this to smaller patches, one fix per patch and write proper
> commit logs. See more info in the wiki below.
> 
hi Kalle, got it, i will modify it ASAP.
hi Felix, please drop this one, i will split this to smaller patches
with proper logs. thanks

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
