Return-Path: <SRS0=1xoO=IP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70361C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 06:40:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1727D64F96
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 06:40:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1727D64F96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xLHyU6SXI9LCxgxEiNAaJ5p0uQWjYNFsfZuD6XnSRps=; b=P05JCz3ipquc+mqXjGHpAoc/9
	m7gKV5zxhXKKqzx5YN1eoKaZml7CximpssC5qMRPkASMuf6k/FjU00GHs8um2kwrv9okFDqkwBv96
	7rvYYnnIO50dhrgM0tln4YjdK1+8v9FIN7HxmpyxTveWtv8ifTBOeQ6iMHH2ULdzxCfSCLUCcJhpu
	jqFz22DzBmIHa8NERsAI/y7RTKlXLPeIIuHEhP6OkErpw44uvXdMJjoG+RGId1j7cx3Tb+12aX0xM
	1hAyVVB9WTrU6Fh7HMZzmXV/PqcvGc6aP80gvc239GK7lmXbn7LdDcqIv8taW4dxVAqyGb2D21UYN
	lvdKrEc7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMPqv-002Zip-Es; Wed, 17 Mar 2021 06:40:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMPqh-002Ze6-AC; Wed, 17 Mar 2021 06:40:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CCF364F4F;
 Wed, 17 Mar 2021 06:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615963205;
 bh=DKkSbpTtYNi1ZVDKfEu/pISf3KKivN5OtDm3wdZBSMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MCL6GBsTblKeyK6Xlm4N9pcyXR/52vV0wfElZZo6h3qXk0qFwaGDjTmju2Jxvm23r
 1fJF/nJ6AAjg7wFRajkNsIY/gqyYiesHF0A5O3zZk/en5bTBYKqWjfFTmUrQN69Kye
 TfSf8TAA9Ea3XUCs1b1OAgM5lURWcIZn7l/ojFJP5UnHvqylKxpc8wluDnINwemtpW
 HbOqMfg6TzzgWwRTmnsR3oEXTZyKdaiWeAWJOjXO6gSzcl/PoYy/Vd6nY5bqPf0GYn
 1VVM4ZROPY/vjpG4O6xzvHtpe3auTvH31ZnAuin/NBKrAqjLPzPdg+G5NSk3kG2mXQ
 qEcKepk6ROisQ==
Date: Wed, 17 Mar 2021 12:10:02 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Seiya Wang <seiya.wang@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fabien Parent <fparent@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Wenbin Mei <wenbin.mei@mediatek.com>,
 Stanley Chu <stanley.chu@mediatek.com>,
 Bayi Cheng <bayi.cheng@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
 srv_heupstream@mediatek.com
Subject: Re: [PATCH 08/10] dt-bindings: phy: Add compatible for Mediatek MT8195
Message-ID: <YFGkQq1J0g4AKTNZ@vkoul-mobl.Dlink>
References: <20210316111443.3332-1-seiya.wang@mediatek.com>
 <20210316111443.3332-9-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316111443.3332-9-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_064007_814554_3E5796FF 
X-CRM114-Status: UNSURE (   6.42  )
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

On 16-03-21, 19:14, Seiya Wang wrote:
> This commit adds dt-binding documentation of UFS M-Phy for Mediatek MT8195 SoC
> Platform.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
