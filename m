Return-Path: <SRS0=95qJ=OR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE12C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 10:55:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A134160EE5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 10:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A134160EE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cWEPxJXUXo0qQ3oOsXuS6NKhoiGuPBKFtvkFwJDNjmk=; b=fSebNhC1Aew0i9
	japPE199me/9xuImn3Sbx1YdeYTmF06tRzla3gO29YON5DPdo4er0UtqRJUxM3oV6LlHyTcxKJ9b4
	fGSLF5Hhl+E32RUgpG7lkVaarZUskVVk9wrYMQf7CJEnFXgUeS4QKL89/cNRZIqDTcAhxg2au05tI
	p1UCrmryFsuspv9GU/3zTdFq18hlbi8jzKr5MB4A/y0wRWVNLpiY51xQtu5y4nFW3pms1K8+lCCmW
	0lCyH80ENhbUngfezdk4Lj6opk3JHq5T+sigL0QIdo4OrZftIw43ECA6HqkNj1Vpvdd3SVW9iEuty
	lABZEUF3ln+BvTFqK44g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUoHf-002MTb-37; Mon, 27 Sep 2021 10:54:55 +0000
Received: from new1-smtp.messagingengine.com ([66.111.4.221])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUoHR-002MPP-Jw; Mon, 27 Sep 2021 10:54:42 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id B7603580A9C;
 Mon, 27 Sep 2021 06:54:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 27 Sep 2021 06:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=F1yC9e6f4L4P4vLBZgU6EcwSh7h
 BL4qthNhSxMuXr+E=; b=tjIGNlvj4WxYghk/RnCVES1C3O5C1YjvH7RI01Kn/Ak
 8x0UnJ+PZ7nOIJVzh18TyOtJQ/Dm0zoYX0vnW3qFh1txbCtSdVwNOEppYkn2L4vQ
 32iRuDgq4Kut90dlYjDkCQd7wNKvq+Hao5vmYn3erYOpSGPTJ5wpwWj0wgQgljXv
 3Vf6DX/pUM8b2ND/K4DVLe2vqs71nPdjVNCxZpW7H9wvF6twa6tfUEPkf1hKKWCg
 ZzFMhtzojXmyN2HEL7szgPbSJ0KobvZopVb+9nb5FOnjuEd7t3Q+Sb75fPt895UK
 QGN5YD+WDzkq73r1p8CCerYCiFRIV0ZnaFRWAOJalLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=F1yC9e
 6f4L4P4vLBZgU6EcwSh7hBL4qthNhSxMuXr+E=; b=GqquaonZPY58341bDIoXOU
 oly2aOQsN6qNmROlqpIGUu91KB4AT+8Azg87t+iJTG4QXPLvumhQRNNhL88B2aF4
 ekH8gw7qjgpeRgddVtfJbC2cXKThwb1wDJFxMEYmxr+9eChUISdTB05pjxsI5lHF
 7UOANZq1Vs+LqzDqL25oIdy3f84etwTesOgrYBqQ6WvmOQXHtQsIMrtNFydtTCza
 SKLZGjQVmbgrr0f7M4jFuH3IbulNgDwaR9JSRKRXpV+SZ/VU45zqIU+jDNjMoMIx
 oSeq19UIZ6i7xbmmDqu/ImfLtfX7hj7ZvZNfyx8pItbzy7cTAs42Uq1sjsJYmApA
 ==
X-ME-Sender: <xms:66JRYXAzI3VN-ScFJUiuYAnbHR-nhPxDWXzaOFkIDwdxUH4ZLswHJQ>
 <xme:66JRYdiiaVONsg6JxjIyEnJxtiJR2UdyWp6w8v80ioCJkyd3JD-URPJ9jV-rRmHJB
 AZE0Alm2i52KQ>
X-ME-Received: <xmr:66JRYSm-yNKnS4R-4-z_auq2CjNCMk6t1pxmB_MW1Nmb-X4l2ejKqfyy9fW7yT56uPt82Ry_S-f4oON8Pjpu0x_F8ubLjqFe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeevueehje
 fgfffgiedvudekvdektdelleelgefhleejieeugeegveeuuddukedvteenucevlhhushht
 vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhh
 drtghomh
X-ME-Proxy: <xmx:66JRYZw5ATvnX-5qAnN7jQV19yLyuIhzwgUCNVCWZcE9xdOT7dZ1cQ>
 <xmx:66JRYcRzW9lnO6_IyBb_plXtgBbwppUAtWHPIwOxw2bMu3ZCRunq6Q>
 <xmx:66JRYcb-iOcKW_a7R-NgVdvZkY80BmTCbZ2i_lFihXy85REXBqhl6g>
 <xmx:7KJRYczSDkgyMmKtad1MyJU7eMbQqiUVFEkkJbqPZWejNWoxrAx_2A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 06:54:34 -0400 (EDT)
Date: Mon, 27 Sep 2021 12:54:31 +0200
From: Greg KH <greg@kroah.com>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Leon Yu <leoyu@nvidia.com>, "David S . Miller" <davem@davemloft.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Miles Chen <miles.chen@mediatek.com>, Bear Wang <bear.wang@mediatek.com>,
 Pablo Sun <pablo.sun@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 Macpaul Lin <macpaul@gmail.com>, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: backport commit ("c739b17a715c net: stmmac: don't attach
 interface until resume finishes") to linux-5.4-stable
Message-ID: <YVGi5yuhExKhLNry@kroah.com>
References: <20210927104500.1505-1-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210927104500.1505-1-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_035441_747011_9F23E04F 
X-CRM114-Status: UNSURE (   7.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Sep 27, 2021 at 06:45:00PM +0800, Macpaul Lin wrote:
> Hi reviewers,
> 
> I suggest to backport 
> commit "c739b17a715c net: stmmac: don't attach interface until resume finishes"
> to linux-5.4 stable tree.

I see no such commit id in Linus's kernel tree.

Are you sure you got the correct id?

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
