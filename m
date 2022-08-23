Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C53BC32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 09:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2BCez/FmHvEKIJLxsqE9Ry9MkuiaBgiplVsoJtyq5uA=; b=F95sMPw3Ve8wTYOqfWP/w1tesM
	fCQ5bza60+i4MOhPz+7+gBH+mF0AUX8OTQpuQnl2WZUVmQhu4ieYYOr9DsNee0+8A1y9OuN2aA+S0
	wnVIh6/Fdpw/3fTE20VCpD32VmUoajBnlgx0zmO+4r2FbvECl1ZyoG7WvRjMildziEe23NRpgBARl
	tLdJDV2tVV/N17Vak7S+V3R38y52yxwPSC4pI88MRXOjuXL9vgFqwcYL/4jm8s6q38jp3jMEJiZCY
	suQFMuUY0wRdSFdkLl8ASxMHO4/wGDf6H0d7oV1Oh7OyZ1PDWDDn+xkWlS6vrB9s8K10TvwpCQPCm
	cgzxhk0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQQAm-004SZu-PK; Tue, 23 Aug 2022 09:26:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQQ5l-004Pom-CB; Tue, 23 Aug 2022 09:21:13 +0000
X-UUID: ca7570521abc46ad9f0326759db55a60-20220823
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=2BCez/FmHvEKIJLxsqE9Ry9MkuiaBgiplVsoJtyq5uA=;
	b=VGwyfnyO3VlthJP1QsShtRA+zSvewrOtgCZyGL/EgHPdWArXW+akpgUW2eWhL4aZljRu3W/nAb3UVXbn6hsjFWNMllJvU3sY0OyzPWhIrvpSYi59VcxCIk7JUKz6srkY9QsUyRjMW8ZQO1JZudb/RXlwt3aUdFRoXED2xJMO5YQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:0c47a575-88f5-4c13-a92c-77201d1b1bf5,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:b23b58cf-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ca7570521abc46ad9f0326759db55a60-20220823
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1936914594; Tue, 23 Aug 2022 02:20:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 23 Aug 2022 17:20:21 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 23 Aug 2022 17:20:20 +0800
Message-ID: <93938744264079d92c2bedf3a9abc4e92abc3ae6.camel@mediatek.com>
Subject: Re: [PATCH,2/2] pwm: mtk-disp: Fix the parameters calculated by the
 enabled flag of disp_pwm.
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	<thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 23 Aug 2022 17:20:34 +0800
In-Reply-To: <f621a841-593f-cfed-9560-64c011a00bdd@linaro.org>
References: <1661239875-19841-1-git-send-email-xinlei.lee@mediatek.com>
	 <1661239875-19841-3-git-send-email-xinlei.lee@mediatek.com>
	 <f621a841-593f-cfed-9560-64c011a00bdd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_022111_631336_BF410D46 
X-CRM114-Status: GOOD (  15.71  )
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

On Tue, 2022-08-23 at 11:32 +0300, Krzysztof Kozlowski wrote:
> On 23/08/2022 10:31, xinlei.lee@mediatek.com wrote:
> > From: xinlei lee <xinlei.lee@mediatek.com>
> > 
> > In the original mtk_disp_pwm_get_state() function, the result of
> > reading
> > con0 & BIT(0) is enabled as disp_pwm. 
> > In order to conform to the register table, we should use the
> > disp_pwm 
> > base address as the enabled judgment.
> > 
> > Fixes: 3f2b16734914 ("pwm: mtk-disp: Implement atomic API
> > .get_state()")
> > Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> 
> This is a fix so not really related with the change adding new
> device.
> Send them separately in the future.
> 
> Best regards,
> Krzysztof

Hi Krzysztof:

Thanks for your suggestion.
If there are no other comments on this revision, I will separate them
in the next edition.

Best Regards!
Xinlei


