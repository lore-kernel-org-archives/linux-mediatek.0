Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B169C77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 10:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+oplVmOeEOPgIqDyW1qIYFp0lFRq10T5/lljQHKoh4=; b=AN32Xz1abYcw0DwMceYZ5w+Vlm
	JCphq3tQoQC7jYlQs+vvfLHVg8mKQUqojqQm9P1vT8wU0iVGpeON4tr17NITrurQNd/S3q7Kh23Fj
	mGgAEkoN6oSlJotKNSRBiuY5I97h1IRMr4lQATpohR9GmRm4UtIeIrByYNUeqUVVDh7M5izePaeUx
	/nHTj5fQIgrciYenbr3S+c4MOqki08kzR9uYiA32pqniVUZhhHFpFJunLXLpwRNSyJyf4LtnkR2rQ
	i7ordhJhBsDlYDbjOMJgyR1ihAROtzDdzGl2CTxCplJk24fm5qDbCNKqobRM/czmYIEYOFjyE0YWa
	YY6A2TpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poMKc-00FqNQ-1J;
	Mon, 17 Apr 2023 10:43:34 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMKY-00FqIW-0f;
	Mon, 17 Apr 2023 10:43:31 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3f1738d0d4cso3962185e9.1;
        Mon, 17 Apr 2023 03:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681728206; x=1684320206;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z+oplVmOeEOPgIqDyW1qIYFp0lFRq10T5/lljQHKoh4=;
        b=fHyGwkwDAtNj0DlHlyzUivs6EQ96RzQOhVuP6N5dkutmEDOwUGklY/lxNlehpflUy7
         RCd62MWviAhxTYZS52hjrQ71xno4y9jqfbhxt3Hs4Mdcu9pON3/1mtG8vpmZqmE93rSc
         Tb9ck/xOVFxFKiM0Wz1Z70UmNgrft9ErZieucpP2Mcdgn78ksMQlzO/LezrV2Woffiz0
         kJl7S2KtfS+COsO3Kvw8GdleE1ATC3ii2tbsoi7Ycu7uWpB0wjKLZ2xVilaYMJZ3bvWt
         zV+Wa2SY60vwSeapI6zXZ1/XB62iNG9tEkmvGcjh59AGw4AgSKF4VPgTwio0IlpzZPAh
         K3Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681728206; x=1684320206;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+oplVmOeEOPgIqDyW1qIYFp0lFRq10T5/lljQHKoh4=;
        b=KpsnPBDifxyHmz5SWZU3hDSOa13y0ExsJThuZhW69gvKTWDE5fcFGcEcT2T1oCr1vB
         KRmDvLgjQ2zAQUJXyZYaPXLmhpulPqlzaTpFvVRXhq6R8/8Z/IsGmZLncm23dLO8y29P
         1TT4ULoUcZQjrJVnvY5F3GdgAI2ws5GwWzzC53DZeXV8XRrHZKIxrCEJAKbB4ZsZZ7JK
         EnN6UIlnSxLkDf6ZopJk7RKP/DFfp0pAd3lbC1W+788rJ/HWbEA2NEuFbH5dr3kfHSdf
         UAWASuulTwdWqpP22H1vXEkMgVEvFLDNTUwktIsYwOrMVCIqgtGeZAQNX26N/rzUHKDM
         uvPw==
X-Gm-Message-State: AAQBX9fGr7wAnBSNwCBOXT65C4uOuJVyAwoxghx9O4PNU31Uut74qL+e
	Dx0dS7qZ4qFm5QBeW5+5t0w=
X-Google-Smtp-Source: AKy350bd9dvxSELvJHpzUxOJ/agocGbgxies6qUeTX6tG3PuWYiJlTByTcqlSV22b766L4A0As52Hw==
X-Received: by 2002:adf:de89:0:b0:2f5:8116:6458 with SMTP id w9-20020adfde89000000b002f581166458mr4935358wrl.66.1681728206141;
        Mon, 17 Apr 2023 03:43:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o5-20020a5d58c5000000b002f47ae62fe0sm10246043wrf.115.2023.04.17.03.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:43:25 -0700 (PDT)
Date: Mon, 17 Apr 2023 13:43:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kang Chen <void0red@hust.edu.cn>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, amitk@kernel.org,
	angelogioacchino.delregno@collabora.com, bchihi@baylibre.com,
	daniel@makrotopia.org, dzm91@hust.edu.cn, henry.yen@mediatek.com,
	hust-os-kernel-patches@googlegroups.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org,
	matthias.bgg@gmail.com, rafael@kernel.org, rdunlap@infradead.org,
	rui.zhang@intel.com, void0red@gmail.com
Subject: Re: [PATCH v3 2/2] thermal: mediatek: change clk_prepare_enable to
 devm_clk_get_enabled in mtk_thermal_probe
Message-ID: <48ae0e2e-257d-4ad2-afbc-2eb4b48e516b@kili.mountain>
References: <b2e5ef14-9a12-15d5-8016-d0994c1177c3@linaro.org>
 <20230411063531.3976354-1-void0red@hust.edu.cn>
 <20230411063531.3976354-2-void0red@hust.edu.cn>
 <4fed91ef.3c256.18783c407e3.Coremail.void0red@hust.edu.cn>
 <cfb7743b-03b0-96c4-fcc3-7095694f6fbb@linaro.org>
 <6108982E-A3DC-4B7E-829E-20BBAC9C503F@hust.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6108982E-A3DC-4B7E-829E-20BBAC9C503F@hust.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_034330_242968_F6BCF0E1 
X-CRM114-Status: GOOD (  14.60  )
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

On Mon, Apr 17, 2023 at 06:15:02PM +0800, Kang Chen wrote:
> 
> 
> > 2023年4月17日 17:52，Daniel Lezcano <daniel.lezcano@linaro.org> 写道：
> > 
> > 
> > Hi,
> > 
> > this patch does not apply:
> > 
> > Analyzing 9 messages in the thread
> > Will use the latest revision: v3
> > You can pick other revisions using the -vN flag
> > Checking attestation on all messages, may take a moment...
> > ---
> >  [PATCH v3 2/2] thermal: mediatek: change clk_prepare_enable to devm_clk_get_enabled in mtk_thermal_probe
> >    + Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> >    + Link: https://lore.kernel.org/r/20230411063531.3976354-2-void0red@hust.edu.cn
> > ---
> > Total patches: 1 (cherrypicked: 2)
> > ---
> > Link: https://lore.kernel.org/r/20230411063531.3976354-1-void0red@hust.edu.cn
> > Base: not specified
> > Applying: thermal: mediatek: change clk_prepare_enable to devm_clk_get_enabled in mtk_thermal_probe
> > error: patch failed: drivers/thermal/mediatek/auxadc_thermal.c:1182
> > error: drivers/thermal/mediatek/auxadc_thermal.c: patch does not apply
> > Patch failed at 0001 thermal: mediatek: change clk_prepare_enable to devm_clk_get_enabled in mtk_thermal_probe
> Could you show me your work tree? I can apply it on mainline-6.3-rc7...

Please write it against linux-next instead.

regards,
dan carpenter


