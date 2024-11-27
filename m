Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4F3D690F2
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Nov 2024 10:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Cc:To:Subject:
	From:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=amX4kw3CVdfrIN/iXfvn6zAUV0UHj4azZhnQaAZnrVA=; b=bTBI1YCuY8jNr9
	gcmosa5rxpOpEwT6s6M+DyhBP/Ghw6a+0tEe+HkpV9Ne4D101P2MqLWx1uzCApIoarM2mChAMsyND
	IHzs8YKPcV30HviTq2VpIyKHIfpxafaSviZMlb/SL6PFkVMNm1QHSyOd4XYmAuN8QrLyWOCPujPL6
	TONFBS4cF55dbegTvl2TL3igEEacRpkWA/oBVKv2DOoreZSbvFfK5i251ImNWbNe8hn/JRr8CGn9b
	Us9BjRoybkNDSL9xAFnDAZpiORRMac4tNw860hCC1PzKCaoRdLt2QRfzBlZNrNqZpuoWgLzPjaAA/
	Zhbkk9yuf0cOUDi8C0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGboi-0000000FGGV-2ipn;
	Thu, 28 Nov 2024 10:32:12 +0000
Received: from mail.nozomi.space ([139.162.184.125])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGJ5Q-0000000DNI3-1ihS
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Nov 2024 14:32:13 +0000
Date: Wed, 27 Nov 2024 15:24:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nozomi.space;
	s=mail; t=1732717454; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:  content-transfer-encoding:content-transfer-encoding;
	bh=amX4kw3CVdfrIN/iXfvn6zAUV0UHj4azZhnQaAZnrVA=;
	b=pNdAo8IHsdqh4j/ODZL2Zm/kbsHkJM4AM2wMTaAxSEvLJd4ZeN4c9DhiMzO990smXsV21h
	T1c/rKWNMeRnyAW6LATZZW8OyJ1dbJobS6nbnAodELch9RBWuinns1KOsPiDPxuRlpKxJ4
	iMUVPIob+uG2wU2yNVMEYob/6CB4+FbyiWKnh76ZrUcUJ5CSYOSmrhOyC7WLw2DADjZuCM
	kvnWmqN0LMAktwIEHSVyuzxYH1Ci+X4PrYsDGjg+KhyeuAv5TmmZF03Qi8Vzkw7pnnkkGJ
	axsiwrin6qqA53LTcTRcNobGeTk0U8TKnPSNrfLajQf9KMyJ6QqEk/4oHKA53Q==
From: =?iso-8859-2?q?Micha=B3_Kope=E6?= <michal@nozomi.space>
Subject: Re: [PATCH v2 1/1] drm/mediatek: Filter modes according to hardware
 capability
To: shawn.sung@mediatek.corp-partner.google.com
Cc: linux-mediatek@lists.infradead.org
Message-Id: <8C5MNS.UGU9MAZ7F1A73@nozomi.space>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_063212_582435_B5FC7167 
X-CRM114-Status: UNSURE (   8.23  )
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

Hi Shawn,

I'm a new owner of the Chromebook Ciri (MT8188) and have run into an=20
issue which I believe is caused by this patch.

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



