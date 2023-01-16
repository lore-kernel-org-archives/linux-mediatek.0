Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C432C46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 13:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0HTUfVc3oaZYPyu8hVJiRYYIklNVSq9G9JrqltNQOXM=; b=nWHRuuKW7riP0uqJ5L1ZqF9lKV
	uDqXj7huFqKobO7Y3anC4G2DsVWpqaKZaOliv+8KEzNPtNhXBUWV2NuY6RjxZrwePfmM7Z+oteDts
	VPoiXqZ5MfQwBmel9ZNZCiMlHFcRDJpEtD1mc89FwhPoGLw4ESGt4gxU5xONhy+z08pcni24IdwJA
	oque2gRMP6mLLMul2O9/9DBl+1X/tktlzcPURuDc+DmNzGM5sZUQTDYEjK2UhwpEP+O64MFheOfMz
	naWSTmJtpvBllSy5qL2cwpdM7jL8WZoq0rSrUKdVNVI8Jar8a8q362zPmk/biJIGM1ViWuYDXizYT
	JB3BvWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHPpx-00AZa4-1i; Mon, 16 Jan 2023 13:47:45 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHPps-00AZTf-Ar; Mon, 16 Jan 2023 13:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0HTUfVc3oaZYPyu8hVJiRYYIklNVSq9G9JrqltNQOXM=; b=RP2SFlEOO71CljwuB1Qv7OjmU2
	IJYZFTHcIFP1VVxWt3NSd+fslR/AUTg+OtdKfy7ldH9E8mYWmFSrGOTR1K+1HHyDT8wY3PEXc31+E
	FtNkSzJtizDqPyB/RCTOite3k+4UYyQnJESYwx71VBYd7B+QJWwxc8JCNeqh9ip8luwR5xEhF1lGD
	IPUFoKIuBHFIKA0gGGSgAt1/A9kj0GHYxwZ2s+wXxWF//5X/5Q8dvFmkWgZUoEJqQxtLDxHpobXn8
	09t8pWFNJEjsd8ytxoGBBrUeOW996pQ7PHQkvFJBprOWWDhKj5+GZ16hzsRM9u8a43jlqIXTyzLVo
	StJ17BKA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36128)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1pHPph-00051t-EG; Mon, 16 Jan 2023 13:47:29 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1pHPpb-00063u-18; Mon, 16 Jan 2023 13:47:23 +0000
Date: Mon, 16 Jan 2023 13:47:23 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Subject: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Message-ID: <Y8VVa0zHk0nCwS1w@shell.armlinux.org.uk>
References: <trinity-1d4cc306-d1a4-4ccf-b853-d315553515ce-1666543305596@3c-app-gmx-bs01>
 <Y1V/asUompZKj0ct@shell.armlinux.org.uk>
 <trinity-ac9a840b-cb06-4710-827a-4c4423686074-1666551838763@3c-app-gmx-bs01>
 <trinity-169e3c3f-3a64-485c-9a43-b7cc595531a9-1666552897046@3c-app-gmx-bs01>
 <Y1Wfc+M/zVdw9Di3@shell.armlinux.org.uk>
 <Y1Zah4+hyFk50JC6@shell.armlinux.org.uk>
 <trinity-d2f74581-c020-4473-a5f4-0fc591233293-1666622740261@3c-app-gmx-bap55>
 <Y1ansgmD69AcITWx@shell.armlinux.org.uk>
 <trinity-defa4f3d-804e-401e-bea1-b36246cbc11b-1666685003285@3c-app-gmx-bap29>
 <87o7qy39v5.fsf@miraculix.mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o7qy39v5.fsf@miraculix.mork.no>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_054740_410145_9D55B48A 
X-CRM114-Status: GOOD (  15.78  )
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
Cc: netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, Alexander Couzens <lynxis@fe80.eu>, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 16, 2023 at 02:08:30PM +0100, Bjørn Mork wrote:
> Frank Wunderlich <frank-w@public-files.de> writes:
> 
> > apart from this little problem it works much better than it actually is so imho more
> > people should test it on different platforms.
> 
> Hello!  I've been banging my head against an MT7986 board with two
> Maxlinear GPY211C phys for a while. One of those phys is connected to
> port 5 of the MT7531 switch.  This is working perfectly.
> 
> The other GPY211C is connected to the second MT7986 mac.  This one is
> giving me a headache...
> 
> I can only get the port to work at 2500Mb/s.  Changing the speed to
> anything lower looks fine in ethtool etc, but traffic is blocked.

My guess would be that the GPY PHY is using in-band SGMII negotiation
(it sets VSPEC1_SGMII_ANEN_ANRS when entering SGMII mode and clears
it in 2500base-X), but as the link is not using in-band mode on the
PCS side, the PHY never sees its in-band negotiation complete, so the
link between PCS and PHY never comes up.

Both sides need to agree on that detail.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

