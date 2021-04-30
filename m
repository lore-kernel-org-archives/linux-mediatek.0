Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A7EC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 16:46:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C67C061458
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 16:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C67C061458
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=Huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UEzuzjVJMW9PJOzbaDMOg0w1/q6S2fVUQklc7BFl50Q=; b=Jf96j1HaRKe2VPww3SqhLLYwU
	9L6svzgg0oP9NK9GGq/SgpY9+AWImuKxaBWAv+7Xqdaglas6wulg29FGs2UJKOcbsXdHFFOhAcKOY
	aZTleaqVcLU3dQCF42/ZK4dJHAohhpDKoTGj9K78GqIaosNSiOjhfzx7PpLkT5DczqIQyJgUuh9Zz
	to/wxHEZnINsGMaP9ihR9Ey3WnIe6kVL0TXlPUCCPAzOHvN5S4ajSugjfW0BuTbKxdCR4OyolPGp1
	0F/MbPDzVI27QVb9prOs5yAEDZkDy1z9/D6qA5M8paQXURhhoPzOJWLi6dNgMrMCVHL2FDIVIJd2y
	uLBhH0daw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcWHI-008Dig-Ek; Fri, 30 Apr 2021 16:46:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcWH5-008Dgu-VY; Fri, 30 Apr 2021 16:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=BumjB7QctLB6SePTP6VmqwnNriPy5oN9buaVYTlKqpI=; b=0z2UKeL70iD2XpEZIhG3AKouHm
 hZlEZOA6+/IkAi5M1id8sSNEXvVHFAVGDMuAW6RRy8Y2XTLGa5ccewbdgkbhQfe9D/oBtjTC63hD7
 o4mrZ26ETwxQfagv39BV0YvJO0JbEhG+pmZuOaeNmMciuRAv+v9zosFiadTsRXH/Zs8uq/+i6MC1F
 T5+9XJwslKCWOWf0tZ8yAUhsMd5h52VK54KA/hBS3Q0GDtzrZ4z6JJd6KTZQvGuBje6iff2+2qXyn
 u3ohMlaWw6PAItGCPH6MQqcFHwV/KP9gT89iri+B5yTF/btzWnDD1im35soCan5J5ICKIj880Mruq
 Xe2V/x6A==;
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcWH2-001Wuw-Fx; Fri, 30 Apr 2021 16:45:54 +0000
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.207])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4FWydk2XZ5z70gGM;
 Sat,  1 May 2021 00:35:06 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Fri, 30 Apr 2021 18:45:48 +0200
Received: from localhost (10.52.124.90) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Fri, 30 Apr
 2021 17:45:47 +0100
Date: Fri, 30 Apr 2021 17:44:13 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: <linuxarm@huawei.com>, <mauro.chehab@huawei.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Tiffany Lin
 <tiffany.lin@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH v4 16/79] media: mtk-vcodec: fix pm_runtime_get_sync()
 usage count
Message-ID: <20210430174413.0000452c@Huawei.com>
In-Reply-To: <b2f5f6e6287d4b56530dcf51b25b5a1c009381f8.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
 <b2f5f6e6287d4b56530dcf51b25b5a1c009381f8.1619621413.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; i686-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.52.124.90]
X-ClientProxiedBy: lhreml719-chm.china.huawei.com (10.201.108.70) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_094552_689383_D5D84E57 
X-CRM114-Status: GOOD (  15.09  )
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

On Wed, 28 Apr 2021 16:51:37 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The pm_runtime_get_sync() internally increments the
> dev->power.usage_count without decrementing it, even on errors.
> Replace it by the new pm_runtime_resume_and_get(), introduced by:
> commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
> in order to properly decrement the usage counter and avoid memory
> leaks.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Without a return value, this seems like it's not complete as driver
will carry on and eventually call mtk_vcode_dec_pw_off() which will assume
it needs to decrement the count.


> ---
>  drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> index ddee7046ce42..fe096fe61c9d 100644
> --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> @@ -92,9 +92,9 @@ void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
>  {
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(pm->dev);
> +	ret = pm_runtime_resume_and_get(pm->dev);
>  	if (ret)
> -		mtk_v4l2_err("pm_runtime_get_sync fail %d", ret);
> +		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
>  }
>  
>  void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
