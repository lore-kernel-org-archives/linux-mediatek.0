Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEA3C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:09:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED5F0206DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:09:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZkK+s4GF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AoErrPD+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED5F0206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zXMTJLM0Sn117cc1xrDMQKTSXF5j036CAnGCU4Tq7OI=; b=ZkK+s4GFBUpcUiwIbNCDbLXps
	nT/WnjBRdvf3P5tSkDbdWfxhWLJciQhRL8iw71eJ6O2IW0eOleXE2BkYCud7Ay50vdaimrSsbhxuO
	5KENvQCWvJbI85hUpQmA/5b/618K+mS0ToEqKwUxQsD+pNxPbFdsYlc8F3kpo2Zp/aII8k5YlXg/P
	9JVaPzPfNZZ83ml0uGoTLGeVKm/KNZgLbD4cMt1vmQN6KLy8W6hiGUJ91JDEyeAgD72lEeByoJ2y0
	1ESoz4QlwEpvxhRde+cRIr2L29cnLpA8ARwV2noWwozY7IAr9+Q7MJqBBvs2zD04ITOPgDXypjERo
	4LUzM1WCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGf3q-0008Lv-OS; Fri, 11 Sep 2020 09:09:38 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGf3n-0008LK-7H; Fri, 11 Sep 2020 09:09:36 +0000
Received: by mail-ej1-x641.google.com with SMTP id p9so12812474ejf.6;
 Fri, 11 Sep 2020 02:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7Bp1bOXWpBW7xzPXZ3ZxvYtrmFHDxcf8OQZ+i0KC0UU=;
 b=AoErrPD+qrhwGcDvfNqT6OUGIyZYBl1CdW3NeuiUtAUwJ81YiW7prlQgPZiUhRt3DG
 Al3JCs1h2azPGHtzzd4u5MDTiPAg45Oy9b53hMVMMt06uflXgrNx1G6Fd4Ynk+s3abgP
 rh6JOuRCfYY3lPxlnFh8KOsBAXXzWoGURBEFL1U7PDCSM2SCvh/J8FlhqEqnhWVgDFsN
 JWCb8BRT4LIn/5MKmYAcThCLEeOqK1RB2cXjxMioWUWuLfMhs1/QxmPLl4xAQ77vj7Oc
 1s+gKjiObs/kxkN9xK4rN2bvdlK9jyTG81x26JzzxHlTSgvvoOUCFKRVRA9oyabwsMdg
 P62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7Bp1bOXWpBW7xzPXZ3ZxvYtrmFHDxcf8OQZ+i0KC0UU=;
 b=DIojx3i+8qLkpDF5fJGLga3lVdznvHcVrtPaOiVJdF2lIPNYldS2Ni3LZzo+buwebb
 EoOOr+6tsLR95ai60iR7U1RwIe9ltCzW+wcT3dhJ3PkJibh4CAd4p1efPqjSyWWY2LX9
 HdUX6npo852dpJvwLy2iuqc0XY5FheKaIcnRV8Qtv6icZmL9Fi0qlzSwFJGLyRZf+WQJ
 fQyVpafQqyhOBAmuINJGBpjaD4RfREKx8Yg/sHuUN0MZgOFrL2TtMe1H4tzYBEZjxsoA
 uzHYTHQdNa7lsqpNA9Bf9xyuRMaxTHfSzwdFBcBqcwqaRaOmtLSlTcN7zEnvWUGlea7j
 DukQ==
X-Gm-Message-State: AOAM531zd4vq8m2UdpsDhg/lYCgl0n7spOKj7TOCOC2YluSCZreIvnFI
 eN94crZDNdrO+Ptr4elZnhM=
X-Google-Smtp-Source: ABdhPJwnPRlkAmFeY8wHJyQPHx85HxdD5H38Ly9l7RTwHl9JaRd86G75DM7dJ4DdksRfA/Wzh9U9DA==
X-Received: by 2002:a17:906:9a1:: with SMTP id q1mr1065673eje.30.1599815374057; 
 Fri, 11 Sep 2020 02:09:34 -0700 (PDT)
Received: from ubuntu-laptop.micron.com ([165.225.203.62])
 by smtp.googlemail.com with ESMTPSA id y25sm1156217edv.15.2020.09.11.02.09.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 11 Sep 2020 02:09:33 -0700 (PDT)
Message-ID: <d151d6a2b53cfbd7bf3f9c9313b49c4c404c4c5a.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] scsi: ufs: Abort tasks before clear them from
 doorbell
From: Bean Huo <huobean@gmail.com>
To: Can Guo <cang@codeaurora.org>, James Bottomley
 <James.Bottomley@hansenpartnership.com>
Date: Fri, 11 Sep 2020 11:09:26 +0200
In-Reply-To: <010101747af387e9-f68ac6fa-1bc6-461d-92ec-dc0ee4486728-000000@us-west-2.amazonses.com>
References: <1599099873-32579-1-git-send-email-cang@codeaurora.org>
 <1599099873-32579-2-git-send-email-cang@codeaurora.org>
 <1599627906.10803.65.camel@linux.ibm.com>
 <yq14ko62wn5.fsf@ca-mkp.ca.oracle.com>
 <1599706080.10649.30.camel@mtkswgap22>
 <1599718697.3851.3.camel@HansenPartnership.com>
 <1599725880.10649.35.camel@mtkswgap22>
 <1599754148.3575.4.camel@HansenPartnership.com>
 <010101747af387e9-f68ac6fa-1bc6-461d-92ec-dc0ee4486728-000000@us-west-2.amazonses.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_050935_355236_4BCE7CDF 
X-CRM114-Status: GOOD (  19.54  )
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
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, Bean Huo <beanhuo@micron.com>,
 rnayak@codeaurora.org, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 open list <linux-kernel@vger.kernel.org>, saravanak@google.com,
 nguyenb@codeaurora.org, ziqichen@codeaurora.org,
 Avri Altman <avri.altman@wdc.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, salyzyn@google.com,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com,
 Bart Van Assche <bvanassche@acm.org>, hongwus@codeaurora.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-09-11 at 02:16 +0000, Can Guo wrote:
> > > 
> > > So your resolution looks good to me.
> > > 
> > > Thanks so much : )
> > 
> > You're welcome ... but just remember I have to explain this to
> > Linus
> > when the merge window opens.  It would be a lot easier if this
> > hadn't
> > happened so please don't make it any worse ...
> > 
> > James
> 
> Sorry that my changes got you confused and thank you for help
> resolve 
> the
> conflicts. My change ("scsi: ufs: Abort tasks before clearing them
> from
> doorbell") is to serve my fixes to ufs error recovery which only got 
> picked
> up on scsi-queue-5.10. So I checked out to scsi-queue-5.10 and made
> my
> changes on the tip of scsi-queue-5.10, below 2 changes were not even
> present in scsi-queue-5.10 back that time.

I mentioned here https://patchwork.kernel.org/patch/11734713/

this change (scsi: ufs: Abort tasks before clearing them from doorbell)
has conflicts with the scsi-fixes branch. I don't know which branch is
the main branch we should focus on.


Bean 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
