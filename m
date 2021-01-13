Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F47DC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 12:55:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21962233F9
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 12:55:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21962233F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tb8BKyfLOU/LGIAGoDBtIRV52LUVCINzpb0SCO3LXMA=; b=E47oIR8JHh6iC26tZNJwo0x0a
	kpL0hQewQDbzrGS09IL0Ih9VynptyzWVqU8NbPbILBV4fu4d15aAGLrG92+9q1Ufag9z2ewU7jDS4
	te0cxsgDYxJV2g/EVasIocKFfP43KLP2ctOq2N4Az+yzWFQf1pT/mdzPHwrkBc9lO+i8PAckOqDGG
	htB2nSkosLV7Msd+jJSfxSY7gp13sTwVoj+o3SEwE8eAHFsg0n2Y7JFFUX82L1gggYXuGGreF2sdo
	x0hEaSOhFLNkS8CZEukKTZyixuHQT9sj88jO4KWpKeQwv097oycjBTekrDJ849W6PQ9Y/YYfQZnJN
	id15HUK1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzfg6-0001Rp-QO; Wed, 13 Jan 2021 12:55:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzffz-0001OL-0L; Wed, 13 Jan 2021 12:55:04 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E3FE9233F6;
 Wed, 13 Jan 2021 12:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610542502;
 bh=R35icEekZdVOc0zpx+bjZE8H0/Hj68YPjmfywpr2VoA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=d0ZlMXd+8YdRNLOyR2tqGLLvwtI1Yl0UoVNI917S1IP4PJc4PAexcxPmBN0UUaWzq
 dle17l7xJaJx7FBq4swvwmWrH0jwhqGG7y7l92tAEFJQB4cv2f3vSx1FCcUeEYOII4
 RzfZBSk3L9JQPuuwVxusmyr4sQAIIs7uZ/1AVF9wE/EVrv7e2sMppgg5pFXSuYq/BA
 uMWEgNa29esAVZtV9A45Z8GJ7zIXgC8gHVif1olvMkE0FwV+beJ04WJJoBQIjDwfhT
 hvplYhmotVS84daqruUFD0WqXJoMTUPTh3qjx4BAplB69zJ1XiLuUGFCaWZtnMjqek
 J+fufpuqeMkhg==
Date: Wed, 13 Jan 2021 18:24:57 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v5 07/11] dt-bindings: phy: convert MIPI DSI PHY binding
 to YAML schema
Message-ID: <20210113125457.GN2771@vkoul-mobl>
References: <20201225075258.33352-1-chunfeng.yun@mediatek.com>
 <20201225075258.33352-7-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201225075258.33352-7-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_075503_557154_5F17F1BB 
X-CRM114-Status: UNSURE (   7.17  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Min Guo <min.guo@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 netdev@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 25-12-20, 15:52, Chunfeng Yun wrote:
> Convert MIPI DSI PHY binding to YAML schema mediatek,dsi-phy.yaml

Applied, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
