Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D06C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 08:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6ZtmHupaXoRDRGY9zWChszWCHX7SVOtXMTFCB5kP6A=; b=NQVTnKf8U0JanqTk3JFCj46TAS
	x6mvV8McQMXJi6QqiZVXYsNgMg8EfmjooB4atv+tRVHsc0jJnxrQlEKGykhk63NgvaLi1Gk43Lpkl
	YJ2d2hjUpBYDXAoVBhFiS90zt2Jnwtpc/lzlTvfn0y5b5/SSXg8cL1M+BdqKEEw14z6RdmSt6CG5e
	+TP9pkogQSpSeLyAwgSTbKJf7dTAe0vIK8elzpDW/5AmqsVkHHUh0ed8paDE7Cbseal81i1w/Iu1H
	kbBHfxKPvodG19csrmIZjNd+aERUpH9BamRikzyXxLM8KGqhBOrXokmHxDeDBlGhU8p2sT+E6zXeP
	NO+gQ6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOg6-006Gzq-WC; Tue, 22 Nov 2022 08:30:51 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOfh-006GkS-96; Tue, 22 Nov 2022 08:30:26 +0000
Received: from 8bytes.org (p200300c27724780086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7724:7800:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 8810B2A0360;
	Tue, 22 Nov 2022 09:30:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1669105820;
	bh=vLe6nxgqikKlbcnK8kZzaybY0rU15COq4GRTBdtoeg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JIifV4bBxxqGYXp3xL/kaRjDWVQpQG5GFY0CPgdELMHldHAZ2DWLYMnr1Ihb/GS3n
	 niLlNZ3gMPUDzW7AXOrTrm2wGqFNwRu7OYIq+ucgr13+Vhw5/75ol7RhHXiE7dGjzG
	 qxaZhEhAOvVVg9wMHXp1Rcal8uGK1yV98G5gzraY/NYjeRf27iUT5ZFpuHLWEqNJuM
	 eM5hIlv4bTLb0LnxW3j4KK89coWJaMRkVDtHmgSkqJ3VFDHe3IWZUzsXbKNs7vOSTg
	 rl5LkSJLe+faA5zMTwncGWocSFa5m7Z5TyNAIG/FzT6CXB63bejxOTS4CiwnB1qsFL
	 LrrPXXihKUu8g==
Date: Tue, 22 Nov 2022 09:30:18 +0100
From: "joro@8bytes.org" <joro@8bytes.org>
To: Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"will@kernel.org" <will@kernel.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Youlin Pei =?utf-8?B?KOijtOWPi+aelyk=?= <youlin.pei@mediatek.com>,
	"dan.carpenter@oracle.com" <dan.carpenter@oracle.com>,
	Libo Kang =?utf-8?B?KOW6t+WIqeazoik=?= <Libo.Kang@mediatek.com>,
	Anan Sun =?utf-8?B?KOWtmeWuieWuiSk=?= <Anan.Sun@mediatek.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	Chengci Xu =?utf-8?B?KOiuuOaJv+i1kCk=?= <Chengci.Xu@mediatek.com>,
	"groeck@chromium.org" <groeck@chromium.org>,
	Xueqi Zhang =?utf-8?B?KOW8oOmbqueQpik=?= <Xueqi.Zhang@mediatek.com>,
	YF Wang =?utf-8?B?KOeOi+S6kemjnik=?= <YF.Wang@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"iommu@lists.linux.dev" <iommu@lists.linux.dev>,
	Mingyuan Ma =?utf-8?B?KOmprOm4o+i/nCk=?= <Mingyuan.Ma@mediatek.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v7 0/6] iommu/mediatek: Improve safety from invalid dts
 input
Message-ID: <Y3yImpIgDiLVk7La@8bytes.org>
References: <20221018024258.19073-1-yong.wu@mediatek.com>
 <b20e6c79b989f0f26707f6e43b9f4aa0d1d8f02e.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b20e6c79b989f0f26707f6e43b9f4aa0d1d8f02e.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_003025_605639_FA55972C 
X-CRM114-Status: UNSURE (   6.82  )
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

Hi Wu,

On Tue, Nov 22, 2022 at 01:13:01AM +0000, Yong Wu (吴勇) wrote:
> Gentle ping for this. Could you help review or apply this if it is ok
> for you?

I am waiting for Matthias' OK on this.

Regards,

	Joerg

