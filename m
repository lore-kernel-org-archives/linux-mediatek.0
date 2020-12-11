Return-Path: <SRS0=zFd5=FP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EDAEC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 12:11:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 931892246B
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 12:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 931892246B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7bXA5oyIvgJuUsSaSlolqphhhnBes55u345u7gzpJNI=; b=ZpI2xiDiFaOCaT7oMhbrZVecB
	VOCB3pOcG0t2KTAnIJ311u+JTbIBX2QWpeIs2kgHNWEr4vrENL1/dEgh8F9W1x2yla7xl+pApaRXH
	Vl+nYonBU1Dw1TMDFhNO7SbGA5SWWQPCJkfm0yIlR+N20J20EjOM6A3UxqLkhofFRuFNQjzuGcCeG
	KIUJ2xLBFp3uWfYexUTT5+mvMTge8XNunIlfP5oHFsbPBSJ3xVeQtS2+x/qEAGRK/iRF5g+/UEsOC
	MozwFTHS0CZZU5InVSn5s6Chl8OQuo5qvcqVbHzw2B377cPNXZaxlqrGGM6FsdYMsUXpJ2n+gHxac
	roF5ANuEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knhGz-0007st-KJ; Fri, 11 Dec 2020 12:11:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knhGv-0007qk-TU
 for linux-mediatek@lists.infradead.org; Fri, 11 Dec 2020 12:11:43 +0000
X-UUID: 0857f75482ce4e0998a1ab946765ec63-20201211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jz0BU0zD8nJZqu8nclwQbGirKMqo34maEeKezynR3Kg=; 
 b=TVsuF1eLs9Dt85MqEQPE49V4zRUAQdTVoyH6eG9HJUwVqYrOy1WHlITspiCvGe0LCDkb4PW0RrELE89R9mQCbtOJVE2SWnUoz4g94pZNtrHkZ9J129ql9FsJlLxfPf9Ft2RMBf5RGzUpxIGE/HQPzdn/QsTmntrr63n36L5PuNQ=;
X-UUID: 0857f75482ce4e0998a1ab946765ec63-20201211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1629170998; Fri, 11 Dec 2020 04:11:35 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Dec 2020 04:11:33 -0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 11 Dec 2020 20:11:31 +0800
Message-ID: <1607688692.8846.2.camel@mtksdccf07>
Subject: Re: [PATCH net-next] net: dsa: mt7530: enable MTU normalization
From: Landen Chao <landen.chao@mediatek.com>
To: DENG Qingfang <dqfext@gmail.com>
Date: Fri, 11 Dec 2020 20:11:32 +0800
In-Reply-To: <20201210170322.3433-1-dqfext@gmail.com>
References: <20201210170322.3433-1-dqfext@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_071142_717858_DE45DA6C 
X-CRM114-Status: UNSURE (   7.94  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sean Wang <Sean.Wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Vladimir Oltean <olteanv@gmail.com>, Vivien
 Didelot <vivien.didelot@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-12-11 at 01:03 +0800, DENG Qingfang wrote:
> MT7530 has a global RX length register, so we are actually changing its
> MRU.
> Enable MTU normalization for this reason.
> 
> Signed-off-by: DENG Qingfang <dqfext@gmail.com>
> ---
Acked-by: Landen Chao <landen.chao@mediatek.com>

Best regards,
landen


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
