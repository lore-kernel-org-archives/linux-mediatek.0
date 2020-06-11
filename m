Return-Path: <SRS0=I3u4=7Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CF2C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 13:35:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 553692068E
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jun 2020 13:35:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NNatekX/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca header.b="ksY/536V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 553692068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Message-Id:MIME-Version:To:
	Subject:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=KbtsNG2FfmZK0Mz72RTezvinkufpi4i9HqymHHSRnfU=; b=NNatekX/L1VhPF
	LRC5NPqJLZT1d3Z/yLCqWD1FEeI6+t4zuWq5Bcf1XIdVEjoGI/FVK+xYem9XSfbcu/PKiLKaGzWnQ
	yd5EAGnYrTLu6oU+D/gMti7hrHVAWhtQIY/mAXttI64Bwushs5FEMFrO8ZKlABjZKxr0tCIdZgWoV
	ImSsM92mC5h7K+Didfha5UQx5/tlkp+djuloI8U58mWZ4wEYGxeKO/o7/YG8E3R4ZO7W2R4mH8YpN
	ERSqlQn2PzQ3pwy7I2isRd7kuo1oQlbDf26GR7FKC12+/Qdx8tWqXXAU9pVUqpXmsYDBUrkE6vBUt
	AoDxMzEK4BRJQIe+7uYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjjpr-00019R-Jo; Fri, 12 Jun 2020 13:35:07 +0000
Received: from sonic315-55.consmr.mail.gq1.yahoo.com ([98.137.65.31])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjWGJ-0003A3-F9
 for linux-mediatek@lists.infradead.org; Thu, 11 Jun 2020 23:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1591916728; bh=4YUy2dnKX+aLfXhIKF01g98COCeJaRGO0uIb0VS79Kk=;
 h=Date:From:Subject:To:Cc:References:From:Subject;
 b=ksY/536Vx4+k7UgUuK7sU+hVBThfiszI09Iuz1pRDsEDzIekIw49uYjp7ORgIcNYz0f6DNDzfy6/4yfZrOHqInTp/7Z/HcyjmMMLgeZWuD8TRAwOaMMkENqEBRHmRUuLAghQQjihayEfj8L20m6zZMfg23tNVn0w4aye3VB6XxwcQwPiMIHahzYpkJItzHEI+CmtRNoS45OeF8pkyYlQXTj5rda13IOwNMLzMGJ8ZXmNJM+2AQJKKYg2covwyMtdvSqzYCtGIcWITwCXA8hKPZtr12KvBVm1CK0E2O6h8qR/7PTGpw4okY+ctPIvnNIDw3ffcEEgwvbMVoGH5mEvNw==
X-YMail-OSG: VeI5KAIVM1l8FZBKKOcgI77XPMQpX1yRxgEuJkG2HwGiwftSWlMzUhg.wI9RpCO
 0m9mb_xDfGj9T2zqhX.uH.ouvYYHvpDFZhv1pWFL5y1aS4v9hb1LGwKsLcCxtdjVmrndIAxlrgTz
 8LO3W4t7Y60g_t0QstSujZEh68oL_wRlHCSB5Td_M.HVxGsUQjqWM2qr_3.AkhSA0yutg5qcke8K
 Tv4I9pYJd9awi6FeCBU8.AW0hdjLa6mwHM8hm8SCtmWxN5P9kgX8HCxAaSA2wWYE5BgfOiUDY0eN
 8SdF4xfPgafkYHgez7VCD9nxGHLJtR8PsxeXciMIqqC1F9E63fd4UIcXYfSp5mCCnXf1pW2oA0VZ
 eHnF2Lf5MUvy0KsxA7VkbSJfJnhx72DN4PMW15_Pqypq2CTc5FOh7t_XE2x5gmqPfv8aAgem9Z6S
 G754j7JvVIvxR16NyP1NJHKbTMsWHNX0qPQnbyQSB5vpRmVwkBOq_AHkSPmPavoJRKp4qbzy6bBO
 Bgl5ef0LdH1w0IGoNwlRH.UR8MrIAnwak32wCqG5lf.SwS9m.j1yNpS4_5D0o_3_e09XXbmbVT87
 JydTvntH.WypWlGKDwbEeflUZOlJnJ07XyPmONgYYP36533AICJBEt96Va3.mhtjhlFw3.29ZciX
 DUnx7ZrUMS58v2ROWoMShz.kIsuifGl.62rbZy_X8r4vO.Uxo5XJwzW4msMSwsvTqaOqT_X2DSbr
 LLj_UnAnYi2D4y9bOLYthO6rgknJsjH5NNK_yfRdTmQy.0mTEM7K9s8uzcE9CTS8fKfsDaVPyVxh
 xVmmJFX.A8jqmra2IrNsfF8nyaPIwxTRtGkfxuk34ZNH.5c0amNlvLcBd8.CT2wpn_WASLVEIrIT
 lDlihOCfti987bgw5CyoUnMPwNm0_HyhWtZkakVcpPqyn4HsvO_sGZRdcb0.0tEu_C025pvdxswN
 rmgxGP8nc8FxFl_ewO1mGzIfh.LwtPgP6qxJHGwfAB.8sgV6oyaOcpklbPCK0mtb2TNuawY.gM1Y
 4EIewDISpLaEHGybdY02ejlYI9grt4UFGP66cBLM98U9eaSs476RtjcbgJDnZF0_b5o12Ivh3yDE
 .RRrOjKXttZUE3n3qAJp9VaVUkrJ1tU13bF05OPpKcgEydjxVzV7vX1CE71IihUl_3XGlg_spYT1
 ddNGRuEIqFA0z2RSjAXwv25g7eOX4gy.2PVQRZ6tqkn.PDou7IfhlVk8_1frFp5r3OUVYDW2Om7X
 b38HOjsBTSMFQLSdrTiz56K7c1Ygr8lUnUMCqgmgaJUxAZUUchMUduSb9Ii8mcXGP569B9NwAMAc
 y3hNB5BRs5SQzb2xm6fsFam.vFlKXVBiNz6MHR.jitsw1wi_Lt0BaPaD8ibirje_yAw4-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Thu, 11 Jun 2020 23:05:28 +0000
Received: by smtp422.mail.gq1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID 385a77de6a3948fc2d5a9f83b3566fac; 
 Thu, 11 Jun 2020 23:05:25 +0000 (UTC)
Date: Thu, 11 Jun 2020 19:05:21 -0400
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: AMD IOMMU + SME + amdgpu regression
To: Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Message-Id: <1591915710.rakbpzst8h.none@localhost>
References: <1591915710.rakbpzst8h.none.ref@localhost>
X-Mailer: WebService/1.1.16072 hermes_yahoo Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
X-Bad-Reply: References but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200611_160531_885060_DDF42F04 
X-CRM114-Status: UNSURE (   6.65  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 12 Jun 2020 06:35:06 -0700
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Daniel Drake <drake@endlessm.com>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org,
 Andy Gross <agross@kernel.org>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Joerg Roedel <jroedel@suse.de>, linux-s390@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 virtualization@lists.linux-foundation.org, jonathan.derrick@intel.com,
 David Woodhouse <dwmw2@infradead.org>, Rob Clark <robdclark@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

amdgpu + IOMMU + SME is now working for me on 5.7, yay! But, it is 
broken on torvalds master, boo. On boot, depending on which exact commit 
I test, it either hangs immediately (with built-in driver, before 
starting initramfs), displays some errors then hangs, or spams the 
screen with many amdgpu errors.

I bisected the black screen hang to:

commit dce8d6964ebdb333383bacf5e7ab8c27df151218
Author: Joerg Roedel <jroedel@suse.de>
Date:   Wed Apr 29 15:36:53 2020 +0200

    iommu/amd: Convert to probe/release_device() call-backs

    Convert the AMD IOMMU Driver to use the probe_device() and
    release_device() call-backs of iommu_ops, so that the iommu core code
    does the group and sysfs setup.

    Signed-off-by: Joerg Roedel <jroedel@suse.de>
    Link: https://lore.kernel.org/r/20200429133712.31431-16-joro@8bytes.org
    Signed-off-by: Joerg Roedel <jroedel@suse.de>

Testing torvalds master (623f6dc593) with the containing merge 
(98bdc74b36) plus the DMA mapping merge (4e94d08734) reverted allows 
amdgpu + IOMMU + SME to once again work.

I think that nobody is really working on amdgpu + SME, but it would be a 
shame if it was supported and then incidentally broken by a small 
change.

I am using an ASRock B450 Pro4 with Ryzen 1600 and ASUS RX 480. I don't 
understand this code at all, but let me know what I can do to 
troubleshoot.

Thanks,
Alex.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
