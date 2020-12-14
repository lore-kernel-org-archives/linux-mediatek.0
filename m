Return-Path: <SRS0=EHBe=FS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EFCC2BB40
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 20:33:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A38F2226A
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 20:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A38F2226A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HHEU3EcFgwDClyIKtaJ9LaOAR/pxO/9uqK77WyK3huY=; b=wlQrTgOjaGpZ+FmI67eA1/5w1
	QG8P1LdsfsVRg7/kIArqttyD+t98C3LJK+jeyCLv1Vju1pCDqT9qdosVrrZGO87Yah4Xoao3I42dS
	M4lzokHFsZSZtcaREsNOGvP/Uj7K6v8C6p1Nx1A6taG31d3OoWheIjw14/hE2lw8QyWmtWs9/EwgH
	HR7dH/dCBX6NJj+doAaOipu3TZGxS2tKrmrJqV341HABfNSCyayqE4/rV4c9xU66BClcWFeD1v4xX
	oxcnMw6D/PEMNUF/qFBeIoR3akLrO7sR9w95XJ6ev3PbkozeePcY3oeHLFbi8KjE8bf4Tdm1uD7jt
	/KYUiOE0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kouWn-0004Op-6M; Mon, 14 Dec 2020 20:33:05 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kouWk-0004Nl-T5; Mon, 14 Dec 2020 20:33:03 +0000
Received: by mail-ej1-x642.google.com with SMTP id qw4so24385279ejb.12;
 Mon, 14 Dec 2020 12:33:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XGRbUsgrZUCddja/BqC2r/x11/O5f/TK7TN/AMbIvbY=;
 b=llIvmbDLbvM4qJ+0lVfbuG0zz2bRdzjLnxOmu1rJwjTbbatJq/1npwWlgepvHS5W7M
 RgEvyq4z2fTu+0pdYtVWlISqDRrOS7NiHQEu7eTzyVUBp7VSCDM4dBBixHpUls7ptBfp
 UIWOkBhs5Jjx47VkO/0N4tDsAGUrwKUgO8/GuW26IBvip0BokUr1GhRKKR6Xrnwd8M/1
 ghXSQym0zsSEuRISFCMgcB5QvahYfQP+3ggtKDjlTlegUnuiaHkYqsI8lSgB/w9VwAnX
 4gWcR0S9ZAPWFUEsw26rVXbNJM7XaBhU2fDb5qUtzvWa+ilvb7DiLnxOAnXRPO3bqhVE
 0XLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGRbUsgrZUCddja/BqC2r/x11/O5f/TK7TN/AMbIvbY=;
 b=uWRwRwLNaYquDUdDW5NuUYLPu2RNKLNZUNst/8zJa1QjetxpF/3H6+5rTQxeT2SdW8
 cxtvBYh4FmZlg8ol1UBRMzDCvd68tOKcVs6qdO/20y8211CEIflAbvWwoV4eukna01AR
 fPK55yEMV9auI4hrpFIUbx3fuSV1TobS9cUnAQTlpcjP8aFwfi3DMQBjXTKh7GwrdvZY
 4B7lYsni4UQX/dvaNCLNQIOxnvy9rOxvSC3v9fNf5nrTtFDafzEv7g110ZDcpL6VrdC7
 So2BCeArwcFT6JmP6DIDmPclAj66sAS7evsSLq3rjQ+zHYBKJs6obtlZs5ncoZsAuKCM
 0lHw==
X-Gm-Message-State: AOAM532d8WTPnKpjpXNpmDHRlIGnaROb0MCQCh7vybtsG0u7I8f4VUFL
 i1aRzRokqKvMbirgqIkK3aw=
X-Google-Smtp-Source: ABdhPJzfzL20bcd7uCQoX39BGGgmI/+CETD/bRgLdpMhgNaXSl0//iyJF23APVGECsCEWmyWh6Pofg==
X-Received: by 2002:a17:906:da08:: with SMTP id
 fi8mr23885831ejb.517.1607977979727; 
 Mon, 14 Dec 2020 12:32:59 -0800 (PST)
Received: from ubuntu-laptop (ip5f5bfce9.dynamic.kabel-deutschland.de.
 [95.91.252.233])
 by smtp.googlemail.com with ESMTPSA id c11sm16850719edx.38.2020.12.14.12.32.57
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 14 Dec 2020 12:32:59 -0800 (PST)
Message-ID: <53cf543b503900847ea776aa3edd24cc33252501.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] scsi: ufs: Re-enable WriteBooster after device
 reset
From: Bean Huo <huobean@gmail.com>
To: Stanley Chu <stanley.chu@mediatek.com>
Date: Mon, 14 Dec 2020 21:32:57 +0100
In-Reply-To: <1607476170.3580.29.camel@mtkswgap22>
References: <20201208135635.15326-1-stanley.chu@mediatek.com>
 <20201208135635.15326-2-stanley.chu@mediatek.com>
 <970af8b1abf565184bf37c3c055bf42ad760201a.camel@gmail.com>
 <1607476170.3580.29.camel@mtkswgap22>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_153303_063598_C2EAD3C5 
X-CRM114-Status: GOOD (  16.45  )
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
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com, cang@codeaurora.org,
 alim.akhtar@samsung.com, beanhuo@micron.com, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, peter.wang@mediatek.com, cc.chou@mediatek.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 nguyenb@codeaurora.org, avri.altman@wdc.com,
 linux-mediatek@lists.infradead.org, jiajie.hao@mediatek.com,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 martin.petersen@oracle.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, alice.chao@mediatek.com, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-09 at 09:09 +0800, Stanley Chu wrote:
> > >   
> > > -               if (!err)
> > > +               if (!err) {
> > >                          ufshcd_set_ufs_dev_active(hba);
> > > +                       if (ufshcd_is_wb_allowed(hba)) {
> > > +                               hba->wb_enabled = false;
> > > +                               hba->wb_buf_flush_enabled =
> > > false;
> > > +                       }
> > > +               }
> > 
> > Stanley,
> > how do you think group wb_buf_flush_enabled and wb_enabled to the
> > dev_info, since they are UFS device attributes. means they are set
> > only
> > when UFS device flags being set.
> 
> Hi Bean,
> 
> Thanks for your review.
> 
> Yes, I agreed that wb related variables is a mess currently. I would
> like to clean them up once I have time. Feel free to post your patch
> if
> you want to take it up : )
> 

Hi Stanley
I updated this change in my new "Several changes for UFS WriteBooster"
series patch, are you interested in reviewing that? to help Martin
easier pick up the changes.

Thanks,
Bean



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
