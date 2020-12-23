Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D0DC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:35:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8E0622248
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8E0622248
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xDglahMGHbEKwxgV/eiSi2z5kvPlvEcNW4jx0ISoDMY=; b=RN2RmFrMHALraMGWGm6Uz6wYZ
	FLxFMjzvA1GYYGqG9XJ4HDQDSrZ+UTVxHNAeF9MrQHXpLZjd7dw8GaYC8EoZ5Trj7JAl3SjLPj726
	HXYFLZZxy2QlIkyxzKNwKubkFrznHS3k2kE77+cqgJagsrZ2vXj2/BosAfyjZ2p23tOyvobqMTF6o
	ar9ZFqasVEkkpP7ONTMbToeXRKpX0FPwo89XiCzAVLP0KNBInyktTOvuZx1BNYIMtn711iKwcR92+
	C0TDCksYpsx9BJRVu0LKcIzv9khvs7MHByGccf6BwsX2vfvKSYLcD7Gd7UDzh1yHcICRK0IdHHpAf
	1w0qI314w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krzcC-0005ok-8L; Wed, 23 Dec 2020 08:35:24 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krzc8-0005mX-IS; Wed, 23 Dec 2020 08:35:21 +0000
Received: by mail-ed1-x52c.google.com with SMTP id i24so15463796edj.8;
 Wed, 23 Dec 2020 00:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Eduj66RiVco+AT7g2a8p+pCQPzg2FWtlxEHzfdMi00s=;
 b=coPa26v03zKgNgMIpiXDgDAK86vnk2bCSzrIPk0VFBbiiJMDzyM1vB1vPnXVKNiao7
 rWGdceLVaZI1n581fdliq/J9m3IFMegzOh8pJ1qJMeT20oNPD8LrK0Bv5YgpVgN5uFmL
 tUXa4P4bkMWsn0asdt17IMNHhLRUz9kjrkwbFqdTj6JGkamIzNcgep43s8GaziH5/Avl
 rKsKHQgNt0k0dlR6pgsysNNLq5SkKf886D/XZoeBx/xp/boxJYKKQGaRow2a5+2e21yq
 S/x7aBW6U51fSsyo3w4O32R/aISR/4fysdF0Cdz3uUjHXPgVAPLWTTsMHkGPDYoMURkE
 zqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Eduj66RiVco+AT7g2a8p+pCQPzg2FWtlxEHzfdMi00s=;
 b=ejctr0ObxtSNgBFS2NG944Q2/6FMg5PH1xHPUD3QGkIFSvGPcmRQ9ekM6HBEX0k89T
 kswQMiX5WKip25mrj3gpr3trFMAB91Td2WdWfdq7Seuh94/ssVKYT7RHRkvvBo20kQss
 lIfuvedoJdZ8BULreAgXiPmF9At04szIW4NSrte1LxUjqRnJMIQwlHBjOSf3eilMiGWy
 VYFUXU/WpIhZPTVUerWLDUqlnC4t6zPwzg9nlU22rz0YcEcihjnM2JnYQVqBFOBfkl7n
 L9/xrkHk6cvep+YghR7FFAIP3sV9Cm6uQwkR/EIHD8w1KE8+P7IPsf8sPNAJEwklrn/W
 T6Bw==
X-Gm-Message-State: AOAM532sdIGKhTMfo3g8yPHgSXDGjRPnUuyAih/3KmQMwmWmGoy7K8cM
 5r+4o39VptgzxvqahZXMrDk=
X-Google-Smtp-Source: ABdhPJxgaqcz1/WGEx69Zgz5v3P94ZQkqyNKYnW4yoWdAxdZPuP9oYZy3mZfQkQD8FpuutRaDS1FaA==
X-Received: by 2002:a50:f61b:: with SMTP id c27mr23642613edn.61.1608712517605; 
 Wed, 23 Dec 2020 00:35:17 -0800 (PST)
Received: from ubuntu-laptop (ip5f5bfce9.dynamic.kabel-deutschland.de.
 [95.91.252.233]) by smtp.googlemail.com with ESMTPSA id
 ga11sm11349518ejb.34.2020.12.23.00.35.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 23 Dec 2020 00:35:17 -0800 (PST)
Message-ID: <8804b780b55f8dc0739e10a246d02cafcb00ab03.camel@gmail.com>
Subject: Re: [PATCH v1] scsi: ufs-mediatek: Enable
 UFSHCI_QUIRK_SKIP_MANUAL_WB_FLUSH_CTRL
From: Bean Huo <huobean@gmail.com>
To: Avri Altman <Avri.Altman@wdc.com>, Can Guo <cang@codeaurora.org>, 
 Stanley Chu <stanley.chu@mediatek.com>
Date: Wed, 23 Dec 2020 09:35:15 +0100
In-Reply-To: <DM6PR04MB657598535F633F59A1DB1F22FCDE0@DM6PR04MB6575.namprd04.prod.outlook.com>
References: <20201222072928.32328-1-stanley.chu@mediatek.com>
 <c862866ec97516a7ffb891e5de3d132d@codeaurora.org>
 <1608697172.14045.5.camel@mtkswgap22>
 <c83d34ca8b0338526f6440f1c4ee43dd@codeaurora.org>
 <DM6PR04MB657598535F633F59A1DB1F22FCDE0@DM6PR04MB6575.namprd04.prod.outlook.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_033520_701035_1BF6FDD3 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
 "andy.teng@mediatek.com" <andy.teng@mediatek.com>,
 "jejb@linux.ibm.com" <jejb@linux.ibm.com>,
 "chun-hung.wu@mediatek.com" <chun-hung.wu@mediatek.com>,
 "kuohong.wang@mediatek.com" <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cc.chou@mediatek.com" <cc.chou@mediatek.com>,
 "jiajie.hao@mediatek.com" <jiajie.hao@mediatek.com>,
 "alice.chao@mediatek.com" <alice.chao@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "peter.wang@mediatek.com" <peter.wang@mediatek.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "beanhuo@micron.com" <beanhuo@micron.com>,
 "chaotian.jing@mediatek.com" <chaotian.jing@mediatek.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "asutoshd@codeaurora.org" <asutoshd@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-23 at 07:47 +0000, Avri Altman wrote:
> > > could change the way it does: Keep manual flush disabled by
> > > default and
> > > remove this quirk.
> 
> Ack on that.
> I never understood why it was needed in the first place.
> Maybe just remove it, and allow to perform explicit flush from sysfs.
> 
> Thanks,
> Avr

Avri
I agree with you.
I don't understand why setting that at the begginnning, also assign
this feature the contrller to make desicion.

Bean



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
