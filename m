Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4BAC43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 20:34:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E3D12073D
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 20:34:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ITORldaC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="sThtOEeX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E3D12073D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nic.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5rEMzs03IzGbBNjpUtmjjm3VkkSDn43UfdjES7+W38=; b=ITORldaCGnBpDm
	aTMIo7TEu+IqAfxgRv0vqm2kAZClVAjRUEnc1VDniz3scf9rM9u9I6f+2NiCEFT4uoKp1bVO76uwp
	OPcSJN7/LXzsS8e+T/Zl0fNUyOFG4MnEJjYRgjY/1WKlyOutnVNfi5H8+XRUA+a2RE54wJO+RI2Dr
	W9inev1QtgMtzRbpfrllQy9Cq8AF/p0VSQWQlAObPsEvpjB5LvKrgEtZvwptwQNR9uaTXWpNUiOmb
	FUNW5mAIAD94fTuivYqDtyb3RocsYl8x+u8XgJlugk6z+EEaftpLBDfUPB8qsHzIRgll9WeQyre9+
	DicoYiI/3JbcQhP5qa+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iemCn-0002bR-DG; Tue, 10 Dec 2019 20:34:01 +0000
Received: from mail.nic.cz ([217.31.204.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iemCj-0002Rn-4Q
 for linux-mediatek@lists.infradead.org; Tue, 10 Dec 2019 20:33:58 +0000
Received: from localhost (unknown [172.20.6.135])
 by mail.nic.cz (Postfix) with ESMTPSA id 5429F140AC8;
 Tue, 10 Dec 2019 21:33:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
 t=1576010032; bh=gT9/qt/EE7APHbwGwmFdoeHh/5ij9tU8+0uQXcYhjVI=;
 h=Date:From:To;
 b=sThtOEeX+qYfIcojZT7f2Vbh9MTdECtF/Ctl0YngNsUBcL6Y7s6S5lCAiP0kfmx/v
 KAyG5LPOqa6UrjRlit08uN0nTJHjzOo98m/IKDFtXdVfk1tYHqKKb1DttwKCg+MKk+
 ufKzsCzDzfO82MDF5WYpvs/zZSe04O4Ms945Lx40=
Date: Tue, 10 Dec 2019 21:33:51 +0100
From: Marek Behun <marek.behun@nic.cz>
To: Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH net-next 4/6] net: dsa: mt7530: Add the support of
 MT7531 switch
Message-ID: <20191210213351.2df6acbf@nic.cz>
In-Reply-To: <20191210163557.GC27714@lunn.ch>
References: <cover.1575914275.git.landen.chao@mediatek.com>
 <6d608dd024edc90b09ba4fe35417b693847f973c.1575914275.git.landen.chao@mediatek.com>
 <20191210163557.GC27714@lunn.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.3 at mail
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_123357_466929_49FF0137 
X-CRM114-Status: UNSURE (   8.83  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Landen Chao <landen.chao@mediatek.com>, f.fainelli@gmail.com,
 vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org, frank-w@public-files.de,
 opensource@vdorst.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 10 Dec 2019 17:35:57 +0100
Andrew Lunn <andrew@lunn.ch> wrote:

> On Tue, Dec 10, 2019 at 04:14:40PM +0800, Landen Chao wrote:
> > Add new support for MT7531:
> > 
> > MT7531 is the next generation of MT7530. It is also a 7-ports switch with
> > 5 giga embedded phys, 2 cpu ports, and the same MAC logic of MT7530. Cpu
> > port 6 only supports HSGMII interface. Cpu port 5 supports either RGMII
> > or HSGMII in different HW sku.  
> 
> Hi Landen
> 
> Looking at the code, you seem to treat HSGMII as 2500Base-X. Is this
> correct? Or is it SGMII over clocked to 2.5Gbps?
> 
> 	 Andrew

How would that work? Would 10 and 100 be overclocked to 25 and 250?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
