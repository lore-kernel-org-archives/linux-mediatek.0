Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273FCC52D7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Aug 2024 08:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMBuSq4Iuu/WRH9zJvE01F27J7ET0Jabx7VI1l4+swM=; b=4UJ+WbMgFQb8RsrbJp5Zy3Ip1M
	MipZMb00K5q/LYApm+bxuWUd/ZvYS0sGDEw0ryVoqoaRA1DMa+PCRXI8IeVtkS9vkt39yoYgE2MmW
	fY19rBsILlcQSyISbBWtXQ33o2f8Gx0l35p8Oc/Ec8Ceimw+NPUtamGHRCzIg0Qc1WXpWaMdR4S7l
	Pa8alf17jvojjteboE64ElatTsdNGI0PZkwXSAmWEmcpZj7dmEMjZ0IMZ3tqnQlqbYLmwgumGoJmJ
	7VTaQQbowmwLTPyIPK6me4Rpdj3IBW1AwGu6ALaVb5NTx8vACGd2+6LTOSHjsqGnBGZ7O5L3lnQ3Q
	zvQrIogw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdQs7-0000000HLWA-3WeC;
	Mon, 12 Aug 2024 08:57:47 +0000
Received: from mout.web.de ([212.227.17.12])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdQs4-0000000HLVm-0IHw
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Aug 2024 08:57:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1723453054; x=1724057854; i=spasswolf@web.de;
	bh=WMBuSq4Iuu/WRH9zJvE01F27J7ET0Jabx7VI1l4+swM=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=M3BcCgzNYkkSMiIYrJq0bJqDCIVcxi+VXUvSmcXJBUAUOO7l1YK5+d/1Vw+UZygP
	 dLCCUwuQjwRapqXbWIqHrySMJ2Vd7gs2RNhqiEPbzmHyHuYsMJn9HWMyfwSuBkD1j
	 XIU2GojlffvSvhrH0PV1ce6sLAec3J2elCgIxj1z/PTNCMeLIUD+aOoseCQLKHqUO
	 gJTlRc3HxalTXorKqiavZhFEB0KLzmtMezhbSH3pjF9Vj4RKn9gpvr7LWoC/GbRhA
	 X4nGk6QVcs30wWSeGqzEi1namVcBbJFS9xu/5m2WEowtiZsGvjqGgTV2QMWngTJjB
	 4jKwfkiy5AKcYQprdw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MrwwJ-1rrltr08dZ-00i3V3; Mon, 12
 Aug 2024 10:57:34 +0200
Message-ID: <62226273aaafafda1a4f3abc0f8c95220407b3a7.camel@web.de>
Subject: Re: patch 46/47 causes NULL pointer deref on mt7921
From: Bert Karwatzki <spasswolf@web.de>
To: Kalle Valo <kvalo@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@kernel.org>, 
	deren.wu@mediatek.com, linux-mediatek@lists.infradead.org, 
	linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com, 
	mingyen.hsieh@mediatek.com, sean.wang@mediatek.com, spasswolf@web.de, 
	linux-kernel@vger.kernel.org, deren.wu@mediatek.com
Date: Mon, 12 Aug 2024 10:57:31 +0200
In-Reply-To: <e32ab97963e850b4425e4f5c45d2c502d50be480.camel@web.de>
References: <20240711175156.4465-1-spasswolf@web.de>
			<CAGp9LzoXMoAW6dVZjTf-JcD_wiU4yXpGwkLaVyWXTkaV2MOKwg@mail.gmail.com>
			<adb192a59c44aa8708e80df30a6a47816a03e50f.camel@web.de>
			<4e943a62736f955af5d9cd1aff7e2b9c084c8885.camel@web.de>
			<2599b886-9c63-4989-a08a-7feab28f7c49@nbd.name>
			<65621cad9a22df881745e9333a5c3696bdbb8df3.camel@web.de>
		 <87frrqkkpm.fsf@kernel.org>
	 <e32ab97963e850b4425e4f5c45d2c502d50be480.camel@web.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.53.2-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:TSnyMGig7txLvS+YfwGIu8/Fod1Z6p3ItsphvzbiOuanqhmLKmK
 lh5oHYxmJ1tIcKTC1KZBKfNAz1eYf26LKhfC8HanopzN37HPy+3/vvS9w8lAwlhLqYkC66W
 AIdQINaj89ppin084Nj/mg7rPnZRjN3o9/UBuCXAb8fsi8vsa+iv//wXoc85cMAjLXzs1CJ
 G/fITTmoiNArMTGqoKo2Q==
UI-OutboundReport: notjunk:1;M01:P0:IH4KGWLbcCQ=;YZjWYn750k4XvI/rqAxdEQav27j
 L2DPnEaHlhIQYNmCPH3MkHSQonWCuQum+ZuUo12jDflo/eda8LhRA48RDoYnuRZCGj22MDl5y
 5zColQJ0kmeVigl0YqdszhG/L79bOCRMQMDfHksJ1Rheis0QMMOh/DYCyNp0RRktPoYoLV5+5
 +sJH2I5LVHugJoeTSjWilABVqUYVVxQK7Ks+FGTh5NivECOepqwwEF3GHmxnP8wpD23hxj/KR
 DoYDuTziVm024qihCcZE2siI2CPaAq1VUuIMYBTUEPMi4L4Hs6Nvg1i8uBcBoTZGL2LUzc52M
 jWHe2R57+XbVkchqf1y4Onacc9qx+JsVte/jagIwn+S/bDXIvg+U5NukBKV3tY2cNC8jxhc2j
 PIFuLTX4d6P1K3wHGymZ39LGuhpXDUsNQdb9olskB2jBefDEU06PEAn5pXQl0e9JWVJOaAaNo
 AOCzvfAmaiFuNEAxOU+GYK9fp1QQrfxD5UtRjls2MKbs9BTgLpas/m++YNFf6EhApHKp+tw7p
 SqIMIVPjemPn11YBmTkvPRTCzOUMCmJcHOBrB98Rpj/SCrMNJadW0iZUIVmMn0ms4pO9C2dRs
 iiigv1QV4tzNJsQX9xJZf756CA4W0GBqEwyCOk1e1kIhfmXyIe2+k6Xp5IAuYbP4EP7P/4jMk
 9HPROLxrnXCj7kfH4cWBHWFUDxZ8TcgivMnwnnwieiqxOCBO03yrJSfRLq+wZ/Mimc9J+kZ+Q
 oMv3EVprRPznLt5KPecyjYzQTqVbOdSXumEOJUpVKgvtLzFWullEJzErh0g9w/QzOlcsfTJs/
 VeqEFUrAAqhELHoESoLlbYUQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_015744_501072_D98B7E26 
X-CRM114-Status: GOOD (  26.31  )
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

Am Dienstag, dem 06.08.2024 um 13:22 +0200 schrieb Bert Karwatzki:
> Am Mittwoch, dem 31.07.2024 um 11:51 +0300 schrieb Kalle Valo:
> > Bert Karwatzki <spasswolf@web.de> writes:
> >
> > > Am Mittwoch, dem 17.07.2024 um 17:25 +0200 schrieb Felix Fietkau:
> > >
> > > > On 17.07.24 16:38, Bert Karwatzki wrote:
> > > >
> > > > > So mvif->phy can be NULL at the start of mt7921_ipv6_addr_change=
. The early
> > > > > return in that case avoids the NULL pointer and mvif->phy has it=
s usual value
> > > > > again on the next call to mt7921_ipv6_addr_change so Wifi is wor=
king again. I
> > > > > don't know how this could happen but perhaps you have an idea.
> > > >
> > > > This change should fix it: https://nbd.name/p/0747f54f
> > > > Please test.
> > >
> > > The BUG is still present in linux-6.11-rc1.
> >
> > I'm not sure what's the status with this. There's one mt76 patch going
> > to v6.11-rc2:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git/=
commit/?id=3D6557a28f3e3a54cff4f0dcdd1dfa649b26557ab3
> >
> > But that looks to be a fix for a different problem, right? Felix, are
> > you planning to submit that 0747f54f as a proper patch? I could then
> > take it to wireless tree.
> >
> The Bug is still present in linux-6.11-rc2 and linux-next-20240806. Also=
 the
> mvif->phy NULL check in the original patch is not neccessary (and feels =
a little
> out of place as mvif->phy is not needed anymore). This patch is sufficie=
nt to
> fix the NULL pointer dereference:
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> index 1bab93d049df..23b228804289 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
> @@ -1183,7 +1183,7 @@ static void mt7921_ipv6_addr_change(struct ieee802=
11_hw
> *hw,
>                                     struct inet6_dev *idev)
>  {
>         struct mt792x_vif *mvif =3D (struct mt792x_vif *)vif->drv_priv;
> -       struct mt792x_dev *dev =3D mvif->phy->dev;
> +       struct mt792x_dev *dev =3D mt792x_hw_dev(hw);
>         struct inet6_ifaddr *ifa;
>         struct in6_addr ns_addrs[IEEE80211_BSS_ARP_ADDR_LIST_LEN];
>         struct sk_buff *skb;
>
> Bert Karwatzki

This error is still present in v6.11-rc3.

Bert Karwatzki


