Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79BB4C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 14:05:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D270461453
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 14:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D270461453
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Gw0b6jG7fckN7nMVN3PmUQNBEHd0dpmC7Gm/bgkn4Vs=; b=V0JuAdVodeLm/qV/TgXc98/4x
	7GXXegFcFepIXboNndFfphosx4Vo2zODXn99FDNaXzxdxy22UmKKazHGCF6c/b4KXcKXT/efaDL5k
	3FvpUMFOHd/5A45RVVHXH/bW3Km/rij9lqImacHaBShcccE6qyzJZaMVf8+wf2L9NeBREQ2k/gSil
	AQEyTEJp+zP+UKGZqtVifbpmEmyDW3uP0Fo4iw5aA2875vr15ebLTXfPECVRAv85AmXVAU95wDg8T
	0sr9oU/B+1EPbHSPGBxXSICSGVtuZJ7moh29cklMXFdf3YbTYMAOLXLZZtx0AKcBPVVOInUF8n2AF
	p/g/0R7pw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZDTh-00EWyJ-VT; Wed, 21 Apr 2021 14:05:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZDTV-00EWxI-9s; Wed, 21 Apr 2021 14:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Date:
 Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=eo1nK0UD2a7QXD/BCB5NO5zSj3zAXmk7v82G2w6ov4I=; b=j8Fc9yOl/91uLGDey1APOosUIR
 O7y4IWF8TijSPutu9SUtjvZYCkpW+/rye8k0G+EH4un9pHQ+XqdZKyt7g2Wbvp+vEik/154bqHqC+
 qwThwzdHJ7SEYPWGKnPd4McVbZg8da/TK05NUd4PvuuKvC4M9yRt73aYToq8TowOrIpvVhZqNSRtG
 ytJiFPt85gXfEzKyPNOaBa11w/u+2G25+yCCXiHDgZhdQJ3pJVJcENA/Fw33cP8qk+qYfRlO4wy/Y
 MhE7zmQJWXFckfbr+VZ+arcPMwrm2TXZ0OPMdVLqBqdR1p50FoIlLjEypIvv5Fb/xCjGips/73cqN
 frpLPehQ==;
Received: from mout.gmx.net ([212.227.17.22])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZDTP-00CwQQ-Re; Wed, 21 Apr 2021 14:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1619013874;
 bh=eo1nK0UD2a7QXD/BCB5NO5zSj3zAXmk7v82G2w6ov4I=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=G+fxJoRkgDWQqoVA/oCFNizQN28RLwvucCkG4u4LUS13DuzyCAR10TCUyD06nCofG
 ktc2+sk1UiidCDYbv0oth/EwiWC8eym5yn/GmOCsMA9NdU0NWWicPpnSZjYjm93O9s
 KF+ZykHc+hPXTY42qP9sVj0rp1RujzEaHoeKMbM4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.77.133] ([80.245.77.133]) by web-mail.gmx.net
 (3c-app-gmx-bs34.server.lan [172.19.170.86]) (via HTTP); Wed, 21 Apr 2021
 16:04:34 +0200
MIME-Version: 1.0
Message-ID: <trinity-47c2d588-093d-4054-a16f-81d76aa667e0-1619013874284@3c-app-gmx-bs34>
From: Frank Wunderlich <frank-w@public-files.de>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Rob Herring <robh@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>, John
 Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org, "open
 list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, =?UTF-8?Q?Ren=C3=A9_van_Dorst?=
 <opensource@vdorst.com>
Subject: Aw: Re: [PATCH net-next v2 2/2] net: ethernet: mediatek: support
 custom GMAC label
Date: Wed, 21 Apr 2021 16:04:34 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <CALCv0x2SG=0kBRnxfSPxi+FvaBK=QGPHQkHWHvTXOw64KawPUQ@mail.gmail.com>
References: <20210419154659.44096-1-ilya.lipnitskiy@gmail.com>
 <20210419154659.44096-3-ilya.lipnitskiy@gmail.com>
 <20210420195132.GA3686955@robh.at.kernel.org>
 <CALCv0x2SG=0kBRnxfSPxi+FvaBK=QGPHQkHWHvTXOw64KawPUQ@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:sV5Mlbn73eWH7aiVlwaybpsQCFZyxd8vwbmUGt69EWlA1fnqNSM9XL/OwUTnRLA5pwmJ2
 gQkOKxpSNkq6/G3e221sldSrvVJLEN4B49Qny4npb20S0MhCGfh0wrdacbeBD/nargGhUw2I7I5m
 I99HhDGPZSLFTC/zJEQhrTf4sJ7+6nT2AQu9uZLnD84WejyQBaFQZMMuNpHJdGVRAYllNzG7loj4
 Gf6K304Da2vxOZP1JyzFMtzwfeh81dRZHl+2GW69itbKKoKMzWtgkXQ1d2CHNHQaHTbgHAVGY+rW
 P0=
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z2mfGzqKo3A=:7BgbnqxAImJaah8rUDd72I
 qd9iee+wk72p/Y+dXXy+REOgl5yfZHwf4KOIwbXQ4SOZPHo3dgu7MNwpkGTS0N+4iNTbwggOX
 ctORwLVkjE7QoBlZLU0RBC6JpGFZb0gVOoLpALJwzHV9kfwhyTq0YwdecwIennA5diIsyFl6u
 +eDtmPFQAGVrcusQ2RngtfIftgPhmiZ4aMkfWzV+QfaUx9wjCf4sLpw6+KBAaXSLymW6FLCOt
 u67DE3xm5QTYs3rZfoKBFNM5oAx5FiY1pjUV76MWmsUZFXsPxU6voxOh15CH5t9esDGdb6Cyj
 54qZ+K5QuGVsSpLgUC9xGtbBi/BQjMkM+Zr2b0exGKaeyniIaeTi3vDuuRX1Z/ZgrICmO7w+G
 /lSqUT9dnFfBBfYzxNfNBJTpKHeUCNDtKHqK/QM+KJRvFdCaeV7Wo4HrM4R47Ymp6Em7RiT8r
 k12pTc/fB0ZQnFEVhSPmIAcGBMRbRWqQffoHJTsD6B0nH69C+PcgsqFGNyli89FXqPZuJ1pLr
 DCITTDUsUy1TfhafZOMiw+AqNh7fOQPazWrpSmr0ui8Darhm+dEw6U/lNLBlhqWFLAfOlarvi
 q5Dn1CNvLeRjGKRnq6v4KdWrogCp5dLFQrlpzMORRtkpHyAwTsPj8mBAp42ltz/kfqBp0H/Dt
 6cZr5FZhVMceWm6R+P8m505ySlRkX/MsnPnKRT57l5fa4XxLYdAEQRS1Jy+pfoA69A8j44Byw
 YRi4CtB4eiB/JKOptodiWl5nnYIs6H6DIRGXZgrhZCDFiElEVj572TAKYmMWAGi+q90VkzIm5
 N3YMTjWFekP3kFSV9/ZR372038pW0j+0ijryhNruduR4LIjCXJY2J6OrIFAUzTM68Y7hjCuBq
 ZWyWRmxE0zfwVUlIHTCJBmMaSaZcQiHhPA5qzSfJE+vAatagR1ewYZ2yDZFoO81/25igrac+K
 9DcCk+d7Igg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_070500_248548_19EA26CD 
X-CRM114-Status: UNSURE (   9.65  )
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

Hi,

for dsa slave-ports there is already a property "label", but not for master/cpu-ports

https://elixir.bootlin.com/linux/v5.12-rc8/source/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts#L163

handled here:

https://elixir.bootlin.com/linux/v5.12-rc8/source/net/dsa/dsa2.c#L1113

@ilya maybe you can rename slave-ports instead of master-port without code change?

i also prefer a more generic way to name interfaces in dts, not only in the mtk-driver, but the udev-approach is a way too, but this needs to be configured on each system manually...a preset by kernel/dts will be nice (at least to distinguish master/cpu- and user-ports).

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
