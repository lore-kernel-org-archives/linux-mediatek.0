Return-Path: <SRS0=+t0h=23=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2C9C32771
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 09:36:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFD76206DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 09:36:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KTsTkH9V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="kzScDLeb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Kh2chubZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFD76206DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5dJQ3VunHvZ6NClvU6FAcKe6g8QqW9PYlBfo4CB2dkk=; b=KTsTkH9V4ACLTu
	fNhQZACP6FMJ09N++looyLdzerG5vV3kYXDENWZCyiAPGqCkaYBKtS5+/+f1uDGLasY0fD07JVw7m
	GM3CozsBi/SnrC6qC0cJtT+xqZ/GOD+OQZTlczx4/OE8vsk+rWQJ3Skh/LaQPgJD67vZjJxciLDbF
	WNApBH3dwztNty5vNyin4niUI8f/a8fsFaJvCzUHHtqPMShIZr4IWEdb6AxqVGDL0GzqxVUOFeCvc
	jQTx0j5fRHitX8j8i0TqGJDiguNFnlmzhpKCBFpfWnTiiCYxBP8BOg/VTv0s1Qu2Pw+XgBALKaq0Y
	9M0qPdJT+QMvj+Otj/YA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioOnm-0003jU-FZ; Mon, 06 Jan 2020 09:35:58 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioOne-0003aW-25; Mon, 06 Jan 2020 09:35:51 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 86610B6A;
 Mon,  6 Jan 2020 04:35:46 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Mon, 06 Jan 2020 04:35:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=Az6842jCwBnlC75YpfmD47hgMm/
 fEpPSyC0cxuz5s9w=; b=kzScDLebOyUrdPpqvzrwdoYxq+UFq+taB9NTurVyeiK
 S86xICcEca9s27KD3g+Yl56cssDqpOViihmO46C8YBBq/YgUCL8M9Lg0CsUIFnHr
 Q9v943r5ZzSkveqnnBzGNaWHR1Gdh0CC7DuOkP0jEd8m8BspxOxhCk5s2Swr3Hsb
 Hf5FxBpKBOeUl68e6UJ8BtP/hc/S/BOHzN3ha6o9OwpAtHujwYouP8VW//XpA3US
 DDxDgXk0SOd+lrS8hKfAjzg/UHI8i8Vz2CBdywUTPPKD9gX6DP7jS8VCI1DPjGnc
 EnnIHbXR4ezDmQy/TM0SCGBR3gmFyTh1+HkBdecdbDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Az6842
 jCwBnlC75YpfmD47hgMm/fEpPSyC0cxuz5s9w=; b=Kh2chubZJUEYhmmKE+k6VQ
 MeSt0HWCXClLTPmNA+IulC1Tom/dJorN4zMD3NmTRa878y/Sz637Mr0LXybDBK+T
 sPN3x4xi0YtGx7b/wNOrX0lm8INO0CYMhmV5fnMgSnUCUAhTbCZDUfQ8nrRbYkqi
 KBPhfNVM5QqFO3DcYZHsidPtmzl5MpKo2NYgOPR0nJQMDdPK2Yi03U0mrIDIpB2h
 iTn6a0BoWGMla3X0Ya1D+Vp7LHlOpC4v+v7H5e95kSrIncRUiWaSgPwImQ0U4Iyc
 irTCGzBFKBaYbViIH5dqW6GwOD1sLInqhhMGNnHNbu0QKZdvQZuIEKm5g+Gjwlhw
 ==
X-ME-Sender: <xms:cf8SXpIA947rVvmHUPBysszxau7raxjqa_kD0WYq0rGaM0GlIk2Z-Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddgtdejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
 ejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucev
 lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:cf8SXoZyxCA8_Yv0eRB19xnOEQgYzhRkpcvv_VQ2fffGtbKFSdyOQQ>
 <xmx:cf8SXrKq2yKIRrhkX6SfgbS02ciFJiwIKaynzWtr4m2BRbpwrOdy1A>
 <xmx:cf8SXmAVXVUSWRBdo_agnlvNDdms-8IEP9aglXKIT8rE4DYbEKEjbw>
 <xmx:cv8SXgo1bpQ4NQlMnyvCcfqEANfylS-nP0m6lPlkJPN4MmW3i6PRfw>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id BD67380059;
 Mon,  6 Jan 2020 04:35:44 -0500 (EST)
Date: Mon, 6 Jan 2020 10:35:42 +0100
From: Greg KH <greg@kroah.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/2] phy: Enable compile testing for some of drivers
Message-ID: <20200106093542.GA3125672@kroah.com>
References: <20200103164710.4829-1-krzk@kernel.org>
 <20200103164710.4829-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200103164710.4829-2-krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200106_013550_120424_B0F24719 
X-CRM114-Status: UNSURE (   6.16  )
X-CRM114-Notice: Please train this message.
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 03, 2020 at 05:47:10PM +0100, Krzysztof Kozlowski wrote:
> Some of the phy drivers can be compile tested to increase build
> coverage.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

I've  taken this through my usb tree as this is needed to resolve some
build Kconfig warnings that now show up there.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
