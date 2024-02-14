Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F81C48BC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 21:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ir/unotnfD5rMdtsGoyJfuSxeOlSTFmP2bDl4ko9QIQ=; b=AePxtYZ4j4wqE1Abv9lT1ErHn9
	J8ViMFuwzgbQ63iVYvj/IHGixx7SJFqMmQSKXO7uRuNok7Rw4NFzuRRSIjwjGK5IwdHbIaEA28biY
	eSSMNx3EHSKNVR/3bV+QjU+p/nQtjxk79wJ7qkUqGadVDIvl7KNnGc0BlIoD0vHZyeNowtujbIZ1z
	hbPWh9IYptmKdt/NMjE2fJOFLlPERvUpQrWJqTfSC8dISrsDue/Hz6C48M7oUi6vwDb4QGMx2Ll14
	ctsqxujef4gnoPJQ1JPb3wOB+zUheufIru8xT+bSuxW34xsk03gA1GUkrrgYkLwJoRKWk56PUCTYt
	DBgZh8uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raMwk-0000000EKLQ-2Vbc;
	Wed, 14 Feb 2024 21:37:38 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raMwh-0000000EKJM-0HC1
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Feb 2024 21:37:36 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-a3d6cd979b6so18342566b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Feb 2024 13:37:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707946653; x=1708551453; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ir/unotnfD5rMdtsGoyJfuSxeOlSTFmP2bDl4ko9QIQ=;
        b=zvGYQOyYfhQoP1s/74zsNpIH5lmQK+db9CDuMys0XzlveRpnjC7E1xDVU0Rnaqi3G1
         sOIaQRxw6467ySTqUFDOd2I6tz4aWLb1JO3iiAFEL/89sEAW1bVUEM9+Hg3h/ZoMKBJE
         ldiJ4k4lBkEsY/EUffbCpUtO2qPK4yG1q/y9BTO6LwUdMHWHIl5iwKpttO/ERQdKV2OI
         x8uUFc363I+sjeGiz8qV6g55eftNRVe9R3QqrjM/mfW17wafjbw2ZdJb5dLXWt+FsFnK
         GUEGqwbfS5Jzaj3CHPk65AsTXyMc6X4t3Rk3dXTCaZawhRBFBcr+x6YWXn9PsMWFDG1m
         fDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707946653; x=1708551453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ir/unotnfD5rMdtsGoyJfuSxeOlSTFmP2bDl4ko9QIQ=;
        b=fJId3lxSvQ/+Ja0U947c/4Ykb86vO9nIhdabI5iPuOWj+bohOUO+8Ln0wHlKRlhzVw
         5Ld/igt234jAWYhAIdd1h1BNy6eJKapCU4xAm0HPViNlwI8v5v+Mb9npnhzHkvJ0vEq7
         C7MzS4NLcZ7j06K+uD/fBtTywIeBVcSlY2Ty7l4Qo86BveELbgG0sx+vPCkAatm+qdz9
         ta+mf1KezreAZLUeMsVrPaeJoY3gxDI2mx/+o59bNOhAvbPa9iPk8KHq1KCzon+nRdyU
         +QP9AMan0p5k3y48ZExMjTWIU+ubxNCCDNlO9VKJCiC8jdqYqQaZLymrsPPvVgv1F3+j
         u9zg==
X-Forwarded-Encrypted: i=1; AJvYcCW+Iqno2tzRmoe3cvBZV+vpq8pMSfNdMt3FieF+M6CvyzT8MOLU2iZw/ZOfNbfBpa78nvGtlx9h34mDh1WtovE2mffpGJHEes+Ok2yzaibcv+CJ
X-Gm-Message-State: AOJu0Yy0dcZ5o79yLHUoNBJ2IKFBp6v2qMSsWupR2NZT6fGerxiqBaGi
	wLYa2vbs6GOkHLUzYoQYFv9j85FiZv+you/szbAiZQR5VmHb+5+D1K7f6jtPQruoN2+zoCn3Qbf
	b
X-Google-Smtp-Source: AGHT+IHk8JLhkU3PqjlB3r1X7UjDpDlD05JGbvpAVKzdIOh6hcCu0LS+v/I1vied8tFOXqlMkHNH4g==
X-Received: by 2002:a17:906:ccc1:b0:a3d:30a0:2e79 with SMTP id ot1-20020a170906ccc100b00a3d30a02e79mr2565149ejb.54.1707946653601;
        Wed, 14 Feb 2024 13:37:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWf55Ibmdxn4mP1NgfJga60DJOumX4O0k/ju9udq+ijqg03KBqFzNuxp3XkGYlC8PLAgOML2h7P9FIrghvOxk+13ZbEiPwSDSQpzylyKcGKntugzulOXfO+UO0HJWUMaqvCtevi42PRrUUzUS/BXVaAnsPCZC/Oyp1WTdnoNVxdUl+Q/KiUx+tTpiXOcnfxIQlJBxP/YAuDrCiniNFjo24YgFRBqo4nznj4EKhPoBPPe6Xk1vCO3tz+0OO7F2YPl5wZAgtZicZTKn+kA0Ee7eAHqaB/QuO4hnkES/QspkiETCivrxFxKUBnNk9GepzntLozlmbkNCQVFg5F3PnRJ2SHFpX81NPX4ua6xQCF7KGxdftPmEEb60b3KfHRaxI8+qf+9lKArK5F7+YfQnM6yTVzZ/lbYBqPnCsF8ERlRsMjex4BvwfrPksIMGVL5h03HdQxtVn9pfBqTxB+ceGzYV88sL/GGwpt/zOx2WWJJkTRKegN/sMgqQ==
Received: from linaro.org ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id hw20-20020a170907a0d400b00a3cf243de37sm2249089ejc.111.2024.02.14.13.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 13:37:33 -0800 (PST)
Date: Wed, 14 Feb 2024 23:37:31 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Srini Kandagatla <srinivas.kandagatla@linaro.org>,
	Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH RFC v3 2/4] spmi: pmic-arb: Make the APID init a version
 operation
Message-ID: <Zc0ymyR87km2rZjW@linaro.org>
References: <20240214-spmi-multi-master-support-v3-0-0bae0ef04faf@linaro.org>
 <20240214-spmi-multi-master-support-v3-2-0bae0ef04faf@linaro.org>
 <d9f88786-abe3-4826-adbd-fee461a70c2c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9f88786-abe3-4826-adbd-fee461a70c2c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_133735_141394_A1946447 
X-CRM114-Status: GOOD (  12.55  )
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

On 24-02-14 22:16:58, Konrad Dybcio wrote:
> On 14.02.2024 22:13, Abel Vesa wrote:
> > Rather than using conditionals in probe function, add the APID init
> > as a version specific operation. Due to v7, which supports multiple
> > buses, pass on the bus index to be used for sorting out the apid base
> > and count.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> [...]
> 
> 
> > +
> >  /*
> >   * v5 offset per ee and per apid for observer channels and per apid for
> >   * read/write channels.
> > @@ -1178,6 +1246,49 @@ static int pmic_arb_offset_v5(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
> >  	return offset;
> >  }
> >  
> > +/*
> > + * Only v7 supports 2 bus buses. Each bus will get a different apid count,
> 
> "bus buses"?

Urgh. Will fix in the next version.

> 
> Konrad

