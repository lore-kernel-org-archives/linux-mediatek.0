Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 758DAC3ABBC
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 May 2025 17:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpPZhMXPJ6bl1wt0L0ce+615Vlv6RlFahKmvBBdBPts=; b=EXmNhjirhC7GSlWIjUKUAAst6X
	ZWGr/eUGSRIwexb3KtqEfq2iSumxjfM5LFIOigxhNnuMoleRzQu4wH0IIDacJNj5SEyH8lLDRJ2Ll
	WPJnHQUE7ASpWRkazrcPdd+vD7MMxU4mwPmn9prYh09uTyMh6DNuOZRC2T6CEIe0Xn8c0wRQ2UtPM
	92Qt0HqrXN54HKZBznW9PPmZTEaIQ5zMa+/FkRm99SAMLl/qHG1NwhYPaKy6IiaGNiFqpsZwAIFB+
	HVIdgw+qlwfw4m08rzw84E/sxSm2daXNncTe4dFUVU9A3U/HmfRuoawdfi6q3nJaYwNaWoxXxIHI2
	sLjHDAcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzdA-000000089Sw-1sSq;
	Mon, 05 May 2025 17:29:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzSc-000000087il-3jZh
	for linux-mediatek@lists.infradead.org;
	Mon, 05 May 2025 17:18:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B14EF5C433A;
	Mon,  5 May 2025 17:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97E03C4CEEE;
	Mon,  5 May 2025 17:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746465513;
	bh=zAYILOUuPLzGJcE+H/qrkjNUK62hvMnUtpZ+b93J6PE=;
	h=Subject:From:Reply-To:To:Cc:Date:In-Reply-To:References:From;
	b=bKjhSY1ZFAKpkyxZ4vBD4W9x8dCZDJZkQW3reZNSIuF9qTqh99PTq+rQLO5ew/UaW
	 5JNE8HkQuTds+5Tn+9CvaMY9gymsMbyj3i5/EmvwSZPmxZgPW9DqHrml3NzsMKXtEU
	 +ps5924p/evGCsh4iPrg72kBsA5O6myVmHYewV8vaiPAIOEDYgmWfGvwOEekHQSCEn
	 RZZNXRi47qVPxCtEjJvTXcbU70cEnY6BCEBu+M+K/5QNw07fAX9Us3h4IWx4ICWu3O
	 86NPJFX87m6u/VLensYpuY8u+kZyPikBwfvofCEVJpaZunpT1M+F8unJ9P2KVQ+4jO
	 6TExxeLdUQpyw==
Message-ID: <0736898d8d53e6249d5be637c9b7e7c81398218a.camel@kernel.org>
Subject: Re: [REGRESSION][BISECTED][STABLE] MT7925: mDNS and IPv6 broken in
 kernel 6.14.3 and above
From: Niklas Schnelle <niks@kernel.org>
To: Mingyen Hsieh =?UTF-8?Q?=28=E8=AC=9D=E6=98=8E=E8=AB=BA=29?=	
 <Mingyen.Hsieh@mediatek.com>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>,  "fossben@pm.me"	 <fossben@pm.me>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, 
 "linux-mediatek@lists.infradead.org"
	 <linux-mediatek@lists.infradead.org>, Allan Wang
 =?UTF-8?Q?=28=E7=8E=8B=E5=AE=B6=E5=81=89=29?=
	 <Allan.Wang@mediatek.com>, "linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "regressions@lists.linux.dev"
	 <regressions@lists.linux.dev>
Date: Mon, 05 May 2025 19:18:29 +0200
In-Reply-To: <28ef2cc608d071d1530902d7b5df045555ab5651.camel@mediatek.com>
References: <EmWnO5b-acRH1TXbGnkx41eJw654vmCR-8_xMBaPMwexCnfkvKCdlU5u19CGbaapJ3KRu-l3B-tSUhf8CCQwL0odjo6Cd5YG5lvNeB-vfdg=@pm.me>
				 <f73dec60b60dd7bb3be40c1feefbe223c7afe19b.camel@mediatek.com>
				 <5ae1ef34c9844d6d0f5fb167dd596a4c43321367.camel@kernel.org>
			 <28ef2cc608d071d1530902d7b5df045555ab5651.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_101835_029257_35C7F8B4 
X-CRM114-Status: GOOD (  53.90  )
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
Reply-To: niks@kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2025-05-05 at 05:48 +0000, Mingyen Hsieh (=E8=AC=9D=E6=98=8E=E8=AB=
=BA) wrote:
> On Sun, 2025-05-04 at 00:39 +0200, Niklas Schnelle wrote:
> >=20
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >=20
> >=20
> > On Wed, 2025-04-30 at 06:47 +0000, Mingyen Hsieh (=E8=AC=9D=E6=98=8E=E8=
=AB=BA) wrote:
> > > On Wed, 2025-04-30 at 01:14 +0000, fossben@pm.me=C2=A0wrote:
> > > >=20
> > > > External email : Please do not click links or open attachments
> > > > until
> > > > you have verified the sender or the content.
> > > >=20
> > > >=20
> > > > Hello all,
> > > >=20
> > > > After upgrading to 6.14.3 on my PC with a MT7925 chip, I noticed
> > > > that
> > > > I could no longer ping *.local addresses provided by Avahi. In
> > > > addition, I also noticed that I was not able to get a DHCP IPv6
> > > > address from my router, no matter how many times I rebooted the
> > > > router or reconnected with NetworkManager.
> > > >=20
> > > > Reverting to 6.14.2 fixes both mDNS and IPv6 addresses
> > > > immediately.
> > > > Going back to 6.14.3 immediately breaks mDNS again, but the IPv6
> > > > address will stay there for a while before disappearing later,
> > > > possibly because the DHCP lease expired? I am not sure exactly
> > > > when
> > > > it stops working.
> > > >=20
> > > > I've done a kernel bisect between 6.14.2 and 6.14.3 and found the
> > > > offending commit that causes mDNS to fail:
> > > >=20
> > > > commit 80007d3f92fd018d0a052a706400e976b36e3c87
> > > > Author: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
> > > > Date:=C2=A0=C2=A0 Tue Mar 4 16:08:50 2025 -0800
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 wifi: mt76: mt7925: integrate *mlo_sta_cmd and *=
sta_cmd
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 commit cb1353ef34735ec1e5d9efa1fe966f05ff1dc1e1 =
upstream.
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 Integrate *mlo_sta_cmd and *sta_cmd for the MLO =
firmware.
> > > >=20
> > > > =C2=A0=C2=A0=C2=A0 Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabli=
ng MLO when
> > > > the
> > > > firmware supports it")
> > > >=20
> > > > =C2=A0drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 59 ++++----=
---
> > > > ----
> > > > --------------------------------------------
> > > > =C2=A01 file changed, 4 insertions(+), 55 deletions(-)
> > > >=20
> > > > I do not know if this same commit is also causing the IPv6 issues
> > > > as
> > > > testing that requires quite a bit of time to reproduce. What I do
> > > > know with certainty as of this moment is that it definitely
> > > > breaks in
> > > > kernel 6.14.3.
> > > >=20
> > > > I've attached my hardware info as well as dmesg logs from the
> > > > last
> > > > working kernel from the bisect and 6.14.4 which exhibits the
> > > > issue.
> > > > Please let me know if there's any other info you need.
> > > >=20
> > > > Thanks!
> > > > Benjamin Xiao
> > >=20
> > > Hi,
> > >=20
> > > Thanks for reporting this issue, we will aim into this.
> > >=20
> > > Can you provide me with your testing steps?
> > >=20
> > > Best Regards,
> > > Yen.
> > >=20
> >=20
> > Hi Yan,
> >=20
> > I see the same IPv6 issue on my Framework 13 (Ryzen 5 AI 340) with an
> > mt7925e WiFI module. My setup is just a home router with native IPv6
> > both for my uplink and in the LAN. The problems with IPv6 can already
> > be seen just in the LAN for example by checking which IP was used for
> > SSH, in my setup it should always be IPv6 but falls back to IPv4 in
> > the
> > broken state.
> >=20
> > As another data point, I tried reverting cb1353ef3473 ("wifi: mt76:
> > mt7925: integrate *mlo_sta_cmd and *sta_cmd") on top of 6.15.-rc4.
> > This
> > fully restores IPv6 for me. Also note I'm running this with the
> > mt7925
> > firmware version 20250425073330 from linux-firmware's master branch
> > as
> > I had some dropped connections with earlier firmware.
> >=20
> > So it definitely looks like that commit also broke IPv6 and not just
> > mDNS. Note that if if I use DHCPv6 instead of router advertisements,
> > on
> > the latest firmware, but without the revert, I get a global IPv6
> > address added to the interface but then native IPv6 addresses are
> > still
> > uncreachable. With the offending patch reverted my SSH session to an
> > IPv6 only host works fine and is stable. Also I'd be willing to test
> > a
> > proper fix as I rely on IPv6 heavily due to having to use CGNAT for
> > IPv4 but not for IPv6.
> >=20
> >=20
> > Thanks,
> > Niklas
>=20
> Hi Benjamin & Niklas,
>=20
> Can you help to try this patch? I can get IPv6 address through this
> patch.
>=20
> If it can work at your environment as well, i will upstream it and add
> test tag with you.
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> index a42b584634ab..fd756f0d18f8 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
> @@ -2183,14 +2183,14 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
>                         mt7925_mcu_sta_mld_tlv(skb, info->vif, info-
> > link_sta->sta);
>                         mt7925_mcu_sta_eht_mld_tlv(skb, info->vif,
> info->link_sta->sta);
>                 }
> -
> -               mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, info-
> > link_sta);
>         }
>=20
>         if (!info->enable) {
>                 mt7925_mcu_sta_remove_tlv(skb);
>                 mt76_connac_mcu_add_tlv(skb, STA_REC_MLD_OFF,
>                                         sizeof(struct tlv));
> +       } else {
> +               mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, info-
> > link_sta);
>         }
>=20
>         return mt76_mcu_skb_send_msg(dev, skb, info->cmd, true);
>=20
>=20
> Thanks~
> Yen.
>=20

Hi Yen,

As the patch didn't apply, I edited mt7925_mcu_sta_cmd() manually on
top of v6.15-rc5 according to the diff. With that IPv6 works fine for
me.

If it were me, I'd probably structure the if different. I'd leave
the=C2=A0mt7925_mcu_sta_hdr_trans_tlv() where it is but have an inner if
(info->link_sta) inside just if (!info->enable), then the !info->enable
case becomes just an else. I'd maybe even put the if (info->link_sta)
body in its own static function if that makes sense semantically, but I
don't know enough (anything) about the driver to know. Anyway, that's
all a matter of taste and actually makes the patch quite a bit larger.

So whichever way you decide on feel free to add:

Tested-by: Niklas Schnelle <niks@kernel.org>

Thanks,
Niklas

