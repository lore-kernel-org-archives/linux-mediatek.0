Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BB7E6F085
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Dec 2025 17:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WHP2xliIunnJcsC1gjZ31iV+F/F+4USoCACscUNjV1M=; b=MLzLY+r0M88JWle4ANdmWz68cx
	SDEZNznHftRE6lJxWtVaLhxJ9Ez2AgmQgyQeRaBmzIiCxydT04r2MymdaqHcERGYu2sz2W2sE0Z5Y
	FmWM8qp74bWuUvQUplT71qAZZdWKtHJezSh/GEwJJF83nQse1YP5zBuJMluFRF5BXriD+6wR3XtWb
	PvXGiJlgmclVQk0p/BcoQqDDRkHlQjlq0muiHXKeZUHRehEQyoGymcJU3AgDHZ9oSD62QNgkQ1wrg
	08tevcwvwXZrtbCwiPxQaktaZJk2AHQBIncID5PWHJh8RwLQ3mW0d1dFsKEkRriLnSCDLDtQbYgPa
	54JS2yqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY65d-0000000FoyH-3aEV;
	Tue, 23 Dec 2025 17:22:29 +0000
Received: from dilbert.mork.no ([2a01:4f9:c010:a439::d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY65a-0000000Foxg-109k;
	Tue, 23 Dec 2025 17:22:27 +0000
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:10e2:d900:0:0:0:1])
	(authenticated bits=0)
	by dilbert.mork.no (8.18.1/8.18.1) with ESMTPSA id 5BNHGJQY589406
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 23 Dec 2025 17:16:20 GMT
Received: from miraculix.mork.no ([IPv6:2a01:799:10e2:d90a:6f50:7559:681d:630c])
	(authenticated bits=0)
	by canardo.dyn.mork.no (8.18.1/8.18.1) with ESMTPSA id 5BNHGIXw540064
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 23 Dec 2025 18:16:19 +0100
Received: (nullmailer pid 993152 invoked by uid 1000);
	Tue, 23 Dec 2025 17:16:18 -0000
From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bmork@telenor.net>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org,
        lorenzo@kernel.org, nbd@nbd.name, ryder.lee@mediatek.com,
        sean.wang@mediatek.com, shayne.chen@mediatek.com
Subject: Re: [PATCH 1/1] wifi: mt76: mt7996: fix mixed FEM check of mt7996
 chipset
In-Reply-To: <20251223140016.235771-1-amadeus@jmu.edu.cn> (Chukun Pan's
	message of "Tue, 23 Dec 2025 22:00:16 +0800")
Organization: Telenor
References: <87fr96tp7w.fsf@miraculix.mork.no>
	<20251223140016.235771-1-amadeus@jmu.edu.cn>
Date: Tue, 23 Dec 2025 18:16:18 +0100
Message-ID: <87a4z9f7a5.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 1.4.3 at canardo.mork.no
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_092226_592763_ED59783A 
X-CRM114-Status: UNSURE (   8.82  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Chukun Pan <amadeus@jmu.edu.cn> writes:

>> The problem is that the patch breaks the other device variant, which
>> used to work before.  If we assume the eeprom data from Zyxel is
>> correct, then this variant is iFEM.
>
> Do you have the specific model name and what the RF chips are?
> The eeprom seems to be fine.

Device with iFEM+eFEM+eFEM, working with your patch:
Zyxel EE4600-00

Readouts from the ADIE_ID registers:

root@ee4600:~# echo 0x0f00002c >/sys/kernel/debug/ieee80211/phy0/mt76/regidx
root@ee4600:~# grep . /sys/kernel/debug/ieee80211/phy0/mt76/rf_regval=20
0x79758a02
root@ee4600:~# echo 0x1f00002c >/sys/kernel/debug/ieee80211/phy0/mt76/regidx
root@ee4600:~# grep . /sys/kernel/debug/ieee80211/phy0/mt76/rf_regval=20
0x79778a10
root@ee4600:~# echo 0x2f00002c >/sys/kernel/debug/ieee80211/phy0/mt76/regidx
root@ee4600:~# grep . /sys/kernel/debug/ieee80211/phy0/mt76/rf_regval=20
0x79778a10

Device with iFEM+iFEM+iFEM, working before and breaking with your patch:
Zyxel WE4600-01

Readouts from the ADIE_ID registers:

root@we4600:~# echo 0x0f00002c >/sys/kernel/debug/ieee80211/phy0/mt76/regidx
root@we4600:~# grep . /sys/kernel/debug/ieee80211/phy0/mt76/rf_regval
0x79758a02
root@we4600:~# echo 0x1f00002c >/sys/kernel/debug/ieee80211/phy0/mt76/regidx
root@we4600:~# grep . /sys/kernel/debug/ieee80211/phy0/mt76/rf_regval
0x79778a11
root@we4600:~# echo 0x2f00002c >/sys/kernel/debug/ieee80211/phy0/mt76/regidx
root@we4600:~# grep . /sys/kernel/debug/ieee80211/phy0/mt76/rf_regval
0x79778a11


I don't know exactly what chips these are.  I have no specs or
datasheets and I haven't removed the heatsink and shielding




Bj=C3=B8rn

