Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E31FC02183
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jan 2025 03:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCiz+sabDeeau8SEKk5GsN1jfadMcq+hi9aKPPfDvcI=; b=yi0qAIPjIo1MNrUfTzNN4cTeiD
	U4iGjolR2gz6OpUgXvZQCNCiItK9bjIpKLjJqzG2blJfu5JmwYti3pOQIe3Xz2o2W37C7D77A2C1S
	cdGC5WG+IDCWq2cW/GVmvGq+W4iWvoTXHrY1rMq2zb3AdjYCdg2pj7y8iE1JRCIe5IgvToouhEsb3
	FtCEnID6MKvsl4rM6mWkJANwfoRQ14ARUVvosLOFU0vP4z1F0xijULb6xrFwAbzbdzjDmsi/5HkVA
	j8fAB4A2cGc+0UALP7Dn8sZ7rMinE6VZOQCqOxlMns9K852cyIYTdPBMKp6n64r+kHjM/YnZXYpat
	MDMjs1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYdAN-0000000GvfU-2HOE;
	Fri, 17 Jan 2025 03:37:03 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYd96-0000000Gva2-3mjI
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jan 2025 03:35:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-216281bc30fso37939555ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jan 2025 19:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737084944; x=1737689744; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wCiz+sabDeeau8SEKk5GsN1jfadMcq+hi9aKPPfDvcI=;
        b=cTab1qWfvt848fCrkYFgb1keEVemV7mhOFRuG96tqNBahVaKtAbJszFdQ8+zQHU1RS
         xTQLs1l1Npp/+pf8XkjCxszSavsxfPXFFkcVzyzqSD4uM4EdG4Tr1HQTjLxLOM1dplqg
         S+r8Vo+N1xD1Af9fdr1LcUJTqhxD+aTtjuvUhwq2wW6/iuxtlXIaP5StxMAlvh5fSsFk
         W7PtavtI4K616k7oIqtOAD6krx5mm7WfDROwWPL3EgR4MXIiVfEPwgulLdjLCw5WevLm
         J3gfupN3mLliOvMQVf9tjiwMIxnLVN0aFkQs1JzjpXLfTolk7wJBcNifInqP1H/zEmGH
         Ej6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737084944; x=1737689744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wCiz+sabDeeau8SEKk5GsN1jfadMcq+hi9aKPPfDvcI=;
        b=r0ol7NSKnSK4YygdeaJouZMUFjTNDw4UH0PmFD5Ciom3UkUurVgTycFJwl7WRIjheB
         sqCunaKwJNF+I5yfud2tAAtkFQ8dtIdsaRernG9EJT190i6rdUyBDhyn7PtQuyp0RAR2
         Pm0Ih0r/IqIbsnGbHvdzEsaCya9qEpOWfO9XKv2+ZxMNI2dN2NKLi9J+SlMV0x1XtdD6
         yFQWAeC3CUrKzDST0bM+6wSOt9SU630cjvXmOR4807KYf2LbzPR1tzyOmz1npH1lYJH/
         IDYeUc3XdriTLhRmqMx/vtMHb15XgClvEar64pmhRCrg10bZiYActIY5W8QXH1jxu+HJ
         z6iw==
X-Forwarded-Encrypted: i=1; AJvYcCUsHH6tGog5Mg6fJS7hnXuWIRY+A4puTJ1wlfKkKZ7Dkm23vIm0UPmUgMhpnvzQh2PNYKByTtbWhOoyt2R+xQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRwSWOvB4p0K6kZ72KLls9Db2vvXGTzSPtbRT3oJc2wFiXIIdq
	EFd7Z7yS+bEtfGFj646xe446sH4sPnBSUcYr5zJ2x/g/s+85Dpcco02RX2U9I2M=
X-Gm-Gg: ASbGncvMWEIAnOclGN0jg6yqs22mbZIS7NgasyLKJ7Dkw6CR5WW6RfCmmRX6MYw0cJn
	NlSU79Lf80m3G5b1S2evpSAxk+4nCHhZehZrX2ZXIt70+3O1FY9+DWjqV2yaVMLQ4/ZJsqaKqN7
	iSttnYTfLXmtCDQSVn/5Prx8jG4gnisd/jSptXKDiX7cPAhAvgKT6JbjoxGTRxvjrKp/rzTL7Lw
	Q6SBBXxn2+iq1iFpOm2NLm787gTEQ5Yp6eYFitTDdYkAF9i+5UHPeOwGCM=
X-Google-Smtp-Source: AGHT+IF5Ygdj23ZD7GuKZPa9QsTHhprHgm42ulCzwj5UoaKE1u+8zqF+SlF34qHYFtOsB+w9cQjK2Q==
X-Received: by 2002:a17:902:ea05:b0:216:3d72:1712 with SMTP id d9443c01a7336-21c3579359cmr18630745ad.48.1737084943861;
        Thu, 16 Jan 2025 19:35:43 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2cea1fe9sm7100525ad.2.2025.01.16.19.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 19:35:43 -0800 (PST)
Date: Fri, 17 Jan 2025 09:05:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v10 1/2] pmdomain: airoha: Add Airoha CPU PM Domain
 support
Message-ID: <20250117033538.pnh52c7qd2bb7h2z@vireshk-i7>
References: <20250109131313.32317-1-ansuelsmth@gmail.com>
 <20250116070214.vdnbyyqnciifngha@vireshk-i7>
 <CAPDyKFr_z3WUyO2bTV7fPt8=ECdoHCERd=f5UN8MmNpyN=Rm_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFr_z3WUyO2bTV7fPt8=ECdoHCERd=f5UN8MmNpyN=Rm_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_193544_932283_F433258F 
X-CRM114-Status: GOOD (  17.15  )
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

On 16-01-25, 16:58, Ulf Hansson wrote:
> On Thu, 16 Jan 2025 at 08:02, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> >
> > Ulf,
> >
> > On 09-01-25, 14:12, Christian Marangi wrote:
> > > Add Airoha CPU PM Domain support to control frequency and power of CPU
> > > present on Airoha EN7581 SoC.
> > >
> > > Frequency and power can be controlled with the use of the SMC command by
> > > passing the performance state. The driver also expose a read-only clock
> > > that expose the current CPU frequency with SMC command.
> > >
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > > Changes v10:
> > > - Depends on HAVE_ARM_SMCCC
> > > Changes v9:
> > > - Fix compile error targetting wrong branch (remove_new change)
> > > Changes v8:
> > > - Add this patch
> > > - Use SMC invoke instead of 1.2
> >
> > Any inputs on this ?
> 
> Apologize for the delay! This looks good to me! So, applied for next
> to my pmdomain tree, thanks!
> 
> I assume Viresh will take the cpufreq patch via his tree? Please let
> me know if you prefer another route.

Applied 2/2. Thanks.

-- 
viresh

