Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B2DC3DA5D
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jul 2024 01:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8F3tpIxMWL4YjjRHZoKIIqqxZpuUQ4NIlW96Rka8Mc=; b=cYRDjUzJ81/P8b5bp03GSFzZKH
	x/SYtaU1kJ+e1vLdOJ5sE3rEiN95+d2CBQP4W1Ef7XETYDCwReBw6nu7ZLEr4bRB9R6J5/ZpYr/Uz
	+qRcSzV6wRg8AiH+4ttk5Xl82k4X+oHTGpXxuY5QxIo83skJXsQ8J1LA4PqMYx6UVNiSI6I5J7Obi
	u3rlWh1T2PHuNXCfcM5FGPWwr2/uoQfK+EhKEAmYzrS0RiRUV+jXp+etA+ANxbpXvLJ0/KVmNdGnt
	VNhjn3F2WevNF/Ka3eBAXpMNH5LNpGaIXjXH6aZuJgQpxt2hnN3JhGoXZvuiDFtuX82zAu0yS61Tf
	NTkhvGqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFfd-0000000FN32-0LlY;
	Thu, 18 Jul 2024 01:10:57 +0000
Received: from mout.web.de ([212.227.15.14])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUFf1-0000000FMwe-1l6W
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jul 2024 01:10:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1721265009; x=1721869809; i=spasswolf@web.de;
	bh=j8F3tpIxMWL4YjjRHZoKIIqqxZpuUQ4NIlW96Rka8Mc=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IU2QkRT9j04ULdMSnmLv0RVxpjz849SO3n9dZibfPVmjxULlVKIrgzlV4/u1HxSQ
	 t0UVIZB5pvF8Aw3XG4ultuPg4MldL3ZUVDABAMDVSiC1gdRXNZfaycEhg+8oROPuU
	 i+bVJZuDRY4jTQl3tabcmqWK0hjIRY6Ha8V0r3IHisbu6pzSMWlUOZ8lP7gu1xBfy
	 2yzgNPPlRtNmStgz8OiafgOww8Z1YJVHIPZGs4SwGIeGqFWnt4gVlqexWhbfT/EMp
	 9/7hpJZghFpcWjblX1CU6HIoOGPKWPdfjsNCH/ieHUeUbYTuoed9URm19A5dxn/zc
	 B+Y/nMlpa9f0KyMwSQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M59n6-1sVM7Z2Gea-005tR5; Thu, 18
 Jul 2024 03:10:09 +0200
Message-ID: <308958f4c5689fd920c3915f4878850a09310b18.camel@web.de>
Subject: Re: patch 46/47 causes NULL pointer deref on mt7921
From: Bert Karwatzki <spasswolf@web.de>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@kernel.org>
Cc: deren.wu@mediatek.com, linux-mediatek@lists.infradead.org, 
	linux-wireless@vger.kernel.org, lorenzo.bianconi@redhat.com, 
	mingyen.hsieh@mediatek.com, sean.wang@mediatek.com, spasswolf@web.de
Date: Thu, 18 Jul 2024 03:10:07 +0200
In-Reply-To: <9fb7ac97d2ca472db469aefefbfeb94e0f886508.camel@web.de>
References: <20240711175156.4465-1-spasswolf@web.de>
	 <CAGp9LzoXMoAW6dVZjTf-JcD_wiU4yXpGwkLaVyWXTkaV2MOKwg@mail.gmail.com>
	 <adb192a59c44aa8708e80df30a6a47816a03e50f.camel@web.de>
	 <4e943a62736f955af5d9cd1aff7e2b9c084c8885.camel@web.de>
	 <2599b886-9c63-4989-a08a-7feab28f7c49@nbd.name>
	 <9fb7ac97d2ca472db469aefefbfeb94e0f886508.camel@web.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:r2lo/zWQksxO8joft6Pgx0zUs9Oyjyt77rX7Stdp8p029CZEO+I
 pP3U0ObWMckpnu508+rsvA/+iU28VBfLhUTlTVDdbiJeovi3pyI7rbxiN+xBuwt7IwItSKk
 rjmFf1V2CM2jaKXLm5WMWojPJwZOBbex91IhLo9oxRlaZu2NLUGH5svL0XIeyD+B444yT1J
 8HqLuxLcO81QPzRT/7vwg==
UI-OutboundReport: notjunk:1;M01:P0:sd3LyqeBty4=;NnkeKHzdR2seVUjUOTUi/OVbpYs
 1tD4TkrSsOdUyhjH8yYR9kpenU5ix1Uk18wLZauqkCq8Dv40sYJFl74vsjb1saAdTVLowN7W/
 8LAwsgtuTeKRQq1t6vm8mNC9WtbEm/dbZMb0Ofq4cGZwB1R2OGOg6+LXZ9XPkCAO/4bvwrsas
 VjR/kJ/tqfrdmCVrpwOBmmVJro8p6T923loL/s56dlh2fM0oUxHh85d8WqEg2qoGFJJqi5I77
 wF7/NnHUHA/CKUwlQLVrpW2p9hGJximhl+DWcALKAgyrwEWb8itKKSG8Ks/c1oQ26Q09E8ECi
 Em0V0BIdGMzlosECVbtbiPSUic/cuzG+eCWND46SgSziKxbg95qWF3Z3MkhcOnH/Ip9if9K+S
 4GnK7oeStsu3ZpPzUi7dCeA8e00QreDLK0ZPH9HfvQRhAjBtN69XNWRW3tcR8uPhTgzjIsgjw
 Q3H+50Po/GTE6R9C/TAOBMoPDikj0/alL+qI83kWdY3B4lHEwhRP2e+2epszwejkMbO2+wt3t
 PZRSkqz7xzConq7nWRjzzeWs2KXsFZGLLpnQXfUx9o0Q1FZWKGJHrc4IjBe/DURAFckhjTf+4
 OJlVc4f9wvJ0OlfVy/C7Q61k+IDPFNlZcJ6frRDTvRkhi0/cU7OTevAIY9KGE3TWGQHBu3EPJ
 QkthK7k/lXiApOt0y1PSpxlkIm18oevriW9mbuQpMOtzsuqXF2tU9rRTuX+8S9KTZ1FbdpK7V
 208Z2rDgbOQTDVPzHJ741sCrVbjYarXxbsxxs+tSp/h9exFDnlUaxyKrk/+sDButI46/ujMKE
 MZ+vpCmJULmY/LQFVJ2flKHQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_181019_845679_94E8B02F 
X-CRM114-Status: GOOD (  12.73  )
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

Am Mittwoch, dem 17.07.2024 um 19:05 +0200 schrieb Bert Karwatzki:
> Am
>
> Your fix works. (I added a WARN() statement on the early return, to see =
if mvif-
> > phy actually was NULL during testing).
>
> Bert Karwatzki
>

While your fix works there was still the question why the driver is sudden=
ly
forgetting mvif->phy? So I've been testing with this script:

#!/bin/sh
for i in $(seq 1 100);
do
		nmcli radio wifi off
		nmcli radio wifi on
	# wait for wifi
	sleep 3
done

together with this patch:

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 4f30426afbb7..206f10473d92 100644
=2D-- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1182,6 +1182,10 @@ static void mt7921_ipv6_addr_change(struct ieee8021=
1_hw
*hw,
                                    struct inet6_dev *idev)
 {
        struct mt792x_vif *mvif =3D (struct mt792x_vif *)vif->drv_priv;
+       if (!mvif->phy) {
+               WARN(1, "mvif->phy =3D=3D NULL\n");
+               return;
+       }
        struct mt792x_dev *dev =3D mvif->phy->dev;
        struct inet6_ifaddr *ifa;
        struct in6_addr ns_addrs[IEEE80211_BSS_ARP_ADDR_LIST_LEN];


On linux-6.10 the script can be run several times without triggering a war=
ning
while on linux-next-20240716 running the script will trigger several warni=
ngs.
In the end the result of a bisection is this as the first commit to trigge=
r the
warning:
commit 574e609c4e6a0843a9ed53de79e00da8fb3e7437
Author: Felix Fietkau <nbd@nbd.name>
Date:   Thu Jul 4 15:09:47 2024 +0200

    wifi: mac80211: clear vif drv_priv after remove_interface when stoppin=
g

    Avoid reusing stale driver data when an interface is brought down and =
up
    again. In order to avoid having to duplicate the memset in every singl=
e
    driver, do it here.

    Signed-off-by: Felix Fietkau <nbd@nbd.name>
    Link: https://patch.msgid.link/20240704130947.48609-1-nbd@nbd.name
    Signed-off-by: Johannes Berg <johannes.berg@intel.com>

diff --git a/net/mac80211/iface.c b/net/mac80211/iface.c
index 6d969d9f1ac9..97aee0a1a39a 100644
=2D-- a/net/mac80211/iface.c
+++ b/net/mac80211/iface.c
@@ -689,8 +689,12 @@ static void ieee80211_do_stop(struct ieee80211_sub_if=
_data
*sdata, bool going_do

 		fallthrough;
 	default:
-		if (going_down)
-			drv_remove_interface(local, sdata);
+		if (!going_down)
+			break;
+		drv_remove_interface(local, sdata);
+
+		/* Clear private driver data to prevent reuse */
+		memset(sdata->vif.drv_priv, 0, local->hw.vif_data_size);
 	}

 	ieee80211_recalc_ps(local);

As this is in generic mac80211 code this could probably also affect other
drivers and their ipv6_addr_change function. (which in turn could easily b=
e
fixed by an early exit when mvif->phy =3D=3D NULL)

Bert Karwatzki

