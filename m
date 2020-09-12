Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C226BC433E2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 13:12:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5197F208E4
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 13:12:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ky2O21Hd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XVKtmQfg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="RpddY8Qn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5197F208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:From:Subject:To:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XP7js5fvV4SSxKBZcc4ECFI7sD75ZG93ZmzJ/6QybS4=; b=ky2O21HdzbE7sL8lK8Vk7u4z7D
	ztvppSLB9actbhx35+kVJZKJfU9/xUqKH8dt2Gu+HXZTsjT5aSlaXOwJngCBsqfbL4VUq5Y3ANDgB
	9nFD/hitUh6PwHhYy/N3396jFlLR40EevjPA7iEus3c47R1K4bX6y29b73byuJvx5u7zIKj1QGs44
	0MIlBZgVADQP83mKHclEqvJoFK2rX6e9qQ9/DTuY8qZWLNBo//oPxOXgT0O3DtLXEkSX48OBZXULh
	xbxPxfl1ivRHBuvF1U7+rSo1FiZmh1XvcoPO3gEfxpbppVuB+npgS683AupeLXxAAHR3KQjVs4Dwv
	JBUZ1mpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHoH1-0005NR-KT; Mon, 14 Sep 2020 13:11:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kH4b7-0003yB-0t; Sat, 12 Sep 2020 12:25:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Date:Message-ID:From:Subject:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=JvhqIRzwBw01DFigRuW1BcNatO/fRcL6zaqeTt4vWY8=; b=XVKtmQfg6V+wzxCVDQ6rssNOl/
 DTsODE4TMazKhcZiwNMwYcyUfGVzOT8yS7gwAevIWE2KkWQ3/RgHsjQArUCDCf/N2JfQsFEf1o+HK
 N0qHM8HZN656qy/cB+4sWUa40N+61PQbGN+LG4n0zAMp+obbt+IxZ3swRy9S6bpCG+43pRsikhy83
 SeZ72N9EZXS9Gl69AKMdxTtD1zcPBiZEuhtRKNai10N+QAerfkGE/imO7BR/AjHLRBrttEp1g962A
 uWiFf1qwR29GMfWxkjmKt1qkJsM/K/PrZKKoSfFpgB+6QcAxp+pVbksiy+4OC9PBqUnC28aj+3O7L
 orUko9pQ==;
Received: from mout.web.de ([212.227.15.4])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kH4b2-0000DL-Gr; Sat, 12 Sep 2020 12:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1599913479;
 bh=OOjiCOsJTJj1juu1RXqHciGvR2PnDAOOvlcQPn463vI=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=RpddY8QnAgJoNytpJpBj6kgHARSKW5hIlkAJtbZZNatpa4/zsjlICGIJ4FmE1qeEO
 F5hw0qCxZmbAeFY6Ybu6Okul7QLiLUXo+w60vERa5jteoWKO924lGfQ0N9jG5RlI8v
 gVJUFDXzERCEh7lleT0a1j9o4WjqAOVibWJyeLUQ=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.132.85.219]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M1UUr-1kWfh02vf7-00tPQN; Sat, 12
 Sep 2020 14:24:39 +0200
To: Xiaoliang Pang <dawning.pang@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH v5] cypto: mediatek - fix leaks in mtk_desc_ring_alloc
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 mQINBFg2+xABEADBJW2hoUoFXVFWTeKbqqif8VjszdMkriilx90WB5c0ddWQX14h6w5bT/A8
 +v43YoGpDNyhgA0w9CEhuwfZrE91GocMtjLO67TAc2i2nxMc/FJRDI0OemO4VJ9RwID6ltwt
 mpVJgXGKkNJ1ey+QOXouzlErVvE2fRh+KXXN1Q7fSmTJlAW9XJYHS3BDHb0uRpymRSX3O+E2
 lA87C7R8qAigPDZi6Z7UmwIA83ZMKXQ5stA0lhPyYgQcM7fh7V4ZYhnR0I5/qkUoxKpqaYLp
 YHBczVP+Zx/zHOM0KQphOMbU7X3c1pmMruoe6ti9uZzqZSLsF+NKXFEPBS665tQr66HJvZvY
 GMDlntZFAZ6xQvCC1r3MGoxEC1tuEa24vPCC9RZ9wk2sY5Csbva0WwYv3WKRZZBv8eIhGMxs
 rcpeGShRFyZ/0BYO53wZAPV1pEhGLLxd8eLN/nEWjJE0ejakPC1H/mt5F+yQBJAzz9JzbToU
 5jKLu0SugNI18MspJut8AiA1M44CIWrNHXvWsQ+nnBKHDHHYZu7MoXlOmB32ndsfPthR3GSv
 jN7YD4Ad724H8fhRijmC1+RpuSce7w2JLj5cYj4MlccmNb8YUxsE8brY2WkXQYS8Ivse39MX
 BE66MQN0r5DQ6oqgoJ4gHIVBUv/ZwgcmUNS5gQkNCFA0dWXznQARAQABtCZNYXJrdXMgRWxm
 cmluZyA8TWFya3VzLkVsZnJpbmdAd2ViLmRlPokCVAQTAQgAPhYhBHDP0hzibeXjwQ/ITuU9
 Figxg9azBQJYNvsQAhsjBQkJZgGABQsJCAcCBhUICQoLAgQWAgMBAh4BAheAAAoJEOU9Figx
 g9azcyMP/iVihZkZ4VyH3/wlV3nRiXvSreqg+pGPI3c8J6DjP9zvz7QHN35zWM++1yNek7Ar
 OVXwuKBo18ASlYzZPTFJZwQQdkZSV+atwIzG3US50ZZ4p7VyUuDuQQVVqFlaf6qZOkwHSnk+
 CeGxlDz1POSHY17VbJG2CzPuqMfgBtqIU1dODFLpFq4oIAwEOG6fxRa59qbsTLXxyw+PzRaR
 LIjVOit28raM83Efk07JKow8URb4u1n7k9RGAcnsM5/WMLRbDYjWTx0lJ2WO9zYwPgRykhn2
 sOyJVXk9xVESGTwEPbTtfHM+4x0n0gC6GzfTMvwvZ9G6xoM0S4/+lgbaaa9t5tT/PrsvJiob
 kfqDrPbmSwr2G5mHnSM9M7B+w8odjmQFOwAjfcxoVIHxC4Cl/GAAKsX3KNKTspCHR0Yag78w
 i8duH/eEd4tB8twcqCi3aCgWoIrhjNS0myusmuA89kAWFFW5z26qNCOefovCx8drdMXQfMYv
 g5lRk821ZCNBosfRUvcMXoY6lTwHLIDrEfkJQtjxfdTlWQdwr0mM5ye7vd83AManSQwutgpI
 q+wE8CNY2VN9xAlE7OhcmWXlnAw3MJLW863SXdGlnkA3N+U4BoKQSIToGuXARQ14IMNvfeKX
 NphLPpUUnUNdfxAHu/S3tPTc/E/oePbHo794dnEm57LuuQINBFg2+xABEADZg/T+4o5qj4cw
 nd0G5pFy7ACxk28mSrLuva9tyzqPgRZ2bdPiwNXJUvBg1es2u81urekeUvGvnERB/TKekp25
 4wU3I2lEhIXj5NVdLc6eU5czZQs4YEZbu1U5iqhhZmKhlLrhLlZv2whLOXRlLwi4jAzXIZAu
 76mT813jbczl2dwxFxcT8XRzk9+dwzNTdOg75683uinMgskiiul+dzd6sumdOhRZR7YBT+xC
 wzfykOgBKnzfFscMwKR0iuHNB+VdEnZw80XGZi4N1ku81DHxmo2HG3icg7CwO1ih2jx8ik0r
 riIyMhJrTXgR1hF6kQnX7p2mXe6K0s8tQFK0ZZmYpZuGYYsV05OvU8yqrRVL/GYvy4Xgplm3
 DuMuC7/A9/BfmxZVEPAS1gW6QQ8vSO4zf60zREKoSNYeiv+tURM2KOEj8tCMZN3k3sNASfoG
 fMvTvOjT0yzMbJsI1jwLwy5uA2JVdSLoWzBD8awZ2X/eCU9YDZeGuWmxzIHvkuMj8FfX8cK/
 2m437UA877eqmcgiEy/3B7XeHUipOL83gjfq4ETzVmxVswkVvZvR6j2blQVr+MhCZPq83Ota
 xNB7QptPxJuNRZ49gtT6uQkyGI+2daXqkj/Mot5tKxNKtM1Vbr/3b+AEMA7qLz7QjhgGJcie
 qp4b0gELjY1Oe9dBAXMiDwARAQABiQI8BBgBCAAmFiEEcM/SHOJt5ePBD8hO5T0WKDGD1rMF
 Alg2+xACGwwFCQlmAYAACgkQ5T0WKDGD1rOYSw/+P6fYSZjTJDAl9XNfXRjRRyJSfaw6N1pA
 Ahuu0MIa3djFRuFCrAHUaaFZf5V2iW5xhGnrhDwE1Ksf7tlstSne/G0a+Ef7vhUyeTn6U/0m
 +/BrsCsBUXhqeNuraGUtaleatQijXfuemUwgB+mE3B0SobE601XLo6MYIhPh8MG32MKO5kOY
 hB5jzyor7WoN3ETVNQoGgMzPVWIRElwpcXr+yGoTLAOpG7nkAUBBj9n9TPpSdt/npfok9ZfL
 /Q+ranrxb2Cy4tvOPxeVfR58XveX85ICrW9VHPVq9sJf/a24bMm6+qEg1V/G7u/AM3fM8U2m
 tdrTqOrfxklZ7beppGKzC1/WLrcr072vrdiN0icyOHQlfWmaPv0pUnW3AwtiMYngT96BevfA
 qlwaymjPTvH+cTXScnbydfOQW8220JQwykUe+sHRZfAF5TS2YCkQvsyf7vIpSqo/ttDk4+xc
 Z/wsLiWTgKlih2QYULvW61XU+mWsK8+ZlYUrRMpkauN4CJ5yTpvp+Orcz5KixHQmc5tbkLWf
 x0n1QFc1xxJhbzN+r9djSGGN/5IBDfUqSANC8cWzHpWaHmSuU3JSAMB/N+yQjIad2ztTckZY
 pwT6oxng29LzZspTYUEzMz3wK2jQHw+U66qBFk8whA7B2uAU1QdGyPgahLYSOa4XAEGb6wbI FEE=
Message-ID: <ac9389ff-ab7d-ad6a-51f1-dbefeda9977e@web.de>
Date: Sat, 12 Sep 2020 14:24:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Language: en-GB
X-Provags-ID: V03:K1:Fs16lnT0ZPN6hu+ylXIisN/b0jDmdwNAZioGSAuDxRq4nd1iSQH
 J/m9Z9xCKB4TSe/ufI/i6M5LL/j9G+cNLJAEklMik+DPfBn2LADRV3fuu/TM+TYA/IZNrsV
 gW067yi+1AFEOd3+df5Nbhs9iY4LLp46+Iryc8JIBUs5XOZGiSYP9v6Zpblnj1IEFejtd11
 LvvFi+BImGxb/hys90e7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CIN690+Fbww=:q6fRkvTmDMKBA0puCzfmO4
 sZAH4k2MavVStPz3gU1uaU+jtXgohsr+7NaUkS/R81wK0KogXKGDaYQs7fumi/4HttGO6PILZ
 AO8RnVMiFYt7mw5UjzvY/qYaJ0Ghra/KMivye8eOfR44l1mR7EDYgMaYFfo4M5gQ5TD+QIIbc
 0MqIYRhT7CkhlouBSq1er2yrHKHQqPj/2WFs910dPdN/LPld8INJdugfqv7euCoUIbPpvEb9K
 hgmBk7ktlE5A/O69MT23/KeyWBX9h4HEj/AxUp4XB2TrvlQAOGIVISDLLbpfcdHXe2s/adIoH
 PzAC9WtUjxUyRU1gD00a/XPM5XRlhOMgjO64pGWp5QjIfsMQ9pu6jJO3qR3TWZmzzLoLRGmK6
 DDgNo8LAsdnI3Gl5Xh9BvXB89SHhKAI+rIXoLp0HPbd3JSqCZqk7LUg1lBo3XbC5gu+kVGhTQ
 1IKLgtSYt64j9M5fxFL2OmqGlJ8yD+x4gFLUXQmFD2xlDbrmghyjy12qRiQaISQQHUXDrk1ul
 oYpSCFGKpf8oOJIhIbFv11hszj1Pe3wCVmOPr0oU5aPkRw04erE2IptqdX8Y+viRv2AnN/HuW
 Ork0OdcBq/fRlq5gHx5Hesjp1PaKlha1sF6o3zVCejF5YIdEBDNT2xzCCM3Bg2GGu8aNzdoDQ
 SDZlf3HDOeVM9wdcCj4b3l+tYT3O/hCnCyR1B31i8pzHKXi1AA4qs7Nos9LhHYkntXGgQ63oc
 q6kSvk601K5YhdLDJWSk8o+Q5yVvLtr6RoUwpx3C82BwI8Hx0QOLd6v1VLXlgHMymgnPWhCEE
 73sc3Zm+i0opz+SdA/Kyi/pqOrI8IHrofkOAWJXzdlwBnYFdtQCs3+p3LAB15oE+8WwlO3sO3
 MZfuQ7kZRwY1boNka8brq43sB1pgMTDN6de+FoxiBJcbkAo8eE1inarTaGiUN0ICazY9MDYoX
 +rLjPseUfOdm1WaKakfhawy6bTtfB2Vy9VVKiVW2RvTVHR0jXvarvw7XXzAY5DxaDC2Xc8flH
 WBBY43Sv7nhVSmvldBLceAS2PHFHI8mQ9gno0NlalRNbMlYyos7wVruodpc92BhFZaJJNU+Os
 G2r6OpqJCTKG4A/jp4u8Wpfa+0MzbuEQksfQv8U8UIUkq7Q8B4OIzIxhtCTwWaiV0QXLIz60x
 mkk9IZeEe44kXOW4Uzcar0mreH0gfbsrQ1grhogIwBDJ4QmkKan7wYncykuds/zBRPq1glWRg
 VHwn93+swZ9ow19/dG3P+uq03Q1SbsUgYKPCHrw==
X-Bad-Reply: 'Re:' in Subject but no References or In-Reply-To headers
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200912_132536_741764_A4B1C102 
X-CRM114-Status: UNSURE (   9.14  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Mon, 14 Sep 2020 09:11:58 -0400
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Tianjia Zhang <tianjia.zhang@linux.alibaba.com>,
 YueHaibing <yuehaibing@huawei.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

4oCmCj4gdGhlIHN0cnVjdCBtdGtfcmluZyByaXNpbmdbaV0gd2lsbCBub3QgYmUgcmVsZWFzZWQs
Cj4gY2F1c2luZyBhIG1lbW9yeSBsZWFrCgoqIFdvdWxkIGFub3RoZXIgaW1wZXJhdGl2ZSB3b3Jk
aW5nIGJlY29tZSBoZWxwZnVsIGZvciB0aGUgY2hhbmdlIGRlc2NyaXB0aW9uPwoKKiBJIHN1Z2dl
c3QgdG8gYWRkIHRoZSB0YWcg4oCcRml4ZXPigJ0gdG8gdGhlIGNvbW1pdCBtZXNzYWdlLgoKCj4g
LS0tCj4gIGRyaXZlcnMvY3J5cHRvL21lZGlhdGVrL210ay1wbGF0Zm9ybS5jIHwgNCArKy0tCgpQ
bGVhc2UgYWRkIHBhdGNoIHZlcnNpb24gZGVzY3JpcHRpb25zLgoKUmVnYXJkcywKTWFya3VzCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
