Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A228EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 14:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CZ2jdBRvqU5hHh1MlB1/sJ36gu8abUtj9ErFY1o08jo=; b=cVPPWaLHopHajv
	AniMAjaj3VIm2epAS7Y47+f91iYui37ZG9FX98fDDXVXviimifvfz5ekIM4EJ6rfd1BiLlcCQQJgA
	vJh5sOOuNfSW7PKEhCl1DDob/REEMfC22SlW9lW38SsoymbyZnDHH0zdJCAsbC76jwVRk7wS+B42z
	urDpoOp1A3zfk0K4B2ZsuHV+wpbilm5sl+oa2bVvziFh+39NyJjNjijTRmN33+pN5jgYJJb/niIlN
	hHLP5iCMxCqnL6EIHnV6hPGUMog0cQ4TJg+YgwnoA6B/ReVS7wUl8WvGdNPLXUFU7b+b8uOT+EsQC
	k3F1gMVhbOWsQfdIE/wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nACEq-005wkI-4h; Wed, 19 Jan 2022 14:47:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nACEn-005whR-Ef; Wed, 19 Jan 2022 14:47:02 +0000
X-UUID: ab8aa7a7127e4758994755ae0aed6ad0-20220119
X-UUID: ab8aa7a7127e4758994755ae0aed6ad0-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2023739559; Wed, 19 Jan 2022 07:46:55 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 06:46:54 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 22:46:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Jan 2022 22:46:52 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <jason@zx2c4.com>
CC: <ardb@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <miles.chen@mediatek.com>,
 <ndesaulniers@google.com>, <samitolvanen@google.com>
Subject: [PATCH] lib/crypto: blake2s: avoid indirect calls to compression
 function for Clang CFI
Date: Wed, 19 Jan 2022 22:46:52 +0800
Message-ID: <20220119144652.12349-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220119135450.564115-1-Jason@zx2c4.com>
References: <20220119135450.564115-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_064701_518234_984CDDD5 
X-CRM114-Status: UNSURE (   5.83  )
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

Test-by: Miles Chen <miles.chen@mediatek.com>

Thank Jason & Ard for your help!

Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
