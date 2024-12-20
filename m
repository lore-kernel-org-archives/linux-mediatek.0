Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7916E77188
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2024 16:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sx9Xc9CzjrFXYpRyMGKjk585rr/PweCL4hg0epZFIUc=; b=Gw4JemT+YlzTra1hRNpLP3ZlvD
	xEGiEx8EGDm6KN0dBGbN7hA4t5VWaqy5ZEYUEEoJ/kFWnwbyiYfCqFeXsKZwhEUS9Eh72Y+DBmi2O
	MBnP7GHluMYx7RJNDxeeNqoYfvNy0Zg9/ofHNQlQwmeGF7OyUv0my9M5f1STgo11ze5rQfAq2As4f
	QGF6km4Y029CCuDiJO2kCdRNaCkiWBPQbgRQzJGGHU7s0kdMtV49YxdNP4YDtMlB/BQzHWg60zZbk
	2dcqiz+IObKlrinUltnm0zqmVGNqSjdwb9ifrIBGXT2c/dBjBCRp2mEitzx0YQJvXXHBA/aDYglgu
	tgkSLMaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOg8F-00000005UzC-3pDi;
	Fri, 20 Dec 2024 16:45:43 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOg75-00000005Uqs-1jjx;
	Fri, 20 Dec 2024 16:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1734713063; x=1735317863; i=frank-w@public-files.de;
	bh=sx9Xc9CzjrFXYpRyMGKjk585rr/PweCL4hg0epZFIUc=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=J+UVRoPM2UjUuH+jG8g74p8CA9ABHoXvM85hjdhM8VUmjGYPkNyMh3hjLuajxXcJ
	 qLkaPbyziQpxMtgpaExz7mSQiQ92+nYt8JqI5FNf5fpopmBliLzP+pOVMHVSfGlA2
	 urgG5uuyXjPPutZBa+1y9OtrwmLQz/nv+p+hPA5IHaeiFJzkvTeVj3dAUb/sNbvvI
	 qufJNRsa/yNAkA6p2AgAMdA8ndWAm2S1N5n2EWfhsT+lG/mLt9T6GUOWL8Aokt6Y0
	 p2Ud6+lIKfihG7nmDpYhThisfox7Bs2Kjz6TMxcOKON+6MyneKMPeUMnHTURbxaAM
	 CviIYA3G1ZSRN07TUA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.224.233] ([157.180.224.233]) by
 trinity-msg-rest-gmx-gmx-live-548599f845-5xz2p (via HTTP); Fri, 20 Dec 2024
 16:44:22 +0000
MIME-Version: 1.0
Message-ID: <trinity-bbda816d-6467-433a-a516-19da45abe816-1734713062840@trinity-msg-rest-gmx-gmx-live-548599f845-5xz2p>
From: Frank Wunderlich <frank-w@public-files.de>
To: linux@fw-web.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Aw: [PATCH v8 0/2] Add Pmic to Bpi-R4
Content-Type: text/plain; charset=UTF-8
Importance: normal
Date: Fri, 20 Dec 2024 16:44:22 +0000
Sensitivity: Normal
In-Reply-To: <20241220163838.114786-1-linux@fw-web.de>
References: <20241220163838.114786-1-linux@fw-web.de>
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:BVA17PosCUUJmGpk8D2/WIrGMlb2jBpW45Y0IdGwTab0ZrzD0Fka3U/UFoG5AGjRRYm6S
 xd1kkN/PAqp1nqFVxFQbl36yRslF8d8tpoCRBEGPazjdGn4EbOs6SRdhreFE7Q4NQH+45vSv6O3e
 AMeZJIGlIOSczWdAFeLqTjanu2uWq3gN0mCk29vxqIund3fpt388yO9mu7XkuFvDWeXqzDEqVJFQ
 SMz7ZBAS1pQatS63mXkSLVd1VYX3f8KlcG3iFvyhFqLulqoIl0T8YU8Zzwh7uB0PdWjxW0WraMSC
 pSOwyw6S64xEwASvoywteCVk5HY0qVHvZd81BZTX/OQFT6UvY/gJVwAn0xxhEEtY1M=
UI-OutboundReport: notjunk:1;M01:P0:GY76qXWr6o4=;/SH78jAFF/8MBVk/bgogUrwzGhg
 EQjLq8aJ4mnW2vJAfJ8EKOQ6nmOf2b2QX9U4eIuTWk2iPa6ES3Qy078sxuEcD1bPeLhWp+i5+
 DuqLV5J60uCd4VR8ku1rsEm91I3pjW3bEgsPBcB+XYW5Qu5zhwberhNZ/Y5B2snKCPD60Z+Js
 aags9DZumvnUfQn8zXiAmWLHf0uwoV4dx5H5/xkdfODAbXhcdbActjjHEVGZjqmt06o/S+Lpg
 wbH5WPYmUFOpjznbAHOav2MCftn4duKyQNT+plsH+OGW4IKFjzUEIzAoLlr84pooOOm4VZOPi
 kCdlf2sGHEyMTxJC5lMfVubO/5/BXBFSKVOR2t9y0eXkl6VBsXesIGdVosgvFBy4f/CFzLCZE
 nW3obcdO4LlBvazaRLjpzKD4vq4dFzQZj9OwNKRPbcoupFUfMyoEzOChF0goQmTFVodJ9VOYd
 8GgNAqNKfcuAVIMfY38SdE/CQQcG4XawDoA3LB8pHcOBlOLUD09kwsYYG0APk89p08WG+IEVc
 1/kAV8SUPFsabXb+inY7vHFjK5aNu3BObCu/qPPOfd25uAZjUpCDTWifT6suXqHisrOTSRoY0
 9/UyT/myg7tnalUzp1UjSgPYANir14geTZh6BeYb6cmdCPSvbw8ug2eZjP2ezKTNIIoArPaab
 ILNM056IsHK4z5xXY2Xd5TEK+Y+d0c13E1orPSTOVoaEsmVab7dNIr3vk7wwUG2rEeNxmiRyi
 z5Jn/0aSlWUrpPXk4i207MlEN/9DOtLyzIsqxFHhUUQ+6jxDBK/TlP21HfWzAZmUFGsjWz+yg
 /zvBroS8DxDeRIfu82yNu5vcvBNqbHsxkf0EKXJgAcsgKb/EBCz4kHW5T3hoBiTNSQV1myUdD
 dQcfZaDovyzSFZA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_084431_823702_6B312F7C 
X-CRM114-Status: UNSURE (   3.82  )
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

Sorry, seems i made mistake with version-number...

these 2 patches were dropped from the linked v3.

there is no v4-v7

not sure why i had increased my changelog in first patch to v7 before...
maybe mixed with the pinctrl series

regards Frank

