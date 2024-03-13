Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 468A5C54791
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 11:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:References:
	In-Reply-To:Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kP/x0UCxIGXaYUmSQNq85lpjgX5/E0wqn7vxqxEhUfo=; b=VlpiMysBzHSkfrwLmyYDkvVH0c
	pBFKOuGYl9LguQJqIbS3JN6StEDjTY6MhwrYz1zn6fkYTN9flzchWIdryQjqWj5+ialbmu7I4Pe6y
	+yIZIpthMGlrjTNFVMbDbpHZd4iiJ7s+O66kUxE3FjFiz9AxWXhdPdiD67HptPYCx81Mv+yBAcUGB
	j85TwZ6hIIRvclDSfn5Wt2eb6LzL2tk68s7pJc9t7l/0cW4tSMT3dY/Qs9aiyAEjNCax7cEwEV64r
	PzbpRhBLP3IDLj0VuOmITM75znqk4TmUhtP97ievL8rY0sYj2fcB8CLvISCrs1ESLeQtiIEwYl4Pg
	DDnXzm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkN9j-00000009y5d-391s;
	Wed, 13 Mar 2024 11:52:23 +0000
Received: from outgoing4.flk.host-h.net ([188.40.0.90])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkN9f-00000009y47-1BE2;
	Wed, 13 Mar 2024 11:52:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=risingedge.co.za; s=xneelo; h=Message-ID:References:In-Reply-To:Subject:Cc:
	To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:reply-to:
	sender:bcc; bh=kP/x0UCxIGXaYUmSQNq85lpjgX5/E0wqn7vxqxEhUfo=; b=LcdqIFtrdhQeB8
	8k5zjPNEpsUiPgKbFrlAtdamD6V9691rlFLiaAselfqb0TqcgkNS/+D9msF9f4XIdnvYeGlVgE9Mp
	FT+rY7fkOL5AZUeYd+NWioD0fAm+bTZENqfKARGPw7E4f4LtdXoL5/sDXsKoTzPJAwMt4mjvw7J+S
	8nUmbTk2nDxi5Py4PSkg4Qaa9XoaUFn2BzOoC5vXvZoXi1ysqe7w+qUqFk5eoSLQoUOlBpQmD9cUg
	C2xAAb3Fw1hCiSd6UTHvAFT6e1Y+HsTt8OOdvGTEiRaq6gAZ8GyGThhTRX/EgBaIyrgSY5Nd2xHBj
	T8Z5yApQIDh/URhFGvxg==;
Received: from www31.flk1.host-h.net ([188.40.1.173])
	by antispam1-flk1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rkN9R-00DrWD-Km; Wed, 13 Mar 2024 13:52:08 +0200
Received: from roundcubeweb1.flk1.host-h.net ([138.201.244.33] helo=webmail9.konsoleh.co.za)
	by www31.flk1.host-h.net with esmtpa (Exim 4.92)
	(envelope-from <justin.swartz@risingedge.co.za>)
	id 1rkN9O-0005Os-9C; Wed, 13 Mar 2024 13:52:02 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date: Wed, 13 Mar 2024 13:52:02 +0200
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
Subject: Re: [PATCH] net: dsa: mt7530: increase reset hold time
In-Reply-To: <bf0ed70f-e106-4a7f-a98c-de34658feb4d@arinc9.com>
References: <f594a72a91d12f1d027a06962caa9750@risingedge.co.za>
 <20240312192117.7789-1-justin.swartz@risingedge.co.za>
 <bf0ed70f-e106-4a7f-a98c-de34658feb4d@arinc9.com>
Message-ID: <e6525cac666a033a5866465abb3e63f1@risingedge.co.za>
X-Sender: justin.swartz@risingedge.co.za
User-Agent: Roundcube Webmail/1.3.17
X-Authenticated-Sender: justin.swartz@risingedge.co.za
X-Virus-Scanned: Clear
X-Originating-IP: 188.40.1.173
X-SpamExperts-Domain: risingedge.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@risingedge.co.za
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.03)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT/f5ASvLhoONzvM3Neet7I0PUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5wCPRB8bAzJcv2cv+UqiTTc2+CpNcmBnO4XM3Sck4bwNogU
 WCl1nkLBzZX0KuJ9bXiS85Z42w/+2OBolTNFbPomXFWCX8oNdggW7HE9XDTdSejrkEpbuUvwMvHx
 3T+KSG//gbuP7hnUK8NQdLwsVWKIv+fXqqb3FJ1Z7kkAIev0U9CKH/oA07tJunDPm536TODb5GPR
 oyaaXp1VNA9dXvxV+mFktoWo3CKg4C3LDJ75vu2U4GT70q7ZqN/P49BncZ5XB7lfx9K88uL/WnJE
 LAEP514Y/yfAEbrTclu3OeNcbACmFr3ts0d2E6vXySsvfMaT9Bjf4etJ827HW1/sdZ81dz6BqXHU
 oYg+nmOeSIjjxA24TPuOyBrko5yKpcR03QEJ9DjWmjcfK/FpTD0spWG+rMYoj8CdNq4vLYsMDbt4
 2oUP1Ae/eGZl2OLANHAHEjHENEhX9cq65nsXPA0MIFDIPOMDW/6+MC+5Mq5RH9OoW0W22an/ubzj
 InB/ImqScRfGyrhHVstPeAuxsRhUFJC4TtSvIahFt3uEpT0304dV2Yoz1SesQUA6bnjJZT6m9lal
 9vikoy50DqR3hu/rL5PGAoTDzn0QdoxFeruM0Uhu+VmAdrqarzedA2bamK+XGdcihnVW8zB2Qi26
 vkVALycwzSdeC1kd8cXa71WqOc72jXbRpMw6Agze1f399OurHEyYS7nq+EBNvgiWKNNSkdVDZOrL
 5kxgO94lq2025NSImfKeGaSpuwkt9kMFaoxOFH1hIqsDqiY5NFuEmlCmGLsHMs4VIrisX+dtrxYn
 /0jYEvj5QBAPtzfeVlNHdCJmwgf0M7fnqgzRvCMiN68tcHQey84mBB4XoB473XOJmIRPynE3O7YZ
 oFBs6I7QuC1BjGNT52hVLEr/9PrrMm81h6IAYzikeIJfw26MB/V1E5BP9Gv0xI1YXOxC1lZqyFpL
 AwQr6muMti2YanICQnMITeB2fd0UyjU/MIq3Vtx6CgQGHtezYqxGMqsKjARq8PBC4qgGsfAERwCB
 JFs7XjZYbJPBsmpIto2O4JO2fx1gIuNHgi11AwJSTGCrOFs22K1ZnDqAw3gLmOBPHazhChxq9nGW
 aSi6bFHidB1VgzDzDZn/+QEiRQv+PVjjwa+Z5RFCOMQwU3LvoOQWIGmR34v72byEdfFYVDBYJee7
 gx/u82RtU6CfboKKYz8yU9NdQv+cV8A0mVfWLKEgol9rYV4JEcNP1rJoln/cD8h/RIvkzXRTCYvX
 WLQhlD92+1l+zHfJg1FMwntsduNBxKPaTpE5L8d4VqFy6yKUFQtzhTlGiGL9B0AyxPUbQ/f3iVyf
 P9wHzfAz6SNqPP2zalJxIwFTIvo1IIDSVMZhrIoAWTF5tIdhy/UIEBYDcZg+Q8UhuRLyBn1+pvlH
 hV6a5QjptwQBGybQyDQ2/GYwPjlMcE57ESN6G+kn87CtwPdB/10jfVNpDbYnXJdSRQj8460WHJib
 IxmU2pb4i4DTkMZeMiNI9JSIyUbtnrlbG4BI8o81FOo91axhCaqPShJzgHH7y4ZfQxML
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_045220_161141_DC3BC855 
X-CRM114-Status: GOOD (  16.31  )
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


On 2024-03-13 10:59, Arınç ÜNAL wrote:
> On 12.03.2024 22:21, Justin Swartz wrote:
>> Increase the MT7530 reset hold period from 1000-1100 usec
>> to 5000-5100 usec.
>> 
>> This should reduce the likelihood of an incorrect external
>> crystal frequency selection which may occur when reset is
>> deasserted too early under certain link conditions.
>> 
>> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
>> ---
>>   drivers/net/dsa/mt7530.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
>> index 3c1f65759..5e9e1381a 100644
>> --- a/drivers/net/dsa/mt7530.c
>> +++ b/drivers/net/dsa/mt7530.c
>> @@ -2243,11 +2243,11 @@ mt7530_setup(struct dsa_switch *ds)
>>   	 */
>>   	if (priv->mcm) {
>>   		reset_control_assert(priv->rstc);
>> -		usleep_range(1000, 1100);
>> +		usleep_range(5000, 5100);
>>   		reset_control_deassert(priv->rstc);
>>   	} else {
>>   		gpiod_set_value_cansleep(priv->reset, 0);
>> -		usleep_range(1000, 1100);
>> +		usleep_range(5000, 5100);
>>   		gpiod_set_value_cansleep(priv->reset, 1);
>>   	}
>> 
> 
> Again, the patch subject is missing the indication of a tree. Read the
> networking subsystem (netdev) development page [1].

Thanks for that pointer.


> This ship has sailed anyway. Now the changes the first patch did must 
> be
> reverted too. I will deal with this from now on, you can stop sending
> patches regarding this.

At least if the first patch isn't reverted, the approach used is
less likely to result in the problem occuring, IMHO.

The delay between deliberately switching the LEDs off, instead of
only waiting on chip reset logic to handle that, and the reset
assertion could be considered a "reset setup" period to complement
the original reset hold period.

Increasing the hold period to what should be 5000 - 5100 usec,
definitely made the problem go away my testing, but the previous
approach is (if nothing else) more explicit in its intent.


> [1] 
> https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html
> 
> Arınç

