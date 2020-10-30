Return-Path: <SRS0=gG0U=EF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC74C4363A
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 03:49:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5BE921775
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Oct 2020 03:49:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GqdCZMDX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h1V0jDWU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5BE921775
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IhvkOjyMeEJ7Q1bA3uDGrObAVP+bBSZPzYo4FGNVPPI=; b=GqdCZMDXdO8mcFegwnlpNyFO4
	sPiwvSWNBH9fBXfjlGK0SSKgg6RP8evD6mzeaXglxUyfKRXjK1kFsh08N82exVpF+ksxbWwDGbp6y
	hFomhBHwoS8l8qQbL3L+eGK+8xUt7Ptz6NJpQmbzLKqPrRk9GkDPhScm7Z3PG5aE4myxx6qQmJ4hL
	F4vZUH4T/QHZ7CDHV5oEPb1ei+aaHmf86uZv6WcGjOmq/+PPJ4Kuwi6C5zjzTawCLMt/r1uZJJuiq
	yOfMAZ6mj5Z8WHhPxWNGxSlBOKVNB/bTD4lKd0P4zznSs6/WY0Stb78clXFdikFF9cXcI/WK7wta4
	meXGYWAuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYLPx-0006ra-He; Fri, 30 Oct 2020 03:49:33 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYLPu-0006qO-SP; Fri, 30 Oct 2020 03:49:32 +0000
Received: by mail-pg1-x542.google.com with SMTP id h6so4076929pgk.4;
 Thu, 29 Oct 2020 20:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=POKlFlvAqzthNcFgF5vrqxopTlKMhI/9XKBoukQUU8Y=;
 b=h1V0jDWUp1S3U6KREeWgcIWN1e0DzycLLMqGfeC39oGAgIucVZpXu+qs/YF1id8e7H
 BfXsvLNFBOmQoSkP6umfYlOK0LL+bZeye00jojwKQHx2PHvznXOQc2ij0dDZqIzHkDMp
 04HAiQaUGMojBG/+Ute7s7GQ3j2DNesgGx4BtHo3Q9kgWAs1ZaQ78PWXVxyY0sNeBYgF
 h5BshH3kayBonxs960k9E5nUWeqQiU25v0K11oSCrm4vTtAk2JikLlIwRhyrmZES249n
 SnwrxtKtr/aCdn6l2cQB7cxzCmMdT3XxPY99goQOx7YHh4k3cT4mvq8ogUbWoTgPM6P7
 +aGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=POKlFlvAqzthNcFgF5vrqxopTlKMhI/9XKBoukQUU8Y=;
 b=ZnTQu31VWSwHaYTfW3vjslWmKBHEkeoojUpC5nw8U/EyGGJcSR6+BzOfSAzoRAiZbP
 QJCQrz92+LR95AwHqbREjg6rCNV3py0pDBbyK8hcEgdwdeXuYhhSC36tDXVK86HNZ/Si
 0GkML+FQ2jb8yUY4+xWfD5g8P4knLoXbxWMFG8OVVijRFHHlCkdyPLGWR3diptA0kH4U
 5LSe1UZEU3Te9ghZhBUt7XTgikRHt7Vi8Dyjv3xiJ1+czvnqRbMNAGRaALkym/JG1owm
 DT3u9XPh+jZUQHmb81Lo6MhmhL2WwjQswi6u7dzX4EAl9PJqaDY8xrONJtHme5GXXBBX
 UiXg==
X-Gm-Message-State: AOAM531EhwoUBUQr+0ocpC2cvF6Id4WQVa1aL1UTj2cVMVzhr17mvhnL
 IMWpVxHU8+eBrtJoO26KaPo=
X-Google-Smtp-Source: ABdhPJwDGHNezweuCs5v1Slkjg0XOxMIxqhPAXFU8ZNNBjzXucjZ5NGURqeBtYJPkN5q74VxmTeM0g==
X-Received: by 2002:a17:90a:fb92:: with SMTP id
 cp18mr429782pjb.228.1604029769012; 
 Thu, 29 Oct 2020 20:49:29 -0700 (PDT)
Received: from [10.230.28.251] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id t129sm4578814pfc.140.2020.10.29.20.49.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Oct 2020 20:49:28 -0700 (PDT)
Subject: Re: [PATCH 03/17] phy: broadcom: convert to
 devm_platform_ioremap_resource(_byname)
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>
References: <1603940079-8131-1-git-send-email-chunfeng.yun@mediatek.com>
 <1603940079-8131-3-git-send-email-chunfeng.yun@mediatek.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <9c33597e-34e7-f94b-a4fb-bfc2e6b0f8ba@gmail.com>
Date: Thu, 29 Oct 2020 20:49:24 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1603940079-8131-3-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_234931_177225_94490C33 
X-CRM114-Status: UNSURE (   9.53  )
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
Cc: Ondrej Jirman <megous@megous.com>, Peter Chen <peter.chen@nxp.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Al Cooper <alcooperx@gmail.com>,
 Anil Varughese <aniljoy@cadence.com>, Wei Yongjun <weiyongjun1@huawei.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Fabio Estevam <festevam@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 NXP Linux Team <linux-imx@nxp.com>, Icenowy Zheng <icenowy@aosc.io>,
 Bharat Gooty <bharat.gooty@broadcom.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Yue Wang <yue.wang@amlogic.com>,
 Lubomir Rintel <lkundrak@v3.sk>, Remi Pommarel <repk@triplefau.lt>,
 linux-mediatek@lists.infradead.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Hanjie Lin <hanjie.lin@amlogic.com>, Ma Feng <mafeng.ma@huawei.com>,
 Scott Branden <sbranden@broadcom.com>, Randy Dunlap <rdunlap@infradead.org>,
 Jyri Sarha <jsarha@ti.com>, linux-kernel@vger.kernel.org,
 Sanket Parmar <sparmar@cadence.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Joe Perches <joe@perches.com>,
 Colin Ian King <colin.king@canonical.com>, Shawn Guo <shawnguo@kernel.org>,
 Li Jun <jun.li@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 10/28/2020 7:54 PM, Chunfeng Yun wrote:
> Use devm_platform_ioremap_resource(_byname) to simplify code
> 
> Cc: Al Cooper <alcooperx@gmail.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
