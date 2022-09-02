Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F18BC54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 06:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m70ifUKfsROMC77D6MINT4jBGjUL1IGdM1yLkcaO2/4=; b=y80XfohWToG+ugjal/KlzO20+S
	JiuulUTxY9Vl+OFNkBm2y4ahvhM9yh0//IfFFRgv6LtZ39N78VG8F3UtQB7/7vdVuYYJeu8ms8A35
	moPNfvyirm8dbQC40QLt4eUFijJcT+nzj4YoMjuXsWTxkFxN/3buSFxAJMcn6tLG4oNOSwPIS5wBB
	DWCqr5hce8NO8fT3zsZGEnU7oEE2UCmcS80uqhVsPs0YwWVFjISMkz1B76SauRFc/nhFfTloGoQ9N
	W9ylENWeJgJMJo9wXoEOaIUW2GGbTdQnobvanYjzlEpF//hSEyub3pMedsnDa0J6w8qoF9w03fDNx
	EVor6B0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0cG-0013Uy-Ty; Fri, 02 Sep 2022 06:57:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU0cD-0013Re-GA; Fri, 02 Sep 2022 06:57:22 +0000
X-UUID: baa8f3fa50fc4b2997661386d25d6420-20220901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=m70ifUKfsROMC77D6MINT4jBGjUL1IGdM1yLkcaO2/4=;
	b=QI6KSHGgVcpa/szzu3UPw3t3rXqjk8Xvn4pzSW+gfja2rAzJnzE+I6UPe30IabX+kTcucV/tCMnajIOWsYchJujDwZ9/da3OF9qR30Qm2AyzdNLpiuKlPFXAs7SCAJoO+dBgyludUuCd5AK8eaQBs4Y3erNcKzEbwL6NllO+Bws=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:3b1a2c14-50de-4e35-9e28-095cfd1105c8,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:28556cd0-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: baa8f3fa50fc4b2997661386d25d6420-20220901
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 140176940; Thu, 01 Sep 2022 23:49:53 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 2 Sep 2022 14:39:27 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 2 Sep 2022 14:39:27 +0800
Message-ID: <1773eadbc41a6e4e1dd8a3ace213e51974e2fcbd.camel@mediatek.com>
Subject: Re: [PATCH 0/4] Introduce MediaTek frequency hopping driver
From: Johnson Wang <johnson.wang@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<angelogioacchino.delregno@collabora.com>, <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 2 Sep 2022 14:39:27 +0800
In-Reply-To: <330d1f46-0e3c-f58e-b916-9e8644e7b4a1@linaro.org>
References: <20220831124850.7748-1-johnson.wang@mediatek.com>
	 <330d1f46-0e3c-f58e-b916-9e8644e7b4a1@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_235721_730259_CA7F0076 
X-CRM114-Status: GOOD (  10.15  )
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

On Wed, 2022-08-31 at 16:20 +0300, Krzysztof Kozlowski wrote:
> On 31/08/2022 15:48, Johnson Wang wrote:
> > Introduce MediaTek frequency hopping and spread spectrum clocking
> > control
> > for MT8186.
> 
> With one line introduction, you do not help us to understand this. :(
> 
> Best regards,
> Krzysztof

Hi Krzysztof,

Ok, I will describe more in the next version.

BRs,
Johnson Wang


