Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E278C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 07:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KioZ2HCArhx7f4I6MTMojaPiAxlksIhkrD+oz958hZs=; b=qAdNh8GdrHiboB
	6XT4Yx8MTovgGrMmyP9XgUiDgl8H/S0+DTyR7RyealhZkEk1kowVSc3ryjKxrV12lcixD2rybbSpI
	HiyD+8J/E7CkibafDwOD1FTxN+oLeKsmIXuTL2RghRY0lys4b1iM5TmXUEFoP5CWNBALNKoJn6NuS
	HqgXPNQ6Ca562vOveYqzXpnrTJuNI0xcr1fdrUtuHvLghBsbF+mAw+DuBaRQKV65oQCgYCWE5hzIm
	TxT4m8b88/dpfKSE9upotDy+GIM3KOqyiYn1NEVO/ZLO1nyn7ekniaSa6edGl9DZyWztXZHf6Zhk9
	ZirXYp/ctv9ssRhT/tqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njcRK-000OHM-CR; Wed, 27 Apr 2022 07:50:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njcRH-000OGA-If
 for linux-mediatek@lists.infradead.org; Wed, 27 Apr 2022 07:50:21 +0000
X-UUID: 6b57445241144a2faf4bae209b5dca85-20220427
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:acd20dde-c840-4b70-b80c-5f3d022bb62c, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:2735a7c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,File:nil,QS:0,BEC:ni
 l
X-UUID: 6b57445241144a2faf4bae209b5dca85-20220427
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <lecopzer.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 134645785; Wed, 27 Apr 2022 00:50:14 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 00:40:12 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 Apr 2022 15:40:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 27 Apr 2022 15:40:11 +0800
From: Lecopzer Chen <lecopzer.chen@mediatek.com>
To: <mcgrof@kernel.org>
CC: <atomlin@redhat.com>, <lecopzer.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-modules@vger.kernel.org>, <matthias.bgg@gmail.com>,
 <yj.chiang@mediatek.com>
Subject: Re: [PATCH] module: show disallowed symbol name for inherit_taint()
Date: Wed, 27 Apr 2022 15:40:11 +0800
Message-ID: <20220427074011.32364-1-lecopzer.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <YmgdUKmfym1/XnhP@bombadil.infradead.org>
References: <YmgdUKmfym1/XnhP@bombadil.infradead.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_005019_647245_EE47493C 
X-CRM114-Status: UNSURE (   5.92  )
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

 
> Can you base your changes on modules-next [0] and resend and Cc
> atomlin@redhat.com?
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/log/?h=modules-next
> 
>   Luis
> 

I've rebased on modules-next and resend [1].

[1] https://lore.kernel.org/lkml/20220427073606.29752-1-lecopzer.chen@mediatek.com/

thanks,
Lecopzer

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
