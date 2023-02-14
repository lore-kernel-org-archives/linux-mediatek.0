Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3DDC05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 15:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrQFXlyYQ6BXMoPDycsGZ57c4QKFYnwrzSnOP2uhY5c=; b=npIB3Om8odNLevNzgvi8SrM2eK
	1/vpzyl4GiJNabRx6VI9dGt9S77C/DzfsWs5CuXwdobR0DMNxNO0AIXPOQ0tyskaz0FzBkKIS9ASZ
	8LHQ+1MJKH45qf4NTUb5PJ//US39uGrg0IQEugL/5DLcwilKK18Xyz/cEKZrG2ILMJRxesv3QWK0+
	UMuJVCS4pobunwz+oLT5mFFcVyj28be2CpIkFMYWNKlC3qDG2dxcod5rCoZoe6idpFW+yXfp4c0VP
	j74pUbV/W/E8VzSkJIzIKjkFqqsYL6wVh0gHNAOlisbUT1iHyk2MjL4nzcVlz/bZ28Mv9EH5gaW5v
	gMpRIzFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwr0-002Nzo-6m; Tue, 14 Feb 2023 15:04:22 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRwWa-002Fxg-QG
	for linux-mediatek@lists.infradead.org; Tue, 14 Feb 2023 14:43:20 +0000
Received: by mail-ej1-x632.google.com with SMTP id rp23so40640924ejb.7
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Feb 2023 06:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xrQFXlyYQ6BXMoPDycsGZ57c4QKFYnwrzSnOP2uhY5c=;
        b=AlAbePd1Q3NeUZeR2Fa4w5Tmj4lwGN2RYVp1sWM1JcuteH4S4aia6L6QcVA/zPZHsT
         HUS3yNyPJXYnbv+NeFtGYj16tN1gj/RjA2mrgoEWM+Tvba+fpl+r2SXDxgxa4ufDV1Nm
         k1KyX2CkLJDqPsXtDFta117qhcdJFmoKDznYQcMbE4usvHZ2F8PQZDDwq936sE1AiivT
         UEFYHNyFpMNOoPgBHr74B09zYdfZo44MCPmcBli6jekwlidoc0Q3TOGlnHx/p5bwtuSU
         uMBUhIVhvLKF7A+ozHGqjnoBEywHcWk+8x5UVpFajK6ClMtYyraSEugTIkoiiIX+gkVa
         bzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xrQFXlyYQ6BXMoPDycsGZ57c4QKFYnwrzSnOP2uhY5c=;
        b=ZUdaxWSjlnPRc/ky1uWaWQt+UF+U3G822Kf/oDDcpNSQ3UOB+asY818LRpR4QOjdWI
         XG2UBlqaYZ+XQwN05NCDcssb6DSGOnKgKH34MIAFxyRXuiYW+zutAN40lW75ZacqwYjW
         yi0CVI4wx9lgJRWFfRjlZwY/vnTASlt24cBNVrYuB6ALKdKemHUnpUcDlmesgXAndsuu
         f2YuvLF4RBHzJxVkHtORbO6kiY7TBeH0ogjMC7KiiOifzAo2LWMyp3UvV1X55jxQKvBq
         VgXCf7cSWMexT5spmrIbqjwoqoaqoHK1i8rdf78/OGut2+HGNE2Tne5naSWftEHhsOgG
         d0qA==
X-Gm-Message-State: AO0yUKXEYTUs7x9sJEvOYLWcU+YI8ekpTYv2QzE52zu4JCHcu61eoSCc
	BhXdlY80x7Ma0vKdV3xjqL4r/DXnF5Zo6SdHPTDZaa/QA9NFF716
X-Google-Smtp-Source: AK7set/eRZRwT84Ah6k0jwJ445lJrD4natFzZ1kVHXpD+dAT/lHnlzbyOxVzjwyjHZ518E8n33MZrsg1UFD9/40unP0=
X-Received: by 2002:a17:906:14cf:b0:8aa:841e:ae71 with SMTP id
 y15-20020a17090614cf00b008aa841eae71mr1387871ejc.13.1676385793939; Tue, 14
 Feb 2023 06:43:13 -0800 (PST)
MIME-Version: 1.0
References: <20230209105628.50294-1-bchihi@baylibre.com> <20230209105628.50294-6-bchihi@baylibre.com>
In-Reply-To: <20230209105628.50294-6-bchihi@baylibre.com>
From: Balsam CHIHI <bchihi@baylibre.com>
Date: Tue, 14 Feb 2023 15:42:38 +0100
Message-ID: <CAGuA+oqD8qDVw=50dC=Qdi8f1-4YqtN7wKtV-msx3=a_Jb24aA@mail.gmail.com>
Subject: Re: [PATCH v14 5/6] arm64: dts: mediatek: mt8195: Add thermal zones
 and thermal nodes
To: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_064316_890353_377C8139 
X-CRM114-Status: UNSURE (   4.71  )
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

Hi Matthias, Angelo,

Would you please confirm if this patch can be applied?
and, if it is the case, to which tree it will be applied?

Best regards,
Balsam

