Return-Path: <SRS0=x1vn=CR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC2BC433E2
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 04:26:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7535521532
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Sep 2020 04:26:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GcfLQ8jl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rweWXphm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7535521532
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e5I4nRatUMfth1yGaUGqIytrv1kD0S6Wl6AlyuWn9mw=; b=GcfLQ8jlqhX0o57bqOaxuWFBt
	p2ubQ3cucHBu6C82i4IBpoEAX6jA2xAz+ocYftQnrqIqSbUYgz/lmo4WxJWhbnY7AWG58FBfBl5Kc
	3UdcOxNMEsaHwvUSCHP80iDG7roI0Q0h/TPqUHAEdmBNARV/ncIjI+5UCRKuQ5wIB7Iauf/43/6c0
	hVpcU9s4M4h4SIO6EwvGY6DiHHGOrBhCT4bnaVd7DYWBAOGrsI2rGL0rz+IwvY8yeYFWkY5JDC5Bi
	RYv6h0sIspxbR2AsFuzTqz0sImRvFFMDsAKAp4HzhJwNt6xinCnTyDQUWzMY4DscYB834Bv/nQPCr
	Xy07uoNPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFVDP-0000xN-7w; Tue, 08 Sep 2020 04:26:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFVDK-0000w1-6X; Tue, 08 Sep 2020 04:26:39 +0000
Received: from localhost (unknown [122.182.239.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D537D21532;
 Tue,  8 Sep 2020 04:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599539192;
 bh=CJ6HscSjdMRTk0mmdMvvzqY/BsVYK5YNZEfkv85bDtg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rweWXphm0+FYsHubtLDXVBOwTvFith3tciW0aemjbSoEhxXmeEtQq+7QHAobV2/SP
 7TXHX/59R+a08eC9pmvrDugcbM99Ovhqk/vk/6FrjbyBLvpOrk5EclsJS9kG41QFgP
 M9expCjqFci79jPxMDeNX806hwlYts401UaZ+57w=
Date: Tue, 8 Sep 2020 09:56:24 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 1/6] phy: phy-bcm-ns-usb3: convert to
 readl_poll_timeout_atomic()
Message-ID: <20200908042624.GA77521@vkoul-mobl>
References: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598320987-25518-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_002638_433312_7D2005EB 
X-CRM114-Status: UNSURE (   8.30  )
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
Cc: Bharat Gooty <bharat.gooty@broadcom.com>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 25-08-20, 10:03, Chunfeng Yun wrote:
> Use readl_poll_timeout_atomic() to simplify code

Applied all, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
