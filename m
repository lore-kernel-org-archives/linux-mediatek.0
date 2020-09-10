Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E433C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 16:09:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C931A20C09
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 16:09:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yg5CNjYC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="SqTOBGdd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="SqTOBGdd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C931A20C09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=HansenPartnership.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UDb2NocIu+xkUiyCMZzPjKYZ0z1xsQrPmh7U6kji6Jk=; b=yg5CNjYCbcM4bXbphYwrME9z/
	ec4HCe4cwrF4GmBDP7DyH+5O0s4A33fk3j0Ebnnk6q5GLAbQbEjKwZ5+1XtTlKade1xhtR92diau5
	D8YAGiiJhYiPH5yxidJdojhG8DKzSq2iAz3CiVH9IfUDBwFjP0ja8eX7gPh8ZU1xRlnawIvOt6Pgv
	37LGlyqCEjB++5K9ZdNB/lYV7tCU5HdlxCj8NGgb5cgx+iSUk/sd0EVnVEEKynjNxfg7LtWJnZhR0
	1bQ0aZNpsH53v7N2h8w+iyqYgBi+QRByaz8ticyj6/Z1CSflKNbC1BZ1tXsqenz19t4ut0Ld9yepO
	pYbGiujIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGP8R-000059-Kv; Thu, 10 Sep 2020 16:09:19 +0000
Received: from bedivere.hansenpartnership.com ([66.63.167.143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGP8L-0008VG-J8; Thu, 10 Sep 2020 16:09:15 +0000
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id B4B848EE11E;
 Thu, 10 Sep 2020 09:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1599754150;
 bh=vjqoZjjs4ZL988BGG7sXtVJHzIb1zQDOeZ88/1JThQw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=SqTOBGdd05DEXZCUAUSRCFQLQh+D8HlmsHDZknIpCoLNKWMiASjKLlkwGQpE1qB2y
 Ra66T5QAZClQDQ1tI6wCPqz6A+A1azS+MUvPfnrYOwq0bWYX6ZlSPFX3WbX9nPfwsv
 HXiNLeDe7+r88pNXMcY6eguRdu3R4RQu703OyKHk=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id c7vL7lTQ-z-f; Thu, 10 Sep 2020 09:09:10 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net
 [73.35.198.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 6C6ED8EE0E2;
 Thu, 10 Sep 2020 09:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1599754150;
 bh=vjqoZjjs4ZL988BGG7sXtVJHzIb1zQDOeZ88/1JThQw=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=SqTOBGdd05DEXZCUAUSRCFQLQh+D8HlmsHDZknIpCoLNKWMiASjKLlkwGQpE1qB2y
 Ra66T5QAZClQDQ1tI6wCPqz6A+A1azS+MUvPfnrYOwq0bWYX6ZlSPFX3WbX9nPfwsv
 HXiNLeDe7+r88pNXMcY6eguRdu3R4RQu703OyKHk=
Message-ID: <1599754148.3575.4.camel@HansenPartnership.com>
Subject: Re: [PATCH v2 1/2] scsi: ufs: Abort tasks before clear them from
 doorbell
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Stanley Chu <stanley.chu@mediatek.com>
Date: Thu, 10 Sep 2020 09:09:08 -0700
In-Reply-To: <1599725880.10649.35.camel@mtkswgap22>
References: <1599099873-32579-1-git-send-email-cang@codeaurora.org>
 <1599099873-32579-2-git-send-email-cang@codeaurora.org>
 <1599627906.10803.65.camel@linux.ibm.com>
 <yq14ko62wn5.fsf@ca-mkp.ca.oracle.com>
 <1599706080.10649.30.camel@mtkswgap22>
 <1599718697.3851.3.camel@HansenPartnership.com>
 <1599725880.10649.35.camel@mtkswgap22>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_120913_800309_6D3D3C8F 
X-CRM114-Status: GOOD (  13.76  )
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
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>,
 open list <linux-kernel@vger.kernel.org>, saravanak@google.com,
 nguyenb@codeaurora.org, ziqichen@codeaurora.org,
 Avri Altman <avri.altman@wdc.com>, Can Guo <cang@codeaurora.org>,
 "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, salyzyn@google.com,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Bean Huo <beanhuo@micron.com>,
 kernel-team@android.com, Bart Van Assche <bvanassche@acm.org>,
 hongwus@codeaurora.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-09-10 at 16:18 +0800, Stanley Chu wrote:
[...]
> > + 	if (!err) {
> >  +cleanup:
> 
> Yeah, considering Bean Huo's patch "scsi: ufs: No need to send Abort
> Task if the task in DB was cleared", "cleanup" label shall be added
> back here.
> 
> So your resolution looks good to me.
> 
> Thanks so much : )

You're welcome ... but just remember I have to explain this to Linus
when the merge window opens.  It would be a lot easier if this hadn't
happened so please don't make it any worse ...

James


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
