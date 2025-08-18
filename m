Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30593CA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Aug 2025 17:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0dpJixL1oHRcv/3jNzfC2XXZ+aqq6CYkmZdArMOuDoY=; b=u3eMJU8bkn94Ek
	sv+NEg19f5B8/8cuFYFK3/Ggvx02Cvzo+DTwsTddkLekBZGt7To1+Yy3FJO8kG3uKRpv+2gczH6Ke
	ofC5q4TLflDxmzfvzHcfCEGmhaDSwfPliG4hMALfcCDhwEF/UjxH4XLJVTR3PwsqL9i55poZxUVvQ
	c9s7g/Yz7FZTOIj10a247u5sSnZ4JovbSmEdL379VEh78q/WCNe8b7SYISWtq9IkgOjJfDtex1VDm
	d9Ec3rr3dlGrMGK4BHXIuKNzqKSt1C/olDcR0+AZBnncF288ANKgK2yAR6GJxJk597lLznAA2gQtS
	ZjyEisYjAp4pWbcldVlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo3iR-00000008AS5-2rej;
	Mon, 18 Aug 2025 17:32:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1oR-00000007vJ4-418N;
	Mon, 18 Aug 2025 15:30:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B027440CF;
	Mon, 18 Aug 2025 15:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5706C113D0;
	Mon, 18 Aug 2025 15:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755531007;
	bh=0dpJixL1oHRcv/3jNzfC2XXZ+aqq6CYkmZdArMOuDoY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TUiYRhv3OxN9v2yoois/MTIq1RAg66QbGVeqXLXRna6GBPLoitAfU5+gXIHywbugf
	 X00aRZagGj9JZAY1UHWYYLwyOEvGPaEDCXSjxOUFCZGppHCl7aMFZJAad4zXTPM60L
	 xbWShtgAz0mK/6jJ3KdipPypAdeKan6efrcwQQmg4X3T3kv6Gt3/SvT8MuB4eQxdo8
	 QDfRYPP2/DNbE2/jpeCouKXiUG2VlioTTVLH2uiay+gJXqJd4ket+v10VHMyy+J8wv
	 wZkV/l6S+UjE0cCmmxpqSVeeggjFJpsG041Sc40Piu+wxpBaoLWkX54tO2/f/Tmwqt
	 ONoyPbr4UUJXg==
Date: Mon, 18 Aug 2025 08:30:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v9 00/13] further mt7988 devicetree work
Message-ID: <20250818083006.0f277b5b@kernel.org>
In-Reply-To: <8A21C091-0C26-4E9F-9B9E-E28A01F71369@fw-web.de>
References: <20250709111147.11843-1-linux@fw-web.de>
	<175218542224.1682269.17523198222056896163.git-patchwork-notify@kernel.org>
	<8A21C091-0C26-4E9F-9B9E-E28A01F71369@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_083020_020898_777D6CC1 
X-CRM114-Status: UNSURE (   7.03  )
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
Cc: andrew@lunn.ch, Landen.Chao@mediatek.com, linux-kernel@vger.kernel.org, edumazet@google.com, patchwork-bot+netdevbpf@kernel.org, robh@kernel.org, linux-pm@vger.kernel.org, cw00.choi@samsung.com, myungjoo.ham@samsung.com, johnson.wang@mediatek.com, pabeni@redhat.com, lorenzo@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, sean.wang@mediatek.com, dqfext@gmail.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, arinc.unal@arinc9.com, netdev@vger.kernel.org, daniel@makrotopia.org, kyungmin.park@samsung.com, djakov@kernel.org, krzk+dt@kernel.org, olteanv@gmail.com, davem@davemloft.net, nbd@nbd.name
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 16 Aug 2025 08:55:51 +0200 Frank Wunderlich wrote:
> Any comments on the missing DTS parts or can they applied too?

You should probably put the maintainers you're addressing this question
to in the To: header of the email.

