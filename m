Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75923ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 10:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KK3UoclfL8kHmhowR+FoFpgrghLqeaE9E9mavmz6o0s=; b=tpIleZRXPEFXIRP1Mb4lVSSbYq
	4rqs+rTjDj0m4Q2q1KQaF2AJwjR7LJ9TkmnsFoQRf0nWJIw+JOqU8AQYkhavyA9GQPvJUC889FpP/
	mLHs+cyIhcVF90VFNpAPyy2Lrrfq5EQS4T8+GIK8a8+1Ao7zGaK2UAEfj0KVcqH7UAZ8NmGT+6RON
	fcGfbMqNscCY8tG8/fGM6lT418aeRlHcLg2SgNexzkzG1YwR69YkdKCArsbZCppsDMJI/ZBBC7/Z1
	wAuAHP7QlI15zxJHn0aM39seJDNWwtwWflW4ZNkFU5aWH3TYRcKJC+ztriTM/KW57mnbEPAAxDay1
	2aC53vsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThuM-00BBjc-Gv; Thu, 01 Sep 2022 10:58:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThuK-00BBhR-4m; Thu, 01 Sep 2022 10:58:49 +0000
X-UUID: c83ebb22d42d4c8abcbad2442a56704d-20220901
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=KK3UoclfL8kHmhowR+FoFpgrghLqeaE9E9mavmz6o0s=;
	b=cTxLfPFRWWWlltNRc07SLaOFK03k3PCyBMdkIoq2bPNdeVjI4OUIED6ZVhoiXkk0POg8IjoMMXJVc9TEM94VHtSAOfyvu5V8ZThhHWogUJKovI/hxfAUyPWrlNGBg6t6yGTZoyG/dmUn0ZDDMqtAWRz7MFxLDTRVq+6JKykqw54=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:fb17f8a3-da82-4658-ba7e-905e5943ad66,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:f6be52d0-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: c83ebb22d42d4c8abcbad2442a56704d-20220901
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <liju-clr.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1851158857; Thu, 01 Sep 2022 03:54:39 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 1 Sep 2022 18:03:59 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 1 Sep 2022 18:03:59 +0800
Message-ID: <36bbb36f1f6a8991856a01a82300298ad5423359.camel@mediatek.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: watchdog: Add compatible for
 MediaTek MT8188
From: Liju-clr Chen <liju-clr.chen@mediatek.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Runyang Chen
	<Runyang.Chen@mediatek.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<nfraprado@collabora.com>
CC: <angelogioacchino.delregno@collabora.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Date: Thu, 1 Sep 2022 18:03:59 +0800
In-Reply-To: <5dbdcb11-ae9c-e2b5-793b-35fa16a4208b@kernel.org>
References: <20220816065330.27570-1-Runyang.Chen@mediatek.com>
	 <20220816065330.27570-2-Runyang.Chen@mediatek.com>
	 <0b17f336-5c04-e375-ef4a-3804f9702bf8@kernel.org>
	 <092345db980b30c577350edc46d88dc3888736d4.camel@mediatek.com>
	 <5dbdcb11-ae9c-e2b5-793b-35fa16a4208b@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_035848_224218_D86A598E 
X-CRM114-Status: GOOD (  13.68  )
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

On Thu, 2022-09-01 at 12:44 +0300, Krzysztof Kozlowski wrote:
> On 01/09/2022 11:16, Liju-clr Chen wrote:
> > Hi Maintainers,
> > 
> > Gentle ping for this patch.
> > It would be appreciated if you could give some suggestions.
> 
> Why ping? You got the ack, so what do you need from me?
> 

I apologized for this mistake. 
I should reply this on cover letter instead of this patch.
Sorry for any inconvenience caused.

Best Regards,
Liju Chen

> Best regards,
> Krzysztof


