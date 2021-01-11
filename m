Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A06D8C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 06:21:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2BE5E225AB
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 06:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2BE5E225AB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P/2XOyJxkxZ86U8EDROgy6hsd4E24iVtm+nJziuDKUY=; b=EeBcWKSAVo0SxXUCv3tWygw2x
	aNA8iL4pXSOaB5FH1NsWZU5DVC3659eoYGcqlzyqniC/TiNuux38DUrxnCIYiPSZQ3VZ1nxh7ciuF
	fQRZYehz1GFLDVCMj0rVuMRwMoEIt5d6GRtbOqRv4rvVBhUWJvf3dUn8320j7MGHykPi5Ht7TkhL9
	a6UHI9YwGENFjzvPPdGGKLM4aKvJgv32B80K+rrSX0YvGxo8JBnJXxNAjIJbx4gBd8UH6iX35VDrX
	S91yIyYNdWR3OR1YKMrx8vrmfd+XIWunpeOR2gBjltLv95pzucbZ8naFjh8Gg4FCFewkE3bC+PQ4d
	K6mVxjpjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyqa6-0005KZ-PP; Mon, 11 Jan 2021 06:21:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyqa3-0005Io-8z
 for linux-mediatek@lists.infradead.org; Mon, 11 Jan 2021 06:21:32 +0000
X-UUID: 6adc1ffbfd0b438e8edcde5a875b07db-20210110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hbUjx36G0lGh66Y/uyRkKQdmOZUnPTwRubcK5li375o=; 
 b=tUWFAFTrtAgfEAHdnobjcdKW9a2Fsn5m+oS7yx9vBMthTRBwADrqfb2tD+86cng/3wi66ySFWewVCAFqA/ExonB8RaxQ3bgXHTJ96DeOm+UBHlkKKnVij7dX440D5vxY7r3Tjyp1QcuR4EhCvdu5szgYhdiM4gp4Rw+4z7RF8BA=;
X-UUID: 6adc1ffbfd0b438e8edcde5a875b07db-20210110
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1820118753; Sun, 10 Jan 2021 22:19:23 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Jan 2021 22:19:21 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Jan 2021 14:19:13 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jan 2021 14:19:14 +0800
Message-ID: <1610345954.4985.7.camel@mtksdccf07>
Subject: Re: [PATCH] mac80211: fix incorrect strlen of .write in debugfs
From: Shayne Chen <shayne.chen@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
Date: Mon, 11 Jan 2021 14:19:14 +0800
In-Reply-To: <0efec65815ff9e26b3da69cb35d503a90086760c.camel@sipsolutions.net>
References: <20210108105643.10834-1-shayne.chen@mediatek.com>
 <0efec65815ff9e26b3da69cb35d503a90086760c.camel@sipsolutions.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_012131_493666_4DAC2649 
X-CRM114-Status: GOOD (  19.19  )
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
 Ryder Lee <ryder.lee@mediatek.com>,
 linux-mediatek <linux-mediatek@lists.infradead.org>,
 Sujuan Chen <sujuan.chen@mediatek.com>,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>
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
> 
Hi Johannes,

Regarding the case "10\n\0\0\0\0", both count and strlen() fail to get
the correct strlen.
# echo "10\n\0\0\0\0" > /sys/kernel/debug/ieee80211/phy0/airtime_flags
airtime_flags_write: count = 13, strlen = 15 
> > +	buf[count] = '\0';
> 
> But if count == sizeof(buf) then this is an out-of-bounds write.
> 
> Same for all the other copied instances.
> 
> johannes
> 

Should we consider this kind of case here?
If yes, maybe we need to use sscanf() as other .write to take care of
this kind of case, since kstrtou16() will also fail on this case.

Btw, some of strlen in other .write are also incorrect, but they won't
get the problem due to sscanf().

Do you prefer that we also use sscanf() in .write of airtime_flags?

Shayne
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
