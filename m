Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CF2C54E58
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 15:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbDwYUROXNM2O+x3xQy95KV7qywRuIIQTUYJjssMCUw=; b=vIRHzIs3M6uDUuPRwUTPfmyOmf
	JQ9a4agGttiA8eWzW8wWcd+uuSEM2/BMlww0MW6q48ZqOqnj5pWV0aLvcIV9jfVD3yUHDp4Rs8SiV
	ZUK9PyzTikviiVoe0A3Tj8CTYQ2642SAmRSp9EQHCeBlhNePQYbqMgkGXUNGrG4UXYuIK/ZkkarVG
	CGS146LE1t59L2wLgh5WkfbA3i7oC0OsM6tGAvVRNwo8Mpuj2BiOS8+bDMCJVMWeGmPeyMYxYdmPT
	5zA51mNIqa7Wfw2ZH9RGjJlSSFaGGsWlIRGvP0gGWEaHAojW1geT/vmyiPMLteWfmFY/AmTZw9CV1
	JwgWGgnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk41G-00000006M3v-1G7L;
	Tue, 12 Mar 2024 15:26:22 +0000
Received: from outgoing1.flk.host-h.net ([188.40.0.86])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk41A-00000006M21-2btJ;
	Tue, 12 Mar 2024 15:26:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=risingedge.co.za; s=xneelo; h=Message-ID:References:In-Reply-To:Subject:Cc:
	To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:reply-to:
	sender:bcc; bh=gbDwYUROXNM2O+x3xQy95KV7qywRuIIQTUYJjssMCUw=; b=TSsh+C57H5sx55
	HSKJfKYRhO6frDbhsHKDuoSHQyqdTxufQRaY+PlKxTjVHIZgYxW78htXgus6zGhYiaTfmIHjvBTJ/
	OLhlu0i4bU2hqTQYR5TN5x4iwUrCS4Ich5n2qKuqIDqJPdA+b01hEMiqmTzRrzB22H3nM1YWQOMrE
	dXJPF3/WtmLQSbLdty9pZshSbv2Ck+K1MzM6jxVIc0RP/d6m7RfuiDKqUZ4uLbFTsemdkWZC7siHr
	RL/VlsJ8cnE5fYWGz2Hvaw33XZTWtF23orOZxJmgGsU8gLFRJsu3srzXWk1oHvPhE10nNFT+MKeY6
	DI2tYBj2pHKrN5+aNvnA==;
Received: from www31.flk1.host-h.net ([188.40.1.173])
	by antispam3-flk1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rk40x-00G4ad-V6; Tue, 12 Mar 2024 17:26:07 +0200
Received: from roundcubeweb1.flk1.host-h.net ([138.201.244.33] helo=webmail9.konsoleh.co.za)
	by www31.flk1.host-h.net with esmtpa (Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rk40t-00070T-Sz; Tue, 12 Mar 2024 17:25:59 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Tue, 12 Mar 2024 17:25:59 +0200
From: Justin Swartz <justin.swartz@risingedge.co.za>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, Florian
 Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] net: dsa: mt7530: disable LEDs before reset
In-Reply-To: <6df6db7e-7842-4194-b429-ab7443a18ccb@arinc9.com>
References: <20240305043952.21590-1-justin.swartz@risingedge.co.za>
 <6064ba52-2470-4c56-958c-35632187f148@arinc9.com>
 <d45083788db8b0b1ace051adecfe6a3a@risingedge.co.za>
 <1bfd93f1-36d5-436e-818e-2ebdcf475b44@arinc9.com>
 <0439f80319127b6a4a9c19108bcc0065@risingedge.co.za>
 <6df6db7e-7842-4194-b429-ab7443a18ccb@arinc9.com>
Message-ID: <9a7c29b51575083201b963638bdb9fa5@risingedge.co.za>
X-Sender: justin.swartz@risingedge.co.za
User-Agent: Roundcube Webmail/1.3.17
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.06)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT9TyjqxmnVSjLe3LUILSAncPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wCPRB8bAzJcv2cv+UqiTTc2+CpNcmBnO4XM3Sck4bwNogU
 WCl1nkLBzZX0KuJ9bXiS85Z42w/+2OBolTNFbPomXFWCX8oNdggW7HE9XDTdSejrkEpbuUvwMvHx
 3T+KSG//gbuP7hnUK8NQdLwsVWKIv+fXqqb3FJ1Z7kkAIev0U9CKH/oA07tJunDPm536TODb5GPR
 oyaaXp1VNA9dXvxV+mFktoWo3CKg4C3LDJ75vu2U4GT70q7ZqN/P49BncZ5XB7lfx9K88uL/WnJE
 LAEP514Y/yfAEbrTclu3OeNcbACmFr3ts0d2E6vXySsvfMaT9Bjf4etJ827HW1/sdZ81dz6BqXHU
 oYg+nmOeSIjjxA24TPuOyBrko5yKpcR03QEJ9DjWmjcfK/FpTD0spWG+rMYoj8CdNq4vLYsMDbt4
 2oUP1Ae/eGZl2OLANHAHEjHENEhX9cq65nsXPA0MIFDIPOMDW/6+MC+5Mq5RH9OoW0W22an/ubzj
 InB/ImqScRfGyrhHVstPeAuxsRhUFJC4TtSvIahFt3uEpT0304dV2Yoz1SesQUA6bnjJZT6m9lal
 9vikoy50DqR3hu/rL5PGAoTDzn0QdoxFeruM0Uhu+TDN1MfKxpvQx1BwwF9G5DEihnVW8zB2Qi26
 vkVALycwzSdeC1kd8cXa71WqOc72jXbRpMw6Agze1f399OurHEyYS7nq+EBNvgiWKNNSkdVDZOrL
 5kxgO94lq2025NSImfKeGaSpuwkt9kMFaoxOFH2cp4YsTYwGNGW12ki18UnPMs4VIrisX+dtrxYn
 /0jYEvj5QBAPtzfeVlNHdCJmwgf0M7fnqgzRvCMiN68tcHQey84mBB4XoB473XOJmIRPynE3O7YZ
 oFBs6I7QuC1BjGNT52hVLEr/9PrrMm81h6IAYzikeIJfw26MB/V1E5BP9Gv0xI1YXOxC1lZqyFpL
 AwQr6muMti2YanICQnMITeB2fd0UyjU/MIq3Vtx6CgQGHtezYqxGMqsKjARq8PBC4qgGsfAERwCB
 JFs7XjZYbJPBsmpIto2O4JO2fx1gIuNHgi11AwJSTGCrOFs22K1ZnDqAw3gLmOBPHazhChxq9nGW
 aSi6bFHidB1VgzDzDZn/+QEiRQv+PVjjwa+Z5RFCOMTMctdsTl1csEqhToiNz8IDdfFYVDBYJee7
 gx/u82RtUz+q9amw8AuFhDmQdF5MpRw0mVfWLKEgol9rYV4JEcNP1rJoln/cD8h/RIvkzXRTCYvX
 WLQhlD92+1l+zHfJg1FMwntsduNBxKPaTpE5L8d4VqFy6yKUFQtzhTlGiGL9BwIzkmvJREfBLui5
 jZGa6GhjCOO2HhD88MS3lvGH/VLGIIDSVMZhrIoAWTF5tIdhy/UIEBYDcZg+Q8UhuRLyBn1+pvlH
 hV6a5QjptwQBGybQyDQ2/GYwPjlMcE57ESN6G+kn87CtwPdB/10jfVNpDbYnXJdSRQj8460WHJib
 IxmU2pb4i4DTkMZeMiNI9JSIyUbtnrlbG4BI8o81FOo91axhCaqPShJzgHH7y4ZfQxML
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_082617_558852_F5C025A2 
X-CRM114-Status: GOOD (  20.11  )
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

On 2024-03-12 16:06, Arınç ÜNAL wrote:
> On 12.03.2024 15:01, Justin Swartz wrote:
>> Arınç
>> 
>> On 2024-03-12 04:41, Arınç ÜNAL wrote:
>>> Wouldn't it be a better idea to increase the delay between
>>> reset_control_assert() and reset_control_deassert(), and
>>> gpiod_set_value_cansleep(priv->reset, 0) and
>>> gpiod_set_value_cansleep(priv->reset, 1) instead of disabling the LED
>>> controller and delaying before reset?
>> 
>> I've done some additional tests to see what the difference would be
>> between increasing the reset hold period vs. disabling the LEDs then
>> sleeping before reset.
>> 
>> 
>> I wanted to know:
>> 
>> When an active link is present on Port 3 at boot, what are the
>> minimum, maximum and average periods between ESW_P3_LED_0
>> going low and the signal inversion that seems to co-incide with
>> reset_control_deassert() for each approach?
>> 
>> 
>> I created two patches:
>> 
>> WITH INCREASED RESET DELAY
>> 
>> As I submitted a patch that added an intended 1000 - 1100 usec delay
>> before reset, I thought it would be fair to increase the reset hold
>> period by the same value.
>> 
>> ---%---
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -2243,11 +2243,11 @@ mt7530_setup(struct dsa_switch *ds)
>>           */
>>          if (priv->mcm) {
>>                  reset_control_assert(priv->rstc);
>> -               usleep_range(1000, 1100);
>> +               usleep_range(2000, 2200);
>>                  reset_control_deassert(priv->rstc);
>>          } else {
>>                  gpiod_set_value_cansleep(priv->reset, 0);
>> -               usleep_range(1000, 1100);
>> +               usleep_range(2000, 2200);
>>                  gpiod_set_value_cansleep(priv->reset, 1);
>>          }
>> ---%---
>> 
>> 
>> DISABLE LEDS BEFORE RESET
>> 
>> Reset hold period unchanged from the intended 1000 - 1100 usec.
>> 
>> ---%---
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -2238,6 +2238,12 @@ mt7530_setup(struct dsa_switch *ds)
>>                  }
>>          }
>> 
>> +       /* Disable LEDs before reset to prevent the MT7530 sampling a
>> +        * potentially incorrect HT_XTAL_FSEL value.
>> +        */
>> +       mt7530_write(priv, MT7530_LED_EN, 0);
>> +       usleep_range(1000, 1100);
>> +
>>          /* Reset whole chip through gpio pin or memory-mapped 
>> registers for
>>           * different type of hardware
>>           */
>> ---%---
>> 
>> 
>> I ran 20 tests per patch, applied exclusively. 40 tests in total.
>> 
>>       <-- ESW_P3_LED_0 Low Period before Reset Deassertion -->
>> 
>>    TEST    WITH INCREASED RESET DELAY    DISABLE LEDS BEFORE RESET
>>       #                        (usec)                       (usec)
>> -------------------------------------------------------------------
>>       1                           182                         4790
>>       2                           370                         3470
>>       3                           240                         4635
>>       4                          1475                         4850
>>       5                            70                         4775
>>       6                          2730                         4575
>>       7                          3180                         4565
>>       8                           265                         5650
>>       9                           270                         4690
>>      10                          1525                         4450
>>      11                          3210                         4735
>>      12                           120                         4690
>>      13                           185                         4625
>>      14                           305                         7020
>>      15                          2975                         4720
>>      16                           245                         4675
>>      17                           350                         4740
>>      18                            80                        17920
>>      19                           150                        17665
>>      20                           100                         4620
>> 
>>     Min                            70                         3470
>>     Max                          3210                        17920
>> 
>>    Mean                           270                         4720
-1s/  Mean/Median/

>>     Avg                       923.421                     6161.579
>> 
>> 
>> Every test resulted in a 40MHz HT_XTAL_FSEL, but after seeing 70 usec
>> and 80 usec periods I wondered how many more tests it may take before
>> an 25MHz HT_XTAL_FSEL appears.
>> 
>> I was also surprised by the 17920 usec and 17665 usec periods listed
>> under the DISABLED LEDS BEFORE RESET column. Nothing unusual seemed
>> to be happening, at least as far as the kernel message output was
>> concerned.
>> 
>> What do you make of these results?
> 
> What I see is setting ESW_P3_LED_0 low via reset assertion is much more
> efficient than doing so by setting the LED controller off. So I'd 
> prefer
> increasing the delay between assertion and reassertion. For example, 
> the
> Realtek DSA subdriver has a much more generous delay. 25ms after reset
> assertion [1].
> 
> Looking at your results, 2000 - 2200 usec delay still seems too close, 
> so
> let's agree on an amount that will ensure that boards in any 
> circumstances
> will have these pins back to the bootstrapping configuration before 
> reset
> deassertion. What about 5000 - 5100 usec?

    TEST    ESW_P3_LED_0 LOW PERIOD
       #                     (usec)
----------------------------------
       1                       5410
       2                       5440
       3                       4375
       4                       5490
       5                       5475
       6                       4335
       7                       4370
       8                       5435
       9                       4205
      10                       4335
      11                       3750
      12                       3170
      13                       4395
      14                       4375
      15                       3515
      16                       4335
      17                       4220
      18                       4175
      19                       4175
      20                       4350

     Min                       3170
     Max                       5490

  Median                   4342.500
     Avg                   4466.500

Looks reasonable to me.


> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/tree/drivers/net/dsa/realtek/rtl83xx.c#n205
> 
> Arınç

