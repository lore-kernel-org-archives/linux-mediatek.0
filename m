Return-Path: <SRS0=12Pn=BT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19D2FC433DF
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 18:01:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC698206C3
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 18:01:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mUfcy8zv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="U8xEsG2G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC698206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dl+K37bmqYaHvlcfzdNR3doHrMjV79qUySpW2dQM5ic=; b=mUfcy8zvziviZVCOJQcOg4eJO
	/t6JqK9/EIzb/pnLhDElNXIoxJ/HoPCr4fdJLLvn8lNDO5xcHY3Q0MPOADW+9tTSDpAp4p9j6rkcn
	wALcT43DKc4xRFqxdL0V95OQXjoSQQZIWy5VoFqh1wygN+8xcOlM7UK+id4v/9RS6dhLkwhFhS6Ln
	EGufn45UY4nehp4fhoHuJTyrgJ9iyO4q4MH2Q2FY6DBG9vVpqrwxCLSsyOeAsCRLG3FG4ZhGpIGT/
	Wdvc+h0pdilWBYN3wNmIoXs2si+uUbW14OhRte1Z+ZNq+qyTMxNOwE0uGs0Ni6T+caUbh2jaFwoeM
	sJzGnHVRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4pdT-0000TP-Mu; Sun, 09 Aug 2020 18:01:31 +0000
Received: from mout.web.de ([212.227.17.12])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4pdQ-0000Ss-Pb; Sun, 09 Aug 2020 18:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1596996020;
 bh=KiNwNXhD43b48VUrIHnh7NRCs/8jIPAkLiMd6kXFV1M=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=U8xEsG2GCib5wvDeae83bW6KDXSIWMARRmFNxMUA056rX23YHjbqZUrWMNef13Nor
 qHHRBaTN1m48DG6iKMcoHr2SyaOsH9kMUfckYucbvOO+rfKIF/+6of3z79lUZngH9T
 OXidMc7uQZqgtTT1omRrhFnBuDcUW5EEcL2BCiTE=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.136.16]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M4ZPc-1kuiFM2Otw-00ykeU; Sun, 09
 Aug 2020 20:00:20 +0200
Subject: Re: [9/9] scsi: ufs: Properly release resources if a task is aborted
 successfully
To: Can Guo <cang@codeaurora.org>, Stanley Chu <stanley.chu@mediatek.com>,
 Asutosh Das <asutoshd@codeaurora.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-scsi@vger.kernel.org,
 kernel-team@android.com
References: <a752927b-dd9b-ebf0-8c77-e2ae0b2aa475@web.de>
 <fc5c328732792aca1dd451d0109f00b5@codeaurora.org>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <cb9dbb7d-5515-0190-d336-be657e1ca31c@web.de>
Date: Sun, 9 Aug 2020 20:00:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <fc5c328732792aca1dd451d0109f00b5@codeaurora.org>
Content-Language: en-GB
X-Provags-ID: V03:K1:CuoaY885NHkswevb21t6RVfrDudF8QH3owNOIRjJCHa9nNssQ/1
 g+660VaqwcBkiqKGzVLiMRtJJBaZRNtLZTJUuCQLefjHE3XAfp9AuryLpsB48XjPQG7GWCb
 uc/IN1f/1kINaAzbxL+VXehCLLg2+UgAizGt24NiCzg5EVhlEEBn4zhQ5pcK7xlbU/wTzuY
 axy0OfdYJ8xQ+W0sncVpA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S6Pur1SLQi4=:vSMZNixHrbvdd3FiB3D2mO
 j7c2+Dtl8WjfAPzZqky2d6p1AtYsnPLA2JrcfCE8l3sMlBv4WBcL0Lc2Pk+cc+5uppkJcze3W
 BZB35CiR11uajvuzOP/kbqFu4zKtopp5UJStpyj9PIHsHWfWRDWwAkNHCj8s3+OZ0i5EgHLz6
 hZLPJt4v+Yxzy/AwzrX9zcu2JUiHmwX7Bqa8ZTK5DwqjTp3BQ0OcGLbuGOcgvOl0UBgBvaU0A
 2hCEjxbu7R4mocFlckUpCrIia2A67ztietV3yO0C1uMxgxGup8mEGoab5kiNdrAPAJvDkgZwC
 AYDRWTmI9ldgTB2lvwevS2p2eWm83wcwnzf1EZQgdiU38ecQfyi78uDzytxhtAcxNkekn7e9U
 WqfVB7xYBXhJ3uyiwC/ruz2JZ4D2DyhnddR9XgBm+PLRGLAhC4hFfaMEUIFTzfy3oG0eQNFlK
 5A4ZbHYeZAuEuhh3WJVf3wKInEy7/C1rTCclOdao+t5GJSAwi/Rk8vd9XSB8TfdXxT8Qn/TZl
 peTkPb6F0PWxHTOL/nYW9IS0IJbqAVZRV236nPtxp8209dhe1h0PRdKDmN9lnmLnS7fINGQkD
 aTSsKyw+kzNXoM4Nrq01wBHfmorr3ttiEiEUmUyx9Fs4hB/blg94S1A8THIhatzDqZglDImTX
 Z1rMfOom217iW6p9oDKV0RrhP5LIVusxbqWkRWCK2kE0CKgkLju81Y+DDR3XDdhxaddCut9CJ
 AY5huxWhZzqhRauoJTGfA+82sG9OlVKqSoXL4CykCSDtmL9LwTh1I9kMXLTdQnn3fyquMkP5x
 sbpapL4whEaeoK5OQLan0Kg83m/xreYNpXiHI6wkCvWvMqg/9G8xEI4Pp8FYyhCWnI5Ji3CJ0
 4esOHArtXvmaSTUeTknrKlruFutbW7NudJ9iGm1XfdS/D9qBF3bOG5wuHatq8ylsbeSh4mFt/
 7eRBCbfyaM4HXbBICXNClZtIL2cIi0qSIU2EB/c6KVDi+mn/wMY3Yf2dNUT64/miWifKyGugH
 N6Ivpwu9cT8YQppryDPOmn6xVK2KiW3E7oz53UIHDaMhTSvtZZmj0v0FcjUCSxQSWthLorPv8
 a69hUtfVshZg7F9sGKYiXskitg3EnC1uxQVCdAIRL3We/lAUPkwt95O8zdknqvxHSX7oRuWX/
 hkfBsICsVOYqu2dmorOIzFMDr4vWSjOiHDxc2ScFinaDLWepQ4cTmgYsXlehQLfKK6zvsUlKU
 Dp9+pIZ8MIraK5M1XDAMm7bQpa08MfWrm8FdXCQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200809_140129_172678_AE224D6D 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: Rajendra Nayak <rnayak@codeaurora.org>,
 Bart Van Assche <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Saravana Kannan <saravanak@google.com>,
 "James E. J. Bottomley" <jejb@linux.ibm.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Bao D. Nguyen" <nguyenb@codeaurora.org>,
 Avri Altman <avri.altman@wdc.com>, Mark Salyzyn <salyzyn@google.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Hongwu Su <hongwus@codeaurora.org>,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Thanks, will fix these in next version.

Thanks for your adjustment of the proposed commit message.
Should the corresponding patch be marked with an other version number?
https://lore.kernel.org/linux-arm-kernel/1596975355-39813-10-git-send-email-cang@codeaurora.org/
https://lore.kernel.org/patchwork/patch/1285629/
https://lkml.org/lkml/2020/8/9/87

Should a cover letter be provided for such a patch series?

Regards,
Markus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
