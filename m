Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B56C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 07:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject
	:MIME-Version:References:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdINLMD7giEYb0+H4Qruw0tql3L0eoaWl9Dp0FuEqps=; b=mJx4Ty8MWgR7+B
	3M+82u1taUpwgO+AKZPfiN4f4xOYuKhfC2IpqK9SCtkn7183ya8lL9EnnwmD/ZvhVxkh4SToJQ7P3
	KFXj29J5NtOAEnLex01YGwblU5lSYiZh8JZtTZ2zxV6lUcuwA8Tp2dxPx7m06klH2vORC4wEG7cJr
	cseHcPRRj8f473+TYrCW+tGPo/C/7/WxI5Wmao9JMa3YhUG5v0us8Svhr98klGJ/bVGnKt0vxxhlO
	x3tusqIt0G3CPgtOsukeYzgKE2hJG+WxNZFm8cFhOs7CDohDzRQ4HCD4RPdLwGUr1hscvfwmJLknU
	pGmNdTaFVYpkKwWEnoLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm9hB-009J0H-Rr; Wed, 04 May 2022 07:45:13 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm9h6-009Izi-2P; Wed, 04 May 2022 07:45:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1651650277;
 bh=pfo7l2+6NRg3JzR+9KrIDePEDrqA7zKF11o5LYtwEJg=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=d3TNyVHaZZCMyyfKbsrQUNviX4v3RF5SfOoweE6vmaR2/JyBWFRWypYDyjp06Z1DB
 FuBE+0+Udaa3ARZCq5fBT3AykSejo8IhgMbgVSW2VZXyu3xEoIliwkzLa7TWBSMoM2
 GCDzaQVtRipER38qIXCwauuhna5OWspUz/EXvDDY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([80.245.79.168]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRmfo-1nNQj902p8-00T9ld; Wed, 04
 May 2022 09:44:37 +0200
Date: Wed, 04 May 2022 09:44:29 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <95aea078-3e85-79c3-79c0-430bd7c0fbae@linaro.org>
References: <20220502153238.85090-1-linux@fw-web.de>
 <d29637f8-87ff-b5f0-9604-89b51a2ba7c1@linaro.org>
 <trinity-cda3b94f-8556-4b83-bc34-d2c215f93bcd-1651587032669@3c-app-gmx-bap25>
 <10770ff5-c9b1-7364-4276-05fa0c393d3b@linaro.org>
 <trinity-213ab6b1-ccff-4429-b76c-623c529f6f73-1651590197578@3c-app-gmx-bap25>
 <95aea078-3e85-79c3-79c0-430bd7c0fbae@linaro.org>
MIME-Version: 1.0
Subject: Re: Aw: Re: Re: [RFC v1] dt-bindings: net: dsa: convert binding for
 mediatek switches
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Greg Ungerer <gerg@kernel.org>,
 =?ISO-8859-1?Q?Ren=E9_van_Dorst?= <opensource@vdorst.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Frank Wunderlich <linux@fw-web.de>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <69290DD3-0179-49C2-8E7D-9F8DBDEBC96F@public-files.de>
X-Provags-ID: V03:K1:Xi3146xQ+5Emm7jErYnUntzfAYprQLIZghBegsBA0oc7IJk6WZ7
 EN1yKUXY8pzFBl73tvSapxS4fIHqWMvVrkpzm1Iu+ZHscY3V5cEJqpj7clPSPxeAHNTLZLq
 kAhiRrTtFdRmz5z1ZElLYt/qGdFj91Z7CWXWfazFNmqpRklgMAB+8wY9CzSuw3JLP2a3Onz
 ockS0Idi7ssPgd4G6pOAQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:SvD6m1ZZk2w=:nHsMDGmebHyxCWsbOOhqYD
 tJ0PHMZ3fVxKUH8cbqp2Lpy7oGvya/82ozlXh7WfaupZ7Bf9hftCqF0yN2Yz7/DfIiWhSDQsR
 xobZopSNltQQHTvmrfFEzYureaXSTUUdS7EgXDzK5tJNCbUaTd7Q7LX/Wup1Mhn6DVJNJpeJZ
 SAV31HJXlN8WqcveBMYJl1gE1aHv0D1wMOUOzsz2+gDUVdTaumYSHF1mp1BbJR6tr781+Lofa
 zCPzk+lJiy3MqbuS89FaeKStJPf+f3VC+lYd3N6PUZJ47Hg4Ok2XMCWsRLM6QME43dxuH6Y4+
 8NCI5g6u1UbYQOpm+Hp6381ErHpWOJwUcVK3wzSBK/PdYx15STdq6swxGeCXazsniOAbIIK0F
 4NmuGLcuDrrtuuX8qPa3L3p+PXmJ7yy8OF5gpcDmIOVORUrHhXrGOJg+99893evc88fcHV7Ia
 7Tnp/0iuzRifFFr/kyKVqY+NDsEQnXGplKHXqDfru1luPdpM2BkiflGVhKoayUNX5+5yXCUKR
 T0rHlxVtu4XT58dMrDjTa2EhdYNNq3AXHjIck/XLkZHYujX1PiEZvF2gRTL/8fL+8GB61sOH8
 s6d2bCw44Y9AzarEyYbPsSqOoH4t/DCPnszAUTsn8HWyfNbXKRCPy4FtKbWHVpnTxOAJKykH0
 Yw2BaXd8qqhkDCtNLT1lc2FzOeAt2PgKdD051V71706+pcCMFZ/iQCR4ujdlsFIJoKJRQKnjr
 Mza88SlwQr5Q9C7knbcvq+sVSpsg1vUDy1Jyv08jjD4LdDmAtgFiGQKxOFOv7hCT/XTia9UnH
 /gQhZyzMmxiVOdlY9eGfc/aMITeIMWheznW6Lyq2FJ3hLpaGI/9e/NNyCbquv8Sk2aisnaAe4
 ZDR76Yxs0Y8Z1quc8rQ6EnGzVeo5HJkw13gCK37XxHeAnOwuSZl3+ZD1z2jmGFnN1PFX/23a+
 Es9UuweDvyE23bhOQc/5nbuT0+YnvsBTfNKuHQqkUOJdy3YVLjnpuGf++pTcmQaWmr32bLkTn
 hMELGm5Dl56aogpxH2xJlgEKll2vhPUIBQanJnZT3L+moBr6fz7fMGHLHqrBcKmdbsdtOQCAp
 6GSaSEtX1hNx+g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_004508_449242_89F14525 
X-CRM114-Status: GOOD (  15.30  )
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
Reply-To: frank-w@public-files.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

m 4. Mai 2022 08:51:41 MESZ schrieb Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>:
>On 03/05/2022 17:03, Frank Wunderlich wrote:
>> 
>> have not posted this version as it was failing in dtbs_check, this
>was how i tried:
>> 
>>
>https://github.com/frank-w/BPI-R2-4.14/blob/8f2033eb6fcae273580263c3f0b31f0d48821740/Documentation/devicetree/bindings/net/dsa/mediatek.yaml#L177
>
>You have mixed up indentation of the second if (and missing -).

The "compatible if" should be a child of the "if" above,because phy-mode property only exists for cpu-port. I can try with additional "-" (but i guess this is only needed for allOf)

Rob told me that i cannot check compatible in subnode and this check will be always true...just like my experience.
I can only make the compatible check at top-level and then need to define substructure based on this (so define structure twice). He suggested me adding this to description for now.

Imho this can be added later if really needed...did not found any example checking for compatible in a subnode. All were in top level. Afair these properties are handled by dsa-core/phylink and driver only compares constants set there.

>(...)
>
>>>>
>>>> basicly this "ports"-property should be required too, right?
>>>
>>> Previous binding did not enforce it, I think, but it is reasonable
>to
>>> require ports.
>> 
>> basicly it is required in dsa.yaml, so it will be redundant here
>> 
>>
>https://elixir.bootlin.com/linux/v5.18-rc5/source/Documentation/devicetree/bindings/net/dsa/dsa.yaml#L55
>> 
>> this defines it as pattern "^(ethernet-)?ports$" and should be
>processed by dsa-core. so maybe changing it to same pattern instead of
>moving up as normal property?
>
>Just keep what is already used in existing DTS.

Currently only "ports" is used...so i will change it to "normal" property.

>>>> for 33 there seem no constant..all other references to pio node are
>with numbers too and there seem no binding
>>>> header defining the gpio pins (only functions in
>include/dt-bindings/pinctrl/mt7623-pinfunc.h)
>>>
>>> ok, then my comment
>> 
>> you mean adding a comment to the example that GPIO-flags/constants
>should be used instead of magic numbers?
>
>I think something was cut from my reply. I wanted to say:
>"ok, then my comment can be skipped"

Ok

>But I think your check was not correct. I looked at bpi-r2 DTS
>(mt7623n)
>and pio controller uses GPIO flags.

I see only same as in the example

https://elixir.bootlin.com/linux/latest/source/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts#L196

>Best regards,
>Krzysztof
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
