Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7AC7C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 10:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7zeEB3m7aAJSMDALJEDuS0rT5pHeqqwZi21V33PMJJc=; b=mNGFZDhUYBe15S
	17n2/nBXXmpv/I9Ub8LIcvf9A2y5zD2L51cJ2JY366ZsGUMJzK9ohEJKdP37kEBioeGfcLu6en4/6
	xuHSfg3zzlAtA24DUgNyn+Aijx9eN+fgTIRX8Zlfjgo/JTpaZ3Ar+U9VCO16eSlQbdrB1RSFVwulv
	eh3u7eigfeyFi5oM/IvB+YADtToqrNofnvXeNFHbUOrNwwM+f1J2d78PqWgVb7RW7wwdkSE0Q13rj
	FI2mVUyihKcvd+vvqQUSD1OhxNWkf9S+gOrGcw6fHJTomDXoYWPYVLs1bsPX34jSBlPFfPu2TQ5J4
	FqJAoqgy88VrE5BBuFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrd3Y-006E08-RG; Thu, 19 May 2022 10:06:56 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrd3K-006Dw0-D1; Thu, 19 May 2022 10:06:46 +0000
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2D6621C0008;
 Thu, 19 May 2022 10:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1652954796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oDc/l+ZvXyh/h4RLRg/o7k1scruepHlpxflzm71xEPg=;
 b=hN7i8a5GqerC9XaBkUR4ixwCNgLNDgbfrG0m4QGCyuhvkd3n4ycYZeieFwKMC7Q7wMtMgq
 8HvbQQbfDjrrgpOc9Xygd004j/QjbLN1OuXzuUqtwpVB6A6CAroYlasTJ2jEyRwVcaQhaU
 B+k48tIhxQmUIlAscrB3n2HmanJXdnVilPuPFD/pCsZmb0SnvFwlzi5jZ5wuyinxsAlYpW
 vK/rK5ePfFZfE9glmi1RHwHM8/bos8vmf7/7Ovmkzx7DJ3YkSBmv+KY6hxcj/wSs28Q6Vc
 3A7vUJrvqExQLEmTAB2yUcrttt1JN5+sSRl7FkVzKDSuBGWLX8HFoSX6Y8qfbg==
Date: Thu, 19 May 2022 12:06:35 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Yang Yingliang <yangyingliang@huawei.com>
Cc: a.zummo@towertech.it, sean.wang@mediatek.com, lee.jones@linaro.org,
 eddie.huang@mediatek.com
Subject: Re: [PATCH] rtc: mt6397: check return value after calling
 platform_get_resource()
Message-ID: <165295476623.538132.4203762589258593822.b4-ty@bootlin.com>
References: <20220505125043.1594771-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220505125043.1594771-1-yangyingliang@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_030642_933220_5B044193 
X-CRM114-Status: UNSURE (   6.62  )
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

On Thu, 5 May 2022 20:50:43 +0800, Yang Yingliang wrote:
> It will cause null-ptr-deref if platform_get_resource() returns NULL,
> we need check the return value.
> 
> 

Applied, thanks!

[1/1] rtc: mt6397: check return value after calling platform_get_resource()
      commit: d3b43eb505bffb8e4cdf6800c15660c001553fe6

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
