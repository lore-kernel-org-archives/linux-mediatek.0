Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89384C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 16:37:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19BE861385
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 16:37:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19BE861385
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q1TftUQ5fuyws35fe4ABYguVHj2VDgwBK+8wOm/q9NI=; b=Yf0PpWPSESxVEDnHt5j7q8z/3
	hBVIiY/uQywYxThU0GqT1f6/HZUf0+7C0Mu87bJWCsp/ey9P+UfK56lhnl0iW/fysvlFVD8AYV6f0
	fjyi5AJvvnSd1EuDV38mjh69ppZGTmUqRxomjcx0ENeLuw7qF55nKj6hp3Jt8WeunNoPW1Nm6z/Ap
	XwZrHmMaymkp0V9usdEJr9huyD0oKk0mm69wRjD1waFS3kzc6CadjEN10uzpKVt7VhmgYXTelugup
	ytWNZTiRebsogENgW2hLqrG2GdwKcmhP6ZEdtrJIvfpYxuJCmZboAru8UQMdbSFmYSTRVHlGy6Nc/
	ac2F9uEKA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS0Jn-00AL5A-2p; Thu, 01 Apr 2021 16:37:15 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS0JH-00AKz0-BE; Thu, 01 Apr 2021 16:36:47 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 g8-20020a9d6c480000b02901b65ca2432cso2669363otq.3; 
 Thu, 01 Apr 2021 09:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZPH3WCM/TnePh08egpPl8mvTJ2h76XFtwQZcEwnvobU=;
 b=LYV4ZloYN+KMpHNcRByrOXSX8xRC7Hne2qUNg5yW2/5iUOY6RCo0a+UTdVSEeYeDL1
 EPUqTodqgXuafdXvYuCzoGriCVdzHB/A0NaAsv91BRkWPjAMDBqmpDUrUwnhB2Gqn5zh
 Ui9202BL5ReLdTooDkTqHxa1E/orraWAaBhj43Xx8lHwAqZkjfqjydEcfWFL4sQnrVIy
 6M5H6Uhsban9AMkDrJVd0emolx44vrCZ41/Lu2L96fA1sDspnmUt7PQvr7kYbKa+ggGN
 u/SALGH7N+3CU5W/rDmpwNbAtaCWVLMuEON82shrcJgiN92vstME+kvS11QQG36/9mR7
 zypg==
X-Gm-Message-State: AOAM53293X5KDss/WWF6W1RuN4kItqSk3n+EOru+cMNkrJAGrduBmqL/
 45LXxOMYQeOHl+7DCWGVvA==
X-Google-Smtp-Source: ABdhPJzry24ZspFgMJWJqJTiORUFoP+9mVcfOtgexiVOhccs/HM2asz2P93i6hp+ssr6h7AsACWdoA==
X-Received: by 2002:a9d:6e18:: with SMTP id e24mr7715273otr.284.1617295001957; 
 Thu, 01 Apr 2021 09:36:41 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o6sm1317748otj.81.2021.04.01.09.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 09:36:41 -0700 (PDT)
Received: (nullmailer pid 570452 invoked by uid 1000);
 Thu, 01 Apr 2021 16:36:40 -0000
Date: Thu, 1 Apr 2021 11:36:40 -0500
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Lee Jones <lee.jones@linaro.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sebastian Reichel <sre@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alessandro Zummo <a.zummo@towertech.it>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Fei Shao <fshao@chromium.org>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, Rob Herring <robh+dt@kernel.org>,
 Eddie Huang <eddie.huang@mediatek.com>, linux-rtc@vger.kernel.org,
 Ran Bi <ran.bi@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>
Subject: Re: [PATCH v7 4/8] dt-bindings: regulator: Add document for MT6359
 regulator
Message-ID: <20210401163640.GA562289@robh.at.kernel.org>
References: <1617188527-3392-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1617188527-3392-5-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617188527-3392-5-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_173643_715351_E29C4C1C 
X-CRM114-Status: GOOD (  10.97  )
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

On Wed, 31 Mar 2021 19:02:03 +0800, Hsin-Hsiung Wang wrote:
> add dt-binding document for MediaTek MT6359 PMIC
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
> changes since v6:
> - fix yaml error.
> ---
>  .../bindings/regulator/mt6359-regulator.yaml  | 385 ++++++++++++++++++
>  1 file changed, 385 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mt6359-regulator.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
