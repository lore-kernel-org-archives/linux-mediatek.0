Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3DBEC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 16:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZ0e+GQU1qsIMIpKzDT9nHI/YnFH5ImmjMa/GicDjGk=; b=oG2k1GyhfSXWI6aFBgYlvZqe9e
	ts9Ez2W9NVXl6741ODnSFpktlEMSVutx1+3eAI2dLxMOdhKa2lTsCRJydFXWDr7Dd6xOkbsLxx2uY
	4WZvNtJewRhv+FEJ0N7x+jwdpJCNccGgJyldqWfBMoSgOSoG64xtOWniKVt5v/4d2F2ihdlnTY5o0
	ZBbPcZqD3ZZfT35NrHSPxT2vGd5UBNfKhSAoe+/+pEJhJlwxfcp6cAtvfOzAd5Lt6V1tmRRfi4wFz
	bDs1XxaPvpLNkWCeMjq+kKvR+gMlQenbhpWYGf3Eh9LbSZEQlIDjrzxX9N2EF387IW8rSKbPr5SZO
	cWbiaxsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4lrB-002yR0-Iu; Fri, 24 Jun 2022 16:08:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4lqz-002yKK-Sg; Fri, 24 Jun 2022 16:08:19 +0000
Received: from notapiano (pool-98-113-53-228.nycmny.fios.verizon.net [98.113.53.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0780866017FA;
	Fri, 24 Jun 2022 17:08:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656086895;
	bh=KGOY/hKSjd6Fa8Gy3cPJe3LIX1aHDy62+SKTc+gQNls=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OJhEKwCxKH5CaQUTh954WJwlHVZYeXRtFfVXE2QIBRMmZ7N2GrutyjZCdOEGPRfM6
	 aHeFF1YHf8ADrGN+qK55wKTxMEno1UP3hpuVT01p/e2xg2O8GA1NRsJC33r7Efto3/
	 U7tp7icBQ4A2PSTnpKfODdpbHccrb7EdpnLQirrA+za60VqxGv19t+2mvz63GUq0zL
	 qZE6BNBgJ5AbfC4R0baa62JmjqPu6MhczBVBN+p1Wa+V50F4VWwGsru8lnySjhaFfQ
	 gtKxdP1rMIDyKJCYyTl+qlx3mjoIQ8tdz/R+vaZD5yglBziQ8METSLVenQu7fvMQTL
	 bx1yGvPrmk2LA==
Date: Fri, 24 Jun 2022 12:08:10 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 4/5] pinctrl: mediatek: dropping original advanced
 drive configuration function
Message-ID: <20220624160810.alotw7iwvivp5zg6@notapiano>
References: <20220624133700.15487-1-guodong.liu@mediatek.com>
 <20220624133700.15487-5-guodong.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220624133700.15487-5-guodong.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_090818_095161_15BAF8C0 
X-CRM114-Status: UNSURE (   9.67  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Guodong,

On Fri, Jun 24, 2022 at 09:36:59PM +0800, Guodong Liu wrote:
> Function bias_combo getter/setters already handle all cases advanced drive
> configuration, include drive for I2C related pins.

This commit message could be improved. I suggest using the following commit
message:

The bias_combo getter/setter is already able to handle advanced drive
configuration, which is the reason commit 353d2ef77f2b ("dt-bindings: pinctrl:
mt8192: Use generic bias instead of pull-*-adv") dropped the pull-up-adv and
pull-down-adv properties from the binding. With those properties removed,
there's no longer any use for the adv_pull callbacks, so drop them.

> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

