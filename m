Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2646EB64DC
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 08:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uHV3SorPPRx5smjTKgidKSpB/zG9RGZsFPGQGoh8zP8=; b=lXsFfAP+UUl9Xvu8m6yihVyf2T
	ethbNVA2iW4eqXnyyXWtgafcvaVN1zgarQZG4s9Niu5jWwXdmjerHZsNUwpi47efPRlnMpMYTDHAH
	KMOb97ouF/jhi9i+EAb84fIe2J1zj+BlilrVKT0mKAJrQ41nse69dTseXjVBUwKTloOVS4deXVcKW
	Me8J4uZnDEMf+RZLlNBf9QistozXg1K9SdKXgAHPsMooSx6A3eI08xnbkCBXP5YPLwR8o0XsqKe+9
	ZoRs7lhowOoxaUpavtk9AYOTBXN3AIlbQyXmwSMK0qx0aeGMKW0LjgIkfQxQg9mrj2288NGJBg5ut
	RuEzl9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMOgt-00AEsC-1w;
	Thu, 20 Jul 2023 08:07:15 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMOgq-00AEpB-1q
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jul 2023 08:07:14 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b701dee4bfso7071611fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jul 2023 01:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689840427; x=1692432427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uHV3SorPPRx5smjTKgidKSpB/zG9RGZsFPGQGoh8zP8=;
        b=eo/aPm7QmBLtn05NMv5zgB6q00je7hyfwr3G+KlaQcIfVVo0nhp/BtkUFXWWNsfxzE
         YjHlqcOAcqUPzuLvQBBFi9QFWhxy3eLFajG+d2qcpDf4r3RN7Shsxb3P46y8xYKIOb+x
         cOE3LQEQqHJ7Ookvz6lXNKy87oQQ3XA0tXMb11/tD8c1Y4xlzdNlTV8XkrNkDrkWTNvR
         wQx4D49nSSuVaRPRiZPt1lULxjIlu4ornYVXwh++JCGMIi0XQ6SIAlnnj/QK+kLh73fk
         s9csjK5oq6Gvn7yxpA7S+nXVdyngfWBPC37F+D5hZ3tMObEQ2Wkaa1lTcELx4Y+KRLfU
         tqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689840427; x=1692432427;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uHV3SorPPRx5smjTKgidKSpB/zG9RGZsFPGQGoh8zP8=;
        b=J47RD3SveHlZwTHf2e9i0OOGKqoEsX/k3pQX5HLQNpG3lx+xt4qE9wHvebr7eSJxVN
         r7xX41UHaCXlXRgU8WluiHlNueJ7PKZcC4rPiRjUNE1QWFaPE3bR1b/godXblKbS6Dl1
         i3Ch1AbcHVjPg9nR3ZvdqQ9Yys1KjtwyTKVetdB8dd2TAk1KRPcVN2Pfr7RnWG44DwdT
         4BA/qpmNi8YhZNCsrw33N3QbCtnuknNlZIDLxeJOX8H1NGPUecA7CZupWUOLAMllecbX
         P5AtCcWyshrizc3r1F8KtF/wxqomP6RmPw2en1v5NGfiOly9IduJzRxQsLR0ziJKhELg
         6FKw==
X-Gm-Message-State: ABy/qLZkaZOFMQKqC0UvJP1iEUMHWDadZoYU4kxUS62WZwpYOLMImjQM
	zlAOkFMrdq/6B5B1H4mbm7XuKQ==
X-Google-Smtp-Source: APBJJlF5k6R9A67PfYpJchDVd7Ed7BYUOP9gf1HDCKJdQrDY3scfui+zBnHSn9KXAkF+LCqCCHgZ5A==
X-Received: by 2002:a2e:9d52:0:b0:2b9:4aa1:71e1 with SMTP id y18-20020a2e9d52000000b002b94aa171e1mr1456444ljj.50.1689840427634;
        Thu, 20 Jul 2023 01:07:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id q13-20020adff94d000000b003143c9beeaesm542198wrr.44.2023.07.20.01.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 01:07:07 -0700 (PDT)
Message-ID: <8374cb80-749a-401d-2d88-48001ad614c2@linaro.org>
Date: Thu, 20 Jul 2023 10:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Replace deprecated extcon-usb-gpio
 id-gpio/vbus-gpio properties
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi
 <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Beno=c3=aet_Cousson?=
 <bcousson@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20230615145838.1526919-1-alexander.stein@ew.tq-group.com>
 <20230615145838.1526919-3-alexander.stein@ew.tq-group.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230615145838.1526919-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_010712_608393_04554956 
X-CRM114-Status: GOOD (  10.46  )
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

On 15/06/2023 16:58, Alexander Stein wrote:
> Use id-gpios and vbus-gpios instead.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek
> ---
> Changes in v2:
> * Added Heiko's A-b for rockchip
> * Added Matthias' R-b for mediatek

Please split patches per subsystem, so this could be applied. Or send it
through soc tree, but you chosen the middle way - neither per subsystem
nor via soc tree - so it went nowhere :(

Best regards,
Krzysztof


