Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C324ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 14:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKTgfDoIE6UiOiVrNwpBfj8b16I2mBbHe7AmkJlk1L4=; b=AVHLJIskr+7LvQYhgbCWy+twIN
	pxqNmdtv56cWziDGd5zWyNaH7RehlL0slniy11w+12h92p7Yko69PY74bHxwWr1YT+C9wvZpgJX92
	O/1YNTHhfu9Sr6hSoYacPFAkCsKbarFJZXa1E764Lj2Z+FHdgbe2Fp/1vlwusfFgLgnlKNuvlJQKf
	qdY+tVNROykT4ZZVJDrHz0wNnUucsXWTD+5mTLSrpIX0yevO2/oJMHI413nUdRs3DNHcQ1cYSfsMB
	PMd/qm5Mhau8oZ8olA3WUWuinetz4d5KDplllrd27vYcRX/RIsGcDoQQ10y1V1AJwHlMM9kzvAKfN
	RPocHdcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omyie-001xPU-8e; Mon, 24 Oct 2022 14:46:24 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omyiS-001xKM-Q4; Mon, 24 Oct 2022 14:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1666622740;
	bh=iKTgfDoIE6UiOiVrNwpBfj8b16I2mBbHe7AmkJlk1L4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Kjy4AZvDGHxHeatlvW8azlHVP6t9AKOdUmCg3XO/DhGfKQyy1Vuzy79AQDj8hWnCQ
	 zIHMWsORu/p1FnD6xsoEwhvFza1GgtAKEeJgEuJVQ9AUFrS6GQU4dnNQDzJoWM2DIp
	 4gM1OPi0tYTiezGiU4DQZ7zkZ4C3KXf5JLGwXcFk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.75.40] ([80.245.75.40]) by web-mail.gmx.net
 (3c-app-gmx-bap55.server.lan [172.19.172.125]) (via HTTP); Mon, 24 Oct 2022
 16:45:40 +0200
MIME-Version: 1.0
Message-ID: <trinity-d2f74581-c020-4473-a5f4-0fc591233293-1666622740261@3c-app-gmx-bap55>
From: Frank Wunderlich <frank-w@public-files.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Alexander Couzens <lynxis@fe80.eu>, Felix Fietkau <nbd@nbd.name>, John
 Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Aw: Re: Re: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Oct 2022 16:45:40 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <Y1Zah4+hyFk50JC6@shell.armlinux.org.uk>
References: <Y1RCA+l2OHkrFfhB@shell.armlinux.org.uk>
 <trinity-ff9bb15b-b10c-46d6-8af2-09a03563c3c8-1666509999435@3c-app-gmx-bap20>
 <Y1UMrvk2A9aAcjo5@shell.armlinux.org.uk>
 <trinity-5350c2bc-473d-408f-a25a-16b34bbfcba7-1666537529990@3c-app-gmx-bs01>
 <Y1Vh5U96W2u/GCnx@shell.armlinux.org.uk>
 <trinity-1d4cc306-d1a4-4ccf-b853-d315553515ce-1666543305596@3c-app-gmx-bs01>
 <Y1V/asUompZKj0ct@shell.armlinux.org.uk>
 <trinity-ac9a840b-cb06-4710-827a-4c4423686074-1666551838763@3c-app-gmx-bs01>
 <trinity-169e3c3f-3a64-485c-9a43-b7cc595531a9-1666552897046@3c-app-gmx-bs01>
 <Y1Wfc+M/zVdw9Di3@shell.armlinux.org.uk>
 <Y1Zah4+hyFk50JC6@shell.armlinux.org.uk>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:kyHcw3FPKTYvo7tQ0dRRfaP5g86cy9/pBLBRRYb144WrPpKIiE0z+ipmmmiD2vVED2zCR
 GlQnUkHFMQhJS/cecoz+5bF42AiKgmS+arS3+7TyFVgHUNKI+YWzVEoPBWy6SKZ4c4/MMvjZsnC1
 0zWHtxRjESzQjt4HbOEKmM5M7F6sGsiIitAXyDMzBohNJ4xjO3HnanQjHUHbYMuKLVjMQp8ATP+S
 Z6jauN53KNlyP25g7uBjKzEPCmtLfQH2sQ/+bAInqwWMuHwetY6CmHcSPUsbAA5bPDJ9y5rBunCM
 jM=
X-UI-Out-Filterresults: notjunk:1;V03:K0:EGH6UiZ1l3E=:k4VEPx74Qa8QBPeUIClj5u
 0xTGHa6SikFAv6gwz43t/pJgoPtY+QSc77vakySsIKujp8oW29Obk5Rce5Yp1PZ96Zwnm26nU
 q0qGusD14W15VcAH9rPd8uhZ6bLzoS8497lm8/riBWB9fHznXW9puUqt+M0j4IuZwzwi2z5n4
 zUjG+l4G9UNdz7rHRmw0hwEXVgmyxLrKNVbrAp2pgqqa66idfg8Im28McKD2PzbdMWVyNOI+G
 ncu2Ww3h6rrp4JLjRNtW9y5PC5FPxWyxH6QJlFITsjs5AOEI9J0EEA+sxOAgHhRzsMwfVo0X5
 AnpGVMZ7CxGoVq/Ha5vxCPrvBdo15liHdwmZbWd0zFtRTSmLsS88fv+vMo5MFTF+vy+ZbXUvv
 Fkj6JjFatN7BFtNaf1HPlpXD3E/3syXl0sHckAyCw6kVK27QJcGQTkNEBeQg7WjrLuP03/Iw8
 UqWBDsttuQ9x+E+WkYYOE7k5KEfR4gz/BKNubN2AvHlrJHQ8OMJ3SnWSJ+rb9oV6SvTAfZ1Bh
 5aej25x9qWUomm0kNWFa8ZeeqtTZo2kY+X9rt8Bo4t2HEhKZvbz3YCFCDSrQt/3PwumEOABqP
 eLIWZxQxdPQe8RxRSKUbdxSXCHfy9bGN9RC4BSEfVUJIEMSf8oK0N8IQBOcVBb4R8oYyiyAcQ
 NKt1hMMA10P9riLgs1mkxmEQgdPnqNDdN+R38fVdVPxJNilrc2bn3l7/H57R+LJwR/vWXrBLc
 vyMgVrS5BUMPiTjX3yyT7tECdQvDxnQMbK4r+sgMiHCjBKlmpEHyNv4y7EuzYYTtwRlQuIqlo
 nvuru/90YbhovJvcreJj9mpIlwvmUfD3OYaZfdANhjESmik0YtWRaXILbPpWaPEmH0lFtgbE8
 oH2XOTHL24nhWQbcjVFRR8YcrnAQlKsnMd9ye66tezIqFW9qTM+UEK8lyq8YLVpOu9dQpb5sF
 yc+rQh2GxHL+ni7umK/Hz3CZhsTideZ42k5IWSVfoG8Y1w9vG6a2IGZWRTEAo/ctdioI8ffpu
 chnBBvfRHZv+vRIO2mUgbDvdHEmQ+iwRHBohW2A5Gzm8ZyEJldjx/lI6q/BVKbvcml/42AbJI
 rr2mDJK/T4EqcKZNhhkb0P58BD+q4v4pzdSSB4duEBC74ZkI+XxPQjw5590UhjPuVcSpqDRkc
 mKUv1BVDT+VpVZ4vWezBTOj13ZOpcvWehOjitVOpnN9sEKlLFfJ1mTxAKAFYHFYs5UhHgvFrv
 V2nkMOSnKOlOu6F+XgNbWacJCMbd5xsrd/aCW4mPw65HDN1AZY/qG75MAybI/tjzzKZ1A94fQ
 XhROJmQe
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_074613_316010_0B5BF0F9 
X-CRM114-Status: GOOD (  13.28  )
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

Hi
> Gesendet: Montag, 24. Oktober 2022 um 11:27 Uhr
> Von: "Russell King (Oracle)" <linux@armlinux.org.uk>

> Here's the combined patch for where I would like mtk_sgmii to get to.
>
> It looks like this PCS is similar to what we know as pcs-lynx.c, but
> there do seem to be differences - the duplex bit for example appears
> to be inverted.
>
> Please confirm whether this still works for you, thanks.

basicly Patch works, but i get some (1-50) retransmitts on iperf3 on first=
 interval in tx-mode (on r3 without -R), other 9 are clean. reverse mode i=
s mostly clean.
run iperf3 multiple times, every first interval has retransmitts. same for=
 gmac0 (fixed-link 2500baseX)

i notice that you have changed the timer again to 10000000 for 1000/2500ba=
seX...maybe use here the default value too like the older code does?

regards Frank

