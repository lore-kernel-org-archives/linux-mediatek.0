Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66556C5479D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 07:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r3n87Ih8HjfgNbykEzue9hfn9c9NxD+/sgdbTK0WRY=; b=BhCWFpHcjKTc/py34bjO7AaoAT
	NoMmDRZ/ZGqi7Znw/9+jlQ4WzdqzL0BdVhOYaHnpfL/PoOXttm+42N1IvutVayc5XojIrCkFwwvd/
	gZaHL5G4YEFyUfjBXivL20mAVLkuf+3bVXxGDXj2OJYs0iHhF8yGY/XFPUQomEQmPd+evAJNFDnZO
	03h+NebIR7AYgmBG6PQXPtrvLkcdz2l4S2ZyE1XOB4JOj5kiV6wC1l7125Amnk+AMA4LNYIsFzXiY
	F5XQIOWt5cnbRt14NmPDJR9WLzTtQfeNNgr7Ozb/3913mJ50QBkSjM6RQ4vRchzaTWQSKWOmQV+XP
	NtHytwEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEmUq-000AlQ-2A; Mon, 09 Jan 2023 07:23:04 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEmUl-000Ajb-WE; Mon, 09 Jan 2023 07:23:02 +0000
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
	LIVER,40,3)
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTP Server V5.0(16481:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>); Mon, 09 Jan 2023 15:22:27 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 9 Jan
 2023 15:22:26 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.20 via Frontend
 Transport; Mon, 9 Jan 2023 15:22:26 +0800
Date: Mon, 9 Jan 2023 15:22:26 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: ChiYuan Huang <u0084500@gmail.com>
CC: Greg KH <gregkh@linuxfoundation.org>, <linux@roeck-us.net>,
	<heikki.krogerus@linux.intel.com>, <matthias.bgg@gmail.com>,
	<tommyyl.chen@mediatek.com>, <macpaul.lin@mediatek.com>,
	<gene_chen@richtek.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] usb: typec: tcpm: Fix altmode re-registration causes
 sysfs create fail
Message-ID: <20230109072226.GA15975@linuxcarl2.richtek.com>
References: <1671096096-20307-1-git-send-email-u0084500@gmail.com>
 <Y5rsdo/SGHJM4UKG@kroah.com>
 <CADiBU3-iVLQf6Q5SzOB_pMCs2PGcFuWryjpDn5Qvz41WQ6C2RA@mail.gmail.com>
 <Y5sIZ3zC6o4ARDEn@kroah.com>
 <20230109014123.GA27423@linuxcarl2.richtek.com>
 <Y7u2Yi+UeqMcVhad@kroah.com>
 <CADiBU39yh9k=BWOmQ_-T3oO1nRQ6nHVjf4H+YRpjb3Mv_3tc0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADiBU39yh9k=BWOmQ_-T3oO1nRQ6nHVjf4H+YRpjb3Mv_3tc0w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_232300_536242_CF5F6F2C 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

On Mon, Jan 09, 2023 at 02:46:34PM +0800, ChiYuan Huang wrote:
> Greg KH <gregkh@linuxfoundation.org> 於 2023年1月9日 週一 下午2:38寫道：
> >
> > On Mon, Jan 09, 2023 at 09:41:23AM +0800, ChiYuan Huang wrote:
> > > ************* Email Confidentiality Notice ********************
> > >
> > > The information contained in this e-mail message (including any attachments) may be confidential, proprietary, privileged, or otherwise exempt from disclosure under applicable laws. It is intended to be conveyed only to the designated recipient(s). Any use, dissemination, distribution, printing, retaining or copying of this e-mail (including its attachments) by unintended recipient(s) is strictly prohibited and may be unlawful. If you are not an intended recipient of this e-mail, or believe that you have received this e-mail in error, please notify the sender immediately (by replying to this e-mail), delete any and all copies of this e-mail (including any attachments) from your system, and do not disclose the content of this e-mail to any other person. Thank you!
> >
> > Now deleted.
> >
> > For obvious reasons, this wording is not compatible with kernel
> > development :(
> 
> I'm sorry about that. Let me check with MIS..............
This one seems work.

https://www.lkml.org/lkml/2023/1/9/73

