Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6F04C433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 21:31:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B203520768
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 21:31:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pQ1qV1us"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B203520768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OO6nTkHeCb53vumdZiYDRlE61S1W5Hl6MULTd/2FbjA=; b=pQ1qV1us/Ts0R0yLbPBEquASW
	Y9P+7WDWzM4vLaOoiRAnF0XEILcXE7TdFr90vSmENrFH+dGuCMp+5iSlSjXskdpfDFpLwSHJ8rMTQ
	PAb7neEDI8Ittj2tLsFVPoPfUZkljGGq497bwEimOqcipDcSEUePGh+lna9QM2X1iQY9m7d3KQXzA
	brAgwj1UKxnN5dxV4fSdAb2OfdjD6Ek6+YWJdjpkb2PROc0c/LwhgqBKQJHvaq+yB0eeUFMpa7Qg7
	1dt4cC8Qf8veHdwMFwO0OEhwE77vxC3tUYJAq/CJhd1kRjA7iFIKGIu68J7u9vHgKhaOuELBik7i3
	XLNl9/3RQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyioY-0005T1-IN; Thu, 23 Jul 2020 21:31:42 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyioN-0005LO-6u; Thu, 23 Jul 2020 21:31:32 +0000
Received: by mail-il1-f196.google.com with SMTP id a11so5616295ilk.0;
 Thu, 23 Jul 2020 14:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BIw6m41bEFoOKz4cgGIlpAZHm+JvVBbNbLNDcXn0BJE=;
 b=c3d7+AuLiCVfUOXYnJyHZxtBW5XGfj8/d2Pn2M9LwVny6cjBv67/lVA6T3xIuP7uba
 sQfkj76x3BeG5QFJGhHdvUbkFgHne3jT33iRruAXeDj9xr5SqnOIsEcA9deGN0BYPFSn
 BhqbkPWSTg/d2re1KTg7TUblXOOtvA6UjVemMjNVxGWBpo3mj/jQexv9dFG1fC9bcad5
 3LLCoem7JdMWj17drTSMctftvSIzRtnnyJ49lKUWzeYrd2pMXX2AjPGM4vvaWTqayp/+
 MSnP2rfGUqc7bqMoaHtlsmqTDgTjHVDSu6X3gaFMu+CZC3eakdrvtoTIEFKBq0aeRnvq
 +58w==
X-Gm-Message-State: AOAM530aaiJQIqM8MjYHUXvauWC0vc9pAmscUPwy6fqK+YlmkrlJpzdL
 53RdVfBSQAMY7RU1KT/3Dw==
X-Google-Smtp-Source: ABdhPJy5nDdiGLJMan1qtQeNQE1tFghS/VAw2SDr5DSd0X01/uox2cHJXZa8Oq1fFecjqwJV15WgGA==
X-Received: by 2002:a05:6e02:e89:: with SMTP id
 t9mr3438231ilj.292.1595539890313; 
 Thu, 23 Jul 2020 14:31:30 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id l13sm2023466iob.28.2020.07.23.14.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 14:31:29 -0700 (PDT)
Received: (nullmailer pid 894261 invoked by uid 1000);
 Thu, 23 Jul 2020 21:31:27 -0000
Date: Thu, 23 Jul 2020 15:31:27 -0600
From: Rob Herring <robh@kernel.org>
To: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Subject: Re: [PATCH 2/8] dt-bindings: mfd: Add compatible for the MediaTek
 MT6359 PMIC
Message-ID: <20200723213127.GA894209@bogus>
References: <1595509133-5358-1-git-send-email-hsin-hsiung.wang@mediatek.com>
 <1595509133-5358-3-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595509133-5358-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_173131_319612_96E50B78 
X-CRM114-Status: UNSURE (   9.57  )
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
Cc: devicetree@vger.kernel.org, Josef Friedl <josef.friedl@speed.at>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 23 Jul 2020 20:58:47 +0800, Hsin-Hsiung Wang wrote:
> This adds compatible for the MediaTek MT6359 PMIC.
> 
> Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/mfd/mt6397.txt | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
