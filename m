Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAF95C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 00:22:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87F0D23A69
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 00:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87F0D23A69
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/s+sjDphxZ7IcQhUuJVnWcULjtauGJjBWC4dG1nisPo=; b=JlbnIRm2Ob635wT8tML/NDHgY
	iyaVcR4umS1sZGUZxmNNIZwHGnkQoe70ctFu6MmOUKT1qz6Rrdd4jbU6At53bI9UoviSdEd6mef7O
	0tFm5duo7bGSSZNigPgT/VRD1ULW13cLGguvmOvQyoJvGCogRxA1tBEYtU2d6o+ImAGI+fZPZUtjt
	lytHw0sKLcFBrGa9ZNqTxfwK8/Ovjqat916SiQ7jitHsa1i843/FXsujw2mzqfYgcLtJLel2zNUzO
	6LgGSkLNkzYVDtd1lsjGj4ow9rxIRqn7gizUF4WoY4C7hX/47XXPROKomrEVZ/UE346dSOouHneoi
	2bpwKjHlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ky21Q-0004pF-B4; Sat, 09 Jan 2021 00:22:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ky21N-0004oU-9S
 for linux-mediatek@lists.infradead.org; Sat, 09 Jan 2021 00:22:22 +0000
X-UUID: d92e53e7898945d6b6b3db7b9cbbedff-20210108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7CYUlKecezZ1BJCyWACsMHG9HSdAtzLwoRJDZJLvlmg=; 
 b=u1nu8GhD3Ns6FKKIPusbT9IGyEvJIMTVgyiiqwP5mQaWrOqzbcKO1uymHfKBhIXPmakY4G0XIrYXFkBsVN88MP+StPa9yWXdFuwIT/gCVOspPpEC514XbTYTwX18bcf9/9otufKmOKZSLeNXg72P3rEeQos+8jlctugh+rr9Fqk=;
X-UUID: d92e53e7898945d6b6b3db7b9cbbedff-20210108
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 535487638; Fri, 08 Jan 2021 16:22:16 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 8 Jan 2021 16:22:15 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 Jan 2021 08:22:13 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 9 Jan 2021 08:22:13 +0800
Message-ID: <1610151733.9343.3.camel@mtkswgap22>
Subject: Re: [PATCH] mac80211: fix incorrect strlen of .write in debugfs
From: Ryder Lee <ryder.lee@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
Date: Sat, 9 Jan 2021 08:22:13 +0800
In-Reply-To: <0efec65815ff9e26b3da69cb35d503a90086760c.camel@sipsolutions.net>
References: <20210108105643.10834-1-shayne.chen@mediatek.com>
 <0efec65815ff9e26b3da69cb35d503a90086760c.camel@sipsolutions.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_192221_521388_7C04AA24 
X-CRM114-Status: GOOD (  15.89  )
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
Cc: Toke =?ISO-8859-1?Q?H=F8iland-J=F8rgensen?= <toke@toke.dk>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>, Sujuan
 Chen <sujuan.chen@mediatek.com>, Lorenzo Bianconi <lorenzo.bianconi@redhat.com>,
 Felix Fietkau <nbd@nbd.name>, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2021-01-08 at 21:02 +0100, Johannes Berg wrote:
> This looks wrong to me, am I missing something?
> 
> > diff --git a/net/mac80211/debugfs.c b/net/mac80211/debugfs.c
> > index 9135b6f..9991a6a 100644
> > --- a/net/mac80211/debugfs.c
> > +++ b/net/mac80211/debugfs.c
> > @@ -120,7 +120,6 @@ static ssize_t aqm_write(struct file *file,
> >  {
> >  	struct ieee80211_local *local = file->private_data;
> >  	char buf[100];
> > -	size_t len;
> >  
> >  	if (count > sizeof(buf))
> >  		return -EINVAL;
> 
> This ensures that count <= sizeof(buf)
> 
> > @@ -128,10 +127,10 @@ static ssize_t aqm_write(struct file *file,
> >  	if (copy_from_user(buf, user_buf, count))
> >  		return -EFAULT;
> 
> We copy, that's fine.
>  
> > -	buf[sizeof(buf) - 1] = '\0';
> > -	len = strlen(buf);
> > -	if (len > 0 && buf[len-1] == '\n')
> > -		buf[len-1] = 0;
> > +	if (count && buf[count - 1] == '\n')
> > +		buf[count - 1] = '\0';
> 
> This I think really was meant as strlen, because if you write something
> like
> 
>  10\n\0\0\0\0
> 
> before it would have parsed it as 10 still, now it gets confused?
> 
> I guess I'm not worried about that though.

I think the problem only happens on airtime_flags_write() that uses
kstrtou16()


> > +	buf[count] = '\0';
> 
> But if count == sizeof(buf) then this is an out-of-bounds write.

Right. Then, we can

 	if (count >= sizeof(buf))
		return -EINVAL;

Ryder



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
