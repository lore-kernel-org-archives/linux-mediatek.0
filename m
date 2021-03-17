Return-Path: <SRS0=1xoO=IP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE24AC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 06:40:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 887E464F99
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Mar 2021 06:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 887E464F99
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5HktHAMfDM3aXdXhXdFb0C4tDnYCxZhd/Pk0Rbup9YI=; b=p2ZZPPFZOQ/q5IY5pqLDfhJjd
	b6DM0I3j2/NAwYWfDoIIN7vIskcYbfuQPq0g8Mlzg7PQz5WuKusJzpc2d29VJqxk9K/U4DkWzl9Io
	vbWluQBu44vlAnqtA66gBD2FLV1GrTCiK6Sf9rkkWUAlghLwIIZs6ZoeY0SVbihaxlaVcC/osj2Gt
	I9qoYZk0Ew1BYP6VbtGGcFD865Ms0L4n8YdWFOYwbAn+C7cQniXURHR5c4G5oO3vlxVmS3rBeHarK
	0cRjIgWhxytjFXExqzaXFmRK/acruxsGLpA6yoXkl4joOPiLTem77cbc2UbOkSQCjMcdPdUC8gOmY
	/Jf8vPYug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMPqd-002Zdm-R9; Wed, 17 Mar 2021 06:40:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMPqT-002ZcY-Jk; Wed, 17 Mar 2021 06:39:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 40C2E64F4F;
 Wed, 17 Mar 2021 06:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615963192;
 bh=8lbNnEdiagk8rX9RCfb8bBZx8x2kTMgPKKigZX60Bgk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=C8AKUzLS550wVz4Cgqm+n5QU0ySJxryUeGpgzgrnjQfY2yNU5dQBYcud0SDjyKG2t
 y3fuc4ktRTwM20dEUv2RpeFODfCtr3toO/nbOf6aBXxlvCj3K8qr5Ubf/G757jG6vb
 Enn1ZI+zSp+VvgkxhmR4fx0NAs6g9GRhm2O1qbIg9uHbo14LAwLm5DZo8jXE+ZFy1Z
 pekwNtkppnGxhLHw2PQ9KtGj5zIxv60Dkj4T0AQh60JX58X4VXbmxM1tCEVzHHaH6C
 WP/MWQxKePZhTfGHb9ttBENCYYqd3mcHWfTmeVNxumXKj3cYstDlIHwpc6weViJfj6
 gs//JP/a/cqHA==
Date: Wed, 17 Mar 2021 12:09:48 +0530
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
Subject: Re: [PATCH 07/10] dt-bindings: phy: Add compatible for Mediatek MT8195
Message-ID: <YFGkNM9z7n70bImA@vkoul-mobl.Dlink>
References: <20210316111443.3332-1-seiya.wang@mediatek.com>
 <20210316111443.3332-8-seiya.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210316111443.3332-8-seiya.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_063953_868575_201B82D4 
X-CRM114-Status: UNSURE (   6.32  )
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
> This commit adds dt-binding documentation of T-Phy for Mediatek MT8195 SoC
> Platform.

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
