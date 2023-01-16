Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607C3C54EBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mx+q3yLiLRos9hCCmecWMw+O0wMnKRMkoi7oBC1P2yw=; b=K0TFC6Fuh+EtGm
	tvCLOz7sZ8kmyha3GLt4jTrxCgxsUTSJrdxrK6Neitq3O4n6jnafJRjNNC4QtCU6KiL8UVtq8Yy+7
	EHdYgp9+uYpWxvyn7rLaStDqLTyBvDJ+trPHoGr/bMdK3YEHc0coBMWTb//zvW9YsyXtRL/fWDEzO
	6W9KkfEZpXYvw66etuBF26YVtztSIwiKeUe/M8N5ixVX9vZRIr09rgHdXSgIoLRizEeRMHM3BqD9f
	JLBovuCMIVraxqZ+5dpRqywGwHBXjBoL0lbbGwzIkHTEHw8BmpnKjrZpmFHhefLx7nlUKK/Po+rQZ
	N2os1Vo1Mdlx2sDFV26g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQkQ-00AxkV-8x; Mon, 16 Jan 2023 14:46:06 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHQkN-00Axiv-9s; Mon, 16 Jan 2023 14:46:04 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9a:3200:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.15.2/8.15.2) with ESMTPSA id 30GEjVgq2096589
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 16 Jan 2023 14:45:32 GMT
Received: from miraculix.mork.no ([IPv6:2a01:799:c9a:3202:549f:9f7a:c9d8:875b])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPSA id 30GEjO301941354
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Mon, 16 Jan 2023 15:45:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
	t=1673880326; bh=mx+q3yLiLRos9hCCmecWMw+O0wMnKRMkoi7oBC1P2yw=;
	h=From:To:Cc:Subject:References:Date:Message-ID:From;
	b=l1FEWKcFwozAXZT92eOk4DYK9J5PCDmXUQrfN+v/KWtvYc2fpizFf5QuySWUej9vH
	 gtapsUguFpTOxxoGcK918w1E9C0f+tX/TELSuLMxT1uGkro6wLbp60oGBBdhkA41yz
	 ABGYMJ8pa1LLF/WVx79N1VB0rbgWi11X6tb1CLZ4=
Received: (nullmailer pid 375753 invoked by uid 1000);
	Mon, 16 Jan 2023 14:45:24 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Organization: m
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
	<Y8VVa0zHk0nCwS1w@shell.armlinux.org.uk>
Date: Mon, 16 Jan 2023 15:45:24 +0100
In-Reply-To: <Y8VVa0zHk0nCwS1w@shell.armlinux.org.uk> (Russell King's message
	of "Mon, 16 Jan 2023 13:47:23 +0000")
Message-ID: <87h6wq35dn.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.7 at canardo
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_064603_670098_474A46CA 
X-CRM114-Status: GOOD (  16.19  )
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

"Russell King (Oracle)" <linux@armlinux.org.uk> writes:
> On Mon, Jan 16, 2023 at 02:08:30PM +0100, Bj=C3=B8rn Mork wrote:
>> Frank Wunderlich <frank-w@public-files.de> writes:
>>=20
>> > apart from this little problem it works much better than it actually i=
s so imho more
>> > people should test it on different platforms.
>>=20
>> Hello!  I've been banging my head against an MT7986 board with two
>> Maxlinear GPY211C phys for a while. One of those phys is connected to
>> port 5 of the MT7531 switch.  This is working perfectly.
>>=20
>> The other GPY211C is connected to the second MT7986 mac.  This one is
>> giving me a headache...
>>=20
>> I can only get the port to work at 2500Mb/s.  Changing the speed to
>> anything lower looks fine in ethtool etc, but traffic is blocked.
>
> My guess would be that the GPY PHY is using in-band SGMII negotiation
> (it sets VSPEC1_SGMII_ANEN_ANRS when entering SGMII mode and clears
> it in 2500base-X), but as the link is not using in-band mode on the
> PCS side, the PHY never sees its in-band negotiation complete, so the
> link between PCS and PHY never comes up.
>
> Both sides need to agree on that detail.

Any hints on how I would go about doing that?  I am a little lost here,
changing arbitrary bits I don't understand the meaning of.


Bj=C3=B8rn

