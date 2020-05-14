Return-Path: <SRS0=tiIh=64=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF823C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 16:33:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A405D2065D
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 May 2020 16:33:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cIqdIKop";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=wp.pl header.i=@wp.pl header.b="FSEGSII2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A405D2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wp.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fUSR93++m0c/N2w8lUw08ZkblLh89o3rvXMKTBFLifU=; b=cIqdIKopqkjJJJ
	/8b6nogeXqDPoayYcoiVCLtR+r46BuSAKCUsld110+j3avIT7F1/27PtD/iJFBo1NjSkbBmijwhDr
	N2KLYtYvYGx7DG2LCbHLh9qzQLIcMEiZr9MpCXERH+6bVQFtdwnYeOHzXSI58ue1zEpOciaf/nGFT
	mFaYeGyd6u4DdK0oXRJSViCqaEY4fesMeK+WHQenuv8LS4tBLEnKkxCmpD3z8t0tXtcrP5V2YlqTY
	ri3MnOZyt7ODLr6s+9UhLvh3WcS88moPSAnPB4b+mlw5YseEezdYAnazRTLggP0YqadzeZvMABuco
	gsaowE+orQdzfiXTwGlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZGnr-0005Fn-0y; Thu, 14 May 2020 16:33:47 +0000
Received: from mx3.wp.pl ([212.77.101.10])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZGnm-0005Dl-6k
 for linux-mediatek@lists.infradead.org; Thu, 14 May 2020 16:33:46 +0000
Received: (wp-smtpd smtp.wp.pl 3044 invoked from network);
 14 May 2020 18:33:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=1024a;
 t=1589474015; bh=bmVlvxRJfbuLi0qWPTmVd+J6tpfP5mcBYa4T+w6Y+8U=;
 h=From:To:Cc:Subject;
 b=FSEGSII21NTu3LcDu5gOBnyldd9XcVfZzPYtGBHnLq4KGH4ETLjb4h9etIzCH9PPQ
 Fp2HGfy9VPZZkCbQOv/Sxp6v1PvuLdA4LoliUer6Sc4N4S8Izwcy3/fRunHjjLVmwI
 M1A75FlFZ1yEYyN8OAlyA/jwva961MITdjVMX+MY=
Received: from unknown (HELO kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com)
 (kubakici@wp.pl@[163.114.132.4]) (envelope-sender <kubakici@wp.pl>)
 by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
 for <kvalo@codeaurora.org>; 14 May 2020 18:33:34 +0200
Date: Thu, 14 May 2020 09:33:26 -0700
From: Jakub Kicinski <kubakici@wp.pl>
To: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] mt76: fix different licenses in same driver
Message-ID: <20200514093326.49b995ed@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <87pnb7go2m.fsf@tynnyri.adurom.net>
References: <3a5cb822eb4cd81d32b5480f1235c992ea4fbe06.1587193872.git.ryder.lee@mediatek.com>
 <d32134a6-9673-521f-22ee-871aa2284af0@nbd.name>
 <20200507100246.1e902bc8@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <87pnb7go2m.fsf@tynnyri.adurom.net>
MIME-Version: 1.0
X-WP-MailID: 87b73c8c2619fcfba521105177ea5514
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [ESLT]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200514_093342_586294_D998329C 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, Stanislaw Gruszka <sgruszka@redhat.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 14 May 2020 07:03:45 +0300 Kalle Valo wrote:
> Jakub Kicinski <kubakici@wp.pl> writes:
> > On Thu, 7 May 2020 15:30:24 +0200 Felix Fietkau wrote:  
> >> Hi Ryder,
> >> 
> >> I think for this patch we need an explicit ACK from Stanislaw Gruszka
> >> and Jakub Kicinski (both Cc'd), because mt76x0 was licensed under GPL.  
> >
> > Thanks, yes, you definitely need an ack, especially from folks who have
> > their copyright on the files :/
> >
> > My personal preference for the license was expressed clearly when the
> > code was written and it is GPL-only. Felix, if you prefer the clean up
> > I'm happy to ack, but I see no reason to downgrade the license at
> > vendor's request.  
> 
> I think it would be unfortunate to have different licenses in the same
> driver. For example think of copying a function from one file to
> another, how would we handle that? So my strong recommendation is to use
> the same license throughout the driver. And in this case I consider mt76
> directory and it's subdirectories as being one driver, please correct me
> if that's not the case.

AFAIU some parts of the code were brought in from mt7601u which has 
a different license. As I said I'm happy with it if Felix feels like
it's needed. Just not a fan of vendors who barely contribute making
license changes.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
