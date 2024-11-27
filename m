Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 943B6D690F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Nov 2024 10:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Cc:To:Subject:
	From:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CcCdE2mWnlvUPyRfMf+AyhHHu8WQK8CTzbd+erbG+Vw=; b=33p5zB2clWd0M6
	bcCh9FMCQFS/3LhNcZPngNhfCdNhaQw8NOBwpRbZyWfmw9F6FFyeVTqcwcg6f9VHglc4o7UtuTRFw
	l9BzebilAnbnFuHyiGwAOK6CtSS9YIe59ZVOcoR0POB/Eqqrr+s+NcZkbgu/AWSz4AM5g9qgwxtzX
	vGJB5TkDfCTP6GFHtClAW65s0BLTbEH2KTIeUodb+UsJAgUpR4NIvmhEqnnPf9j40ztZO1PH0pd6A
	VzxEcrbOE0vw2AFo+dmywEQYotgcv9CZibnlaeLA4hocGNAbOIj3aFD7zhcTyX3uewmyi16mr/xMI
	je0libWDXnJotOVcCz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGboi-0000000FGGZ-3ykU;
	Thu, 28 Nov 2024 10:32:12 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJAG-0000000DNfz-26Tm
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Nov 2024 14:37:13 +0000
Date: Wed, 27 Nov 2024 15:28:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1732717728; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=CcCdE2mWnlvUPyRfMf+AyhHHu8WQK8CTzbd+erbG+Vw=;
	b=x41x1ZRd7A1+ZeOy28GidZ4cA80opTa3tk4vYnwgpWuGXkCWYfUb7jWapFr64fcZgL1JKb
	kUVhQb+qL0XPRDRnb7x6nfbSbdbSItkVVhksscgOLJlHvFOBI6u5RyVX6+zrTb3lG3IJ3D
	+qSMY0GKBYf7p3gcQNvu67CrxKN72vYAw0+/uqQ23oxEH8JWJOfBYFpghYpurhgVWdnyHE
	vl7WSb/m+APW72v4NqnE1EfN91ZJhaZu576VyKpIJ6P+xRtIX9K8Rzq98mqhOqKd4IeAMT
	tDhunNbpPvyY6Ss6hqCM06GQRU76fp5/aggbrjodgKuP2fPziDWaWYli8vrK9g==
From: =?iso-8859-2?q?Micha=B3_Kope=E6?= <michal@nozomi.space>
Subject: Re: [PATCH v2 1/1] drm/mediatek: Filter modes according to hardware
 capability
To: Shawn.Sung@mediatek.com
Cc: linux-mediatek@lists.infradead.org
Message-Id: <UJ5MNS.Y9SOF1FBB3XG@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_063712_673358_06E5CCDA 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Thu, 28 Nov 2024 02:32:12 -0800
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
Reply-To: 2025e0ddff85a3bfa1f8894587b5e26ba3cfd65b.camel@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

(Re-sending because Shawn's @google email is inactive)

Hi Shawn,

I'm a new owner of the Chromebook Ciri (MT8188) and have run into an=20
issue which I believe is related to this patch.

I'm attempting to use a 3440x1440 144Hz monitor over DisplayPort, but=20
the available resolutions are limited to 2560x1440@120Hz. I found this=20
patch, then I confirmed with the monitor's EDID that i am indeed=20
reaching data rates above 8250 (though minimally) in higher resolution=20
modes.

I wanted to ask about this comment:

 > The proposed formula is only one way to estimate whether our SoC
 > supports the mode setting. The basic idea behind it is just to check
 > if the data rate requirement is too high (directly proportional to
 > pixel clock, inversely proportional to vbp). Please adjust the
 > function if it doesn't fit your situation in the future.

- Can you confirm if the reference number 8250 is the hard limit of the=20
hardware?
- Could you suggest other formulae that could work for my use case? I'd=20
be happy to implement and test on my end but as I don't have access to=20
MTK documentation, I don't know the actual limits of the hardware and=20
how to deal with them

Regards,
Micha=B3 Kope=E6




