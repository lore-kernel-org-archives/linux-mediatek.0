Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B255C54EBC
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Jan 2023 01:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mloTljDLM3+9wiYZIt0ylVlgbVBUVZ/eq3ZfGpbT1ck=; b=O+VeKZgAgkeIACU/c4kKLUmtNl
	mLH1yNREyMJMKAetidI9WZXGzuKJW9AAMea1fm/GfQWc6HNOcYirTd0uHIsHvg4e719paIQj/7FhU
	hrlYd5ufeYmSaOOgtnOBULyK5I+uSY0JtrsCzXfd+5F8Gc1g7L5nEeIjVQRvy1yYEYdjO5kNUb7wh
	zNjxEipgAC119Pi2yjYMhRa/dutzy7WXF+7CAu9yZFTNLTXlcK2+FLbNoi60HmWIBqNiV9LQzgCxw
	RcffGOZKaKsIDcIG4xsPQNn4kkfpKh4wZhIWde/bLT63AAYzE/pc2jp9efPwDlacDSpgyBIFaDjq3
	fh2+R9Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEhAn-00GhBV-Km; Mon, 09 Jan 2023 01:42:01 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pEhAi-00Gh9l-Tq; Mon, 09 Jan 2023 01:41:59 +0000
X-MailGates: (flag:4,DYNAMIC,BADHELO,RELAY,NOHOST:PASS)(compute_score:DE
	LIVER,40,3)
Received: from 192.168.10.46
	by mg.richtek.com with MailGates ESMTP Server V5.0(16491:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>); Mon, 09 Jan 2023 09:41:24 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex3.rt.l (192.168.10.46) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Mon, 9 Jan
 2023 09:41:23 +0800
Received: from linuxcarl2.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1118.20 via Frontend
 Transport; Mon, 9 Jan 2023 09:41:23 +0800
Date: Mon, 9 Jan 2023 09:41:23 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: ChiYuan Huang <u0084500@gmail.com>, <linux@roeck-us.net>,
	<heikki.krogerus@linux.intel.com>, <matthias.bgg@gmail.com>,
	<tommyyl.chen@mediatek.com>, <macpaul.lin@mediatek.com>,
	<gene_chen@richtek.com>, <linux-usb@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <stable@vger.kernel.org>
Subject: Re: [PATCH] usb: typec: tcpm: Fix altmode re-registration causes
 sysfs create fail
Message-ID: <20230109014123.GA27423@linuxcarl2.richtek.com>
References: <1671096096-20307-1-git-send-email-u0084500@gmail.com>
 <Y5rsdo/SGHJM4UKG@kroah.com>
 <CADiBU3-iVLQf6Q5SzOB_pMCs2PGcFuWryjpDn5Qvz41WQ6C2RA@mail.gmail.com>
 <Y5sIZ3zC6o4ARDEn@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y5sIZ3zC6o4ARDEn@kroah.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_174157_405766_E76CCDD9 
X-CRM114-Status: GOOD (  18.53  )
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

On Thu, Dec 15, 2022 at 12:43:35PM +0100, Greg KH wrote:
> On Thu, Dec 15, 2022 at 05:53:44PM +0800, ChiYuan Huang wrote:
> > Greg KH <gregkh@linuxfoundation.org> =E6=96=BC 2022=E5=B9=B412=E6=9C=88=
15=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:44=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > >
> > > On Thu, Dec 15, 2022 at 05:21:36PM +0800, cy_huang wrote:
> > > > From: ChiYuan Huang <cy_huang@richtek.com>
> > >
> > > Why not send directly from this address so we can validate that this =
is
> > > the correct email address of yours?
> > >
> > It's  the company mailbox policy. To send the external mail, there's
> > the security text block at the bottom.
> > Except this, some mail address are also blocked. To avoid this, I use
> > my personal mail to send the patch
> > and leave the SoB for the Richtek mailbox.
> > It's lazy to fight for this.
>
> Please fix it, otherwise your company's email address will be spoofed
> and people can claim to be sending changes from their domain.
>
> Please fix that up, abusing random gmail addresses like this is not ok,
> sorry.

Thanks for your comment.
After the work with MIS for several weeks, we finnaly got one way to do it.

But I'm not sure all mail account can receive the mail.
If anyone cannot receive the mail, please inform me.

ChiYuan Huang.

>
> greg k-h
************* Email Confidentiality Notice ********************

The information contained in this e-mail message (including any attachments=
) may be confidential, proprietary, privileged, or otherwise exempt from di=
sclosure under applicable laws. It is intended to be conveyed only to the d=
esignated recipient(s). Any use, dissemination, distribution, printing, ret=
aining or copying of this e-mail (including its attachments) by unintended =
recipient(s) is strictly prohibited and may be unlawful. If you are not an =
intended recipient of this e-mail, or believe that you have received this e=
-mail in error, please notify the sender immediately (by replying to this e=
-mail), delete any and all copies of this e-mail (including any attachments=
) from your system, and do not disclose the content of this e-mail to any o=
ther person. Thank you!

