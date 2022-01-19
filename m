Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31385C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 10:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=icnWbGuRMZH/Lj8vFO9DbTjxBZI05ZiqlMtBLbHklJs=; b=Bkw+rZujTRlcL/
	jmbG1IWRNLEtz3MamLKaocZAG3DjhsTCI/IUHqug8N1ypMsxYBWpuhprB8JHugNjfI9TnxeG8nleD
	KqmmdOIV/tN+vFf3cnen8jrC8nKbKg4QFrMCqiN/9tXYZuZz035I4tjhvVlnLOgzi0iCnHqInfGgv
	MqfBGklVFh0a2eqFPxClo9NLTtqwG3sQDHN8zoGASITnoZD12XXbdzdHFXBwTQnnxDfrHLGVEbQzb
	+Id1dpWhzfcWTURGXEJoHSj+sJml0Qwj+fu9S/DOI9jP2QaNCLLIx2GY/UW/eoNCYpmx+NOB8g/IG
	YPyuJGwRqt0OotMuFArw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA7vN-004pBn-QS; Wed, 19 Jan 2022 10:10:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA7vL-004pAz-DX; Wed, 19 Jan 2022 10:10:40 +0000
X-UUID: 241df6d64eff470fab8b566f35c63637-20220119
X-UUID: 241df6d64eff470fab8b566f35c63637-20220119
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 702856276; Wed, 19 Jan 2022 03:10:37 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 02:10:35 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 19 Jan 2022 18:10:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Jan 2022 18:10:22 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <ardb@kernel.org>
CC: <Jason@zx2c4.com>, <davem@davemloft.net>, <ebiggers@google.com>,
 <gregkh@linuxfoundation.org>, <herbert@gondor.apana.org.au>,
 <linux-arm-kernel@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
 <samitolvanen@google.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
Date: Wed, 19 Jan 2022 18:10:22 +0800
Message-ID: <20220119101022.5176-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAMj1kXEuWRUbCqDBnxiWRaERt6OGL8ufQ1Q7naAGHqKK1oQB1w@mail.gmail.com>
References: <CAMj1kXEuWRUbCqDBnxiWRaERt6OGL8ufQ1Q7naAGHqKK1oQB1w@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_021039_487318_1614F817 
X-CRM114-Status: GOOD (  10.96  )
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

Hi, 

> We should try to understand why CFI thinks the prototypes of the two
> symbols are different. There are still a number of issues with CFI, so
> papering over them by reverting stuff that we want for good reasons is
> not the way to go imo.
> 
> In the short term, you can work around it by avoiding the indirect
> call to blake2s_compress, e.g.,

Thanks for the patch. I tried it and the issue remains.
As Jason said, he cannot reproduce this issue. I will try another version
of clang next.

Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
