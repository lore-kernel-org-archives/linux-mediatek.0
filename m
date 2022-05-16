Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18272C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 09:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0X+fMuPwqOFU0I67Vp2UGNErNt4nBI+/R5vIlpI51o4=; b=SZeVDWngbPNR2j
	5Qi23R3Vdmk3/uvrJZ/X8LBHoySeP8ELY8itHsEF8oSQ3kw2K37iEtAhEL+5qy5TDMR8iyzRGIQRz
	KOTGDIK4C0/oqutVKTp3DScDNCpoYU+FwxWzA191Cg+MNp/59xrr9mDcC0TRhl4Ya6AIDVKWK/Obh
	albfdwWOtb6sUqHhjXPk4Ftm0u/oY2Dqe99/B7IPkBkwk6hiva2ab7AlLlnjFUIgVEx7LYB+dJrK6
	8EB95emMceWaUOWBjL9CbQ8CBnxsx0MO08DTJzCityJTNg1WhMfENYmBeJ8CHWxw1iJ7lg/AkYQz/
	qkXrmw5zo17NOI3uagYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqXFb-006viN-LQ; Mon, 16 May 2022 09:42:51 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqXFH-006vcN-NV; Mon, 16 May 2022 09:42:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A064D1F427AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652694148;
 bh=c1ydz49i6C3IsJ96xkSmOp1z24weTIOHYM24+DkxGaU=;
 h=From:To:Cc:Subject:Date:From;
 b=THpfRNpOqui6zvR+BYZmkkqsaw+HmfKIjK2d64FkVNdSUzpMVw63wqDSxFaC+OJra
 klxciMwyLwKGQ4fYzMgWlLs/e/phiHKepxmPw+Elh00bIY1U7h60uFRN5nEaFEKCKy
 X1FDAuQFO0dpAcvPvPWP8pyeQXh7DVhjKS+l4u1VTp8GVVapxyvaqCqHM5GcUz3hy2
 OedzLWz2OHGtO2y8v6DXA4aknaD9TTWVfSQyCfqr2yeAoIFlGOKXmjIw1WnnXaogWL
 mCiqn5t/s6uWtQJOJRJmwau05eDgz65PUZ5edK+EWtHuam5cIeHsXk0zvEoyEk4ZPC
 EQ1N10/H/fP4w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@mediatek.com
Cc: pavel@ucw.cz, matthias.bgg@gmail.com, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/3] leds-mt6323: Make driver flexible and cleanups
Date: Mon, 16 May 2022 11:42:19 +0200
Message-Id: <20220516094222.30414-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_024232_018981_49058064 
X-CRM114-Status: UNSURE (   9.03  )
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

MT6323 is not the only PMIC that has a LEDs controller IP and it was
found that the others do have a compatible register layout, except
for some register offsets.
The logic contained in this driver can be totally reused for other
PMICs as well, so I can't see any reason to keep this specific to
the MT6323 part.

This series brings meaningful platform data to this driver, giving
it flexibility and making it possible and straightforward to add
support for other (older, or newer!) PMICs.

AngeloGioacchino Del Regno (3):
  leds: leds-mt6323: Specify registers and specs in platform data
  leds: leds-mt6323: Open code and drop MT6323_CAL_HW_DUTY macro
  leds: leds-mt6323: Drop MT6323_ prefix from macros and defines

 drivers/leds/leds-mt6323.c | 258 ++++++++++++++++++++++++-------------
 1 file changed, 166 insertions(+), 92 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
