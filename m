Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20770C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 05:01:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0963208DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 05:01:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TctGsrxx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="MPbn1O1O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0963208DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=y7cis7MUinnVH/eG8Ho2J5QsWscBd5ujStw60GsJuZA=; b=TctGsrxx+zCkj8pJP2+bBmrXV
	hFuj/x3EW89u+VmAs0LVZ+YGFlRbdS4P8ONakMab2jf7boh9av01bDVCIu4AFLwA5Vx8nGYbNjY7k
	jbgPZfYPkbkKUpXGb3GxbvMNducuqfYFTxvNbUcqjv/iCyXN16DanJCUpIpEvlJhYKHh4sU00UFVq
	Cypy1Oyx/B6vNb39Vb0LYj+Q4i+G/c/Etri7U84ndrIOyxav6SQ0RmdiJ2wmaHAXUpQWOIivJukMn
	j4hByIKAz2eonI1sh2PBeRjXO5zHGWD3gj52L3blou5UfZ0MNLhMscVBcwSK0PGOpV0pKhUYCdlk5
	+gvlmiKbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHgc4-0005Te-8H; Mon, 14 Sep 2020 05:01:12 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHgbu-0005S8-KI
 for linux-mediatek@lists.infradead.org; Mon, 14 Sep 2020 05:01:07 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1600059665; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=incIykKufp2vCbdHmRPdZFVE3aFFHufJedlCIBpyTrM=;
 b=MPbn1O1OCTPpa/Hih/izYIsXT2Mc5uJGhom8RIRDWnpqjHx3d6Mnt59LuoVzdnyKk+iMGOda
 +PqwaUZAWE+r8bJtS0eJF2ivpe8xRb29WWmvb5+cWKzWZoT5GTMn+lFj5xowjBX72gSKEhsE
 LwyKawI+Sm5FrrjbfUjLAnraKgc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDIyMyIsICJsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f5ef8ef25e1ee75869ed566 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Sep 2020 05:00:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0CC5DC43391; Mon, 14 Sep 2020 05:00:30 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: cang)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 4C38FC433C6;
 Mon, 14 Sep 2020 05:00:30 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 14 Sep 2020 13:00:30 +0800
From: Can Guo <cang@codeaurora.org>
To: Bean Huo <huobean@gmail.com>
Subject: Re: [PATCH v2 1/2] scsi: ufs: Abort tasks before clear them from
 doorbell
In-Reply-To: <d151d6a2b53cfbd7bf3f9c9313b49c4c404c4c5a.camel@gmail.com>
References: <1599099873-32579-1-git-send-email-cang@codeaurora.org>
 <1599099873-32579-2-git-send-email-cang@codeaurora.org>
 <1599627906.10803.65.camel@linux.ibm.com>
 <yq14ko62wn5.fsf@ca-mkp.ca.oracle.com>
 <1599706080.10649.30.camel@mtkswgap22>
 <1599718697.3851.3.camel@HansenPartnership.com>
 <1599725880.10649.35.camel@mtkswgap22>
 <1599754148.3575.4.camel@HansenPartnership.com>
 <010101747af387e9-f68ac6fa-1bc6-461d-92ec-dc0ee4486728-000000@us-west-2.amazonses.com>
 <d151d6a2b53cfbd7bf3f9c9313b49c4c404c4c5a.camel@gmail.com>
Message-ID: <030cecc931ef5d210c89d4541c2adea2@codeaurora.org>
X-Sender: cang@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200914_010105_554028_8BD23B34 
X-CRM114-Status: GOOD (  22.55  )
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
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Avri Altman <avri.altman@wdc.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, salyzyn@google.com,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, kernel-team@android.com,
 Bart Van Assche <bvanassche@acm.org>, hongwus@codeaurora.org,
 asutoshd@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2020-09-11 17:09, Bean Huo wrote:
> On Fri, 2020-09-11 at 02:16 +0000, Can Guo wrote:
>> > >
>> > > So your resolution looks good to me.
>> > >
>> > > Thanks so much : )
>> >
>> > You're welcome ... but just remember I have to explain this to
>> > Linus
>> > when the merge window opens.  It would be a lot easier if this
>> > hadn't
>> > happened so please don't make it any worse ...
>> >
>> > James
>> 
>> Sorry that my changes got you confused and thank you for help
>> resolve
>> the
>> conflicts. My change ("scsi: ufs: Abort tasks before clearing them
>> from
>> doorbell") is to serve my fixes to ufs error recovery which only got
>> picked
>> up on scsi-queue-5.10. So I checked out to scsi-queue-5.10 and made
>> my
>> changes on the tip of scsi-queue-5.10, below 2 changes were not even
>> present in scsi-queue-5.10 back that time.
> 
> I mentioned here https://patchwork.kernel.org/patch/11734713/
> 
> this change (scsi: ufs: Abort tasks before clearing them from doorbell)
> has conflicts with the scsi-fixes branch. I don't know which branch is
> the main branch we should focus on.
> 
> 
> Bean

Yeah, I know that one, but I was not even working on scsi-fixes branch
at that time. Now I have two more fixes to ufshcd_abort(), not sure
which branch I should work on, so asking the same here.

Regards,

Can Guo.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
