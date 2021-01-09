Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A18C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 16:45:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8D432333E
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 16:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8D432333E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X9JFTU01DmP1PiSFLRks9HdwDaXPSa6iGh6uf2CRdO8=; b=otHzf9UhgPkxRl8Cfb4OhCptX
	Dpu1GP5iVLRRiMaDw1NPBW5yS+1pbypUe1FB7QhRv5P5IHnlnyI5F3DRsu3/wRsks+wAyjW7AGKJt
	CUfEcbxgtKPeLZYErCT/rqq+a81f5lOe/VRpfp0Yd/msK6dxES/A0SdBe/sKoxGb/4IR/QSKvjLO0
	tRfeCgPZTZOny2szLPqqYJ8SCLPx7Dod3GQ1qgBRlm8u6j5nCapzzIO5qX9xmDZstB8yMc8VZi5q5
	kSuEgt3Y3tmrsVzr47JmJ1IiBGYyc9knUVNxxN5Qei7ouwCde+HMDXDbiwj0SZQDrEyVLpfUOGgJC
	LBpvC8K2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyHMc-0005Ka-SA; Sat, 09 Jan 2021 16:45:18 +0000
Received: from mout.gmx.net ([212.227.17.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyHMW-0005Ii-Kr; Sat, 09 Jan 2021 16:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1610210693;
 bh=t0xRRcpfx8CmUrj1y7gu9ysNwQrKAhLNtKpvWeALyxg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=isZU4laO2OzDxt/KjIPRBHbCwFG/mvKeOM/aQmd0HSRJ+Ue4qpF0j86enCX5h9tbW
 /WREGJNburZ9MANkfdYomHfEFV79EjXaj93Wwl5K3pkiVP0/lW6963aiuCwyKyXIXf
 n4jF8Ic7NM6YCAFBGm7KIEgpWdIQ79Gr+iurp9mM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.76.99.44] ([185.76.99.44]) by web-mail.gmx.net
 (3c-app-gmx-bap17.server.lan [172.19.172.87]) (via HTTP); Sat, 9 Jan 2021
 17:44:52 +0100
MIME-Version: 1.0
Message-ID: <trinity-5d8f37cd-9d0e-4790-baf9-30b8ea4bc743-1610210692928@3c-app-gmx-bap17>
From: Frank Wunderlich <frank-w@public-files.de>
To: matthias.bgg@kernel.org
Subject: Aw: [PATCH v2 3/3] regulator: mt6323: Add OF match table
Date: Sat, 9 Jan 2021 17:44:52 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20210109112612.1221-3-matthias.bgg@kernel.org>
References: <20210109112612.1221-1-matthias.bgg@kernel.org>
 <20210109112612.1221-3-matthias.bgg@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:O7Fhu6dDxIRzG1n/8s2FEsKtZnQCyjn3b4/8rlrNW+9i+pO5gq9bgwt5ga3BGG+JtOzn7
 LHtoA0I17+bYi/JQVNr3an85fGpHuPJXYYgOT02FBAfxtFzZ/UqtohgY/5dJNjKHMmIFWoTiZP9/
 lw16wdkYauCkKtEROtwcaIuFeBR8vTllcSQgAMXAWPGrLrgUA5n2ejtdWhhmJwXnQ7oRTm1JbwtG
 52QYyzeIZ0AT6XbYLrue8dxc+yUOrgL7lGMPSpJXlQKrcsn/l0SLQMxRvWfeQj9tz8YMABPS8Yr4
 /I=
X-UI-Out-Filterresults: notjunk:1;V03:K0:yx2Tj72ja58=:psqyfhGbFlzDpc5LVeng/W
 cEqpwE9wpFHa9LDMqu8AdfPO2d/o8Mi/UWCW0ldAsAVrXeQJMZPbq6sLCiwzH/E9LPWb2MmkL
 gug2MsIth6n5V/SkAlmeCryQrH+Wxlw3j3l5LH5hVNIbsLhGl76+vhvEE9M+WEji/im8s6DBl
 j6hJ3uZ/qNdEB+lC8B8pkaaXFnMQrLXaMHybmrnIkV6wkJRJLvrYwEOq+B8hlnLYfaqqHSy4Z
 CeOu8J9Im6Mv/wMZMwioizTrHnnYRzUxSr1yHcGrpLidh+KNQoHj2kVUxCnVfFMdG4ZaD9iZp
 smLWkZp9fbxfYoHr9vv+Z7IeA27daqQgVI4cTTv4GPz1TaZKCIR0rCu+Dqn5zWbDskfZHpjuQ
 85alAOcywdF6tqxEUgNm4eD3WDNwrx09R/JXGETldge8uWa+ZK+QG+Vo52HgNfdcZmhheI1Jc
 keszR396xFVjWGv9CtpJ/3X2vh4YEI/6F0IfWnIJQUWsqz32CsAeuJyhES+Ei2WkBX6uW6se1
 Gd10QoxML94KVVN4g3tXkfVnyB/o1fv677LdCdwqjW+18eQtbtJP29dslxlurR8HLPqxf+oBB
 o4KIYRo/05QwQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210109_114512_955936_1FA65423 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: Gene Chen <gene_chen@richtek.com>, Matthias Brugger <mbrugger@suse.com>,
 Axel Lin <axel.lin@ingics.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

> Gesendet: Samstag, 09. Januar 2021 um 12:26 Uhr
> Von: matthias.bgg@kernel.org

> Changes in v2:
> - check for CONFIG_OF
> - add Fixes tag

> --- a/drivers/regulator/mt6323-regulator.c
> +++ b/drivers/regulator/mt6323-regulator.c
> @@ -406,9 +406,18 @@ static const struct platform_device_id mt6323_platform_ids[] = {
>  };
>  MODULE_DEVICE_TABLE(platform, mt6323_platform_ids);
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id mt6323_of_match[] = {
> +	{ .compatible = "mediatek,mt6323-regulator", },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, mt6323_of_match);
> +#endif
> +
>  static struct platform_driver mt6323_regulator_driver = {
>  	.driver = {
>  		.name = "mt6323-regulator",
> +		.of_match_table = of_match_ptr(mt6323_of_match),

imho check for CONFIG_OF is here needed too, else mt6323_of_match is referenced but undefined

>  	},
>  	.probe = mt6323_regulator_probe,
>  	.id_table = mt6323_platform_ids,

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
